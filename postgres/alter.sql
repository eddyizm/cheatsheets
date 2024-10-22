-- add timestamp column
ALTER TABLE mytable ADD COLUMN created_at TIMESTAMP DEFAULT NOW()

-- add id column with primary key to existing table
alter table table_name
add column id bigint primary key generated always as identity;
