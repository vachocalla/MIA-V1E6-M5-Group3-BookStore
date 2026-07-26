CREATE TABLE Book_Author
(
	book_id INT NOT NULL CONSTRAINT PK_bookauthor PRIMARY KEY,
	author_id INT NOT NULL,
	[rowversion] [timestamp] NOT NULL,
);
