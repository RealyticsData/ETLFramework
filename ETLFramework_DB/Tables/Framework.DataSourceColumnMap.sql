CREATE TABLE Framework.DataSourceColumnMap (
    DataSourceColumnMapTemplateID int           NOT NULL,
    ColumnNumber                  int           NOT NULL,
    StageColumnName               varchar(128)  NULL,
    DataType                      varchar(128)  NULL,
    SourceColumnName              varchar(128)  NULL,
    ColumnExpression              varchar(128)  NULL,
    CONSTRAINT PK_Framework#DataSourceColumnMap PRIMARY KEY CLUSTERED (DataSourceColumnMapTemplateID ASC, ColumnNumber ASC),
    CONSTRAINT FK_Framework#DataSourceColumnMap_Framework#DataSourceColumnMapTemplate FOREIGN KEY (DataSourceColumnMapTemplateID) REFERENCES Framework.DataSourceColumnMapTemplate (DataSourceColumnMapTemplateID)
);
GO
