CREATE TABLE Framework.DataSetParent (
	DataSetID int NOT NULL,
	ParentDataSetID int NOT NULL,
	CONSTRAINT PK_Framework#DataSetParent PRIMARY KEY (DataSetID, ParentDataSetID)
);
GO