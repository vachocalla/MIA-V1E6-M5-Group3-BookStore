CREATE PROCEDURE [dbo].[sp_get_books]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS book_key,
        NULL AS title
    INTO #temp
    UNION ALL
    SELECT 
        b.book_key,
        b.title
    FROM dbo.Dim_Book      b;

    SELECT
        book_key,
        title
    FROM #temp
    ORDER BY title;
END
