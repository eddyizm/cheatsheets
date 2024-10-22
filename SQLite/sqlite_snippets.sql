/* Sqlite shortcuts */
-- convert string to date 
select date(date_time) as d, count(id) 
from ufo_sightings
group by date(date_time)

-- format number with commas
select printf('%,d',count(*)) from TABLE;

-- get top N records 

select * from table LIMIT 10;

-- get table info - Columns
pragma table_info(<TABLENAME>);

-- get user version,
PRAGMA user_version

-- set user version
PRAGMA user_version = 5

--exampe
pragma table_info(DailyLog);

-- gets database tables and create table statements.
SELECT *
  FROM sqlite_master

-- get create statement for table example
SELECT sql
  FROM sqlite_master WHERE name = 'DailyLog'

-- select random positive number including 0 where 10 is the limit, ABS guarantees positive number
SELECT ABS(RANDOM() % 10)

-- For generating positive and non-zero random number
SELECT ABS(RANDOM()) % (HIGH - LOW) + LOW
-- Also use method below for pseudorandom  number
ORDER RANDOM()
  
/* command line  */  

https://sqlite.org/cli.html  

sqlite3 -- start command line

--open db  
 `.open <db name>`  
-- show tables  
`.tables`  
-- show db information  
    `.dbinfo`   
-- exit cmd line  
    `.exit`   
-- help  
    `.help  `

-- format output 

sqlite> .mode line
sqlite> select * from tbl1;
-- one = hello
-- two = 10

-- one = goodbye
-- two = 20


-- set output and run query. 
sqlite> .output results.txt
sqlite> .mode column
sqlite> select * from tbl1;
-- one         two       
-- ----------  ----------
-- hello       10        
-- goodbye     20        

-- show header
sqlite> .headers on

-- delete kodi empty shows *excluding shows i will use later*
select tv.idShow, tv.c00 from tvshow as tv where idShow NOT IN (select distinct idShow from episode) AND tv.idShow NOT IN (45, 86, 66, 62);

delete  from tvshow where idShow NOT IN (select distinct idShow from episode) AND idShow NOT IN (45, 55);
