CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
	UPDATE dc
	SET 
		first_name = sc.first_name,
		last_name = sc.last_name,
		email = sc.email,
		full_name = sc.full_name,
		street_name = sc.street_name,
		street_number = sc.street_number,
		city = sc.city,
		address_status = sc.address_status,
		country_name = sc.country_name,
		created_date = sc.created_date,
		modified_date = sc.modified_date
	FROM [dbo].[Dim_Customer]        dc
	INNER JOIN [staging].[Customer] sc ON (dc.[customer_key] = sc.[customer_key])
