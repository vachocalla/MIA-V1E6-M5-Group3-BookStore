CREATE TABLE Author
(
	[author_id] INT NOT NULL,
	[author_name] VARCHAR(400) NULL,
	[rowversion] [timestamp] NOT NULL,
	[book_id] INT NOT NULL,
	CONSTRAINT PK_author PRIMARY KEY (author_id)
);
