CREATE TABLE [Framework].DataDestinationKey (
    DatabaseTableID int             NOT NULL,
    ColumnSequence  int             NOT NULL,
    ColumnName      varchar(128)    NULL,
    CONSTRAINT PK_Framework#DataDestinationKey PRIMARY KEY CLUSTERED (DatabaseTableID, ColumnSequence ASC),
    CONSTRAINT FK_Framework#DataDestinationKey_Framework#DataDestinationTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DataDestinationTable (DatabaseTableID)
);
GO
