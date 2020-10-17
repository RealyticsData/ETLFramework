CREATE TABLE Metadata.OrchestrationDataSet (
    DataSetID       int NOT NULL,
    OrchestrationID int NOT NULL,
    CONSTRAINT PK_Metadata#OrchestrationDataSet PRIMARY KEY CLUSTERED (DataSetID ASC, OrchestrationID ASC),
    CONSTRAINT FK_Metadata#OrchestrationDataSet_Metadata#DataSet FOREIGN KEY (DataSetID) REFERENCES [Framework].DataSet (DataSetID),
    CONSTRAINT FK_Metadata#OrchestrationDataSet_Metadata#Orchestration FOREIGN KEY (OrchestrationID) REFERENCES Metadata.Orchestration (OrchestrationID)
);





