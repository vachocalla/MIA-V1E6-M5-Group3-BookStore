CREATE PROCEDURE [dbo].[sp_get_authors]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS author_names
    INTO #temp
    UNION ALL
    SELECT 
        b.author_names
    FROM dbo.Dim_Book b
    GROUP BY b.author_names;
    
    SELECT 
        author_names
    FROM #temp
    ORDER BY author_names DESC;
END