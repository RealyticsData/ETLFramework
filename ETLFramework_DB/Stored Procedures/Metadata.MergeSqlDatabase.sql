/*
Description:

Adds new databases are added to the metadata registry.
----------------------------------------------------------------------------------------------------
Revision History:
----------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE Metadata.MergeSqlDatabase
AS
BEGIN
	INSERT Metadata.SqlDatabase (
		DatabaseName,
		ServerID
	)
	SELECT
		stg.DatabaseName, svr.ServerID
	FROM EtlOps.StageDatabase stg
		INNER JOIN Metadata.HostServer svr
		ON stg.ServerName = svr.HostServerName
	WHERE NOT EXISTS (
		SELECT 1 FROM Metadata.SqlDatabase tgt
		WHERE
			tgt.DatabaseName = stg.DatabaseName
			AND tgt.ServerID = svr.ServerID
	)
	;
END
GO
