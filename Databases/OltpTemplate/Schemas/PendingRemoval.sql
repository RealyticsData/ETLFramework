/*******************************************************************************
Description:
    The PendingRemoval schema holds database objects that have been changed
	during a deployment. It serves as a mechanism to preserve state in case a
	rollback is needed.

	Items stored in this schema will be automatically dropped by a SQL agent job
	after a set period of time.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE SCHEMA PendingRemoval AUTHORIZATION dbo;
GO
