-- add composite key constraint 

ALTER TABLE myTable
    ADD CONSTRAINT pk_myConstraint PRIMARY KEY (Column1,Column2)
GO

-- ALTER TABLE AND SET GETDATE() DEFAULT 
ALTER TABLE YourTable ADD CONSTRAINT DF_YourTable DEFAULT GETDATE() FOR YourColumn

-- create table identity and seed 
Personid int IDENTITY(1,1) PRIMARY KEY,

-- Alter script for changing a column property. 

ALTER TABLE dbo.ITEMREQUEST_OUTSYS
ALTER COLUMN MFGNAME VARCHAR(255) 

/* add identity column INT to existing table */


ALTER TABLE dbo.<TABLE>
ADD ID int IDENTITY

/* SQL ALTER TABLE Syntax

To add a column in a table, use the following syntax: */

ALTER TABLE table_name
ADD column_name datatype

--Example: 

ALTER TABLE DB.dbo.ITEM
ADD  ADDNOTES VARCHAR(255) 

-- Alter script for deleting a column property.

ALTER TABLE table_name
DROP COLUMN column_name

-- alter table name

sp_rename 'old_table_name', 'new_table_name';

-- alter column name 

EXEC SP_RENAME 'dbo.Table.OldColumn', 'NewColumn', 'COLUMN';

-- alter column name with brackets require double quotes
sp_rename 'dbo.OldTable."[bracket_colum]"', 'updated_columnname'

-- add primary key
ALTER TABLE Persons
ADD PRIMARY KEY (ID);