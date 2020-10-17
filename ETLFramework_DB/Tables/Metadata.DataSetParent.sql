CREATE TABLE Metadata.DataSetParent (
	DataSetID int NOT NULL,
	ParentDataSetID int NOT NULL,
	CONSTRAINT PK_Metadata#DataSetParent PRIMARY KEY (DataSetID, ParentDataSetID)
);
GO