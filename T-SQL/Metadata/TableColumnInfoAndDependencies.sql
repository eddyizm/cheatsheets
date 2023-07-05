-- table COLUMN information and dependencies

DECLARE 
@TableName VARCHAR(100),
@DataBaseName VARCHAR(25) -- further restriction if there are common table names across multiple database

SET @TableName = 'SV00581';
SET @DataBaseName = 'TWO'; 

select 
TABLE_CATALOG, 
TABLE_NAME, 
ORDINAL_POSITION, 
COLUMN_NAME
,DATA_TYPE
,COLUMN_DEFAULT
,CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS (NOLOCK)
where TABLE_NAME= @TableName 
AND TABLE_CATALOG = @DataBaseName;

-- view showing table dependencies reference ID's 
SELECT referencing_id, referenced_class_desc, 
* FROM sys.sql_expression_dependencies (NOLOCK)
WHERE referenced_entity_name = @TableName; 

--EXEC sp_depends @TableName

-- table names in database | and | Database names on Server
SELECT TABLE_NAME 
FROM <DATABASE_NAME>.INFORMATION_SCHEMA.Tables 
WHERE TABLE_TYPE = 'BASE TABLE'

