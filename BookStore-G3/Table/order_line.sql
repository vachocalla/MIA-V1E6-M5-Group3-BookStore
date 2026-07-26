CREATE TABLE order_line(
	line_id int NOT NULL CONSTRAINT [PK_order_line] PRIMARY KEY,
	order_id int NULL,
	book_id int NULL,
	[rowversion] timestamp NOT NULL
);