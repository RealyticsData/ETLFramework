CREATE TABLE Metadata.DataSource (
	DataSourceID                  int           NOT NULL IDENTITY(1,1),
    DataSetID                     int           NOT NULL,
	DatabaseTableID               int           NOT NULL,
    DataSourceColumnMapTemplateID int           NOT NULL,
	CdcWrapperFunction            nvarchar(128) NULL,
    CONSTRAINT PK_Metadata#DataSource PRIMARY KEY CLUSTERED (DataSetID ASC, DatabaseTableID ASC),
	CONSTRAINT UQ_Metadata#DataSource_DataSourceID UNIQUE NONCLUSTERED (DataSourceID),
    CONSTRAINT FK_Metadata#DataSource_Metadata#DatabaseTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DatabaseTable (DatabaseTableID),
    CONSTRAINT FK_Metadata#DataSource_Metadata#DataSet FOREIGN KEY (DataSetID) REFERENCES [Framework].DataSet (DataSetID),
    CONSTRAINT FK_Metadata#DataSource_Metadata#DataSourceColumnMapTemplate FOREIGN KEY (DataSourceColumnMapTemplateID) REFERENCES Metadata.DataSourceColumnMapTemplate (DataSourceColumnMapTemplateID)
);
GO
