CREATE TABLE Framework.Orchestration (
    OrchestrationID   int           NOT NULL,
    OrchestrationName varchar(50)  NULL,
    SsisProjectName   varchar(100) NULL,
    AgentName         varchar(100) NULL,
    CONSTRAINT PK_Framework#Orchestration PRIMARY KEY CLUSTERED (OrchestrationID ASC)
);
GO
