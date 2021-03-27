/*******************************************************************************
Description:
    Lookup table of US postal state codes, including territories and military
	post offices.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.PostalStateType (
	PostalStateTypeID tinyint NOT NULL,
	PostalStateName varchar(50) NOT NULL,
	CONSTRAINT PK_Reference#PostalStateType PRIMARY KEY NONCLUSTERED (
		PostalStateTypeID
	)
) ON [PRIMARY];
GO
