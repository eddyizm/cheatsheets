 /* Snippet example in order to extract one column of information from Stored Procedure */   
SELECT  DISTINCT TIMECARD_DATE FROM 
OPENROWSET('SQLNCLI', 'Server=SERVER\DBNAME ;uid=<login> ;pwd=<passwords>',
'EXEC  SRC.dbo.sproc');
     