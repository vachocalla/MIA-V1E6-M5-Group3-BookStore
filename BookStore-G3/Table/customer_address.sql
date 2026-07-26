CREATE TABLE customer_address(
	customer_id int NOT NULL,
	address_id int NOT NULL,
	status_id int NULL,
	[rowversion] timestamp NOT NULL,
	CONSTRAINT [PK_customer_address] PRIMARY KEY (customer_id, address_id),
	CONSTRAINT FK_CustomerAddress_Address FOREIGN KEY (address_id) REFERENCES [address](Id),
	CONSTRAINT FK_CustomerAddress_Customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT FK_CustomerAddress_AddressStatus FOREIGN KEY (status_id) REFERENCES address_status(status_id),
);