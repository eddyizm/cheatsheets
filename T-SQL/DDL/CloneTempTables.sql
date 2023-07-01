/* development temp table */
IF OBJECT_ID('tempdb..#clonedTable ') IS NOT NULL 
      DROP TABLE #clonedTable 
	  
-- duplicate table schema with no data
select  * into #clonedTable  
from dbo.<OriginalTable>  (nolock) 
where 1=2

-- restore database from backup
USE [master]
ALTER DATABASE [test] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
RESTORE DATABASE [test] FROM  DISK = N'C:\temp\test.bak' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5
ALTER DATABASE [test] SET MULTI_USER

GO
