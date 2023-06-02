/*How to start a SQL Server job from a stored procedure?
Execute the following Microsoft SQL Server T-SQL scripts in Management Studio Query Editor or imbed them in stored procedures to start a job which is configured with SQL Server Agent and perform other job control related operations programmatically:
*/

-- SQL Server start job from script - SQL Server job programmatically control
EXEC msdb.dbo.sp_start_job N'Weekly Accounts Payable Transaction History';
 
/**** To perform certain actions SQLAgentOperatorRole in msdb maybe required. ****/

-- Creating application stored procedure to start SQL Server Agent job
CREATE PROC sprocStartMonthlyInventoryJob
AS
EXEC msdb.dbo.sp_start_job N'Monthly Inventory Processing';
GO
-- Execute t-sql stored procedure
EXEC sprocStartMonthlyInventoryJob
------------

-- Create SQL Server Agent job start stored procedure with input parameter
CREATE PROC uspStartJob @JobName sysname
AS
DECLARE @ReturnCode tinyint -- 0 (success) or 1 (failure)
EXEC @ReturnCode=msdb.dbo.sp_start_job @job_name=@JobName;
RETURN (@ReturnCode)
GO
-- Execute t-sql stored procedure with parameter and return code
DECLARE @return int
EXEC @return=uspStartJob N'CheckandBackupInventoryDB'
SELECT 'Start job result' = @return
------------

 
SQL Server Agent Job related T-SQL queries and scripts:  
 
------------
-- List all jobs with basic info like job_id, name, etc.
------------
SELECT * FROM msdb.dbo.sysjobs ORDER BY name


-- STOP a currently executing job - sql server agent stored procedure
EXEC msdb.dbo.sp_stop_job N'NightlyInventoryFeed' ;
 
-- Get job INFO on application job - execute system stored procedure
EXEC msdb.dbo.sp_help_job
    @job_name = N'FinanceBackup',
    @job_aspect = N'ALL' ;
GO

-- SQL Server system job INFO - t sql stored procedure
EXEC msdb.dbo.sp_help_job
      @job_name = N'syspolicy_purge_history',
      @job_aspect = N'ALL' ;
GO

 
Check running status of a job

-- Check run status of a job
-- SQL Server 2008 T-SQL - Running = 1 means currently executing
DECLARE @job_id uniqueidentifier = '4C004358-62E0-4933-9268-90F54EF36AA9' 
EXEC master.dbo.xp_sqlagent_enum_jobs 1, sa, @job_id
 

-- If current_execution_status=1 then RUNNING
EXEC msdb.dbo.sp_help_job  @job_id='0D823348-2DDC-4816-93EA-307D6E736437'
------------

------------
-- SQL Server Agent disable job
------------
EXEC msdb.dbo.sp_update_job
    @job_name = N'Back Up Database - AdventureWorks2008',
    @enabled = 0 ;
------------

---------
-- SQL Server Agent detailed job information - more columns can be added as needed
------------
SELECT job.name                                      AS JobName,
       job.job_id,
       job.enabled                                   AS JobEnabled,
       CONVERT(SYSNAME,SERVERPROPERTY('Servername')) AS Server,
       job.DESCRIPTION,
       job.notify_level_eventlog,
       job.notify_level_email,
       job.notify_level_page,
       job.notify_email_operator_id,
       job.date_created,
       cat.name                                      AS CategoryName,
       sch.next_run_date,
       sch.next_run_time,
       srv.last_run_outcome,
       srv.last_outcome_message,
       srv.last_run_date,
       srv.last_run_time,
       srv.last_run_duration,
       op.name                                       AS NotifyOperatorName,
       op.email_address,
       job.date_modified                             AS JobDateModified,
       ssch.name                                     AS ScheduleName,
       ssch.enabled                                  AS ScheduleEnabled,
       ssch.freq_type,
       ssch.freq_interval,
       ssch.freq_subday_interval,
       ssch.freq_subday_type,
       ssch.freq_relative_interval,
       ssch.freq_recurrence_factor,
       ssch.active_start_date,
       ssch.active_end_date,
       ssch.active_start_time,
       ssch.active_end_time,
       GETDATE()                                     AS ThisReportRunDate
FROM   msdb.dbo.sysjobs job
       INNER JOIN msdb.dbo.syscategories cat
         ON job.category_id = cat.category_id
       LEFT OUTER JOIN msdb.dbo.sysoperators op
         ON job.notify_page_operator_id = op.id
       LEFT OUTER JOIN msdb.dbo.sysjobservers srv
         ON job.job_id = srv.job_id
       LEFT OUTER JOIN msdb.dbo.sysjobschedules sch
         ON sch.job_id = job.job_id
       LEFT OUTER JOIN msdb.dbo.sysschedules ssch
         ON sch.schedule_id = ssch.schedule_id
ORDER BY JobName
/* Partial results
JobName                 job_id                                    JobEnabled  Server
syspolicy_purge_history EF74E83A-325E-489B-B52C-D1E7DF5A5508      1     HPESTAR\SQL2008
*/
