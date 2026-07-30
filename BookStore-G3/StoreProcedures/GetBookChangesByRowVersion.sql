CREATE PROCEDURE [dbo].[GetBookChangesByRowVersion]
	@startRow BIGINT,
	@endRow  BIGINT
AS
	SELECT 
        b.book_id,
        b.title,
        b.isbn13,
        bl.language_code,
        bl.language_name,
        b.num_pages,
        b.publication_date,
        p.publisher_name,
        a.author_name
    FROM book AS b
    INNER JOIN book_language AS bl ON (
        b.language_id = bl.language_id
    )
    INNER JOIN publisher AS p ON (
        b.publisher_id = p.publisher_id
    )
    INNER JOIN book_author AS ba ON (
        b.book_id = ba.book_id
    )
    INNER JOIN author AS a ON (
        ba.author_id = a.author_id
    )
    WHERE 
        (b.[rowversion] > CONVERT(ROWVERSION,@startRow) AND b.[rowversion] <= CONVERT(ROWVERSION,@endRow))
        OR 
        (bl.[rowversion] > CONVERT(ROWVERSION,@startRow) AND bl.[rowversion] <= CONVERT(ROWVERSION,@endRow))
        OR 
        (p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow))
        OR 
        (ba.[rowversion] > CONVERT(ROWVERSION,@startRow) AND ba.[rowversion] <= CONVERT(ROWVERSION,@endRow))
        OR 
        (a.[rowversion] > CONVERT(ROWVERSION,@startRow) AND a.[rowversion] <= CONVERT(ROWVERSION,@endRow))
