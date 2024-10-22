/* email samples */

BEGIN
	DECLARE @Subject varchar(1000), @Body VARCHAR(5000);
	
	DECLARE @Col1 varchar(1000), @Col2 VARCHAR(5000)

SELECT @Col1=Appointment_Description, @Col2=Appointment_Status FROM dbo.SV00301 WHERE Service_Call_ID='150212-0001' AND Appointment='0001'

If @Col1 <> ''
	Begin
		Set @Subject = 'Sample Email ' + @Col1;
		Set @Body = 'Appt Desc ' + @Col1 + char(10) + CHAR(13) + 'Appointment Status ' + @Col2
		PRINT @Body
		EXEC master.dbo.sp_send_cdosysmail 'postmaster@mail.com',  'sdurairaj@mail.com', @Subject, @Body;
	END
END;

-- email in attached file 

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'Postmaster',
@subject = 'Test EXEC msdb..sp_send_dbmail',
@recipients = 'you@mail.com',
@query = N'SELECT EMPLOYID,CTC_HEADER_PK, ALLOCATED, 
JOB_HOURS, JOB_MINUTES, TIMECARD_DATE
FROM SRC.dbo.CTC_Header
WHERE ERROR_CODE <> 0
AND SUBMITTED_DATE > GETDATE()-7',
@attach_query_result_as_file = 1,
@query_attachment_filename = 'Errors.csv' -- or .txt

-- email in body with subject line dated
--  no count on to keep results clean. 
-- second select statement to add a footer in plain text with chars to new line space
declare @vSubject VARCHAR (50);
SET @vSubject = '<SubjectHeader> ' + FORMAT(GETDATE(), 'yyyy-MM-dd')

EXEC msdb.dbo.sp_send_dbmail
@profile_name = '<PROFILENAME>',
@recipients = 'you@mail.com',
@subject =  @vSubject,
@query = N'SET NOCOUNT ON;
select sum(amount) as Amount, PREFIX as Prefix
from <DB>.dbo.<TABLE> 
group by PREFIX
SELECT CHAR(13)+CHAR(10) + ''Yours Truly, '' + CHAR(13)+CHAR(10) + ''<ME>'' ',
@attach_query_result_as_file = 0