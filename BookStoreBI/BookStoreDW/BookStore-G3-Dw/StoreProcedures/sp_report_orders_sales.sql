/*
Reporte General de Ventas (Fact_Orders + Dimensiones)
*/
CREATE PROCEDURE [dbo].[sp_report_orders_sales]
    @FechaInicio DATE = NULL,
    @FechaFin    DATE = NULL,
    @CustomerKey   INT = NULL,
    @BookKey     INT = NULL,
    @Country        VARCHAR(200) = NULL,
    @Status      VARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.order_id,
        o.line_id,
        o.order_date_time,
        o.status_value,
        o.price,
        o.quantity,
        o.subtotal,

        -- Cliente
        c.full_name AS Cliente,
        c.email AS EmailCliente,
        c.country_name AS PaisCliente,

        -- Libro
        b.title AS TituloLibro,
        b.isbn13,
        b.author_names AS Autores,
        b.publisher_name AS Editorial,

        -- Fecha
        d.full_date AS FechaOrden,
        d.calendar_year AS Anio,
        d.month_name AS Mes,

        -- Envío
        s.method_name AS MetodoEnvio,
        s.cost AS CostoEnvio,

        -- Dirección
        a.city AS Ciudad,
        a.country_name AS PaisEntrega

    FROM dbo.Fact_Orders o
    INNER JOIN dbo.Dim_Customer  c ON o.customer_key = c.customer_key
    INNER JOIN dbo.Dim_Book      b ON o.book_key    = b.book_key
    INNER JOIN dbo.Dim_Date      d ON o.date_key    = d.date_key
    INNER JOIN dbo.Dim_Shipping  s ON o.shipping_key= s.shipping_key
    INNER JOIN dbo.Dim_Address   a ON o.address_key = a.address_key

    WHERE 
        (@FechaInicio IS NULL OR d.full_date >= @FechaInicio)
        AND (@FechaFin IS NULL OR d.full_date <= @FechaFin)
        AND (@CustomerKey IS NULL OR c.customer_key = @CustomerKey)
        AND (@BookKey IS NULL OR b.book_key = @BookKey)
        AND (@Country IS NULL OR c.country_name LIKE '%' + @Country + '%')
        AND (@Status IS NULL OR o.status_value = @Status)

    ORDER BY o.order_date_time DESC, o.order_id;
END