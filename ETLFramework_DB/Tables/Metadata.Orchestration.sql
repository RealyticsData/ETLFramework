CREATE TABLE Metadata.Orchestration (
    OrchestrationID   int           NOT NULL,
    OrchestrationName varchar(50)  NULL,
    SsisProjectName   varchar(100) NULL,
    AgentName         varchar(100) NULL,
    CONSTRAINT PK_Metadata#Orchestration PRIMARY KEY CLUSTERED (OrchestrationID ASC)
);
GO
