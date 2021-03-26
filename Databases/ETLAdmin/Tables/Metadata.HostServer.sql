CREATE TABLE Metadata.HostServer (
    HostServerName      nvarchar(128)   NOT NULL,
	ServerAlias         nvarchar(128)   NULL,
    ServerEnvironmentID tinyint         NULL,
    ServerID            int             NULL,
    CONSTRAINT PK_Metadata#HostServer PRIMARY KEY CLUSTERED (HostServerName ASC),
    CONSTRAINT FK_Metadata#HostServer_Metadata#LogicalServer FOREIGN KEY (ServerID) REFERENCES Metadata.LogicalServer (ServerID),
    CONSTRAINT FK_Metadata#HostServer_Metadata#ServerEnvironment FOREIGN KEY (ServerEnvironmentID) REFERENCES Metadata.ServerEnvironment (ServerEnvironmentID)
);
GO
