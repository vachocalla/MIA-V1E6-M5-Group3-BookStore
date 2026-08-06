CREATE TABLE [dbo].[Dim_ShippingMethod]
(
	[shipping_key] [int] IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Dim_ShippingMethod] PRIMARY KEY CLUSTERED,
	[method_id] [int] NOT NULL,
	[method_name] [varchar](100) NULL,
	[cost] [decimal](10, 2) NULL,
	[created_date] [datetime] DEFAULT GETDATE(),
	[modified_date] [datetime] DEFAULT GETDATE(),
)
