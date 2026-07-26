CREATE TABLE publisher(
	publisher_id INT NOT NULL,
	publisher_name VARCHAR(400) NULL,
	[rowversion] timestamp NOT NULL,
	book_id INT NOT NULL,
	CONSTRAINT [PK_publisher] PRIMARY KEY (publisher_id)
);