/*******************************************************************************
Description:
    The PendingRefactor schema holds potentially new database objects that must
	co-exist with the main object during deployment. The primary use case is for
	refactoring large (million+ rows) tables without resorting to an ALTER TABLE
	statement. (ALTER TABLE can lock up large tables for long periods of time.)

	Items stored in this schema will be automatically dropped by a SQL agent job
	after a set period of time.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE SCHEMA PendingRefactor AUTHORIZATION dbo;
GO
