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
	ZipLongitude float NULL,
	CONSTRAINT UQ_Reference#PostalZip_ZipCode_PostalCity UNIQUE NONCLUSTERED (
		ZipCode,
		PostalCity
	),
	CONSTRAINT FK_Reference#PostalZip_Reference#PostalState FOREIGN KEY (PostalState)
		REFERENCES Reference.PostalState (PostalState),
	CONSTRAINT CK_Reference#PostalZip_ZipCode CHECK (
		ZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]'
	)
) ON [PRIMARY];
GO
