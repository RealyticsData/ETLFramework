/*
The data destination filter works by filtering on specific columns that either provide a true/false or value filter. These columns should be populated as part of the transformation process,
so that the filtering logic can be as simple as possible.
*/
CREATE TABLE Framework.DataDestinationFilter (
	DataSetID int NOT NULL,
	DataDestinationColumn nvarchar(128) NOT NULL,
	DataDestinationPredicate nvarchar(max),
	CONSTRAINT PK_Framework#DataDestinationFilter PRIMARY KEY (DataSetID, DataDestinationColumn)
);
GO
