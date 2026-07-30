CREATE TABLE shipping_method(
	method_id int NOT NULL CONSTRAINT [PK_shipping_method] PRIMARY KEY,
	method_name varchar(100) NULL,
	cost decimal(6, 2) NULL,
	[rowversion] timestamp NOT NULL
);