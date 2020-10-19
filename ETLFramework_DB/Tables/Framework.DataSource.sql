CREATE TABLE Framework.DataSource (
	DataSourceID                  int           NOT NULL IDENTITY(1,1),
    DataSetID                     int           NOT NULL,
	DatabaseTableID               int           NOT NULL,
    DataSourceColumnMapTemplateID int           NOT NULL,
	CdcWrapperFunction            nvarchar(128) NULL,
    CONSTRAINT PK_Framework#DataSource PRIMARY KEY CLUSTERED (DataSetID ASC, DatabaseTableID ASC),
	CONSTRAINT UQ_Framework#DataSource_DataSourceID UNIQUE NONCLUSTERED (DataSourceID),
    CONSTRAINT FK_Framework#DataSource_Metadata#DatabaseTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DatabaseTable (DatabaseTableID),
    CONSTRAINT FK_Framework#DataSource_Framework#DataSet FOREIGN KEY (DataSetID) REFERENCES Framework.DataSet (DataSetID),
    CONSTRAINT FK_Framework#DataSource_Framework#DataSourceColumnMapTemplate FOREIGN KEY (DataSourceColumnMapTemplateID) REFERENCES Framework.DataSourceColumnMapTemplate (DataSourceColumnMapTemplateID)
);
GO
