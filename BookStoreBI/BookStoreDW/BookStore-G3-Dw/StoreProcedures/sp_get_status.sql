CREATE PROCEDURE [dbo].[sp_get_status]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT null AS status_value
    INTO #temp
    UNION ALL
    SELECT 
        o.status_value
    FROM dbo.Fact_Orders o
    GROUP BY o.status_value;

    SELECT 
    status_value
    FROM #temp 
    ORDER BY status_value;
END