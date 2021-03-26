CREATE TABLE Org.BusinessLocation (
    BusinessLocationID   int          NOT NULL,
    BusinessLocationName varchar(50) NULL,
    BusinessUnitID       int          NOT NULL,
    CONSTRAINT PK_Org#BusinessLocation PRIMARY KEY CLUSTERED (BusinessLocationID ASC),
    CONSTRAINT FK_Org#BusinessLocation_Org#BusinessUnit FOREIGN KEY (BusinessUnitID) REFERENCES Org.BusinessUnit (BusinessUnitID)
);



