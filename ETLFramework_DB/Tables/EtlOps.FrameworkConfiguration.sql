CREATE TABLE EtlOps.FrameworkConfiguration (
	ConfigurationSetting varchar(100) NOT NULL,
	ConfigurationValue   nvarchar(max), -- configuration values are stored as JSON to accommodate complex forms (e.g., multiple auto-created columns)
	CONSTRAINT PK_EtlOps#FrameworkConfiguration PRIMARY KEY (ConfigurationSetting)
);
GO
