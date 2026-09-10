-- get database name in current context 
SELECT DB_NAME() as CurrentDatabase;

-- Database names on Server
Select '<ServerName> | '+ name 
-- + ' | ' + collation_name 
AS DBNames
from Sys.Databases (nolock)
WHERE NAME NOT IN ('master','tempdb','model','msdb');

-- Database Version 
Select REPLACE(LEFT(@@VERSION, 45), 'Microsoft ','')

/* get size on disk of databases on server */
-- v 2022
SELECT 
    d.name AS [Database Name],
    CAST(SUM(f.size) * 8.0 / 1024 / 1024 AS DECIMAL(10, 2)) AS [Total Space GB]
FROM 
    sys.databases d
INNER JOIN 
    sys.master_files f ON d.database_id = f.database_id
GROUP BY 
    d.name
ORDER BY 
    [Total Space GB] DESC;
 
-- v 2016 
SELECT      sys.databases.name,  
            (SUM(size)*8/1024) * 0.001  AS [Total disk space in GB]  
FROM        sys.databases   
JOIN        sys.master_files  
ON          sys.databases.database_id=sys.master_files.database_id  
GROUP BY    sys.databases.name
ORDER BY [Total disk space in GB] DESC

/*get size of table */
USE {database_name};  
GO  
EXEC sp_spaceused N'{dbo}.{table_name}';  
GO  
