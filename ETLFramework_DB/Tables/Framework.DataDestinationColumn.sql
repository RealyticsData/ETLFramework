CREATE TABLE [Framework].DataDestinationColumn (
    DatabaseTableID     int             NOT NULL,
    ColumnName          nvarchar(128)   NOT NULL,
    AggregationType     tinyint         NULL,
    AggregationFunction varchar(10)     NULL,
    SCDType             tinyint         NULL,
    SCDSortRank         int             NULL,
    CONSTRAINT PK_Framework#DataDestinationColumn PRIMARY KEY CLUSTERED (DatabaseTableID ASC, ColumnName ASC),
    CONSTRAINT FK_Framework#DataDestinationColumn_Metadata#DatabaseTableColumn FOREIGN KEY (DatabaseTableID, ColumnName) REFERENCES Metadata.DatabaseTableColumn (DatabaseTableID, ColumnName),
    CONSTRAINT FK_Framework#DataDestinationColumn_Framework#DataDestinationTable FOREIGN KEY (DatabaseTableID) REFERENCES Metadata.DataDestinationTable (DatabaseTableID)
);
GO
