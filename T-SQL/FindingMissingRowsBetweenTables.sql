-- Find SQL rows that are not shared between two tables 

-- Using NOT IN:

SELECT a.column
  FROM TABLE_A a
 WHERE a.column NOT IN (SELECT b.column
                          FROM TABLE_B b)
-- Using NOT EXISTS:

-- This is a good one if you need to compare more than one column...

SELECT a.column
  FROM TABLE_A a
 WHERE NOT EXISTS(SELECT NULL
                    FROM TABLE_B b
                   WHERE b.column = a.column)

-- Using LEFT JOIN/IS NULL:

   SELECT a.column
     FROM TABLE_A a
LEFT JOIN TABLE_B b ON b.column = a.column
    WHERE b.column IS NULL

--Because of the table aliases, you could swap the table names without changing the rest of the query to see the opposite--rows from TABLE_B that aren't in TABLE_A.