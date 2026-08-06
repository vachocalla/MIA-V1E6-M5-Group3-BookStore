CREATE TABLE [Staging].[Book]
(
	[book_key] [int] NOT NULL,
	[title] [varchar](400) NOT NULL,
	[isbn13] [varchar](13) NULL,
	[language_code] [varchar](8) NULL,
	[language_name] [varchar](50) NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[publisher_name] [varchar](400) NULL,
	[author_names] [varchar](2000) NULL,
	[created_date] [datetime] DEFAULT GETDATE(),
	[modified_date] [datetime] DEFAULT GETDATE(),
)
