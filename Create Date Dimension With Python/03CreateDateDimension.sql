DROP TABLE IF EXISTS dw.DimDate

CREATE TABLE dw.DimDate(	
DateCK BIGINT PRIMARY KEY,
Date DATE,
FormattedDate CHAR(10),-- Date in MM-dd-yyyy format
DayOfMonth NVARCHAR(2), -- Field will hold day number of Month
DaySuffix NVARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
DayName NVARCHAR(9), -- Contains name of the day, Sunday, Monday 
DayOfWeek CHAR(1),-- First Day Sunday=1 and Saturday=7
DayOfWeekInMonth NVARCHAR(2), --1st Monday or 2nd Monday in Month
DayOfWeekInYear NVARCHAR(2),
DayOfQuarter NVARCHAR(3),
DayOfYear NVARCHAR(3),
WeekOfMonth NVARCHAR(1),-- Week Number of Month 
WeekOfQuarter NVARCHAR(2), --Week Number of the Quarter
WeekOfYear NVARCHAR(2),--Week Number of the Year
MonthInYear INT, --Number of the Month 1 to 12 NVARCHAR(2)
MonthName NVARCHAR(9),--January, February etc
MonthOfQuarter NVARCHAR(2),-- Month Number belongs to Quarter
QuarterInYear CHAR(1),
QuarterName NVARCHAR(9),--First,Second..
Year INT,-- Year value of Date stored in Row CHAR(4)
YearName CHAR(7), --CY 2012,CY 2013
MonthYear CHAR(10), --Jan-2013,Feb-2013
YYYYMM CHAR(6),
FirstDayOfMonth DATE,
LastDayOfMonth DATE,
FirstDayOfQuarter DATE,
LastDayOfQuarter DATE,
FirstDayOfYear DATE,
LastDayOfYear DATE,
IsHoliday BIT,-- Flag 1=National Holiday, 0-No National Holiday
IsWeekDay BIT,-- 0=Week End ,1=Week Day
NameOfHoliday NVARCHAR(50),--Name of Holiday in US
IsFirstDayOfMonth NVARCHAR(3) NULL,
IsLastDayOfMonth NVARCHAR(3) NULL,
IsFirstDayOfQuarter NVARCHAR(3) NULL,
IsLastDayOfQuarter NVARCHAR(3) NULL,
IsFirstDayOfYear NVARCHAR(3) NULL,
IsLastDayOfYear NVARCHAR(3) NULL,
ISOWeekNumberOfYear INT NULL,
ISODayOfWeek INT NULL,
IsWorkDay NVARCHAR(3) NULL
)