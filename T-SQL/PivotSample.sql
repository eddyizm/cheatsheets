-- unpivot with CROSS APPLY 

select vendorid, orders, orders1 -- where orders and order1 are the newly named columns from cross apply`
from pvt1
cross apply
(
  values -- these values are coming from the table itself and will map to the orders, orders1 as show in line C
    (emp1, sa),
    (emp2, sa1)
) c (orders, orders1);

--PIVOT EXAMPLE

USE AdventureWorks2008R2;
GO

SELECT DaysToManufacture
	,AVG(StandardCost) AS AverageCost
FROM Production.Product
GROUP BY DaysToManufacture;

-- Here is the result set.
-- DaysToManufacture          AverageCost
-- 0                          5.0885
-- 1                          223.88
-- 2                          359.1082
-- 4                          949.4105
-- Pivot table with one row and five columns
SELECT 'AverageCost' AS Cost_Sorted_By_Production_Days
	,[0]
	,[1]
	,[2]
	,[3]
	,[4]
FROM (
	SELECT DaysToManufacture
		,StandardCost
	FROM Production.Product
	) AS SourceTable
PIVOT(AVG(StandardCost) FOR DaysToManufacture IN (
			[0]
			,[1]
			,[2]
			,[3]
			,[4]
			)) AS PivotTable;

-- Here is the result set.
-- Cost_Sorted_By_Production_Days    0         1         2           3       4       
-- AverageCost                       5.0885    223.88    359.1082    NULL    949.4105
SELECT *
FROM DailyIncome -- Colums to pivot
pivot(max(IncomeAmount) -- Pivot on this column
		FOR IncomeDay IN (
			[MON]
			,[TUE]
			,[WED]
			,[THU]
			,[FRI]
			,[SAT]
			,[SUN]
			)) -- Make colum where IncomeDay is in one of these.
	AS MaxIncomePerDay -- Pivot table alias
WHERE VendorId IN ('SPIKE') -- Select only for this vendor
