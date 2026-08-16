CREATE PROCEDURE [dbo].[sp_get_publishers]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS publisher_name
    INTO #temp
    UNION ALL
    SELECT 
        publisher_name
    FROM dbo.Dim_Book b 
    GROUP BY b.publisher_name;

    SELECT 
        publisher_name
    FROM #temp
    ORDER BY publisher_name;
END