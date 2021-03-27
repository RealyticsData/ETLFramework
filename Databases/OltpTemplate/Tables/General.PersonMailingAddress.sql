/*******************************************************************************
Description:
    Table mapping people to mailing addresses. This is a many-to-many
relationship, with only one identified as a primary address.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.PersonMailingAddress (
	PersonID int NOT NULL,
	MailingAddressID int NOT NULL,
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_General#PersonMailingAddress_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_General#PersonMailingAddress_ModifyUser DEFAULT suser_sname(),
	IsPrimaryAddress bit NOT NULL CONSTRAINT DF_General#PersonMailingAddress_IsPrimaryAddress DEFAULT 0,
	MailingAddressComment varchar(256) NULL,
	CONSTRAINT PK_General#PersonMailingAddress PRIMARY KEY (
		PersonID,
		MailingAddressID
	)
);
GO

CREATE UNIQUE INDEX FIX_General#PersonMailingAddress ON General.PersonMailingAddress (
	PersonID
)
WHERE IsPrimaryAddress = 1;
GO
