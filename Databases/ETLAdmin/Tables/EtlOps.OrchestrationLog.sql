CREATE TABLE EtlOps.OrchestrationLog (
    OrchestrationSessionID UNIQUEIDENTIFIER CONSTRAINT DF_EtlOps#OrchestrationLog DEFAULT (newid()) NOT NULL,
    OrchestrationID        int              NOT NULL,
    StartTime              DATETIME2 (3)    NOT NULL,
    EndTime                DATETIME2 (0)    NULL,
    CONSTRAINT PK_EtlOps#OrchestrationLog PRIMARY KEY NONCLUSTERED (OrchestrationSessionID ASC),
    CONSTRAINT UQ_EtlOps#OrchestrationLog_StartTime_OrchestrationID UNIQUE CLUSTERED (StartTime ASC, OrchestrationID ASC)
);

