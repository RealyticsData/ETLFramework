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
	PostalStateName varchar(30),
	PostalStateTypeID tinyint,
	CONSTRAINT PK_Reference#PostalState PRIMARY KEY NONCLUSTERED (
		PostalState
	),
	CONSTRAINT FK_Reference#PostalState_Reference#PostalStateType FOREIGN KEY (PostalStateTypeID)
		REFERENCES Reference.PostalStateType (PostalStateTypeID)
) ON [PRIMARY];
GO
