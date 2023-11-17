-- show all foreign keys
SELECT conrelid::regclass AS table_name, 
       conname AS foreign_key, 
       pg_get_constraintdef(oid) 
FROM   pg_constraint 
WHERE  contype = 'f' 
AND    connamespace = 'public'::regnamespace   
ORDER  BY conrelid::regclass::text, contype DESC;

-- list indexes
select *
from pg_indexes

-- show connections
SELECT backend_start, application_name,
query, backend_type, state, wait_event,
* FROM pg_stat_activity
order by 1 desc ;