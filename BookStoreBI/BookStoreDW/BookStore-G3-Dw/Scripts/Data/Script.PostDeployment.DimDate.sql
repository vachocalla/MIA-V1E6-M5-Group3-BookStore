
DECLARE @startdate DATE = '2020-01-01',
		@enddate   DATE = '2024-12-31';
DECLARE @datelist TABLE(full_date DATE);

IF @startdate IS NULL
	BEGIN
		SELECT TOP 1 
				@startdate = full_date
		FROM dbo.Dim_Date 
		ORDER By date_key ASC;
	END

WHILE (@startdate <= @enddate)
BEGIN 
	INSERT INTO @datelist(full_date)
	SELECT @startdate

	SET @startdate = DATEADD(dd,1,@startdate);
END

MERGE dbo.Dim_Date AS target
USING (
    SELECT 
        date_key              = CONVERT(INT, CONVERT(VARCHAR, dl.full_date, 112)),
        full_date             = dl.full_date,
        calendar_year         = YEAR(dl.full_date),
        calendar_semester     = CASE WHEN DATEPART(qq, dl.full_date) IN (1, 2) THEN 1 ELSE 2 END,
        calendar_quarter      = DATEPART(qq, dl.full_date),
        month_number_of_year  = MONTH(dl.full_date),
        month_name            = DATENAME(MONTH, dl.full_date),
        week_number_of_year   = DATEPART(wk, dl.full_date),
        day_number_of_year    = DATEPART(dy, dl.full_date),
        day_number_of_month   = DATEPART(d, dl.full_date),
        day_number_of_week    = DATEPART(dw, dl.full_date),
        day_name_of_week      = DATENAME(WEEKDAY, dl.full_date),
        is_weekend            = CASE WHEN DATEPART(WEEKDAY, dl.full_date) IN (1, 7) THEN 1 ELSE 0 END
    FROM @datelist dl
) AS source
ON (target.date_key = source.date_key)

WHEN NOT MATCHED THEN
    INSERT (
        date_key,
        full_date,
        calendar_year,
        calendar_semester,
        calendar_quarter,
        month_number_of_year,
        month_name,
        week_number_of_year,
        day_number_of_year,
        day_number_of_month,
        day_number_of_week,
        day_name_of_week,
        is_weekend
    )
    VALUES (
        source.date_key,
        source.full_date,
        source.calendar_year,
        source.calendar_semester,
        source.calendar_quarter,
        source.month_number_of_year,
        source.month_name,
        source.week_number_of_year,
        source.day_number_of_year,
        source.day_number_of_month,
        source.day_number_of_week,
        source.day_name_of_week,
        source.is_weekend
    );
