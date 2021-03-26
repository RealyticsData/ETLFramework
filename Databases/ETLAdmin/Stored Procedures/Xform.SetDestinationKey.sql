/*
Sets the partition key for data in staging tables. This is required if a single source can have multiple partitions. (For example, enterprise accounting systems that span multiple business units.)

Partitioning allows the ETL process to merge data into EDW datamarts in parallel, which speeds up loading times.
*/