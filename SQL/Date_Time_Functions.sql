/*Date and Time Functions */
-- convert varchar date and time strings to datetime with shady time data

ISNULL(TRY_CAST(TRY_CAST(<DATE FIELD> as DATE) AS DATETIME) + 
    TRY_CAST(TRY_CAST(STUFF((CASE 
         WHEN LEN(<TIME FIELD>) < 4 THEN 
         REPLACE(STR(<TIME FIELD>, 4), SPACE(1), '0')
         ELSE <TIME FIELD> END) , 3, 0, ':')  as TIME)
         as DATETIME), 
         TRY_CAST(<DATE FIELD> as DATE))

-- get date from data parts SQL SERVER 2012+ 
DECLARE @Year int = 2016, @Month int = 10, @Day int = 25;
SELECT DATEFROMPARTS (@Year, @Month, @Day);

-- Get month  number from month name 
Select charindex('DEC','JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC')/4+1

-- adding working days skipping weekends and holidays 
DECLARE @StartDate DATE = '2020-11-09'
DECLARE @numDays  INT = 45
DECLARE @HolidaysTbl as TABLE (HolidayDate date)
INSERT INTO @HolidaysTbl(HolidayDate) 
VALUES     ('2020-01-01'),     ('2020-01-20'),     ('2020-02-17'),     ('2020-05-25'),     ('2020-07-03'),     ('2020-09-07'),     ('2020-10-12'),     ('2020-11-11'),     ('2020-11-26'),     ('2020-12-25'),     ('2021-01-01'),     ('2021-01-18'),     ('2021-02-15'),     ('2021-05-24'),     ('2021-07-05'),     ('2021-09-06'),     ('2021-10-11'),     ('2021-11-11'),     ('2021-11-25'),     ('2021-12-24'),     ('2021-12-31');

--CREATE FUNCTION ADDWORKINGDAYS(@StartDate AS DATE, @numDays AS INT)
--RETURNS DATETIME
--AS
--BEGIN
    WHILE @numDays > 0
    BEGIN
       SET @StartDate = DATEADD(d,1,@StartDate )
       IF EXISTS (SELECT HolidayDate FROM @HolidaysTbl WHERE HolidayDate = @StartDate) 
        BEGIN 
            SET @StartDate = DATEADD(d,1,@StartDate)
        END
       IF DATENAME(DW,@StartDate ) = 'saturday' 
        BEGIN
            SET @StartDate = DATEADD(d,1,@StartDate)
        END 
        IF DATENAME(DW,@StartDate ) = 'sunday'
        BEGIN
            SET @StartDate = DATEADD(d,1,@StartDate)
        END 
        SET @numDays = @numDays-1
    END
select @StartDate  --  RETURN CAST(@addDate AS DATETIME)





-- calculate date
select DATEDIFF(YEAR, BIRTH, GETDATE()) - (
		CASE 
			WHEN DATEADD(YY, DATEDIFF(YEAR, BIRTH, GETDATE()), BIRTH) > GETDATE()
				THEN 1
			ELSE 0
			END
		) AS AGE
from <table>;

-- Format date
SELECT 
(FORMAT(DATEADD(DAY,-1,GETDATE()),'yyyy-MM-dd')) AS [Date]

-- return first day of current month
SELECT DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)

-- Return end of month date 
SELECT DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,-1) 

-- return first day of previous month 
SELECT DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0)

-- return last day of previous month
SELECT DATEADD(DAY, -(DAY(GETDATE())), GETDATE())

-- Casting as date trims off the time. 
SELECT CAST(DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,-1) AS DATE) 

-- Return first date of last year  change (-1) to alter number of years. 
SELECT DATEADD(yy,-1,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0)) 

-- return last day of last year
SELECT DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) , 0))

-- To get the last day of the current year:
SELECT DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) +1, 0))

/* return last 12 months excluding current month */
SELECT DATEADD(m, -12, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0))

/* format as straight varchar 20170101 */
select CONVERT(VARCHAR(8), GETDATE(), 112)

/* get date or time from getdate() */
SELECT CAST (GETDATE() AS DATE) AS D, CAST (GETDATE AS time) AS T

/* get past 18 year month - clever way to create incrementing values recursively*/
WITH R (N)
  AS (SELECT 0 UNION ALL SELECT N + 1 FROM R WHERE N < 18)
SELECT
     DATEPART(YEAR, DATEADD(MONTH, -N, GETDATE())) AS [year],
     FORMAT(DATEADD(MONTH, -N, GETDATE()), 'MM') AS [month], N
FROM R

/* get quarter start dates for year */
DECLARE
    @ThisDate date = DATEADD(yy,0,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0)) -- first day of current year
SELECT 'Q1',DATEADD(quarter,0,@ThisDate), 'Q2',DATEADD(quarter,1,@ThisDate), 'Q3',DATEADD(quarter,2,@ThisDate), 'Q4',DATEADD(quarter,3,@ThisDate)     

/* get quarter date spans by current date */
DECLARE @vFirstDayOfCurrentYear DATE = DATEADD(yy, 0, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)); 
DECLARE @vCurrentQtr INT= DATEPART(QUARTER, GETDATE());
DECLARE @QtrStart DATE;
DECLARE @QtrEnd DATE;

SELECT @QtrStart = 
CASE WHEN @vCurrentQtr = 1
THEN DATEADD(QUARTER, 0, @vFirstDayOfCurrentYear) 
WHEN  @vCurrentQtr = 2
THEN DATEADD(QUARTER, 1, @vFirstDayOfCurrentYear) 
 WHEN @vCurrentQtr = 3
THEN DATEADD(QUARTER, 2, @vFirstDayOfCurrentYear) 
 WHEN @vCurrentQtr = 4
THEN DATEADD(QUARTER, 3, @vFirstDayOfCurrentYear) 
END, @QtrEnd = 
CASE WHEN @vCurrentQtr = 1
THEN DATEADD(QUARTER, 1, @vFirstDayOfCurrentYear) 
WHEN  @vCurrentQtr = 2
THEN DATEADD(QUARTER, 2, @vFirstDayOfCurrentYear) 
 WHEN @vCurrentQtr = 3
THEN DATEADD(QUARTER, 3, @vFirstDayOfCurrentYear) 
 WHEN @vCurrentQtr = 4
THEN DATEADD(QUARTER, 4, @vFirstDayOfCurrentYear) 
END
 
PRINT @QtrStart
PRINT @QtrEnd

/* Date and Hour Check */
DECLARE 
@DateCheck VARCHAR(15),
@HourCheck INT

SET @DateCheck = (SELECT DATENAME(dw, GETDATE()))
SET @HourCheck = (SELECT CAST(DATENAME(HOUR,GETDATE()) AS INT))

IF (@DateCheck <> 'Saturday' AND @DateCheck <> 'Sunday'	) -- Check for day or not the day
	AND (@HourCheck >= 6 AND @HourCheck <= 18 ) -- check for the time
		BEGIN
		/* Statement to execute if criteria */
		END
/* get server date time */
SELECT SYSDATETIME(), CURRENT_TIMESTAMP          