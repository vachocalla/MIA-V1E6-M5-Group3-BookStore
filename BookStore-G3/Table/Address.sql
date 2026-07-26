CREATE TABLE [Address]
(
	[Id] INT NOT NULL CONSTRAINT PK_address PRIMARY KEY,
	[address_id] [int] NOT NULL,
	[street_number] [varchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[country_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
	CONSTRAINT fk_address_country FOREIGN KEY (country_id) REFERENCES country(country_id)
 );
