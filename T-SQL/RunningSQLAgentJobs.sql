/* show active, running sql server agent jobs and duration */

SELECT 
    j.name AS JobName,
    ja.start_execution_date AS StartTime,
     DATEDIFF(HOUR, ja.start_execution_date, GETDATE()) AS DurationInHours
FROM 
    msdb.dbo.sysjobactivity ja
JOIN 
    msdb.dbo.sysjobs j ON ja.job_id = j.job_id
WHERE 
    ja.stop_execution_date IS NULL
    and ja.start_execution_date IS NOT NULL
