CREATE TABLE cust_order(
	order_id int NOT NULL CONSTRAINT [PK_cust_order] PRIMARY KEY,
	order_date datetime NULL,
	customer_id int NULL,
	shipping_method_id int NULL,
	dest_address_id int NULL,
	[rowversion] timestamp NOT NULL,
	CONSTRAINT FK_CustomerOrder_Address FOREIGN KEY (dest_address_id) REFERENCES [Address](address_id),
	CONSTRAINT fk_cs_shipping FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
	CONSTRAINT fk_co_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)

);