CREATE PROCEDURE [dbo].[usp_SearchInAll]       
(@strFind AS VARCHAR(MAX))
AS
/* Purpose: Search in stored procs, views, function and tables for text 
   
   Usage: You can set a query shortcut to ctrl + 4 for searching on command.
   
   06.09.2021 : E.Cervantes 
*/

BEGIN
    SET NOCOUNT ON; 
    --TO FIND STRING IN ALL PROCEDURES        
    BEGIN
        SELECT OBJECT_NAME(OBJECT_ID) SP_Name
              ,OBJECT_DEFINITION(OBJECT_ID) SP_Definition
        FROM   sys.procedures
        WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+@strFind+'%'
    END 

    --TO FIND STRING IN ALL VIEWS        
    BEGIN
        SELECT OBJECT_NAME(OBJECT_ID) View_Name
              ,OBJECT_DEFINITION(OBJECT_ID) View_Definition
        FROM   sys.views
        WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+@strFind+'%'
    END 

    --TO FIND STRING IN ALL FUNCTION        
    BEGIN
        SELECT ROUTINE_NAME           Function_Name
              ,ROUTINE_DEFINITION     Function_definition
        FROM   INFORMATION_SCHEMA.ROUTINES
        WHERE  ROUTINE_DEFINITION LIKE '%'+@strFind+'%'
               AND ROUTINE_TYPE = 'FUNCTION'
        ORDER BY
               ROUTINE_NAME
    END

    --TO FIND STRING IN ALL TABLES OF DATABASE.    
    BEGIN
        SELECT t.name      AS Table_Name
              ,c.name      AS COLUMN_NAME
        FROM   sys.tables  AS t
               INNER JOIN sys.columns c
                    ON  t.OBJECT_ID = c.OBJECT_ID
        WHERE  c.name LIKE '%'+@strFind+'%'
        ORDER BY
               Table_Name
    END
END