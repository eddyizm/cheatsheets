# create temp table

SELECT 
    column1,
    column2,
    column3
INTO TEMPORARY TABLE temp_table_name
FROM 
    existing_table_name
WHERE 
    some_condition;

