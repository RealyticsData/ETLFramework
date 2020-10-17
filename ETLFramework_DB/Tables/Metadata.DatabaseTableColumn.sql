CREATE TABLE Metadata.DatabaseTableColumn (
	DatabaseTableID int           NOT NULL,
    ColumnNumber    int           NOT NULL,
    ColumnName      nvarchar(128) NOT NULL,
    DataType        nvarchar(128) NOT NULL,
	IsDropped       bit           NOT NULL CONSTRAINT DF_Metadata#DatabaseTableColumn DEFAULT (0),
    CONSTRAINT PK_Metadata#DatabaseTableColumn PRIMARY KEY CLUSTERED (DatabaseTableID ASC, ColumnNumber ASC),
	CONSTRAINT UQ_Metadata#DatabaseTableColumn_DatabaseTableID_ColumnName UNIQUE (DatabaseTableID ASC, ColumnName ASC),
	CONSTRAINT FK_Metadata#DatabaseTableColumn_Metadata#DatabaseTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DatabaseTable (DatabaseTableID)
);
GO
