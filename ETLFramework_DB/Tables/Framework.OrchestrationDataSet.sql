CREATE TABLE Framework.OrchestrationDataSet (
    DataSetID       int NOT NULL,
    OrchestrationID int NOT NULL,
    CONSTRAINT PK_Framework#OrchestrationDataSet PRIMARY KEY CLUSTERED (DataSetID ASC, OrchestrationID ASC),
    CONSTRAINT FK_Framework#OrchestrationDataSet_Framework#DataSet FOREIGN KEY (DataSetID) REFERENCES Framework.DataSet (DataSetID),
    CONSTRAINT FK_Framework#OrchestrationDataSet_Framework#Orchestration FOREIGN KEY (OrchestrationID) REFERENCES Framework.Orchestration (OrchestrationID)
);
GO
