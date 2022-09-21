/*import json file*/

DECLARE @EmployeeDetails VARCHAR(MAX)
 
SELECT @EmployeeDetails = BulkColumn FROM OPENROWSET(BULK'C:\Users\SQLAdmin\Desktop\JSONFile\SampleJSON.json', SINGLE_BLOB) JSON;
SELECT @EmployeeDetails as SingleRow_Column
 
IF (ISJSON(@EmployeeDetails) = 1) 
 BEGIN 
   PRINT 'Imported JSON is Valid' 
 END 
ELSE 
 BEGIN 
   PRINT 'Invalid JSON Imported' 
 END 
 
 
SELECT * FROM OPENJSON(@EmployeeDetails, '$.EmployeeDetails.Employee')
 
 
SELECT Name,Gender,Company,Email
FROM OPENJSON(@EmployeeDetails, '$.EmployeeDetails.Employee')
WITH(
    Name nvarchar(50) '$.name',
        Gender nvarchar(50) '$.gender',
    Company nvarchar(50) '$.company',
    Email nvarchar(50) '$.email'
)  
 
 INSERT INTO EmployeeDetails 
  SELECT Name,Gender,Company,Email
  FROM OPENJSON(@EmployeeDetails, '$.EmployeeDetails.Employee')
  WITH(
    Name nvarchar(50) '$.name',
    Gender nvarchar(50) '$.gender',
    Company nvarchar(50) '$.company',
    Email nvarchar(50) '$.email'
  )
