-- stats and defrag tools
DBCC SHOWCONTIG (<TableName>) WITH   ALL_INDEXES 

DBCC INDEXDEFRAG (<DB>, <TableName>,9)

UPDATE STATISTICS <TableName>
