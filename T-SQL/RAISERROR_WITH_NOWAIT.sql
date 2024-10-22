/* Alternative to PRINT inside of a Stored Procedure */
ALTER
--CREATE 
    PROCEDURE [dbo].[RaiseWithNoWaitProcExample]
AS
BEGIN
    SET NOCOUNT ON;

    -- This will print immediately
    RAISERROR ('RE Start', 0, 1) WITH NOWAIT
    SELECT 1;

    -- Five second delay to simulate lengthy execution
    WAITFOR DELAY '00:00:05'

    -- This will print after the five second delay
    RAISERROR ('RE End', 0, 1) WITH NOWAIT
    SELECT 2;
END

GO

EXEC [dbo].[RaiseWithNoWaitProcExample]