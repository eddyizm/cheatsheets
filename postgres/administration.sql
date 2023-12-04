-- check for blocked queries
SELECT pg_cancel_backend(a.pid), pg_terminate_backend(a.pid)
FROM( select pid, 
       usename, 
       pg_blocking_pids(pid) as blocked_by, 
       query as blocked_query
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0) a

-- kill a blocked query
SELECT pg_cancel_backend(a.pid), pg_terminate_backend(a.pid);

-- kill all blocked queries
SELECT pg_cancel_backend(a.pid), pg_terminate_backend(a.pid)
FROM( select pid, 
       usename, 
       pg_blocking_pids(pid) as blocked_by, 
       query as blocked_query
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0) a
