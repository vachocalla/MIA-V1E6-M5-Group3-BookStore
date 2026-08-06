CREATE PROCEDURE GetCustomerChangesByRowVersion
	@startRow BIGINT,
	@endRow  BIGINT 
AS
	SELECT 
		c.customer_id,
		c.first_name,
		c.last_name,
		c.email,
		a.street_name,
		a.street_number,
		a.city,
		adds.address_status,
		co.country_name
	FROM Bookstore.dbo.customer AS c
	JOIN dbo.customer_address AS ca ON (
		c.customer_id = ca.customer_id
	)
	JOIN dbo.address_status AS adds ON (
		ca.status_id = adds.status_id
	)
	JOIN dbo.[address] AS a ON (
		ca.address_id = a.address_id
	)
	JOIN dbo.country AS co on (
		a.country_id = co.country_id
	)
	WHERE 
		(c.[rowversion] > CONVERT([rowversion],@startRow) AND c.[rowversion] <= CONVERT([rowversion],@endRow))
		OR 
		(ca.[rowversion] > CONVERT([rowversion],@startRow) AND ca.[rowversion] <= CONVERT([rowversion],@endRow))
		OR 
		(adds.[rowversion] > CONVERT([rowversion],@startRow) AND adds.[rowversion] <= CONVERT([rowversion],@endRow))
		OR 
		(a.[rowversion] > CONVERT([rowversion],@startRow) AND a.[rowversion] <= CONVERT([rowversion],@endRow))
		OR 
		(co.[rowversion] > CONVERT([rowversion],@startRow) AND co.[rowversion] <= CONVERT([rowversion],@endRow))

