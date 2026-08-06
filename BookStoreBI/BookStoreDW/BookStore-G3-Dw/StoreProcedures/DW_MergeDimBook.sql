CREATE PROCEDURE [dbo].[DW_MergeDimBook]
AS
	UPDATE db
	SET 
		title = sb.title,
		isbn13 = sb.isbn13,
		language_code = sb.language_code,
		language_name = sb.language_name,
		num_pages = sb.num_pages,
		publication_date = sb.publication_date,
		publisher_name = sb.publisher_name,
		author_names = sb.author_names,
		created_date = sb.created_date,
		modified_date = sb.modified_date
	FROM [dbo].[Dim_Book]        db
	INNER JOIN [staging].[book] sb ON (db.[book_key] = sb.[book_key])
