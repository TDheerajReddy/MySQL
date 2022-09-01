-- create table Employee_TB(
--     emp_id integer(5),
--     emp_name char(30),
--     emp_Address varchar(50),
--     emp_phone integer(11),
--     emp_dob date,
--     emp_salary integer(7) check (emp_salary > 5000),
--     emp_doj date,
--     emp_dep_no integer(5)
--     );
-- drop table employee_TB;
create database mysqldb1;
use mysqldb1;
CREATE TABLE employee( 
    Emp_ID INT(5) primary key auto_increment, 
    Emp_Name VARCHAR(25) ,
    Emp_Address VARCHAR(50) ,
    Emp_Image BLOB ,
    Emp_Salary INT(10) ,
    Dept_ID INT(5)
    );

desc employee;
insert into employee values(
    1001,
    'T.Dheeraj Reddy',
    'Nayapura, Kota',
    load_file('E:/PP/screenshotjpeg.jpg'),
    600000,
    5600
);
insert into employee values(1002,'prakhar Saxena','Dadabari, Kota',load_file('E:/PP/1.jpg'),1000000,5601);
insert into employee values(1003,'Sameer Kukreja','Vigyan Nagar, Kota',load_file('E:/PP/2.jpg'),700000,5602);
insert into employee values(1004,'Abhishek Pradhan','Station, Kota',load_file('E:/PP/IMG_20191110_103645.jpg'),800000,5603);


select * from employee;
delete from employee where emp_name = 'NULL';
drop table employee;

alter table employee add(emp_phone numeric);
alter table employee add(emp_dob date);
alter table employee add(emp_doj date);

update employee set emp_phone = 8764275788, emp_dob = '1998-01-04', emp_doj = '2023-05-02' where emp_id = 1001;
update employee set emp_phone = '6367042707', emp_dob = '2001-11-22', emp_doj = '2023-04-01' where emp_id = 1002;
update employee set emp_phone = 7374091560, emp_dob = '2001-01-12', emp_doj = '2023-05-01' where emp_id = 1003;
update employee set emp_phone = 7877781623, emp_dob = '2000-06-16', emp_doj = '2023-05-01' where emp_id = 1004;

create table Department(
    Dept_ID INT(5) primary key references employee(dept_id),
    dept_name varchar(30),
    dept_address varchar(10)
    );
drop table Department;

insert into Department values(5600,'Developer','5th floor');
insert into Department values(5601,'Manager','2th floor');
insert into Department values(5602,'Marketing','1th floor');
insert into Department values(5603,'Finance','3th floor');

select * from department;

select d.dept_id, d.dept_name, e.emp_name from department d, employee e where d.dept_id = e.dept_id;

--join query
select department.dept_id, department.dept_name, employee.emp_id, employee.emp_phone from employee INNER JOIN department ON employee.dept_id = department.dept_id;
-- select department.dept_id, department.dept_name, employee.emp_id, employee.emp_phone from employee FULL JOIN department ON employee.dept_id = department.dept_id;
select department.dept_id, department.dept_name, employee.emp_id, employee.emp_phone from employee LEFT JOIN department ON employee.dept_id = department.dept_id;
select department.dept_id, department.dept_name, employee.emp_id, employee.emp_phone from employee RIGHT JOIN department ON employee.dept_id = department.dept_id;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table product_tb(p_id int(7) primary key,P_name varchar(35),
    p_cost int(9) check(p_cost >= 1000),
    p_quantity int(5),
    p_dom date
    );

create table Supplier_tb(s_id int(5),s_name varchar(35), s_address varchar(50), s_city varchar(30), s_phone numeric unique, p_id int(7) references product_tb(p_id));

desc product_tb;
desc supplier_tb;
-- delete from product_tb;
-- drop table supplier_tb;

--iserting data into product_tb
insert into product_tb values(202111,'PTP Washing-Machine M98',30000, 2,'2021-12-22');
insert into product_tb values(202112,'PTP AC G4',37000,1,'2021-12-22');
insert into product_tb values(202113,'PTP Cooler P5',5700,3,'2021-10-22');
insert into product_tb values(202114,'PTP Fridge A1',19000,1,'2021-08-22');
insert into product_tb values(202115,'PTP Study Table H9',1200,1,'2021-11-22');
--iserting data into supplier_tb
insert into supplier_tb values(1001,'Prakhar Saxena', 'H.No. C84 Dadabari, Kota Rajasthan 324005','Kota',9865423707,202112);
insert into supplier_tb values(1002,'T.Dheeraj Reddy', 'H.No. B16 Nayapura, Kota Rajasthan 324001','Kota',8764275788,202113);
insert into supplier_tb values(1003,'Sameer Kukreaja', 'H.No. J12 Vigyan Nagar, Kota Rajasthan 324004','Kota',7374091560,202115);
insert into supplier_tb values(1004,'Abhishek Pradhan', 'H.No. M16 Station, Kota Rajasthan 324002','Kota',7877781623,202111);
insert into supplier_tb values(1005,'Abhishek Yadav', 'H.No. D66 Station, Delhi Delhi 680204','Delhi',8954623581,202114);


