/*******************************************************************************
Description:
    A lookup table for phone types. It is initially populated with a few key
values (home, office, fax, and mobile) but there should be code to add new types
as business demands.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE Reference.PhoneType (
	PhoneTypeID int NOT NULL IDENTITY(1,1),
	CreationDate datetime2(7) NOT NULL CONSTRAINT DF_Reference#PhoneType_CreationDate DEFAULT sysdatetime(),
	ModifyDate datetime2(7) NULL,
	ModifyUser nvarchar(128) NOT NULL CONSTRAINT DF_Reference#PhoneType_ModifyUser DEFAULT suser_sname(),
	PhoneTypeDescription varchar(20),
	CONSTRAINT PK_Reference#PhoneType PRIMARY KEY CLUSTERED (PhoneTypeID)
);
GO
