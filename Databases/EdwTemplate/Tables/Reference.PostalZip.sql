/*******************************************************************************
Description:
    Lookup table of zip codes, including estimated population and geographical
	coordinates.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
2021-03-27	Jonathan Szeto - Added audit columns.
*******************************************************************************/
CREATE TABLE Reference.PostalZip (
	ZipCodeKey int NOT NULL IDENTITY(1,1),
	ZipCode char(5) NOT NULL,
	ModifyDate datetime2(7) NULL,
	SessionID uniqueidentifier,
	PostalCity varchar(50) NOT NULL,
	PostalState char(2) NOT NULL,
	CountryCode AS cast('USA' AS char(3)),
	ZipPopulation int NULL,
	ZipPopulationEstimateYear int NULL,
	ZipLatitude float NULL,
	ZipLongitude float NULL
) ON [PRIMARY];
GO

CREATE CLUSTERED INDEX CIX_Reference#PostalZip_ZipCode ON Reference.PostalZip (
	ZipCode,
	PostalCity
) ON [PRIMARY];
GO
