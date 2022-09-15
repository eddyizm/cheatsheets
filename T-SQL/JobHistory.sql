/* fast way to check table row count without locking table */
DECLARE @TableName sysname
SET @TableName = '<TABLE NAME>'
 
SELECT TBL.object_id, TBL.name, SUM(PART.rows) AS rows
FROM sys.tables TBL
INNER JOIN sys.partitions PART ON TBL.object_id = PART.object_id
INNER JOIN sys.indexes IDX ON PART.object_id = IDX.object_id
AND PART.index_id = IDX.index_id
WHERE TBL.name = @TableName
AND IDX.index_id < 2
GROUP BY TBL.object_id, TBL.name;


/* get job execution history by job name */
DECLARE @jobId BINARY(16)
 
SELECT @jobId = CONVERT(uniqueidentifier, job_id) FROM msdb.dbo.sysjobs
WHERE name = 'YOUR_AGENT_JOB_NAME_GOES_HERE'
 
declare @tmp_sp_help_jobhistory table
(
    instance_id int null,
    job_id uniqueidentifier null,
    job_name sysname null,
    step_id int null,
    step_name sysname null,
    sql_message_id int null,
    sql_severity int null,
    message nvarchar(4000) null,
    run_status int null,
    run_date int null,
    run_time int null,
    run_duration int null,
    operator_emailed sysname null,
    operator_netsent sysname null,
    operator_paged sysname null,
    retries_attempted int null,
    server sysname null
)
 
insert into @tmp_sp_help_jobhistory
exec msdb.dbo.sp_help_jobhistory
    @job_id = @jobId,
    @mode='FULL'
 
SELECT
    tshj.instance_id AS [InstanceID],
    tshj.sql_message_id AS [SqlMessageID],
    tshj.message AS [Message],
    tshj.step_id AS [StepID],
    tshj.step_name AS [StepName],
    tshj.sql_severity AS [SqlSeverity],
    tshj.job_id AS [JobID],
    tshj.job_name AS [JobName],
    tshj.run_status AS [RunStatus],
    CASE tshj.run_date WHEN 0 THEN NULL ELSE
    convert(datetime,
            stuff(stuff(cast(tshj.run_date as nchar(8)), 7, 0, '-'), 5, 0, '-') + N' ' +
            stuff(stuff(substring(cast(1000000 + tshj.run_time as nchar(7)), 2, 6), 5, 0, ':'), 3, 0, ':'),
            120) END AS [RunDate],
    tshj.run_duration AS [RunDuration],
    tshj.operator_emailed AS [OperatorEmailed],
    tshj.operator_netsent AS [OperatorNetsent],
    tshj.operator_paged AS [OperatorPaged],
    tshj.retries_attempted AS [RetriesAttempted],
    tshj.server AS [Server],
    getdate() as [CurrentDate]
FROM @tmp_sp_help_jobhistory as tshj
ORDER BY [InstanceID] ASC