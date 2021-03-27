/*******************************************************************************
Description:
    Table holding sensitive information about people, such as PII.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE SensitiveInfo.Person (
	PersonID int NOT NULL,
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_SensitiveInfo#Person_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_SensitiveInfo#Person_ModifyUser DEFAULT suser_sname(),
	DateOfBirth date,
	CONSTRAINT PK_SensitiveInfo#Person PRIMARY KEY (PersonID),
	CONSTRAINT FK_SensitiveInfo#Person_General#Person FOREIGN KEY (PersonID)
		REFERENCES General.Person (PersonID)
);
GO
