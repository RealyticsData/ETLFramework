CREATE TABLE EtlOps.DataSetLog (
    DataSetSessionID       UNIQUEIDENTIFIER CONSTRAINT DF_EtlOps#DataSetLog DEFAULT (newid()) NOT NULL,
    OrchestrationSessionID UNIQUEIDENTIFIER NOT NULL,
    DataSetID              int              NOT NULL,
    StartTime              DATETIME2 (3)    NOT NULL,
    EndTime                DATETIME2 (0)    NULL,
    CONSTRAINT PK_EtlOps#DataSetLog PRIMARY KEY NONCLUSTERED (DataSetSessionID ASC),
    CONSTRAINT FK_EtlOps#DataSetLog_EtlOps#OrchestrationLog FOREIGN KEY (OrchestrationSessionID) REFERENCES EtlOps.OrchestrationLog (OrchestrationSessionID),
    CONSTRAINT UQ_EtlOps#DataSetLog_StartTime_DataSetID UNIQUE CLUSTERED (StartTime ASC, DataSetID ASC)
);

