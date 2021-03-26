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
CREATE PROCEDURE Metadata.MergeDatabaseTableColumn
AS
BEGIN
	DROP TABLE IF EXISTS #DatabaseTableColumn;

	SELECT
		dt.DatabaseTableID,
		stg.ColumnNumber,
		stg.ColumnName,
		stg.DataType,
		dt.IsDropped
	INTO #DatabaseTableColumn
	FROM EtlOps.StageTableMetadata stg
		INNER JOIN Metadata.DatabaseTable dt
			INNER JOIN Metadata.HostServer svr
			ON dt.ServerID = svr.ServerID
		ON stg.ServerName = svr.HostServerName
		AND stg.DatabaseName = dt.DatabaseName
		AND stg.TableSchema = dt.TableSchema
		AND stg.TableName = dt.TableName
	;

	MERGE INTO Metadata.DatabaseTableColumn tgt
	USING #DatabaseTableColumn src
	ON src.DatabaseTableID = tgt.DatabaseTableID
	AND src.ColumnName = tgt.ColumnName
	WHEN MATCHED AND (
		src.ColumnNumber <> tgt.ColumnNumber
		OR src.DataType <> tgt.DataType
	) THEN UPDATE SET
		ColumnNumber = src.ColumnNumber,
		DataType = src.DataType
	WHEN NOT MATCHED BY TARGET THEN INSERT (
		DatabaseTableID,
		ColumnNumber,
		ColumnName,
		DataType,
		IsDropped
	) VALUES (
		src.DatabaseTableID,
		src.ColumnNumber,
		src.ColumnName,
		src.DataType,
		src.IsDropped
	)
	WHEN NOT MATCHED BY SOURCE AND (
		tgt.IsDropped = 0
	) THEN UPDATE
	SET
		IsDropped = 1
	;
END
GO
