/*
Description:

Merges database table metadata from staging table to metadata tables.

New tables are added to the metadata registry.

Deleted tables (tables that can't be found in system views) are marked for soft deletion. This allows
for review and later removal if deemed to be truly deleted.
----------------------------------------------------------------------------------------------------
Revision History:
----------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE Metadata.MergeDatabaseTable
AS
BEGIN
	DECLARE @MergeOutput table (
		MergeAction nvarchar(10),
		DatabaseTableID int
	);

	DROP TABLE IF EXISTS #DatabaseTable;

	SELECT DISTINCT
		svr.ServerID,
		stg.DatabaseName,
		stg.TableSchema,
		stg.TableName
	INTO #DatabaseTable
	FROM EtlOps.StageTableMetadata stg
		INNER JOIN Metadata.HostServer svr
		ON stg.ServerName = svr.HostServerName
	;

	MERGE INTO Metadata.DatabaseTable tgt
	USING #DatabaseTable src
	ON tgt.ServerID = src.ServerID
	AND tgt.DatabaseName = src.DatabaseName
	AND tgt.TableSchema = src.TableSchema
	AND tgt.TableName = src.TableName
	WHEN NOT MATCHED BY TARGET THEN INSERT (
		ServerID,
		DatabaseName,
		TableSchema,
		TableName
	) VALUES (
		src.ServerID,
		src.DatabaseName,
		src.TableSchema,
		src.TableName
	)
	WHEN NOT MATCHED BY SOURCE THEN UPDATE
	SET IsDropped = 1
	OUTPUT $action, deleted.DatabaseTableID INTO @MergeOutput (MergeAction, DatabaseTableID)
	;

	/* Mark child tables for soft delete. */
	UPDATE c
	SET
		IsDropped = 1
	FROM Metadata.DatabaseTableColumn c
		INNER JOIN @MergeOutput o
		ON c.DatabaseTableID = o.DatabaseTableID
	WHERE
		o.MergeAction = 'UPDATE'
	;
END
GO
