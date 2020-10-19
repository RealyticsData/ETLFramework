CREATE TABLE Framework.DataDestinationTable (
	DatabaseTableID int             NOT NULL,
    IsSCD           bit             NULL,
    IsAggregate     bit             NULL,
    CONSTRAINT PK_Framework#DataDestinationTable PRIMARY KEY CLUSTERED (DatabaseTableID),
    CONSTRAINT FK_Framework#DataDestinationTable_Metadata#DatabaseTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DatabaseTable (DatabaseTableID)
);
GO
