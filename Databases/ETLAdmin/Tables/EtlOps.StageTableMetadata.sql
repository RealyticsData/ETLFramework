CREATE TABLE EtlOps.StageTableMetadata (
	ServerName nvarchar(128),
	DatabaseName nvarchar(128),
	TableSchema nvarchar(128),
	TableName nvarchar(128),
	ColumnNumber int,
	ColumnName nvarchar(128),
	DataType nvarchar(256)
);
GO
