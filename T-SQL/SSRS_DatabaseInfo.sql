/*
SSRS Database info

The error log is on the server! You need to RDP into it and click on desktop link I created. 
SHORT CUT TO LOGFILES
PATH: D:\MSQL\MSRS10.MSQL\Reporting Services\LogFiles
*/
-- Report Name // ItemID is report ID 
SELECT *
FROM dbo.CATALOG

-- Report subscriptions tied to users via userID
SELECT *
FROM dbo.Subscriptions

-- disable subscriptions
UPDATE dbo.Subscriptions SET InactiveFlags = 1
WHERE SubscriptionID <SubscriptionID>

-- Report Users
SELECT *
FROM dbo.Users

-- Services Account
UPDATE dbo.Subscriptions
SET OwnerID = 'BBF37050-D69F-4493-B7CE-E1403799FBB3'

SELECT *
FROM dbo.Users
WHERE UserName = '<DOMAIN>\<USERID>' B7D11F2D - 131 B - 4 A61 - AAC1 - 3909 F6CBE109 services account BBF37050 - D69F - 4493 - B7CE - E1403799FBB3

SELECT *
FROM dbo.Subscriptions
WHERE OwnerID = 'BBF37050-D69F-4493-B7CE-E1403799FBB3'

SELECT *
FROM dbo.CATALOG
WHERE CreatedByID = '182E16A8-4EED-4F52-A437-954801C280F3'

SELECT TOP 100 *
FROM dbo.Users
WHERE UserName = '<DOMAIN>\<USERID>' services account ID = BBF37050 - D69F - 4493 - B7CE - E1403799FBB3 Hour(TextToDateTime(In1)) + ":" + Minute(TextToDateTime(In1)) Hour(CurrTime()) + ":" + Minute(CurrTime())

SELECT *
FROM dbo.ExecutionLogStorage
WHERE TimeStart > '2015-10-23 00:01:18.170'
	AND ReportID = 'A51E77C5-8EEF-47ED-8BD4-D179880F7DED'
--AND Status <> 'rsSuccess'
ORDER BY TimeStart DESC

SELECT *
FROM dbo.ExecutionLog
WHERE TimeStart > '2015-10-23 00:01:18.170'
	AND STATUS <> 'rsSuccess'
ORDER BY TimeStart DESC

SELECT *
FROM dbo.ExecutionLog2
WHERE TimeStart > '2015-10-23 00:01:18.170'
	AND STATUS <> 'rsSuccess'
ORDER BY TimeStart DESC


/* get report subscriptions with owners, subscriptions, last run time, schedule name, report path */
SELECT USR.UserName AS SubscriptionOwner 
      ,SUB.ModifiedDate 
      ,SUB.[Description] 
      ,SUB.EventType 
      ,SUB.DeliveryExtension 
      ,SUB.LastStatus 
      ,SUB.LastRunTime 
      ,SCH.NextRunTime 
      ,SCH.Name AS ScheduleName       
      ,CAT.[Path] AS ReportPath 
	  ,RS.ScheduleID
      ,CAT.[Description] AS ReportDescription 
FROM dbo.Subscriptions AS SUB 
     INNER JOIN dbo.Users AS USR 
         ON SUB.OwnerID = USR.UserID 
     INNER JOIN dbo.[Catalog] AS CAT 
         ON SUB.Report_OID = CAT.ItemID 
     INNER JOIN dbo.ReportSchedule AS RS 
         ON SUB.Report_OID = RS.ReportID 
            AND SUB.SubscriptionID = RS.SubscriptionID 
     INNER JOIN dbo.Schedule AS SCH 
         ON RS.ScheduleID = SCH.ScheduleID 
		 WHERE SUB.Description = 'Report Description Name'
ORDER BY USR.UserName 
        ,CAT.[Path];

		select * from msdb.dbo.sysjobs sjs
		
/* show reports and who has what access to them */
select C.UserName, D.RoleName, D.Description, E.Path, E.Name 
from dbo.PolicyUserRole A
   inner join dbo.Users C on A.UserID = C.UserID
   inner join dbo.Roles D on A.RoleID = D.RoleID
   inner join dbo.Catalog E on A.PolicyID = E.PolicyID
  -- WHERE Name IN ('Report Name', 'Other Report Name')
  -- AND C.UserName NOT IN ('BUILTIN\Administrators', 'AD\ENDUSER'
  --)
order by C.UserName , E.Name        

-- Run SQL job to fire subscription: 
  exec msdb.dbo.sp_start_job @job_name = 'E8C3B3D7-3E69-4CE4-AE56-E8AA3F08F103'