CREATE TABLE [dbo].[book_language]
(
	language_id int NOT NULL CONSTRAINT [PK_book_language] PRIMARY KEY,
	language_code varchar(8) NULL,
	language_name varchar(50) NULL,
	[rowversion] timestamp NOT NULL
)
