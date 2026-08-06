CREATE TABLE Book_Author
(
	book_id INT NOT NULL,
	author_id INT NOT NULL,
	[rowversion] [timestamp] NOT NULL,
	CONSTRAINT [PK_bookauthor] PRIMARY KEY (book_id, author_id),
	CONSTRAINT FK_BookAuthor_Author FOREIGN KEY (author_id) REFERENCES [author](author_id),
	CONSTRAINT FK_BookAuthor_Book   FOREIGN KEY (book_id)   REFERENCES [book](book_id)
);