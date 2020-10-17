CREATE TABLE Metadata.SqlDatabase (
	DatabaseID     int NOT NULL IDENTITY(1,1),
    DatabaseName   varchar(128) NOT NULL,
    DatabaseTypeID tinyint       NULL,
    ServerID       int           NOT NULL,
    CONSTRAINT PK_Metadata#SqlDatabase PRIMARY KEY CLUSTERED (ServerID ASC, DatabaseName ASC),
    CONSTRAINT FK_Metadata#SqlDatabase_Metadata#DatabaseType FOREIGN KEY (DatabaseTypeID) REFERENCES Metadata.DatabaseType (DatabaseTypeID),
    CONSTRAINT FK_Metadata#SqlDatabase_Metadata#LogicalServer FOREIGN KEY (ServerID) REFERENCES Metadata.LogicalServer (ServerID)
);
GO




