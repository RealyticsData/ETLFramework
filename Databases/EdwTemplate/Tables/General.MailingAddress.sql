/*******************************************************************************
Description:
    Table holding mailing addresses.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.MailingAddress (
	MailingAddressKey int NOT NULL IDENTITY(1,1),
	ModifyDate datetime2(7) NULL,
	SessionID uniqueidentifier,
	MailingAddressLine1 varchar(50) NOT NULL,
	MailingAddressSuiteNumber varchar(10) NULL,
	MailingAddressLine2 varchar(50) NULL,
	MailingAddressCity varchar(30) NOT NULL,
	MailingAddressPostalState char(2) NOT NULL,
	MailingAddressZip char(5) NOT NULL,
	MailingAddressZip4 char(4) NULL,
	MailingAddressCountry char(3),
	MailingAddressLatitude float NULL,
	MailingAddressLongitude float NULL
);
GO

CREATE CLUSTERED INDEX CIX_General#MailingAddress ON General.MailingAddress (
	MailingAddressZip
);
GO
