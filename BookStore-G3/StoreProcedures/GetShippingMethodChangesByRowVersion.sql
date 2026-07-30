CREATE PROCEDURE GetShippingMethodChangesByRowVersion
(
   @startRow BIGINT,
   @endRow  BIGINT 
)
AS
	SELECT 
		method_id,
		method_name,
		cost
	FROM shipping_method
	WHERE 
		[rowversion] > CONVERT(ROWVERSION,@startRow) 
		AND 
		[rowversion] <= CONVERT(ROWVERSION,@endRow)