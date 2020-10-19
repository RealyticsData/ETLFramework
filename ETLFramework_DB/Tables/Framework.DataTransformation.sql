CREATE TABLE Framework.DataTransformation (
    DataSetID                 int            NOT NULL,
    TransformationSequence    int            NOT NULL,
    StoredProcedureSchema     varchar(128)  NULL,
    StoredProcedureName       varchar(128)  NULL,
    StoredProcedureParameters varchar(1000) NULL,
    ExecutionStageID          tinyint        NULL,
    CONSTRAINT PK_Framework#DataTransformation PRIMARY KEY CLUSTERED (DataSetID ASC, TransformationSequence ASC),
    CONSTRAINT FK_Framework#DataTransformation_Framework#DataSet FOREIGN KEY (DataSetID) REFERENCES Framework.DataSet (DataSetID)
);
GO
