CREATE TABLE Metadata.DataSourceColumnMap (
    DataSourceColumnMapTemplateID int           NOT NULL,
    ColumnNumber                  int           NOT NULL,
    StageColumnName               varchar(128)  NULL,
    DataType                      varchar(128)  NULL,
    SourceColumnName              varchar(128)  NULL,
    ColumnExpression              varchar(128)  NULL,
    CONSTRAINT PK_Metadata#DataSourceColumnMap PRIMARY KEY CLUSTERED (DataSourceColumnMapTemplateID ASC, ColumnNumber ASC),
    CONSTRAINT FK_Metadata#DataSourceColumnMap_Metadata#DataSourceColumnMapTemplate FOREIGN KEY (DataSourceColumnMapTemplateID) REFERENCES Metadata.DataSourceColumnMapTemplate (DataSourceColumnMapTemplateID)
);
GO
