/*Add HOLIDAYS */
/*THANKSGIVING - Fourth THURSDAY in November*/
UPDATE [dw].[DimDate]
SET Holiday = 'Thanksgiving Day'
WHERE Date IN(
SELECT DATEADD(WEEK, 3, DateAdd(day, (7+5 -DatePart(weekday, Date))%7, Date) ) AS Thanksgiving
FROM [dw].[DimDate]
WHERE MonthInYear = 11
AND DayOfMonth = 1
)

/*CHRISTMAS*/
UPDATE [dw].[DimDate]
SET Holiday = 'Christmas Day'
WHERE [Month] = 12 AND DayOfMonth  = 25

/*4th of July*/
UPDATE [dw].[DimDate]
SET Holiday = 'Independance Day'
WHERE [Month] = 7 AND DayOfMonth = 4

/*New Years Day*/
UPDATE [dw].[DimDate]
SET Holiday = 'New Year''s Day'
WHERE [Month] = 1 AND DayOfMonth = 1

/*Memorial Day - Last Monday in May*/
UPDATE [dw].[DimDate]
SET Holiday = 'Memorial Day'
FROM [dw].[DimDate]
WHERE DateCK IN (
SELECT MAX(DateCK)
FROM [dw].[DimDate]
WHERE MonthName = 'May'
AND DayOfWeek  = 'Monday'
GROUP BY Year, Month
)

/*Labor Day - First Monday in September*/
UPDATE [dw].[DimDate]
SET Holiday = 'Labor Day'
FROM [dw].[DimDate]
WHERE DateCK IN (
SELECT MIN(DateCK)
FROM [dw].[DimDate]
WHERE MonthName = 'September'
AND DayOfWeek = 'Monday'
GROUP BY Year, Month
)

/*Valentine's Day*/
UPDATE [dw].[DimDate]
SET Holiday = 'Valentine''s Day'
WHERE [Month] = 2 AND DayOfMonth = 14

/*Saint Patrick's Day*/
UPDATE [dw].[DimDate]
SET Holiday = 'Saint Patrick''s Day'
WHERE [Month] = 3 AND DayOfMonth = 17

/*Martin Luthor King Day - Third Monday in January starting in 1983*/
UPDATE [dw].[DimDate]
SET Holiday = 'Martin Luthor King Jr Day'
WHERE [Month] = 1
AND DayOfWeek  = 'Monday'
AND Year >= 1983
AND DayOfWeekInMonth = 3

/*President's Day - Third Monday in February*/
UPDATE [dw].[DimDate]
SET Holiday = 'President''s Day'
WHERE [Month] = 2
AND DayOfWeek = 'Monday'
AND DayOfWeekInMonth = 3

/*Mother's Day - Second Sunday of May*/
UPDATE [dw].[DimDate]
SET Holiday = 'Mother''s Day'
WHERE [Month] = 5
AND DayOfWeek = 'Sunday'
AND DayOfWeekInMonth = 2

/*Father's Day - Third Sunday of June*/
UPDATE [dw].[DimDate]
SET Holiday = 'Father''s Day'
WHERE [Month] = 6
AND DayOfWeek = 'Sunday'
AND DayOfWeekInMonth = 3

/*Halloween 10/31*/
UPDATE [dw].[DimDate]
SET Holiday = 'Halloween'
WHERE [Month] = 10
AND DayOfMonth = 31

/*Election Day - The first Tuesday after the first Monday in November*/
BEGIN
DECLARE @Holidays TABLE (ID INT IDENTITY(1,1), DateID int, Week TINYINT, YEAR CHAR(4), DAY CHAR(2))

INSERT INTO @Holidays(DateID, Year,Day)
SELECT DateCK, Year, DayOfMonth 
FROM [dw].[DimDate]
WHERE [Month] = 11
AND DayOfWeek = 'Monday'
ORDER BY Year, DayOfMonth 

DECLARE @CNTR INT, @POS INT, @STARTYEAR INT, @ENDYEAR INT, @MINDAY INT

SELECT
@CURRENTYEAR = MIN(Year),
@STARTYEAR = MIN(Year),
@ENDYEAR = MAX(Year)
FROM @Holidays

WHILE @CURRENTYEAR <= @ENDYEAR
BEGIN
SELECT @CNTR = COUNT(Year)
FROM @Holidays
WHERE Year = @CURRENTYEAR

SET @POS = 1

WHILE @POS <= @CNTR
BEGIN
SELECT @MINDAY = MIN(DAY)
FROM @Holidays
WHERE Year = @CURRENTYEAR
AND Week IS NULL

UPDATE @Holidays
SET Week = @POS
WHERE Year = @CURRENTYEAR
AND Day = @MINDAY

SELECT @POS = @POS + 1
END

SELECT @CURRENTYEAR = @CURRENTYEAR + 1
END

UPDATE [dw].[DimDate]
SET Holiday  = 'Election Day'				
FROM [dw].[DimDate] DT
JOIN @Holidays HL ON (HL.DateID + 1) = DT.DateCK
WHERE Week = 1
END