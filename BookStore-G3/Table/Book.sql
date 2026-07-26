CREATE TABLE Book
(
	[book_id] INT NOT NULL CONSTRAINT PK_book PRIMARY KEY,
	[title] VARCHAR(400) NULL,
	[isbn13] VARCHAR(13) NULL,
	[language_id] INT NULL,
	[num_pages] INT NULL,
	[publication_date] DATE NULL,
	[publisher_id] INT NULL,
	[rowversion] [timestamp] NOT NULL,
);
