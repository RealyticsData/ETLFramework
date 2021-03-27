/*******************************************************************************
Description:
    Table mapping people to email addresses. This is a many-to-many
relationship, with only one identified as a primary address.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE General.PersonEmail (
	PersonID int NOT NULL,
	PersonEmail nvarchar(320) NOT NULL,
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_General#PersonEmail_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_General#PersonEmail_ModifyUser DEFAULT suser_sname(),
	PersonEmailType varchar(20) NULL, -- This is freeform, because there are no predefined types, as there might be with mailing addresses or phone numbers
	IsPrimaryEmail bit NOT NULL CONSTRAINT DF_General#PersonEmail_IsPrimaryAddress DEFAULT 0,
	PersonEmailComment varchar(256) NULL,
	CONSTRAINT PK_General#PersonEmail PRIMARY KEY (
		PersonID,
		PersonEmail
	), CONSTRAINT CK_General#PersonEmail_PersonEmail CHECK ( -- A very basic check to validate email format. If more advanced validity checking is required, this should be delegated to the application layer.
		PersonEmail LIKE '_%@_%.__%'
	)
);
GO

CREATE UNIQUE INDEX FIX_General#PersonEmail_UniquePrimary ON General.PersonEmail (
	PersonID
)
WHERE IsPrimaryEmail = 1;
GO
