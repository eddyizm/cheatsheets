-- table names in database | and | Database names on Server

SELECT TABLE_NAME 
FROM <DATABASE_NAME>.INFORMATION_SCHEMA.Tables 
WHERE TABLE_TYPE = 'BASE TABLE'
-- or
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='dbName' 

-- Database names on Server
Select '<ServerName> | '+ name 
-- <ServerName> AS Server, name AS DB
AS DBNames
from Sys.Databases (nolock)
WHERE NAME NOT IN ('master','tempdb','model','msdb');

-- search all databases on server for table
DECLARE @SQL NVARCHAR(max)
SET @SQL = stuff((
            SELECT '
UNION
SELECT ' + quotename(NAME, '''') + ' as Db_Name, Name collate SQL_Latin1_General_CP1_CI_AS as Table_Name
FROM ' + quotename(NAME) + '.sys.tables WHERE NAME LIKE ''%'' + @TableName + ''%'''
            FROM sys.databases
            ORDER BY NAME
            FOR XML PATH('')
                ,type
            ).value('.', 'nvarchar(max)'), 1, 8, '')
--PRINT @SQL;
EXECUTE sp_executeSQL @SQL
    ,N'@TableName varchar(30)'
    ,@TableName = '<TABLE NAME>'