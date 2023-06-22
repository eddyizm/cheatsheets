/* trigger to log SQL text on update */

CREATE TABLE <DML_TRIGGER_TABLE_STORAGENAME> (
	LogDate DATETIME
	,hostname VARCHAR(500)
	,AppName VARCHAR(500)
	,Username VARCHAR(500)
	,Currentuser VARCHAR(500)
	,SYstemUser VARCHAR(500)
	,SessionUser VARCHAR(500)
	,lastchangedate DATETIME
	)

CREATE TRIGGER <TRIGGER_NAME>  ON <dbo.TABLE_NAME>
FOR UPDATE
	,DELETE
AS
DECLARE @ExecStr VARCHAR(50)
	,@Qry NVARCHAR(255)

CREATE TABLE #inputbuffer (
	EventType NVARCHAR(30)
	,Parameters INT
	,EventInfo NVARCHAR(255)
	)

SET @ExecStr = 'DBCC INPUTBUFFER(' + STR(@@SPID) + ')'

INSERT INTO #inputbuffer
EXEC (@ExecStr)

SET @Qry = (
		SELECT TOP 1 EventInfo
		FROM #inputbuffer
		)

INSERT INTO <DML_TRIGGER_TABLE_STORAGENAME> (
	hostname
	,appname
	,currentuser
	,systemuser
	,sessionuser
	,LogDate
	,Username
	,lastchangedate
	,SQLTEXT
	)
SELECT HOST_NAME()
	,APP_NAME()
	,CURRENT_USER
	,SYSTEM_USER
	,SESSION_USER
	,GETDATE()
	,SUSER_NAME()
	,lastchangedate
	,@Qry
FROM deleted

RETURN


