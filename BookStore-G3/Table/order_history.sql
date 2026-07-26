CREATE TABLE order_history(
	history_id int NOT NULL CONSTRAINT [PK_order_history] PRIMARY KEY,
	order_id int NULL,
	status_id int NULL,
	status_date datetime NULL,
	[rowversion] timestamp NOT NULL
);