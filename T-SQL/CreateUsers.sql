 -- Create the database role
CREATE ROLE TableSelector AUTHORIZATION [dbo]
GO
 ---- Grant access rights to a specific schema in the database
GRANT 
      SELECT, INSERT, UPDATE, DELETE, ALTER 

ON SCHEMA::dbo
      TO TableSelector 
GO

-- Add an existing user to the new role created 
EXEC sp_addrolemember @ROLENAME, @LOGIN
GO

-- Revoke access rights on a schema from a role 
DENY ALTER  -- you can customize here ...
ON SCHEMA::dbo
      TO TableSelector 
      
select 'CREATE USER [AD\'+AD+']' from [dbo].Users     

-- Grant execute privilege on stored procedure
USE AdventureWorks2012;   
GRANT EXECUTE ON OBJECT::[dbo].usp_proc
    TO Recruiting11;  
GO  
