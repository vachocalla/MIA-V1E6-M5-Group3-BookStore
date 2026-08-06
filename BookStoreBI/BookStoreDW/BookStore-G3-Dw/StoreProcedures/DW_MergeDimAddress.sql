CREATE PROCEDURE [dbo].[DW_MergeDimAddress]
AS
	UPDATE da
	SET 
		street_name = sa.street_name,
		street_number = sa.		street_number,
		city = sa.		city,
		country_name = sa.		country_name,
		--[address_status varchar](30) NULL,
		created_date = sa.created_date,
		modified_date = sa.modified_date
	FROM [dbo].[Dim_Address]        da
	INNER JOIN [staging].[Address] sa ON (da.[address_key] = sa.[address_key])
