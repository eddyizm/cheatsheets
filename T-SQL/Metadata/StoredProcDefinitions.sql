-- get stored proc definition
sp_helptext 'yourprocname'

-- or use object definition
SELECT OBJECT_DEFINITION(OBJECT_ID('yourprocname')) 
