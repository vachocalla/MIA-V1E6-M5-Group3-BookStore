CREATE PROCEDURE [dbo].[sp_report_sales_by_book]
    @Anio INT = NULL,
    @Editorial VARCHAR(400) = NULL,
    @Autor VARCHAR(2000) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        b.book_id,
        b.title AS Titulo,
        b.isbn13,
        b.author_names AS Autores,
        b.publisher_name AS Editorial,
        COUNT(DISTINCT o.order_id) AS TotalOrdenes,
        SUM(o.quantity) AS TotalUnidades,
        SUM(o.subtotal) AS TotalVentas,
        AVG(o.price) AS PrecioPromedio
    FROM dbo.Fact_Orders o
    INNER JOIN dbo.Dim_Book b ON o.book_key = b.book_key
    INNER JOIN dbo.Dim_Date d ON o.date_key = d.date_key
    WHERE 
        (@Anio IS NULL OR d.calendar_year = @Anio)
        AND (@Editorial IS NULL OR b.publisher_name LIKE '%' + @Editorial + '%')
        AND (@Autor IS NULL OR b.author_names LIKE '%' + @Autor + '%')
    GROUP BY 
        b.book_id, b.title, b.isbn13, b.author_names, b.publisher_name
    ORDER BY TotalVentas DESC;
END