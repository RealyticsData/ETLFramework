/*
Generates the system view query that gets table and column metadata for the MSSQL database specified.
*/
CREATE PROCEDURE Metadata.GenerateMetadataSql
	@DatabaseName nvarchar(128),
	@SqlCommand nvarchar(max) OUT
AS
BEGIN
	SET @SqlCommand = N'
SELECT
    @@servername AS ServerName, 
    N''' + @DatabaseName + ''' AS DatabaseName, 
    s.name AS TableSchema, 
    t.name AS TableName, 
    c.column_id AS ColumnNumber, 
    c.name AS ColumnName, 
    typ.name + isnull(''('' + CASE 
        WHEN typ.name LIKE ''%char''
            OR typ.name LIKE ''%binary'' THEN CASE 
                WHEN c.max_length = -1 THEN ''max''
                WHEN typ.name LIKE ''n%'' THEN cast(c.max_length / 2 AS nvarchar(11)) 
                ELSE cast(c.max_length AS nvarchar(11)) 
            END 
        WHEN typ.name IN(''datetime2'', ''time'', ''datetimeoffset'') THEN cast(c.scale AS nvarchar(11)) 
        WHEN typ.name = ''decimal'' THEN cast(c.precision AS nvarchar(11)) + '','' + cast(c.scale AS nvarchar(11)) 
    END + '')'', '''') AS DataType 
FROM ' + @DatabaseName + '.sys.tables t 
    INNER JOIN ' + @DatabaseName + '.sys.schemas s 
    ON t.schema_id = s.schema_id 
    INNER JOIN ' + @DatabaseName + '.sys.columns c 
    ON t.object_id = c.object_id 
    INNER JOIN ' + @DatabaseName + '.sys.types typ 
    ON c.user_type_id = typ.user_type_id 
WHERE 
    t.is_ms_shipped = 0 
;';
END
GO
