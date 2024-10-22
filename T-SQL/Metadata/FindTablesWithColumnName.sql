/* Find all table names with column name */
SELECT c.NAME AS ColName
	,t.NAME AS TableName
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.NAME LIKE '%MyCol%'


/* search all db's on server for column name */
CREATE TABLE #yourcolumndetails (
    DBaseName VARCHAR(100),
    TableSchema VARCHAR(50),
    TableName VARCHAR(100),
    ColumnName VARCHAR(100),
    DataType VARCHAR(100),
    CharMaxLength VARCHAR(100)
    )

EXEC sp_MSForEachDB @command1 = 'USE [?];
    INSERT INTO #yourcolumndetails SELECT
    Table_Catalog
    ,Table_Schema
    ,Table_Name
    ,Column_Name
    ,Data_Type
    ,Character_Maximum_Length
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME like ''%LabVendor%'''

SELECT *
FROM #yourcolumndetails

DROP TABLE #yourcolumndetails
