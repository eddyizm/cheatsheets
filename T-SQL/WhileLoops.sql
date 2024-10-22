-- Iterate over a temp table
DECLARE @vFileName VARCHAR(255);-- file name or other flag to iterate over
DECLARE @vCount INT;

-- temp table values
SELECT DISTINCT FileName
INTO #filenames

-- get count to set loop against
SELECT @vCount = COUNT(*)
FROM #filenames;

WHILE @vCount > 0
BEGIN
	-- get first value
	SELECT TOP 1 @vFileName = FileName
	FROM #filenames;

	/* UPDATES / INSERTS */
	
	-- remove that row after performing work against it
	DELETE
	FROM #filenames
	WHERE FileName = @vFileName;
	
	-- decrement counter
	SELECT @vCount = @vCount - 1;
END;

--drop temp table 
DROP TABLE #filenames