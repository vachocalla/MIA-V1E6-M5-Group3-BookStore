CREATE TABLE country(
	country_id int NOT NULL CONSTRAINT [PK_country] PRIMARY KEY,
	country_name varchar(200) NULL,
	[rowversion] timestamp NOT NULL
);