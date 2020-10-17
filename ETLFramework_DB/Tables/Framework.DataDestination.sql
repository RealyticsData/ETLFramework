CREATE TABLE Framework.DataDestination (
	DatabaseTableID int NOT NULL,
    DataSetID       int NOT NULL,
    CONSTRAINT PK_Framework#DataDestination PRIMARY KEY CLUSTERED (DatabaseTableID ASC, DataSetID ASC),
    CONSTRAINT FK_Framework#DataDestination_Framework#DataDestinationTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DataDestinationTable (DatabaseTableID),
    CONSTRAINT FK_Framework#DataDestination_Framework#DataSet FOREIGN KEY (DataSetID) REFERENCES [Framework].DataSet (DataSetID)
);
GO
