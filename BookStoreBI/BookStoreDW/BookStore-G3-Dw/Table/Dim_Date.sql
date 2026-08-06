CREATE TABLE dbo.Dim_Date
(
    date_key int NOT NULL CONSTRAINT PK_Dim_Date PRIMARY KEY CLUSTERED,
	full_date date NOT NULL,
	[year] smallint NOT NULL,
	[quarter] tinyint NOT NULL,
	[month] tinyint NOT NULL,
	month_name varchar(20) NOT NULL,
	day_of_month tinyint NOT NULL,
	day_of_week tinyint NOT NULL,
	day_name varchar(20) NOT NULL,
	week_of_year tinyint NOT NULL,
	is_weekend bit NOT NULL,
	is_holiday bit NULL,
)
