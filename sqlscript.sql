REM   Script: Creating Table
REM   .

CREATE TABLE Customers 
( cust_id number(10) NOT NULL primary key, 
  cust_name varchar2(50) NOT NULL, 
  cust_city varchar2(50) 
);

-- Insert RECORD 
INSERT INTO Customers(cust_id,cust_name,cust_city)VALUES(1005,'T.Dheeraj Reddy','Kota');
-- OR
INSERT INTO Customers VALUES(1006,'Prakhar Saxena','Ajmer');
--insert record dynamically
insert into customers(cust_id,cust_name,cust_city)values(&cust_id,&cust_name,&cust_city);

-- Retrieve RECORD/Data
select * from customers;
-- Retrieve Data with WHERE clause
select * from customers where cust_city = 'Kota'
-- Retrieve Data without * and use of ORDER BY clause
select cust_name from CUSTOMERS; /* by default is ascending order*/ 
select cust_name from CUSTOMERS ORDER BY cust_name DESC;

-- DELETE RECORD with condition
delete from Customers where cust_id = 1005;
-- DELETE RECORD without condition
delete from Customers;
--Deletes table data and attributes.
truncate table Customers;
--Notes
  -- Delete without condition - it deletes all records.
  -- Delete with condition - it deletes only conditionally data.
  -- Truncate - Deletes table data and attributes.


-- 'desc' - To show the table structure on the screen.
desc <table_name>;
desc Customers;

--Add new Attribute/Column
alter table customers ADD(cust_Mobile_No number);

--Add Primary Key to Attribute/Column

--Modify Attribute/Column DataType
alter table customers modify(cust_Mobile_No varchar2(11));

--Remove Attribute/Column from table
alter table customers drop(cust_Mobile_No);

--Rename Table
alter table CUSTOMERS RENAME TO CUTOMER;
alter table cutomer rename to customers;

--Reaname Attribute/Column name
alter table customers RENAME COLUMN cust_id TO cust_identification;


--Display records without duplication - it gives priority to the first record
select DISTINCT cust_name from customers;

--Update records with or without condition
update customers set cust_phone = 1234567890;    --without condition, update all records

update customers set cust_phone = 8764275788 where cust_id = 1005;    --with condition, update specific record.