CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
	UPDATE fo
	SET 
		book_key = so.book_key,
		customer_key = so.customer_key,
		date_key = so.date_key,
		shipping_key = so.shipping_key,
		address_key = so.address_key,
		order_date_time = so.order_date_time,
		status_date = so.status_date,
		status_value = so.status_value,
		price = so.price,
		quantity = so.quantity,
		subtotal = so.subtotal,
		etl_load_date = so.etl_load_date
	FROM [dbo].[Fact_Orders]        fo
	INNER JOIN [staging].[Orders] so ON (fo.order_id = so.order_id AND fo.line_id = so.line_id)
