/*
Description:

Denormalized view of data mart database columns.
----------------------------------------------------------------------------------------------------
Revision History:
----------------------------------------------------------------------------------------------------
*/
CREATE VIEW Metadata.DatamartTable_vw
AS
SELECT
	ls.ServerID,
	ls.ServerDescription,
	db.DatabaseID,
	db.DatabaseName,
	db.DatabaseTypeID,
	dbt.DatabaseTypeDescription,
	tbl.TableSchema,
	tbl.TableName,
	tbl.IsReplicated,
	tbl.ReplicationSubscription,
	tbl.IsCDCEnabled
FROM Metadata.LogicalServer ls
	INNER JOIN Metadata.SqlDatabase db
	ON ls.ServerID = db.ServerID
	INNER JOIN Metadata.DatabaseType dbt
	ON db.DatabaseTypeID = dbt.DatabaseTypeID
	INNER JOIN Metadata.DatabaseTable tbl
	ON db.ServerID = tbl.ServerID
	AND db.DatabaseName = tbl.DatabaseName
WHERE
	db.DatabaseTypeID = 2
	AND tbl.IsDropped = 0
;
GO
