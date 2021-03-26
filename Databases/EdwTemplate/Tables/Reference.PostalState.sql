/*******************************************************************************
Description:
    Lookup table of US postal state codes, including territories and military
	post offices.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.PostalState (
	PostalState char(2) NOT NULL,
	PostalStateName varchar(30)
) ON [PRIMARY];
GO

CREATE CLUSTERED INDEX CIX_Reference#PostalState ON Reference.PostalState (
	PostalState
) ON [PRIMARY];
GO
