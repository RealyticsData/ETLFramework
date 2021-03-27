/*******************************************************************************
Description:
    Table mapping people to phone numbers. Phone numbers are left unparsed, as
there is little value added in parsing area codes and other fields for analysis.
(YMMV, especially if you plan to do call center analysis.)
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.PersonPhone (
	PersonID int NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_General#PersonPhone_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_General#PersonPhone_ModifyUser DEFAULT suser_sname(),
	PhoneTypeID int NULL,
	IsPrimaryPhone bit NOT NULL CONSTRAINT DF_General#PersonPhone_IsPrimaryPhone DEFAULT 0,
	IsSmsEnabled bit NULL,
	PersonPhoneComment varchar(256) NULL,
	CONSTRAINT PK_General#PersonPhone PRIMARY KEY (
		PersonID,
		PhoneNumber
	),
	CONSTRAINT FK_General#PersonPhone_Reference#PhoneType FOREIGN KEY (PhoneTypeID)
		REFERENCES Reference.PhoneType (PhoneTypeID)
);
GO

CREATE UNIQUE INDEX FIX_General#PersonPhone_UniquePrimary ON General.PersonPhone (
	PersonID
)
WHERE IsPrimaryPhone = 1;
GO
