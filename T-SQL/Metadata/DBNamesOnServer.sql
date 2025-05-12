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
SELECT      sys.databases.name,  
            (SUM(size)*8/1024) * 0.001  AS [Total disk space in GB]  
FROM        sys.databases   
JOIN        sys.master_files  
ON          sys.databases.database_id=sys.master_files.database_id  
GROUP BY    sys.databases.name
ORDER BY [Total disk space in GB] DESC
--ORDER BY    sys.databases.name  

/*get size of table */
USE {database_name};  
GO  
EXEC sp_spaceused N'{dbo}.{table_name}';  
GO  
