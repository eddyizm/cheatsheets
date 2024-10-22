-- Add composite key
ALTER TABLE myTable
    ADD CONSTRAINT pk_myConstraint PRIMARY KEY (Column1,Column2)
GO

-- The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

CREATE TABLE Orders (
     OrderID int NOT NULL PRIMARY KEY,
     OrderNumber int NOT NULL,
     PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
 );
 
 -- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:
 CREATE TABLE Orders (
     OrderID int NOT NULL,
     OrderNumber int NOT NULL,
     PersonID int,
     PRIMARY KEY (OrderID),
     CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
     REFERENCES Persons(PersonID)
 );
 -- To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:
 
 ALTER TABLE Orders
 ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
 
 -- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:
 
 ALTER TABLE Orders
 ADD CONSTRAINT FK_PersonOrder
 FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);