CREATE TABLE customer(
	customer_id int NOT NULL CONSTRAINT [PK_customer] PRIMARY KEY,
	first_name varchar(200) NULL,
	last_name varchar(200) NULL,
	email varchar(350) NULL,
	[rowversion] timestamp NOT NULL
);