/* Table Variable 

better performance than a temp table. 

*/

-- example declaration 
DECLARE @ProductTotals TABLE
(
  ProductID int, 
  Revenue money
)

-- insert statement
INSERT INTO @ProductTotals (ProductID, Revenue)
SELECT ProductID, SUM(UnitPrice * Quantity)
FROM [Order Details]
GROUP BY ProductID

--  You can use table variables in batches, stored procedures, and user-defined functions (UDFs). We can UPDATE records in our table variable as well as DELETE records.
	
UPDATE @ProductTotals
SET Revenue = Revenue * 1.15
WHERE ProductID = 62
 
DELETE FROM @ProductTotals
WHERE ProductID = 60
 
SELECT TOP 5 * 
FROM @ProductTotals
ORDER BY Revenue DESC

/* store deleted/inserted or updated records from output into table variable */

DELETE FROM dbo.table1
OUTPUT DELETED.* INTO @MyTableVar
WHERE id = 4 OR id = 2;