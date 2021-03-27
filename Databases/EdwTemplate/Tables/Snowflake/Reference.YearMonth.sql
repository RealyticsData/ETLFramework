/*******************************************************************************
Description:
    Snowflake table for business month. This is a unique month in a specific year.

The surrogate key is an incremental sequence from the anchor month set in the
system configuration. (e.g., 1/1/1900)

The MonthYear columns are a six-digit integer. The first four digits represent
the year, and the last two digits represent the month.

The FiscalYearMonth columns represent the year and month according to the fiscal
year, as set by the system configuration. The month increments relative to its
sequence in the fiscal year. For example, if the fiscal year begins
in October of the previous calendar year, then October 2020 (the first month of
fiscal year 2021) would have a CalendarYearMonth of 202010, but a FiscalYearMonth
of 202101.

Quarters also follow the same logic regarding calendar and fiscal years. Since
there are only four quarters in a month, YearQuarter is a five-digit integer
instead of four.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.YearMonth (
	BusinessMonthKey int NOT NULL,
	CalendarYear int NOT NULL,
	CalendarYearQuarter int NOT NULL,
	CalendarYearMonth int NOT NULL,
	CalendarMonth tinyint NOT NULL,
	FiscalYear int NOT NULL,
	FiscalYearQuarter int NOT NULL,
	FiscalYearMonth int NOT NULL,
	FiscalMonth tinyint NOT NULL,
	MonthStart date NOT NULL,
	MonthEnd date NOT NULL
);
GO

CREATE CLUSTERED INDEX CIX_Reference#EDWMonth ON Reference.YearMonth (
	CalendarYearMonth
)