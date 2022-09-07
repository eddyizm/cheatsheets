/*
Try / Catch template
*/ 

--BEGIN
  
	BEGIN TRY 

		-- TODO
		SELECT 'Write your code here';

	END TRY
   
	BEGIN CATCH  


		DECLARE @ERROR_MESSAGE VARCHAR(8000)  
		SET @ERROR_MESSAGE = 'ERROR PROCEDURE: ' + CONVERT(VARCHAR(50),ERROR_PROCEDURE()) + '. '  
		SET @ERROR_MESSAGE = @ERROR_MESSAGE + 'ERROR LINE: ' + CONVERT(VARCHAR(50),ERROR_LINE()) + '. '  
		SET @ERROR_MESSAGE = @ERROR_MESSAGE + 'ERROR MESSAGE: ' + CONVERT(VARCHAR(500),ERROR_MESSAGE()) + '. '  
		SET @ERROR_MESSAGE = @ERROR_MESSAGE + 'ERROR SEVERITY: ' + CONVERT(VARCHAR(50),ERROR_SEVERITY()) + '. '  
		SET @ERROR_MESSAGE = @ERROR_MESSAGE + 'ERROR STATE: ' + CONVERT(VARCHAR(50),ERROR_STATE()) + '. '  

		RAISERROR (@ERROR_MESSAGE, 16, 1)   

		RETURN ERROR_SEVERITY()  
		
	END CATCH  
      
--END