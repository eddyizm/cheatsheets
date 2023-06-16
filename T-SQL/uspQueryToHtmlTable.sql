CREATE PROC [dbo].[uspQueryToHtmlTable]   
(  
  @query nvarchar(MAX), --A query to turn into HTML format. It should not include an ORDER BY clause.  
  @orderBy nvarchar(MAX) = NULL, --An optional ORDER BY clause. It should contain the words 'ORDER BY'.  
  @html nvarchar(MAX) = NULL OUTPUT --The HTML output of the procedure.  
)  
AS  
BEGIN     
  SET NOCOUNT ON;  
  
  IF @orderBy IS NULL BEGIN  
    SET @orderBy = ''    
  END  
  
  SET @orderBy = REPLACE(@orderBy, '''', '''''');  
  
  DECLARE @realQuery nvarchar(MAX) = '  
    DECLARE @headerRow nvarchar(MAX);  
    DECLARE @cols nvarchar(MAX);      
  
    SELECT * INTO #dynSql FROM (' + @query + ') sub;  
  
    SELECT @cols = COALESCE(@cols + '', '''''''', '', '''') + ''['' + name + ''] AS ''''td''''''  
    FROM tempdb.sys.columns   
    WHERE object_id = object_id(''tempdb..#dynSql'')  
    ORDER BY column_id;  
  
    SET @cols = ''SET @html = CAST(( SELECT '' + @cols + '' FROM #dynSql ' + @orderBy + ' FOR XML PATH(''''tr''''), ELEMENTS XSINIL) AS nvarchar(max))''      
  
    EXEC sys.sp_executesql @cols, N''@html nvarchar(MAX) OUTPUT'', @html=@html OUTPUT  
  
    SELECT @headerRow = COALESCE(@headerRow + '''', '''') + ''<th>'' + name + ''</th>''   
    FROM tempdb.sys.columns   
    WHERE object_id = object_id(''tempdb..#dynSql'')  
    ORDER BY column_id;  
  
    SET @headerRow = ''<tr>'' + @headerRow + ''</tr>'';  
  
    SET @html = ''<style>
    table { border-collapse: collapse;width: 100%;}
    th {text-align: left;padding: 8px;background-color: lightblue;} 
    td {text-align: left;padding: 8px;}
    tr:nth-child(even) {background-color: #CCC;}</style> ''<table border="1">'' + @headerRow + @html + ''</table>'';      
    ';  
  
  EXEC sys.sp_executesql @realQuery, N'@html nvarchar(MAX) OUTPUT', @html=@html OUTPUT  
END  