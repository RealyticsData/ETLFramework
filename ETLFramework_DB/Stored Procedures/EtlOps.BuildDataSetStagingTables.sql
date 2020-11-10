/*
Master stored procedure that builds all the necessary staging tables for a dataset. Depending on the dataset properties, it will call a secondary stored procedures for either
standard, SCD, or aggregation datasets.
*/
