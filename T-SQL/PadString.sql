/* pad string */

-- working sample
SELECT @Task_Line_Number, 'Task  Line' , @Task_Hierarchy , 'Task H', 
REPLACE(STR(@Task_Line_Number, 4), SPACE(1), '0') 

-- sample pads the character 1 (first 1) with 4 spaces with 0

SELECT REPLACE(STR(1, 4), SPACE(1), '0')

-- result 0001

--varchar string = '9102'
select  REPLACE(STR(string,5), SPACE(1),'0') FROM table
-- result 09102
