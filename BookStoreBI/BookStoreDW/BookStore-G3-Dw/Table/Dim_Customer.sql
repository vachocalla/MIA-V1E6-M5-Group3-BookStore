CREATE TABLE [dbo].[Dim_Customer]
(
	[customer_key] [int] IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED,
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](200) NULL,
	[last_name] [varchar](200) NULL,
	[email] [varchar](350) NULL,
	[full_name] [varchar](400) NULL,
	[street_name] [varchar](400) NULL,
	[street_number] [varchar](10) NULL,
	[city] [varchar](100) NULL,
	[address_status] [varchar](30) NULL,
	[country_name] [varchar](200) NULL,
	[created_date] [datetime] DEFAULT GETDATE(),
	[modified_date] [datetime] DEFAULT GETDATE(),
)
