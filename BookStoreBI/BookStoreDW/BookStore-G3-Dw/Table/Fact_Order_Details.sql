CREATE TABLE dbo.Fact_Order_Details(
	order_detail_id bigint IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Fact_Order_Details] PRIMARY KEY CLUSTERED,
	book_key int NOT NULL,
	customer_key int NOT NULL,
	date_key int NOT NULL,
	shipping_key int NOT NULL,
	address_key int NOT NULL,
	order_id int NOT NULL,
	line_id int NOT NULL,
	price decimal(10, 2) NULL,
	quantity int NULL,
	subtotal decimal(10, 2) NULL,
	etl_load_date datetime NULL,
	CONSTRAINT fk_book_key FOREIGN KEY (book_key) REFERENCES dim_book(book_key),
	CONSTRAINT fk_customer_key FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
	CONSTRAINT fk_date_key FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
	CONSTRAINT fk_shipping_key FOREIGN KEY (shipping_key) REFERENCES dim_shipping(shipping_key),
	CONSTRAINT fk_address_key FOREIGN KEY (address_key) REFERENCES dim_address(address_key)
	);