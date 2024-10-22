-- Calculating percentage
	
Select 
FORMAT   -- better to format  as percentage right from the start if it makes things easier. 	
((5.0 / 6000.0) -- number that I'm looking for as a percent 'BITE' out of the main pie / total number (pie) that I am cutting from
,'p') -- new way to do this, format to percentage removes the multiplying by 100 step
AS [%] 

-- Non formatted solution	
	Select  
	100.0  -- number that I'm looking for as a percent 'BITE' out of the main pie
	/ 12816.0 -- total number (pie) that I am cutting from
	* 100 -- multiply by 100 to get a percentage. 
	
-- example for 75% 
	
SELECT (3.0/4.0) * 100 AS Percentage

-- Find Percentage Rate
SELECT ((31.50 - 22.50)/22.50) * 100 AS PercentageRate