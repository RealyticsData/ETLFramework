/*******************************************************************************
Description:
    The Temp schema holds tables with a limited lifespan and not meant to be
	controlled by source control. It serves as a controlled sandbox for developers
	and administrators to experiment. Any items stored here will be automatically
	dropped by a cleanup SQL job after a given period of time.
--------------------------------------------------------------------------------
History:
2021-03-26	Jonathan Szeto - Initial schema creation.
*******************************************************************************/
CREATE SCHEMA Temp AUTHORIZATION dbo;
GO
