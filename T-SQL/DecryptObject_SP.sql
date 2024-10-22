/* DROP PROC DecryptObject

Create using DAC connection. For some reason, I can't get it to work with SSMS so using powershell -> 

sqlcmd -A -S <SERVER> -d <DATABASE> -b -i "D:\path\to\DecryptObject_SP.sql"

then pass in procs using a text script with the same line

sqlcmd -A -S <SERVER> -d <DATABASE> -b -i <FULL PATH TO SCRIPT>

*/
GO

CREATE PROCEDURE DecryptObject (
	@schema NVARCHAR(255)
	,@ObjectName NVARCHAR(255)
	)
	WITH ENCRYPTION
AS
BEGIN
    /* This procedure can only be run using a DAC Connection */
	DECLARE @id INT
		,@TYPE NVARCHAR(50)
		,@Statement NVARCHAR(4000)
		,@IsEncrypted BIT

	--GET THE ID FOR THE OBJECT
	SELECT TOP 1 @id = object_id
	FROM sys.all_objects
	WHERE [type] NOT IN (
			'S'
			,'U'
			,'PK'
			,'F'
			,'D'
			,'SQ'
			,'IT'
			,'X'
			,'PC'
			,'FS'
			,'AF'
			)
		AND NAME = @ObjectName
		AND SCHEMA_NAME([schema_id]) = COALESCE(@schema, 'dbo')

	IF @id IS NULL
	BEGIN
		PRINT @ObjectName + ' not found!'

		RETURN
	END

	--SEE IF IT IS ENCRYPTED
	SELECT @IsEncrypted = [encrypted]
	FROM syscomments
	WHERE [id] = @id
		AND colid = 1

	IF @IsEncrypted = 0
	BEGIN
		PRINT @ObjectName + ' not encrypted!'

		RETURN
	END

	IF NOT EXISTS (
			SELECT 1
			FROM sys.dm_exec_connections C
			INNER JOIN sys.endpoints E ON C.[endpoint_id] = E.[endpoint_id]
			WHERE E.[name] = 'Dedicated Admin Connection'
				AND C.[session_id] = @@SPID
			)
	BEGIN
		PRINT 'This procedure can only be run using a DAC Connection'

		RETURN
	END

	--GET THE REST OF THE VALUES
	SELECT @ObjectName = [name]
		,@TYPE = CASE 
			WHEN [type] = 'P'
				THEN N'PROCEDURE'
			WHEN [type] = 'V'
				THEN 'VIEW'
			WHEN [type] IN (
					'FN'
					,'TF'
					,'IF'
					)
				THEN N'FUNCTION'
			ELSE [type]
			END
		,@Statement = CASE 
			WHEN [type] = 'P'
				THEN N'WITH ENCRYPTION AS'
			WHEN [type] = 'V'
				THEN N'WITH ENCRYPTION AS SELECT 123 ABC'
			WHEN [type] IN (
					'FN'
					,'TF'
					,'IF'
					)
				THEN N' () RETURNS INT WITH ENCRYPTION AS BEGIN RETURN 1 END'
			ELSE [type]
			END
	FROM sys.all_objects
	WHERE object_id = @id

	DECLARE @BlockNumber INT
		,@Block NVARCHAR(MAX)
		,@pos INT
		,@DummyBlock NVARCHAR(MAX)
		,@DummyImage VARBINARY(MAX)
		,@EncyptedBlock NVARCHAR(MAX)
		,@EncyptedImage VARBINARY(MAX)
		,@pos2 INT
		,@part1 NVARCHAR(MAX)
		,@part2 NVARCHAR(MAX)
		,@DummyImageSQL NVARCHAR(MAX)
		,@NewText NVARCHAR(4000)

	--GET THE ECRYPTED IMAGE VALUE
	SELECT @EncyptedImage = imageval
	FROM sys.sysobjvalues
	WHERE [objid] = @id
		AND valclass = 1

	BEGIN TRANSACTION

	--BUILD THE SQL FOR THE DUMMY IMAGE
	SELECT @pos2 = 1
		,@part1 = N'ALTER ' + @TYPE + ' ' + ISNULL((@schema + '.'), '') + @ObjectName + ' ' + @Statement

	--FILL THE REST OF THE STRINGS AND START THE SQL FOR THE DUMMY IMAGE
	SELECT @part1 = @part1 + REPLICATE('-', 4000 - LEN(@part1))
		,@part2 = REPLICATE('-', 8000)
		,@DummyImageSQL = N'EXEC(@part1'

	--PROCESS THE ENCRYPTED IMAGE ONE BLOCK AT A TIME
	WHILE @pos2 <= CEILING(DATALENGTH(@EncyptedImage) / 8000.0)
	BEGIN
		--BUILD THE SQL FOR THE DUMMY IMAGE
		SET @DummyImageSQL = @DummyImageSQL + N'+@part2'
		SET @pos2 = @pos2 + 1
	END

	--FINISH THE SQL
	SELECT @DummyImageSQL = @DummyImageSQL + ')'

	--EXEC SQL TO CREATE DUMMY IMAGE
	EXEC sp_executesql @DummyImageSQL
		,N'@part1 NVARCHAR(4000),@part2 VARCHAR(8000)'
		,@part1 = @part1
		,@part2 = @part2

	--GO GET THE DUMMY IMAGE THAT WAS CREATED
	SELECT @DummyImage = imageval
	FROM [sys].[sysobjvalues]
	WHERE [objid] = @id
		AND [valclass] = 1

	ROLLBACK TRANSACTION

	SET @BlockNumber = 1

	--PROCESS ONE BLOCK AT A TIME
	WHILE @BlockNumber <= CEILING(DATALENGTH(@EncyptedImage) / 8000.0)
	BEGIN
		--GET THE NEXT BLOCK FROM THE ENCRYPTED IMAGE AND THE DUMMY IMAGE
		SELECT @EncyptedBlock = SUBSTRING(@EncyptedImage, (@BlockNumber - 1) * 8000 + 1, 8000)
			,@DummyBlock = SUBSTRING(@DummyImage, (@BlockNumber - 1) * 8000 + 1, 8000)

		IF @BlockNumber = 1
		BEGIN
			--BUILD THE CREATE STATEMENT HEADER
			SELECT @NewText = N'CREATE ' + @TYPE + ' ' + ISNULL((@schema + '.'), '') + @ObjectName + ' ' + @Statement + REPLICATE('-', 4000)
		END
		ELSE
		BEGIN
			--FILL IN HALF A BLOCK
			SELECT @NewText = REPLICATE('-', 4000)
		END

		--FILL HALF THE SIZE OF THE ENCRYPTED BLOCK
		SELECT @Block = REPLICATE(N'A', (DATALENGTH(@EncyptedBlock) / 2))
			,@pos = 1

		--PROCESS ONE BIT AT A TIME
		WHILE @pos <= DATALENGTH(@EncyptedBlock) / 2
		BEGIN
			--USE BITWISE OR TO DECRYPT THE BIT
			SELECT @Block = STUFF(@Block, @pos, 1, NCHAR(UNICODE(SUBSTRING(@EncyptedBlock, @pos, 1)) ^ (UNICODE(SUBSTRING(@NewText, @pos, 1)) ^ UNICODE(SUBSTRING(@DummyBlock, @pos, 1)))))

			--NEXT POSITION
			SELECT @pos = @pos + 1
		END

		--PRINT THIS BLOCK BEFORE MOVING TO THE NEXT, THIS WILL HAVE THE EFFECT OF
		--GENERATING ONE LONG STATEMENT IN THE RESULTS WINDOW
		PRINT @Block
		PRINT '|||remove|||'

		SELECT @BlockNumber = @BlockNumber + 1
	END
END
GO

EXEC DecryptObject 'dbo'
	,'DecryptObject'
