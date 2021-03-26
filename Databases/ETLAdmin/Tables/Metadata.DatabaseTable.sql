CREATE TABLE Metadata.DatabaseTable (
	DatabaseTableID         int             NOT NULL IDENTITY(1,1),
	ServerID                int             NOT NULL,
    DatabaseName            varchar(128)    NOT NULL,
    TableSchema             varchar(128)    NOT NULL,
    TableName               varchar(128)    NOT NULL,
    IsReplicated            bit             NULL,
	ReplicationSubscription nvarchar(128)	NULL,
    IsCDCEnabled            bit             NULL,
	IsDropped               bit             NOT NULL CONSTRAINT DF_Metadata#DatabaseTable_IsDropped DEFAULT (0),
	CONSTRAINT PK_Metadata#DatabaseTable PRIMARY KEY NONCLUSTERED (DatabaseTableID ASC),
    CONSTRAINT UQ_Metadata#DatabaseTable_ServerID_DatabaseName_TableSchema_TableName UNIQUE CLUSTERED (ServerID ASC, DatabaseName ASC, TableSchema ASC, TableName ASC),
    CONSTRAINT FK_Metadata#DatabaseTable_Metadata#SqlDatabase FOREIGN KEY (ServerID, DatabaseName) REFERENCES Metadata.SqlDatabase (ServerID, DatabaseName)
);
GO
