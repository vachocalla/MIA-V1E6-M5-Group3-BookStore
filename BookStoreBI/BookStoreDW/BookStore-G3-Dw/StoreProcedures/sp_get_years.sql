CREATE PROCEDURE [dbo].[sp_get_years]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS calendar_year
    INTO #temp
    UNION ALL
    SELECT 
        calendar_year
    FROM dbo.Dim_Date d 
    GROUP BY d.calendar_year;

    SELECT 
        calendar_year
    FROM #temp
    ORDER BY calendar_year;
END