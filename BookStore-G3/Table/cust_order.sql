CREATE TABLE cust_order(
	order_id int NOT NULL CONSTRAINT [PK_cust_order] PRIMARY KEY,
	order_date datetime NULL,
	customer_id int NULL,
	shipping_method_id int NULL,
	dest_address_id int NULL,
	[rowversion] timestamp NOT NULL
);