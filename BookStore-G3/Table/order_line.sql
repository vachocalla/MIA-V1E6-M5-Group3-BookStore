CREATE TABLE order_line(
	line_id int NOT NULL,
	order_id int NULL,
	book_id int NULL,
	[rowversion] timestamp NOT NULL,
	CONSTRAINT [PK_order_line] PRIMARY KEY (line_id),
	CONSTRAINT [FK_OrderLine_Book] FOREIGN KEY (book_id) REFERENCES [book](book_id)
);