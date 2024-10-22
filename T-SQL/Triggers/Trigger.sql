/* Last updated by last user Trigger template */
USE database_name
GO

CREATE TRIGGER dbo.tU_table_name ON dbo.table_name
FOR UPDATE
AS
UPDATE dbo.table_name
SET LastUpdate = getdate()
	,UpdateID = suser_sname()
FROM dbo.table_name table_name
	,deleted
WHERE table_name.primary_key_column_1 = deleted.primary_key_column_1
	--  next line is needed only if the table’s primary key has more than one column
	AND table_name.primary_key_column_2 = deleted.primary_key_column_2

-- repeat above line for each additional primary key column
RETURN
