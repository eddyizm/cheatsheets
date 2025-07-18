/* string manipulation functions */

-- hash value
SELECT 
    HASHBYTES('SHA2_256', CONCAT('28.99', '|', '0.00')) AS HashExample;

-- hash value and convert to hex value
SELECT 
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'YourDataHere'), 2) AS HexHash;

-- convert number to letter in alphabet
DECLARE @number INT = 5; 
SELECT  Letter = CHAR(64 + @number);

--string split
SELECT ProductId, Name, value  
FROM Product  
    CROSS APPLY STRING_SPLIT(Tags, ',');  

-- convert scientific notation number to int
select str(cast('7.5013e+006' as real) )

--format only 
select format(convert(NUMERIC(18, 2), ISNULL(NULLIF(<VARCHAR>, ''), '0')) / 100, '0.00')

-- extract file name from folder path
select SUBSTRING(FileName, LEN(FileName) + 2 - CHARINDEX('\',REVERSE(FileName)), LEN(FileName))')

-- Example of  Concat with single quotes for another IN query
SELECT  ('''' + RTRIM(ITEMNMBR)+''''+ ',')

-- convert varchar to decimal 
select convert(NUMERIC(18, 2), ISNULL(NULLIF(Interest, ''), '0'))

-- extract folder path from full file path
select REVERSE( SUBSTRING(REVERSE(Location), CHARINDEX('\', REVERSE(Location)) , LEN (Location))) Folder))
