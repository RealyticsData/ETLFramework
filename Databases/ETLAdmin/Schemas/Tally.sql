/*******************************************************************************
Description:
    The Tally schema holds tally tables (tables consisting only key values and 
some key attributes). This is used primarily for calculating various ranges.
Use cases include:
* Overlapping multiple SCD effective ranges
* Subdividing ("amortizing") facts over uneven date/time ranges
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE SCHEMA Tally AUTHORIZATION dbo;
GO
