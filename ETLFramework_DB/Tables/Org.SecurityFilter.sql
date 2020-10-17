CREATE TABLE Org.SecurityFilter (
    UserName           nvarchar(128) NOT NULL,
    BusinessLocationID int           NOT NULL,
	ServerID           int           NOT NULL,
    DatabaseName       varchar(128)  NOT NULL,
    CONSTRAINT PK_Org#SecurityFilter PRIMARY KEY NONCLUSTERED (UserName ASC, BusinessLocationID ASC, DatabaseName ASC),
    CONSTRAINT FK_Org#SecurityFilter_Metadata#SqlDatabase FOREIGN KEY (ServerID, DatabaseName) REFERENCES Metadata.SqlDatabase (ServerID, DatabaseName),
    CONSTRAINT FK_Org#SecurityFilter_Org#BusinessLocation FOREIGN KEY (BusinessLocationID) REFERENCES Org.BusinessLocation (BusinessLocationID)
);
GO
