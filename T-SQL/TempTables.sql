/* get information for temp table */
CREATE TABLE #T
(
X INT,
Y INT
)

SELECT COUNT(name) -- * 
FROM tempdb.sys.columns
WHERE object_id = object_id('tempdb..#T')
-- a much more thorough look into temp table information
EXEC tempdb.dbo.sp_help @objname = N'#TempTable';

/* Check for temp table and drop before creating new one */
IF OBJECT_ID('tempdb..#TEMPY') IS NOT NULL
	DROP TABLE #TEMPY
--code to create table...	
CREATE TABLE #TEMPY
  

IF OBJECT_ID('tempdb..#CLIENTS_KEYWORD') IS NOT NULL
	TRUNCATE TABLE #CLIENTS_KEYWORD
ELSE
	CREATE TABLE ##CLIENTS_KEYWORD (client_id INT)

-- non temp table  
IF EXISTS (
		SELECT 1
		FROM [2KNOW].sys.sysobjects
		WHERE NAME = 'DimDivision'
		)
	DROP TABLE [2KNOW].dbo.DimDivision
