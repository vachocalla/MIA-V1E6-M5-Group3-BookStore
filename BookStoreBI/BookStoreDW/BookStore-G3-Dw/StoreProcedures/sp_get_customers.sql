CREATE PROCEDURE [dbo].[sp_get_customers]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS customer_key,
        NULL AS Cliente
    INTO #temp
    UNION ALL
    SELECT 
        c.customer_key,
        c.full_name AS Cliente
    FROM dbo.Dim_Customer  c ;

    SELECT
        customer_key,
        Cliente
    FROM #temp
    ORDER BY Cliente;
END