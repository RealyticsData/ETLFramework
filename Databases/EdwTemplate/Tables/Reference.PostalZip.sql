/*******************************************************************************
Description:
    Lookup table of zip codes, including estimated population and geographical
	coordinates.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.PostalZip (
	ZipCode char(5) NOT NULL,
	PostalCity varchar(50) NOT NULL,
	PostalState char(2) NOT NULL,
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
