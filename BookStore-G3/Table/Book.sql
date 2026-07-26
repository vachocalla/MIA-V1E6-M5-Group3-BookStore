CREATE TABLE Book
(
	[book_id] INT NOT NULL,
	[title] VARCHAR(400) NULL,
	[isbn13] VARCHAR(13) NULL,
	[language_id] INT NULL,
	[num_pages] INT NULL,
	[publication_date] DATE NULL,
	[publisher_id] INT NULL,
	[rowversion] [timestamp] NOT NULL,
	CONSTRAINT PK_book PRIMARY KEY (book_id),
	CONSTRAINT FK_BookId_Publisher FOREIGN KEY (publisher_id) REFERENCES [Publisher](publisher_id),
	CONSTRAINT FK_BookId_Language  FOREIGN KEY (language_id)  REFERENCES [book_language](language_id)
);
