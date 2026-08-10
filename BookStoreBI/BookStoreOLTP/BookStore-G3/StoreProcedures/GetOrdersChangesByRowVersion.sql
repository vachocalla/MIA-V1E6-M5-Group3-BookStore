CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
	@startRow BIGINT,
	@endRow BIGINT
AS
	SELECT 
		cu.order_id,
		ol.line_id,

		CONVERT(INT,
			(CONVERT(CHAR(4),DATEPART(YEAR,cu.[order_date]))
			+ CASE 
				WHEN DATEPART(MONTH,cu.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,cu.[order_date]))
				ELSE + CONVERT(CHAR(2),DATEPART(MONTH,cu.[order_date]))
			END
			+ CASE 
				WHEN DATEPART(DAY,cu.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,cu.[order_date]))
				ELSE + CONVERT(CHAR(2),DATEPART(DAY,cu.[order_date]))
			END)) AS order_date_key,
		cu.order_date AS order_date_time,
		cu.customer_id,
		shipping_method_id,
		dest_address_id,
		ol.book_id,

		oh.status_date,
		os.status_value,
	
		ol.price,
		1 AS quantity,
		ol.price AS subtotal

	FROM cust_order AS cu
	INNER JOIN order_history AS oh ON (
		oh.history_id = cu.order_id
	)
	INNER JOIN order_status AS os ON (
		os.status_id = oh.status_id
	)
	INNER JOIN order_line AS ol ON (
		ol.order_id = cu.order_id
	)
	WHERE 
			(cu.[rowversion] > CONVERT(ROWVERSION, @startRow) AND cu.[rowversion] <= CONVERT(ROWVERSION, @endRow))
			OR 
			(oh.[rowversion] > CONVERT(ROWVERSION,@startRow) AND oh.[rowversion] <= CONVERT(ROWVERSION,@endRow))
			OR 
			(os.[rowversion] > CONVERT(ROWVERSION,@startRow) AND os.[rowversion] <= CONVERT(ROWVERSION,@endRow))
			OR 
			(ol.[rowversion] > CONVERT(ROWVERSION,@startRow) AND ol.[rowversion] <= CONVERT(ROWVERSION,@endRow))
