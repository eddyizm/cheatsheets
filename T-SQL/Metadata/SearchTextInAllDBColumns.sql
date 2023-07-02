SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
DECLARE @SearchStr NVARCHAR(100);
SET @SearchStr = N'Sample 17718466';

/* 
Purpose: To search all columns of all tables for a given search string
Returns column name and full column value
*/

CREATE TABLE #Results
(
    ColumnName NVARCHAR(370),
    ColumnValue NVARCHAR(3630)
);

SET NOCOUNT ON;

DECLARE @TableName NVARCHAR(256),
        @ColumnName NVARCHAR(128),
        @SearchStr2 NVARCHAR(110);
SET @TableName = N'';
SET @SearchStr2 = QUOTENAME('%' + @SearchStr + '%', '''');

WHILE @TableName IS NOT NULL
BEGIN
    SET @ColumnName = N'';
    SET @TableName =
    (
        SELECT MIN(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME))
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE'
              AND QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) > @TableName
              AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME)), 'IsMSShipped') = 0
    );

    WHILE (@TableName IS NOT NULL) AND (@ColumnName IS NOT NULL)
    BEGIN
        SET @ColumnName =
        (
            SELECT MIN(QUOTENAME(COLUMN_NAME))
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = PARSENAME(@TableName, 2)
                  AND TABLE_NAME = PARSENAME(@TableName, 1)
                  AND DATA_TYPE IN ( 'char', 'varchar', 'nchar', 'nvarchar', 'int', 'decimal' )
                  AND QUOTENAME(COLUMN_NAME) > @ColumnName
        );

        IF @ColumnName IS NOT NULL
        BEGIN
            INSERT INTO #Results
            EXEC ('SELECT ''' + @TableName + '.' + @ColumnName + ''', LEFT(' + @ColumnName + ', 3630) FROM ' + @TableName + ' (NOLOCK) ' + ' WHERE ' + @ColumnName + ' LIKE ' + @SearchStr2);
        END;
    END;
END;

SELECT ColumnName,
       ColumnValue
FROM #Results;

DROP TABLE #Results;