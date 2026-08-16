CREATE PROCEDURE [dbo].[sp_get_months]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS month_number_of_year,
        NULL AS month_name
    INTO #temp
    UNION ALL
    SELECT 
        month_number_of_year,
        month_name
    FROM dbo.Dim_Date d 
    GROUP BY month_number_of_year,month_name;

    SELECT
        month_number_of_year,
        month_name
    FROM #temp
    ORDER BY month_number_of_year DESC;
END