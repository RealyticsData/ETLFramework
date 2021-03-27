/*******************************************************************************
Description:
    The General schema holds entities for general or as-yet-unspecified usage.
The dbo schema should not be used, as it is the overall default schema for the
database and can be accessed by everyone. Using a General schema forces two-part
name usage, and it also allows for finer permission control.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE SCHEMA General AUTHORIZATION dbo;
GO
