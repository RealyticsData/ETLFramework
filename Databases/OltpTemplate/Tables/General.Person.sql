/*******************************************************************************
Description:
    Table holding information about people. This excludes PII.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.Person (
	PersonID int NOT NULL IDENTITY(1,1),
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_General#Person_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_General#Person_ModifyUser DEFAULT suser_sname(),
	FirstName varchar(48) NOT NULL,
	MiddleName varchar(24) NULL,
	LastName varchar(48) NOT NULL,
	SSNLast4 char(4) NULL,  -- This appears in the general table, since last 4 is generally not considered PII. It is nullable, should the business choose not to populate it.
	CONSTRAINT PK_General#Person PRIMARY KEY NONCLUSTERED (PersonID)
);
GO

