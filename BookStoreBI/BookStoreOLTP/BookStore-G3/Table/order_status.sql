CREATE TABLE order_status(
	status_id int NOT NULL CONSTRAINT [PK_order_status] PRIMARY KEY,
	status_value varchar(20) NULL,
	[rowversion] timestamp NOT NULL
);