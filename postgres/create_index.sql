-- create index for the values in the phone column of the address table
CREATE INDEX IF NOT EXISTS idx_address_phone 
ON address(phone);
