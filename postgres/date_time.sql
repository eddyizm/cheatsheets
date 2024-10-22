-- datetime in postgres is timestamp
-- convert string to timestamp
SELECT TIMESTAMP '2001-02-16'

-- get date one month back from current date
select date_trunc('day', TIMESTAMP '2023-09-20' - interval '1 month');

-- subract days from current date
SELECT CURRENT_DATE - INTERVAL '10 days';
