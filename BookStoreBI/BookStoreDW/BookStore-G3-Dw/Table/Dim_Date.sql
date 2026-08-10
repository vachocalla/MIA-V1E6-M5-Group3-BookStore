CREATE TABLE dbo.Dim_Date
(
    date_key int NOT NULL CONSTRAINT PK_Dim_Date PRIMARY KEY CLUSTERED,
	full_date date NOT NULL,
	calendar_year smallint NOT NULL,
	calendar_semester smallint NOT NULL,
	calendar_quarter tinyint NOT NULL,
	month_number_of_year tinyint NOT NULL,
	month_name varchar(20) NOT NULL,
	week_number_of_year tinyint NOT NULL,
	day_number_of_year smallint NOT NULL,
	day_number_of_month tinyint NOT NULL,
	day_number_of_week tinyint NOT NULL,
	day_name_of_week varchar(20) NOT NULL,
	is_weekend bit NOT NULL
)
