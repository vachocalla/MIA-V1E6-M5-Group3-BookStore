CREATE PROCEDURE GetCustomerChangesByRowVersion
	@startRow BIGINT,
	@endRow  BIGINT 
AS
	;WITH CustomerAddressCte AS (
		SELECT 
			c.customer_id,
			c.first_name,
			c.last_name,
			c.email,
			CONCAT(c.first_name, ' ', c.last_name) as full_name,
			a.street_name,
			a.street_number,
			a.city,
			adds.address_status,
			co.country_name,
			CONCAT_WS(', ', a.street_name, a.street_number, a.city, co.country_name) AS single_address,
			ROW_NUMBER() OVER (
				PARTITION BY c.customer_id 
				ORDER BY ca.[rowversion] DESC
			) AS RowNumber
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
	)
	SELECT 
		customer_id,
		first_name,
		last_name,
		email,
		full_name,
		MAX(CASE WHEN RowNumber = 1 THEN street_name END) AS street_name,
		MAX(CASE WHEN RowNumber = 1 THEN street_number END) AS street_number,
		MAX(CASE WHEN RowNumber = 1 THEN city END) AS city,
		MAX(CASE WHEN RowNumber = 1 THEN address_status END) AS address_status,
		MAX(CASE WHEN RowNumber = 1 THEN country_name END) AS country_name,
		STRING_AGG(single_address, ' | ') WITHIN GROUP (ORDER BY RowNumber ASC) AS historical_address
	FROM CustomerAddressCte
	GROUP BY 
		customer_id,
		first_name,
		last_name,
		email,
		full_name
	ORDER BY customer_id;