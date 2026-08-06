CREATE TABLE [Staging].[Shipping]
(
	[shipping_key] [int] NOT NULL,
	[method_name] [varchar](100) NULL,
	[cost] [decimal](10, 2) NULL,
	[created_date] [datetime] DEFAULT GETDATE(),
	[modified_date] [datetime] DEFAULT GETDATE(),
)