select * from product_tb;
select * from supplier_tb;

-- Assignment of DBMS BCA pg-41
    -- Q1
select emp_name from employee where emp_name like '_a%' or '_e%';  --without % we can't find value
    -- Q2
select s_name, p_quantity from supplier_tb s, product_tb P where p.p_id = s.p_id and s_id = 1002;
    -- Q3
update employee e, department d set e.emp_salary = (e.emp_salary +(10/100 * e.emp_salary)) where d.dept_id = 5603;
select emp_name, dept_name, emp_salary from employee e, department d where e.dept_id = d.dept_id and d.dept_id = 5603;
    -- Q4
select s_id, s_name from supplier_tb where s_city not in('Idore','nagpur');
    -- Q5
select s_id, s_name, s_phone from supplier_tb where s_city in('Delhi','Mumbai');
    -- Q6
alter table employee add(emp_gender varchar(6));
update employee set emp_gender = 'Male';
    -- Q7
select emp_name, emp_id, dept_name from employee e, department d where e.dept_id = d.dept_id;
    -- Q8
select count(emp_salary) from employee where emp_salary > 20000;
    -- Q9
select emp_name, emp_salary from employee where emp_salary=(select max(emp_salary) from employee);      --use subquery whre the output is highest salary = emp_salary
    -- 10
select * from employee e, department d where d.dept_name = 'Advertisement';
    -- Q11
select avg(emp_salary) from employee;
    -- Q12
desc supplier_tb;
alter table supplier_tb modify s_name varchar(40);
    -- Q13
select emp_name from employee order by emp_name ASC;
    -- Q14
select emp_name, emp_phone from employee where emp_salary > 10000;
    -- Q15
insert into employee values(1005,'Abhishek Yadav','Station, Delhi',load_file('E:/PP/IMG_20191110_103646.jpg'),750000,5603,'9513574682','2001-11-22','2023-05-01','Male');
select sum(emp_salary), max(emp_salary), min(emp_salary), avg(emp_salary) from employee where dept_id = 5603;
    -- Q16
select p_id, P_NAME, p_dom from product_tb order by p_dom desc;




select * from employee;
select * from department;
select * from product_tb;
select * from supplier_tb;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Operations on Table

create database DCM_DB;
use DCM_DB;
drop database DCM_DB;

create table EMPLOYEE_TB(
    E_ID int(5),
    E_Dept_ID int(10),
    E_Name varchar(30),
    E_Salary int(10),
    E_Phone numeric,
    E_City varchar(30),
    E_Gender varchar(6)
    );
create table DEPARTMENT_TB(
    E_Dept_ID int(10),
    E_Dept_Name varchar(35),
    E_Dept_Address varchar(11)
    );
drop table EMPLOYEE_TB;
drop table DEPARTMENT_TB;

-- Adding Key Constraint
alter table EMPLOYEE_TB ADD primary key(E_ID);
alter table EMPLOYEE_TB ADD unique(E_Phone);
alter table DEPARTMENT_TB ADD primary key(E_Dept_ID);
alter table EMPLOYEE_TB ADD foreign key(E_Dept_ID) references DEPARTMENT_TB(E_Dept_ID);

-- Inserting Values int tables
    -- parent Table
insert into DEPARTMENT_TB values(202010,'Manager','5th Floor');
insert into DEPARTMENT_TB values(202011,'Finance','1st Floor');
insert into DEPARTMENT_TB values(202012,'Backend Developer','4th Floor');
insert into DEPARTMENT_TB values(202013,'Frontend Developer','3rd Floor');
insert into DEPARTMENT_TB values(202014,'Full-Stack Developer','2nd Floor');
    
    -- Child Table
insert into EMPLOYEE_TB values(1005,202010,'T.Dheeraj Reddy',600000,8764275788,'Kota','Male');
insert into EMPLOYEE_TB values(1002,202012,'Prakhar Saxena',500000,946137812,'Kota','Male');
insert into EMPLOYEE_TB values(1003,202013,'Abhishek Pradhan',700000,8643157625,'Kota','Male');
insert into EMPLOYEE_TB values(1001,202011,'Sameer Kukreja',600000,7641289436,'Kota','Male');
insert into EMPLOYEE_TB values(1004,202011,'Pawan Gujjar',600000,9462157834,'Kota','Male');


select * from EMPLOYEE_TB;
select * from DEPARTMENT_TB;
    -- description of Table
desc EMPLOYEE_TB;
desc DEPARTMENT_TB;
-- Delete a Attribute/Coloumn
alter table EMPLOYEE_TB drop column E_Gender;

-- Add a Attribute
alter table EMPLOYEE_TB ADD(E_Gender varchar(6));
-- Update all records without condition
update EMPLOYEE_TB set E_Gender = 'Male';

-- remove a specific column value for a specific person / object
update EMPLOYEE_TB set E_Gender = '' where E_ID = 1003;
    -- OR if not STRING
update EMPLOYEE_TB set E_Gender = NULL where E_ID = 1003;

