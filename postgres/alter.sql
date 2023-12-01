-- add timestamp column
ALTER TABLE mytable ADD COLUMN created_at TIMESTAMP DEFAULT NOW()
