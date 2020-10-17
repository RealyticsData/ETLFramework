CREATE TABLE EtlOps.EtlControl (
    DataSetID       int             NOT NULL,
    DatabaseTableID int             NOT NULL,
    ControlDate     datetime        NULL,
    Active          bit             NULL,
    CONSTRAINT PK_EtlOps#EtlControl PRIMARY KEY CLUSTERED (DataSetID ASC, DatabaseTableID),
    CONSTRAINT FK_EtlOps#EtlControl_Metadata#DataSource FOREIGN KEY (DataSetID, DatabaseTableID) REFERENCES Metadata.DataSource (DataSetID, DatabaseTableID)
);
GO
