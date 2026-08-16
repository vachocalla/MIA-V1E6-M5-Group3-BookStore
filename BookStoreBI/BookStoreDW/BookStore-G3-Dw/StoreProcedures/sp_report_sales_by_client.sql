CREATE PROCEDURE [dbo].[sp_report_sales_by_client]
    @Pais VARCHAR(200) = NULL,
    @Anio INT = NULL,
    @Mes INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.customer_id,
        c.full_name AS Cliente,
        c.email,
        c.country_name AS Pais,
        COUNT(DISTINCT o.order_id) AS TotalOrdenes,
        SUM(o.quantity) AS TotalUnidades,
        SUM(o.subtotal) AS TotalGastado,
        AVG(o.price) AS PrecioPromedio
    FROM dbo.Fact_Orders o
    INNER JOIN dbo.Dim_Customer c ON o.customer_key = c.customer_key
    INNER JOIN dbo.Dim_Date d ON o.date_key = d.date_key
    WHERE 
        (@Pais IS NULL OR c.country_name = @Pais)
        AND (@Anio IS NULL OR d.calendar_year = @Anio)
        AND (@Mes IS NULL OR d.month_number_of_year = @Mes)
    GROUP BY 
        c.customer_id, c.full_name, c.email, c.country_name
    ORDER BY TotalGastado DESC;
END