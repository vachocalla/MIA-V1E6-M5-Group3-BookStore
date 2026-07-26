CREATE TABLE [dbo].[book_language]
(
	language_id INT NOT NULL,
	language_code VARCHAR(8) NULL,
	language_name VARCHAR(50) NULL,
	[rowversion] timestamp NOT NULL,
	book_id INT NOT NULL,
	CONSTRAINT [PK_book_language] PRIMARY KEY (language_id)
);
