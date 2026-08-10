CREATE TABLE [Staging].[Orders]
(
	order_id int NOT NULL,
	line_id int NOT NULL,

	book_key int NOT NULL,
	customer_key int NOT NULL,
	date_key int NOT NULL,
	shipping_key int NOT NULL,
	address_key int NOT NULL,
	
	order_date_time datetime NOT NULL,

	status_date datetime NOT NULL,
	status_value VARCHAR(20) NOT NULL,

	price decimal(10, 2) NULL,
	quantity int NULL,
	subtotal decimal(10, 2) NULL,

	etl_load_date DATETIME DEFAULT GETDATE()
)

