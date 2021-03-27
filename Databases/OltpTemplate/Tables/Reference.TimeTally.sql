/*******************************************************************************
Description:
    Lookup table of time values and associated properties.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.TimeTally (
	TimeID int NOT NULL,
	TimeValue time(0) NOT NULL,
	TimeHour int NOT NULL,
	TimeHourLabel varchar(12) NOT NULL,
	TimeHalfHour int NOT NULL,
	TimeHalfHourLabel varchar(12) NOT NULL,
	TimeQuarterHour int NOT NULL,
	TimeQuarterHourLabel varchar(12) NOT NULL,
	TimeFiveMinute int NOT NULL,
	TimeMinute int NOT NULL,
	TimeSecond int NOT NULL,
	CONSTRAINT PK_Reference#TimeTally PRIMARY KEY NONCLUSTERED (
		TimeID
	),
	CONSTRAINT UQ_Reference#TimeTally_TimeValue UNIQUE CLUSTERED (
		TimeValue
	)
) ON [PRIMARY];
GO