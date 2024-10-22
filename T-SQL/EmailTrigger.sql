SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDDYIZM
-- Create date: 7/10/2014
-- Description:	trigger to email 
-- 

-- =============================================
CREATE TRIGGER 
dbo.TEST_EMAIL_TRIGGER ON dbo.<YOUTABLE>
FOR  INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	  	If EXISTS(SELECT CUSTNMBR FROM INSERTED WHERE CUSTNMBR ='225' AND Divisions='SW')
			BEGIN
					DECLARE @Subject varchar(1000), @Body VARCHAR(5000)
					
					--Set @Subject = <SUBJECT>
					
					--Set @Body = ''
					SELECT @Subject
					EXEC master.dbo.sp_send_cdosysmail 'postmaster@mail.com',  'you@mail.com', @Subject , 'Hello'
			END
	

END
GO
