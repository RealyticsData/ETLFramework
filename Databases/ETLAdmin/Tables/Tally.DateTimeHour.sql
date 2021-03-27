/*******************************************************************************
Description:
    Tally of date and time to subdivide by hour.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE TABLE Tally.DateTimeHour (
	DateTimeValue datetime2(0) NOT NULL,
	DateTimeHour tinyint NOT NULL
) ON [PRIMARY];
GO

CREATE CLUSTERED INDEX CIX_Tally#DateTimeHour ON Tally.DateTimeHour (
	DateTimeValue
) ON [PRIMARY];
GO