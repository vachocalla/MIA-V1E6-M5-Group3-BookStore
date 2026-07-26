CREATE TABLE Address_Status
(
	status_id INT NOT NULL CONSTRAINT PK_addr_status PRIMARY KEY,
	[address_status] [varchar](30) NULL,
	[rowversion] [timestamp] NOT NULL,
);
