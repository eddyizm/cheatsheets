# Postgres  

### dump db
   pg_dump -C -h localhost -U localuser dbname > backup.sql

### restore db  
   psql db_name < backup.sql
 
