# Postgres  

#dump db
pg_dump -C -h localhost -U localuser dbname > backup.sql

# restore db  
psql db_name < backup.sql

# connect to db
psql -U root -d postgres

# list tables
\dt

# list schemas
\dn

# list tables in schema  
\dt schema_name.*

