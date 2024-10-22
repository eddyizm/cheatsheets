/*  Bulk insert of CSV */
-- eg. truncate and load sample - Bulk insert requires table to exist
print '----------------- truncate edit table ------------------';
TRUNCATE TABLE dbo.<TABLE>;
print '----------------- bulk insert csv file ------------------';
BULK INSERT dbo.<TABLE>
FROM '\\<SERVER>\<DRIVELETTER>$\<PATH>\<FILE>.csv'
WITH
(
FIRSTROW=2, -- with headers where row #1
FIELDTERMINATOR = '|', -- separator
--ROWTERMINATOR = '0x0A' -- linux line terminator LF
ROWTERMINATOR = '\n' -- windows endline CRLF
)
print '---------------- csv ingested successfully! -------------';
