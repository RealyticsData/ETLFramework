CREATE TABLE Metadata.DataDestinationTable (
	DatabaseTableID int             NOT NULL,
    IsSCD           bit             NULL,
    IsAggregate     bit             NULL,
    CONSTRAINT PK_Metadata#DataDestinationTable PRIMARY KEY CLUSTERED (DatabaseTableID),
    CONSTRAINT FK_Metadata#DataDestinationTable_Metadata#DatabaseTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DatabaseTable (DatabaseTableID)
);
GO
