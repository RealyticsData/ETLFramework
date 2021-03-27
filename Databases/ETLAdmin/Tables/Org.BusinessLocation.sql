/*******************************************************************************
Description:
    Org.BusinessLocation tracks organization business locations. The primary use
cases are the following:
* Partitioning by property to maximize parallel ETL.
* Row-level filtering for users.

Entities which are general usage and not location-specific use a
BusinessLocationID of 0.

Negative BusinessLocationIDs may be reserved for special purposes.
--------------------------------------------------------------------------------
History:
2021-03-27	Jonathan Szeto - Added documnetation comments.
*******************************************************************************/
CREATE TABLE Org.BusinessLocation (
    BusinessLocationID   int          NOT NULL,
    BusinessLocationName varchar(50) NULL,
    BusinessUnitID       int          NOT NULL,
    CONSTRAINT PK_Org#BusinessLocation PRIMARY KEY CLUSTERED (BusinessLocationID ASC),
    CONSTRAINT FK_Org#BusinessLocation_Org#BusinessUnit FOREIGN KEY (BusinessUnitID) REFERENCES Org.BusinessUnit (BusinessUnitID)
);



