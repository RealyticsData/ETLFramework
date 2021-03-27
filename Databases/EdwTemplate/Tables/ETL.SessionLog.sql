/*******************************************************************************
Description:
    ETL logging table mapping rows affected by ETL to an ETL session. This
enables developers to track changes to a row's state over time.

Tables to be tracked by session must have an identity key that is used as the
surrogate key for the table.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Initial table creation.
*******************************************************************************/
CREATE TABLE ETL.SessionLog (
	SessionDate datetime2(7) NOT NULL,
	DataTableID int NOT NULL,               -- References ETLAdmin.Framework.DataDestinationTable. Participates in clustered index
	SessionID uniqueidentifier NOT NULL,	--
	SurrogateKey int NOT NULL,
	BusinessLocationID int NOT NULL         -- References ETLAdmin.Org.BusinessLocation. Included for partitioning.
);
GO

CREATE CLUSTERED INDEX CIX_ETL#SessionLog ON ETL.SessionLog (
	DataTableID,
	SessionDate,
	BusinessLocationID
);
GO