-- change/modify Attribute Size.
alter table EMPLOYEE_TB modify E_Gender varchar(10);
select e_name limit 5 from employee_tb;


---------------Aggregate Functions-----------------------------------
-- count records
select count(*) from employee_tb;

-- count salary attribute records
select count(E_salary) from employee_tb;
select count(E_Salary) from EMPLOYEE_TB where E_Salary > 500000;
select E_Name, E_Salary from EMPLOYEE_TB;


-- count department id attribute record where department id = 202011
select count(E_Dept_ID) from employee_tb where E_Dept_iD = 202011;

select E_Dept_Name, count(E_Dept_Name) from DEPARTMENT_TB GROUP BY E_Dept_Name;
-- select E_Dept_Name, count(E_Dept_Name) from DEPARTMENT_TB having count(E_Dept_Name)>4;

-- find the Average, Sum, Maximum, Minimum  of Salary of employees
select avg(E_Salary), sum(E_Salary), max(E_Salary), min(E_Salary) from EMPLOYEE_TB;

-- find the Average, Sum, Maximum, Minimum  of Salary of employees whose in 'Finance' Department
select avg(E_Salary), sum(E_Salary), max(E_Salary), min(E_Salary) from EMPLOYEE_TB where E_Dept_ID = 202011;


-- Display all records from all tables
select * from Employee_TB E, DEPARTMENT_TB D where D.E_Dept_ID = E.E_Dept_ID;

-- Display limited records from a large Table records
select * from Employee_TB order by E_Name ASC LIMIT 3;
-- OR
-- select * from EMPLOYEE_TB where E_ID > ((select count(*) from Employee_TB) - (2));  --Not  Working


-- GROUP BY
-- Find how many emplyees has in different salaries
select count(E_ID) AS "Number Of Employees", E_Salary from EMPLOYEE_TB group by E_Salary;
-- Find how many emplyees work in different departments
    -- With Single table
select count(E_ID) AS "Number Of Employees", E_Dept_ID from EMPLOYEE_TB group by E_Dept_ID;
    -- With Join query - Multiple table 
select E_Dept_Name, count(E_ID) AS "Number Of Employees" from EMPLOYEE_TB INNER JOIN DEPARTMENT_TB ON DEPARTMENT_TB.E_Dept_ID = EMPLOYEE_TB.E_Dept_ID GROUP BY E_Dept_Name;

-- HAVING - it is like a where clause
select count(E_Salary) from EMPLOYEE_TB group by E_Salary HAVING count(E_Salary) > 1;



-----------------------------VIEWS-----------------------------------------------------------------------------------------------------------------------------------
-- It is a sub part of records, duplicate records for backups, crate sub-parts, real copy of original table, filtered info of original table.
-- View can be operated like a normal table.

create VIEW Employee_TB_Backup AS select * from EMPLOYEE_TB;
select count(E_Salary) "Salary" from EMPLOYEE_TB group by E_Salary HAVING count(E_Salary) > 1;    -- if we don't put conditions, then it copies whole data of original table

create VIEW Kota_Employees_VIEW AS select * from EMPLOYEE_TB where E_City = 'Kota';
create VIEW Salary_Above_Five_Lakhs as select E_ID, E_Name, E_Dept_Name, E_Salary from Employee_TB E, Department_TB D where E.E_Dept_ID = D.E_Dept_ID;

select * from EMPLOYEE_TB_BACKUP;
select * from KOTA_EMPLOYEES_VIEW;
select * from Salary_Above_Five_Lakhs;
INSERT into KOTA_EMPLOYEES_VIEW values(1006, 202013,'Shivam Mewara',700000, 7412354986, 'Kota','Male'); -- We can insert records if we have single table Attributes, otherwise it will give error like below
UPDATE KOTA_EMPLOYEES_VIEW SET E_Salary = 800000 where E_Name = 'T.Dheeraj Reddy';


INSERT into Salary_Above_Five_Lakhs(E_ID, E_Name, E_Dept_Name, E_Salary)values(1006,'Shivam Mewara','Frontend Developer',700000);  -- it gives error;
-- ER_VIEW_NO_INSERT_FIELD_LIST: Can not insert into join view 'dcm_db.salkary_above_five_lakhs' without fields list

INSERT into Salary_Above_Five_Lakhs values(1006,'Shivam Mewara','Frontend Developer',700000);
-- If we put attribues name then it will give another error "ER_VIEW_MULTIUPDATE: Can not modify more than one base table through a join view 'dcm_db.salkary_above_five_lakhs'"
INSERT into Salary_Above_Five_Lakhs(E_ID, E_Name, E_Dept_Name, E_Salary)values(1006,'Shivam Mewara','Frontend Developer',700000);
INSERT into Salary_Above_Five_Lakhs(E_ID, E_Name, E_Dept_Name, E_Salary)values(1007,'Likki','Backend Developer',600000);

UPDATE Salary_Above_Five_Lakhs SET E_Dept_Name = 'Full-Stack Developer', E_Salary = 750000 where E_ID = 1006;
