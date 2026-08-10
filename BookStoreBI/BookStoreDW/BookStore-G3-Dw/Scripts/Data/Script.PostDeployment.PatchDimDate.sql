MERGE dbo.Dim_Date AS target
USING (
    SELECT 
        0 AS date_key,
        GETDATE() AS full_date,
        0 AS calendar_year,
        0 AS calendar_semester,
        0 AS calendar_quarter,
        0 AS month_number_of_year,
        '' AS month_name,
        0 AS week_number_of_year,
        0 AS day_number_of_year,
        0 AS day_number_of_month,
        0 AS day_number_of_week,
        '' AS day_name_of_week,
        0 AS is_weekend
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
        0
        ,GETDATE()
        ,0
        ,0
        ,0
        ,0
        ,''
        ,0
        ,0
        ,0
        ,0
        ,''
        ,0
    );