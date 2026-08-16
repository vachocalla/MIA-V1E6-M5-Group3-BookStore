CREATE PROCEDURE [dbo].[sp_report_sales_by_country]
    @Anio INT = NULL,
    @Pais VARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        a.country_name AS Pais,
        a.city AS Ciudad,
        COUNT(DISTINCT o.order_id) AS TotalOrdenes,
        SUM(o.quantity) AS TotalUnidades,
        SUM(o.subtotal) AS TotalVentas
    FROM dbo.Fact_Orders o
    INNER JOIN dbo.Dim_Address a ON o.address_key = a.address_key
    INNER JOIN dbo.Dim_Date d ON o.date_key = d.date_key
    WHERE 
        (@Anio IS NULL OR d.calendar_year = @Anio)
        AND (@Pais IS NULL OR a.country_name = @Pais)
    GROUP BY a.country_name, a.city
    ORDER BY TotalVentas DESC;
END