/*
Search text in steps in sql server agent jobs.
*/ 

USE msdb

GO
 SELECT Job.name          AS JobName,
       Job.enabled       AS ActiveStatus,
       JobStep.step_name AS JobStepName,
      JobStep.command AS JobCommand
 FROM   sysjobs Job
       INNER JOIN sysjobsteps JobStep
               ON Job.job_id = JobStep.job_id 
WHERE  JobStep.command LIKE '%Select count(*) from dbo.Test%' 