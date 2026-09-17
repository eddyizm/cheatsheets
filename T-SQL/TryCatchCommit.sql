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
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW; -- Re-throws the active error automatically
    END CATCH
END TRANSACTION

GO
