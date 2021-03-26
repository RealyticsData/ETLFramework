CREATE TABLE Org.BusinessLocationSegment (
    BusinessLocationID        int NOT NULL,
    BusinessSegmentID         int NOT NULL,
    BusinessLocationSegmentID int NULL,
    CONSTRAINT PK_Org#BusinessLocationSegment PRIMARY KEY CLUSTERED (BusinessLocationID ASC, BusinessSegmentID ASC),
    CONSTRAINT FK_Org#BusinessLocationSegment_Org#BusinessLocation FOREIGN KEY (BusinessLocationID) REFERENCES Org.BusinessLocation (BusinessLocationID),
    CONSTRAINT FK_Org#BusinessLocationSegment_Org#BusinessSegment FOREIGN KEY (BusinessSegmentID) REFERENCES Org.BusinessSegment (BusinessSegmentID)
);

