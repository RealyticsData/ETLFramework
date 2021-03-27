/*******************************************************************************
Description:
    Lookup table of time values and associated properties.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.TimeOfDay (
	TimeKey int NOT NULL,
	TimeValue time(0) NOT NULL,
	TimeHourKey tinyint NOT NULL,
	TimeHourLabel varchar(12) NOT NULL,
	TimeHalfHourKey tinyint NOT NULL,
	TimeHalfHourLabel varchar(12) NOT NULL,
	TimeQuarterHourKey tinyint NOT NULL,
	TimeQuarterHourLabel varchar(12) NOT NULL,
	TimeFiveMinuteKey tinyint NOT NULL,
	TimeMinute tinyint NOT NULL,
	TimeSecond tinyint NOT NULL
) ON [PRIMARY];
GO

CREATE CLUSTERED INDEX CIX_Reference#TimeOfDay ON Reference.TimeOfDay (
	TimeValue
) ON [PRIMARY];
GO
