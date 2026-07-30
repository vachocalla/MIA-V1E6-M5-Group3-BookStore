CREATE PROCEDURE GetAddressChangesByRowVersion
	@startRow BIGINT,
	@endRow BIGINT
AS
	SELECT 
		a.address_id,
		a.street_name,
		a.street_number,
		a.city,
		co.country_name
	FROM [Address] AS a
	JOIN country AS co ON 
		(
			a.country_id = co.country_id
		)
	WHERE 
		(a.[rowversion] > CONVERT(ROWVERSION, @startRow) AND a.[rowversion] <= CONVERT(ROWVERSION, @endRow))
		OR 
		(co.[rowversion] > CONVERT(ROWVERSION,@startRow) AND co.[rowversion] <= CONVERT(ROWVERSION,@endRow))
