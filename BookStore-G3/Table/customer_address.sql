CREATE TABLE customer_address(
	customer_id int NOT NULL,
	address_id int NOT NULL,
	status_id int NULL,
	[rowversion] timestamp NOT NULL,
	CONSTRAINT [PK_customer_address] PRIMARY KEY (customer_id, address_id)
);