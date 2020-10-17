CREATE TABLE EtlOps.StageCdcTable (
	DataSourceID int,
	ReenableCdc bit,
	ResetControlDate bit,
	ResetControlDateReason varchar(50)
);
GO