/* Try Catch with TRANSACTION CONTROL */
SET ANSI_NULLS OFF;
SET NOCOUNT ON; 
SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; 

BEGIN TRANSACTION;  
  
    BEGIN TRY  
        -- Generate a constraint violation error.  
        DELETE FROM Production.Product  
        WHERE ProductID = 980;  
    END TRY  
    BEGIN CATCH  
        SELECT   
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
      
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
    END CATCH;  
  
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO
