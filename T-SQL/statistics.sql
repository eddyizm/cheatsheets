-- stats for simple timing
CREATE PROCEDURE dbo.YourProcedure
AS
BEGIN
    SET NOCOUNT ON;
    SET STATISTICS TIME ON;
    
    -- Your query here
    SELECT * FROM LargeTable WHERE Condition = 1;
    
    SET STATISTICS TIME OFF;
END;

-- stats for IO 
CREATE PROCEDURE dbo.YourProcedureWithIOStats
AS
BEGIN
    SET NOCOUNT ON;
    SET STATISTICS IO ON;
    
    -- Your query here
    SELECT * FROM LargeTable WHERE Condition = 1;
    
    SET STATISTICS IO OFF;
END;

