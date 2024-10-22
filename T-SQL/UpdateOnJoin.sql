-- UPDATE MULTIPLE TABLES 
BEGIN TRANSACTIONS;
 
UPDATE TABLE1
SET Col1 = 'SomeValue'
WHERE Cond1 = 'SomeCond';
 
UPDATE TABLE2
SET Col2 = 'SomeValue'
WHERE Cond2 = 'SomeCond';
 
COMMIT;

-- UPDATE On a JOIN 
UPDATE SY SET SY.INET1 = PH.INET1, SY.INET2 = PH.INET2
FROM <TABLE_ONE>  SY INNER JOIN <TABLE_TWO> PH 
ON PH.Master_ID = SY.Master_ID COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE SY.Master_Type='EMP'

-- DELETE on JOIN 
DELETE N 
FROM <TABLE_ONE> N
JOIN <TABLE_TWO> T ON N.ITEMNMBR =T.ITEMNMBR

-- multi condition 
UPDATE N SET N.QTYONHND = T.QTYONHND
FROM <TABLE_ONE> T
JOIN <TABLE_TWO> N ON N.ITEMNMBR =T.ITEMNMBR
AND N.LOCNCODE = T.LOCNCODE
AND N.RCRDTYPE = T.RCRDTYPE
WHERE T.QTYONHND > 0

-- update TOP records

update top (100) table1 set field1 = 1

-- update CTE with duplicates (can also be used to delete) 
WITH dupes
AS (
	SELECT ROW_NUMBER() OVER (
			PARTITION BY dob
			,membername
			,Patient
			,annualcap ORDER BY membername
			) AS RN
		,*
	FROM #DeDupe
    WHERE annualcap IS NOT NULL 
	)
UPDATE dupes
SET annualcap = 0
WHERE rn > 1;
