CREATE TABLE [Framework].DataSet (
    DataSetID          int       IDENTITY (1, 1) NOT NULL,
    DataSetName        CHAR (10) NULL,
    KeepDeletedRecords BIT       NULL,
    CONSTRAINT PK_Metadata#DataSet PRIMARY KEY CLUSTERED (DataSetID ASC)
);
GO
