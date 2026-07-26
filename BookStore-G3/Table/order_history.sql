CREATE TABLE order_history(
	history_id int NOT NULL CONSTRAINT [PK_order_history] PRIMARY KEY,
	order_id int NULL,
	status_id int NULL,
	status_date datetime NULL,
	[rowversion] timestamp NOT NULL,
	CONSTRAINT fk_sh_order FOREIGN KEY (status_id) REFERENCES order_status(status_id),
	CONSTRAINT fk_co_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id)

);