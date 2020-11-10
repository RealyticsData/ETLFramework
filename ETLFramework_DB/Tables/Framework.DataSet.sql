CREATE TABLE Framework.DataSet (
    DataSetID          int         IDENTITY (1, 1) NOT NULL,
    DataSetName        varchar(50) NULL,
    KeepDeletedRecords bit         NULL,
	CompositeDataSet   bit         NULL,
    CONSTRAINT PK_Framework#DataSet PRIMARY KEY CLUSTERED (DataSetID ASC)
);
GO
