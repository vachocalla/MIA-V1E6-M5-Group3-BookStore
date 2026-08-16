CREATE PROCEDURE [dbo].[sp_get_countries]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        NULL AS PaisCliente
    INTO #temp
    UNION ALL 
    SELECT 
        c.country_name AS PaisCliente
    FROM dbo.Dim_Customer  c
    GROUP BY c.country_name;

    SELECT
        PaisCliente
    FROM #temp
    ORDER BY PaisCliente;
END