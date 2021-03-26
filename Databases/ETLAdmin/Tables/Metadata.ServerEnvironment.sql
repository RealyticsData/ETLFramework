CREATE TABLE Metadata.ServerEnvironment (
    ServerEnvironmentID     tinyint     NOT NULL,
    ServerEnvironmentName   varchar(50) NULL,
    ServerEnvironmentCode   char(4)     NULL,
    CONSTRAINT PK_Metadata#ServerEnvironment PRIMARY KEY CLUSTERED (ServerEnvironmentID ASC)
);
GO
