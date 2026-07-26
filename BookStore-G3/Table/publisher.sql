CREATE TABLE publisher(
	publisher_id int NOT NULL CONSTRAINT [PK_publisher] PRIMARY KEY,
	publisher_name varchar(400) NULL,
	[rowversion] timestamp NOT NULL
);