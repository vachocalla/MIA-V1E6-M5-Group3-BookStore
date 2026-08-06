CREATE PROCEDURE [dbo].[DW_MergeDimShippingMethod]
AS
	UPDATE dsm
	SET 
		method_name = ssm.method_name,
		cost = ssm.cost,
		--[address_status varchar](30) NULL,
		created_date = ssm.created_date,
		modified_date = ssm.modified_date
	FROM [dbo].[Dim_ShippingMethod]        dsm
	INNER JOIN [staging].[ShippingMethod] ssm ON (dsm.[shipping_key] = ssm.[shipping_key])
