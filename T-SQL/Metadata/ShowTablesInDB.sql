SELECT t.NAME AS table_name
	,sum(pa.rows) RowCnt
FROM sys.tables AS t
INNER JOIN sys.partitions pa ON pa.object_id = t.object_id
INNER JOIN sys.schemas sc ON t.schema_id = sc.schema_id
WHERE t.is_ms_shipped = 0
	AND pa.index_id IN (
		1
		,0
		) --for row counts
	/* --Find the backup tables
and  ( 
lower(t.name) like '%snap%'
or lower(t.name) like '%bak%'
or lower(t.name) like '%backup%'
or lower(t.name) like '%bk%'
) 
*/
GROUP BY t.NAME
ORDER BY sum(pa.rows) DESC

/* search stored proc for string */

SELECT OBJECT_NAME(OBJECT_ID) AS ObjectName,
       definition             AS ObjectDefinition
 FROM   sys.sql_modules 
WHERE  definition LIKE '%<SEARCH TERM>%'
UNION
SELECT OBJECT_NAME(id) AS ObjectName,
       TEXT AS ObjectDefinition 
FROM   sys.syscomments 
WHERE  TEXT LIKE '%<SEARCH TERM>%' 