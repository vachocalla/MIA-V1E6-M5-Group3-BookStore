CREATE TABLE [dbo].[Dim_Address]
(
	[address_key] [int] IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Dim_Address] PRIMARY KEY CLUSTERED,
	[address_id] [int] NOT NULL,
	[street_name] [varchar](200) NULL,
	[street_number] [varchar](10) NULL,
	[city] [varchar](100) NULL,
	[country_name] [varchar](200) NULL,
	--[address_status] [varchar](30) NULL,
	[created_date] [datetime] DEFAULT GETDATE(),
	[modified_date] [datetime] DEFAULT GETDATE(),
)
