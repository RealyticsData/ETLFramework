/*******************************************************************************
Description:
    Table holding mailing addresses.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.MailingAddress (
	MailingAddressID int NOT NULL IDENTITY(1,1),
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_General#MailingAddress_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_General#MailingAddress_ModifyUser DEFAULT suser_sname(),
	MailingAddressLine1 varchar(50) NOT NULL,
	MailingAddressSuiteNumber varchar(10) NULL,
	MailingAddressLine2 varchar(50) NULL,
	MailingAddressCity varchar(30) NOT NULL,
	MailingAddressPostalState char(2) NOT NULL,
	MailingAddressZip char(5) NOT NULL,
	MailingAddressZip4 char(4) NULL,
	MailingAddressCountry char(3),
	MailingAddressLatitude float NULL,
	MailingAddressLongitude float NULL,
	CONSTRAINT PK_General#MailingAddress PRIMARY KEY NONCLUSTERED (MailingAddressID),
	CONSTRAINT FK_General#MailingAddress_Reference#PostalState FOREIGN KEY (MailingAddressPostalState)
		REFERENCES Reference.PostalState (PostalState),
	CONSTRAINT FK_General#MailingAddress_Reference#PostalZip FOREIGN KEY (MailingAddressZip)
		REFERENCES Reference.PostalZip (ZipCode)
);
GO

CREATE CLUSTERED INDEX CIX_General#MailingAddress ON General.MailingAddress (
	MailingAddressZip
);
GO
