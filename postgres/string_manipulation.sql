
-- replace all non integers
select regexp_replace('test1234test45abc', '[^0-9]+', '', 'g');
