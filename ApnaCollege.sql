/*MySQL*/
/*Database:- 
    *Database is collection of data in a format that can be easily accessed (Digital).
    *Collection of inter-related data / tables / informations.
    *Collection of tables/informations.
*/
/*  Relational Databases = MySQL, Oracle, SQL Server, PostgreSQL (PL/SQL), 
    Non-Relational Databases (NoSQL) = mongoDB, CouchDB, Riak, Amazon SimpleDB, Lotus Notes;
*/
/* SQL:-
    it is used to perform CRUD operations- Create, Read, Update, Delete

    SEQUEL = Structured English Query Language (IBM)
    SQL = Structured Query Language
*/
/* Table Scema:-
    *combination of rows and columns
    columns = general structure / design / schema. (Verticle)
    rows = individual's data.(Horizontal)
*/
/* Not Case-Sensitive */

CREATE DATABASE ApnaCollege;

USE ApnaCollege;

/* CREATE TABLE table_NAme (COL1_name DATATYPE CONSTRAINT, COL2_name DATATYPE CONSTRAINT); */
CREATE TABLE Student(
    ID INT PRIMARY KEY AUTOINCREMENT, 
    Name VARCHAR(25), 
    Age INT NOT NULL);

INSERT INTO Student VALUES(1, Dheeraj, 26);

SELECT * FROM Student;

/*SQL DataType
    CHAR(50) = use whole 50 bytes / use extra memory - Static Memory
    VARCHAR(50) = use only used data/bytes  -   Dynamic Memory
    BLOB = string(0-65535), can store binary large object BLOB(1000), images,videos Addresses
    INT = integer( -2,147,483,648 to 2,147,483,647 ), INT
    TINYINT = integer(-128 to 127), TINYINT
    BIGINT = integer( -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 ), BIGINT
    BIT = can store x-bit values. x can range from 1 to 64, BIT(2) =11, BIT(4) = 1111=15
    FLOAT = Decimal number - with precision to 23 digits FLOAT
    DOUBLE = Decimal number - with 24 to 53 digits DOUBLE
    BOOLEAN = Boolean values 0 or 1,  BOOLEAN   -   Not directly Use, Use with TINYINT, if TINYINT = 1 then BOOLEAN =1, if TINYINT = 0 then BOOLEAN = 0
    DATE = date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31, DATE
    TIME = HH:MM:SS, TIME
    YEAR = year in 4 digits format ranging from 1901 to 2155, YEAR
*/
/*Signed and Unsigned
    Signed = - to +
    Unsigned = 0 to +   -   range increased
    Unsigned Ex = TINYINT UNSIGNED (0 to 255)   -   range increased
    Signed Ex = TINYINT (-128 to 127)
    Ex:= Age TINYINT UNSIGNED
*/

/*Types of SQL Commands
    1. DQL (Data Query Language) : Used to retrieve data from databases. (SELECT)

    2. DDL (Data Definition Language) : Used to create, alter, and delete database objects like tables, indexes, etc. (CREATE, ALTER, RENAME, TRUNCATE, DROP)

    3. DML (Data Manipulation Language): Used to modify the database. (INSERT, UPDATE, DELETE)

    4. DCL (Data Control Language): Used to grant & revoke permissions. (GRANT, REVOKE)

    5. TCL (Transaction Control Language): Used to manage transactions. (COMMIT, ROLLBACK, START TRANSACTIONS, SAVEPOINT)
*/

/*Database related Queries*/
    CREATE DATABASE db_name;
    CREATE DATABASE IF NOT EXISTS db_name;
    Ex:= CREATE DATABASE IF NOT EXISTS Student;

    DROP DATABASE db_name;
    DROP DATABASE IF EXISTS db_name;
    
    SHOW DATABASES;
    SHOW TABLES;


/*Table related Queries
    CREATE TABLE table_name (
        column_name1 datatype constraint,
        column_name2 datatype constraint,
    );
Ex:= CREATETABLE Student(
        RollNo INT PRIMARY KEY,
        Name VARCHAR(50)
    );

    SELECT * FROM table_name;

    INSERT INTO table_name (column_name1, column_name2) VALUES (col1_data, col2_data), (col1_data, col2_data);
    Ex:= INSERT INTO Student (RollNo, Name) VALUES (101, "Lakshay"), (102, "Akshay"); - prefer for multiple values
    Ex:= INSERT INTO Student VALUES (101, "Lakshay"); - prefer for Small Table and if we know Datatypes

*/
/*Practice*/
CREATE DATABASE IF NOT EXISTS XYZ;
USE XYZ;

CREATE TABLE Employee(
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary FLOAT
);

INSERT INTO Employee
(ID, Name, Salary) 
VALUES 
(1,"adam",25000), (2,"bob",30000),(3,"casey",40000);

SELECT * FROM Employee;

DROP DATABASE IF EXISTS XYZ;
/**/

/*KEYS
    PRIMARY KEY: 
        UNIQUE and NOT NULL.
        Only 1 PK per Table.

    FOREIGN KEY:
        PRIMARY KEY of Other Table.
        Can be Multiple FKs
        FKs can have Multiple/Duplicate and NULL values in a Tables.
*/

/*CONSTRAINTS - SQL constraints are used to specify rules for data in a table.
    NOT NULL
    NULL
    UNIQUE
    PRIMARY KEY = Ex:= PRIMARY KEY (ID); PRIMARY KEY (ID, Name); - both column combination is Primary Key, means both values combination not used anywhere in that table. Single column can be reapeated.
    FOREIGN KEY = FOREIGN KEY (current_table_col) references Table_Name(col_name);
    DEFAULT = Ex:= Salary FLOAT DEFAULT 15000
    CHECK = Ex1:= create table Emp(id int, name varchar(50), age int, city varchar(50), CONSTRAINT age_check_temp CHECK(age >=18 AND city="Kota"));
            Ex2:= create table Emp(name varchar(50), age int CHECK(age >=18));
*/

/*Practice*/
CREATE DATABASE IF NOT EXISTS College;
USE College;
CREATE TABLE IF NOT EXISTS Student(rollNo INT PRIMARY KEY, name VARCHAR(50), marks INT NOT NULL, grade VARCHAR(1), city VARCHAR(50));
INSERT INTO Student VALUES 
(1,"abc",88,"A","kota"), (2,"def",89,"A","Ajmer"), 
(3,"ghi",65,"B","Bundi"), (4,"jkl",85,"A","Jaipur"), 
(5,"mno",44,"C","kota");
INSERT INTO Student VALUES (6,"pqr",95,"A","Bundi"), (7,"stv",92,"A","kota");
SELECT * FROM Student;

SELECT rollno, marks FROM Student;
/* DISTINCT(col) - Removes duplicate rows from query results.
    avoid duplicate/repeated values when we use only one column/select ionly unique values */
SELECT DISTINCT(city) FROM Student;

/*WHERE Clause - to define some Conditions */
SELECT * FROM Student WHERE marks >=85;
SELECT * FROM Student WHERE city = "KOTA";

/*Using Operators in WHERE
    Arithmetic Operators : +(addition) , -(subtraction), *(multiplication), /(division), %(modulus)
    Comparison Operators : = (equal to), != (not equal to), > , >=, <, <=
    Logical Operators : AND, OR , NOT, IN, BETWEEN, ALL, LIKE, ANY
    Bitwise Operators : & (Bitwise AND), | (Bitwise OR)
*/

SELECT * FROM Student WHERE marks >= 85 AND city = "KOTA";
SELECT * FROM Student WHERE marks >= 85 OR city = "KOTA";
SELECT * FROM Student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM Student WHERE city IN ("bundi", "KOTA", "Delhi");
SELECT * FROM Student WHERE city NOT IN ("BUNDI","KotA");

SELECT * 
FROM Student 
WHERE marks+10 > 100; /*retrive student data whose marks is added to 10 is greater than 100  */

/*Limit Clause
    Sets an upper limit on number of (tuples)rows to be returned.*/
SELECT * FROM Student WHERE marks > 75 LIMIT 3;

/*Order By Clause
    To sort in ascending (ASC) (by default) or descending order (DESC).
*/
SELECT * FROM Student ORDER BY city; 
SELECT * FROM Student ORDER BY marks DESC;
SELECT * FROM Student ORDER BY marks DESC LIMIT 3;  /*Top 3 Students*/
SELECT * FROM Student WHERE city IN ("bundi", "KOTA", "Delhi") ORDER BY rollno DESC LIMIT 3;

/*Aggregate Functions:-
    Aggregare functions perform a calculation on a set of values, and Return a Single Value.
        COUNT( )
        MAX( )
        MIN( )
        SUM( )
        AVG( )
*/

SELECT MAX(marks) FROM Student;
SELECT MIN(marks) FROM Student;
SELECT AVG(marks) FROM Student;
SELECT COUNT(ROLLNO) FROM Student;      /*Total Students*/


/*Group By Clause:-
    Groups rows that have the same values into summary rows.
    It collects data from multiple records and groups the result by one or more column.
        *Generally we use group by with some aggregation function.
        
        We use Columns with "GROUP BY" only we mention at the left side of the Query with "SELECT" keyword.

*/
SELECT city FROM Student GROUP BY city;
SELECT city, COUNT(rollno) FROM Student GROUP BY city;      /*Total Students in every city*/
SELECT city, name, COUNT(rollno) FROM Student GROUP BY city; /*ERROR in Workbench, because we can not use "name" column with GROUP BY*/
SELECT city, name, COUNT(rollno) FROM Student GROUP BY city, name;         /*No Error in Workbench*/
SELECT city, AVG(marks) FROM Student GROUP BY city;     /*Average Marks in each City*/

/*WAQ to find average marks in each city in ascending order*/
SELECT city, AVG(marks) AS avg_marks
FROM Student 
GROUP BY city 
ORDER BY avg(marks);

/*EX:- SELECT mode, COUNT(custId) FROM Customer GROUP BY mode; */
SELECT grade, COUNT(rollno) FROM Student GROUP BY grade;

/*Having Clause:-
    Used when we want to apply any condition after grouping.
    Similar to "WHERE" i.e. applies some condition on rows.

    WHERE = Conditions On Rows
    HAVING = Conditions On groups
*/
/*Count number of students in each city where max marks cross 90*/
SELECT city, COUNT(rollno) FROM Student GROUP BY city HAVING max(marks) > 90;
SELECT city, COUNT(rollno) FROM Student WHERE MAX(marks) > 90 GROUP BY city;    /* ERROR - "aggregate functions are not allowed in WHERE" / aggregate functions are not allowed because the WHERE clause is used for filtering data before aggregation. That's why we use HAVING clause.

/*General Order
    SELECT column(s)
    FROM table_name
    WHERE condition - Rows
    GROUP BY column(s)
    HAVING condition    - Groups/Aggregate fun/Columns
    ORDER BY column(s) ASC
    LIMIT;
*/
SELECT city
FROM Student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 90
ORDER BY city
LIMIT 4;

/*Table related Queries - UPDATE
    UPDATE (to update existing rows)

    UPDATE table_name
    SET col1 = val1, col2 = val2
    WHERE condition;
*/

SET SQL_SAFE_UPDATES = 0;   /*this command allow updation, 0 = Safe Mode OFF, 1 = Safe Mode ON*/

UPDATE Student 
SET grade = "O" 
WHERE grade = "A";      /*"O" means Outstanding*/

UPDATE Student SET marks = 50 WHERE rollNo = 5;
UPDATE Student SET grade = "C" WHERE rollNo = 3;
UPDATE Student SET grade = "B" WHERE marks BETWEEN 80 AND 90;
UPDATE Student SET grade = "O" WHERE marks > 90;

/* Q.Grace Marks OR Wrong question given in exam. */
UPDATE Student SET marks = marks + 1;   /* Without any Condition Whole table Updated.*/

/*Table related Queries - DELETE
    DELETE (to delete existing rows)
    
    DELETE FROM table_name
    WHERE condition;
*/
/*DELETE FROM Student;  -- Delete whole table tupple/records/rows Without any Condition.*/

SELECT * from student;

DELETE FROM Student 
WHERE marks < 33;

/*Revisiting Foreign Key:-
    Foreign Key is on Child Table and where the foreign key is reffered it is called Parent Table.
*/

/*Parent Table*/
CREATE TABLE IF NOT EXISTS Department(
    Id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

/*Child Table*/
CREATE TABLE IF NOT EXISTS Teacher(
    Id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(Id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

/*Cascading for FK
    ON DELETE CASCADE
        When we create a foreign key using this option, it deletes the referencing rows in the child table
        when the referenced row is deleted in the parent table which has a primary key.
        NOTE:- Parent delete then Child delete, when Child delete then Parent table does not effect.
    ON UPDATE CASCADE
        When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child
        table when the referenced row is updated in the parent table which has a primary key.
        NOTE:- Parent update then Child update, when Child update then Parent table does not effect.
        Ex:- Without CASCADE statement we can not Change Parent Primary Key.
            CREATE TABLE IF NOT EXISTS Teacher(
                Id INT PRIMARY KEY,
                name VARCHAR(50),
                dept_id INT,
                FOREIGN KEY (dept_id) REFERENCES Department(Id) 
                ON DELETE CASCADE 
                ON UPDATE CASCADE
            );
*/

INSERT INTO Department VALUES (1001,"Science"), (1002,"Arts");
SELECT * FROM Department;

INSERT INTO Teacher VALUES (101,"Kaal",1002), (102,"Dhamaal",1001);
SELECT * FROM Teacher;
SELECT * FROM Department;
UPDATE Department SET Id = 1001 WHERE Id = 1003;

/*Table related Queries - ALTER
    Alter (to change the schema)
        ADD COLUMN
            ALTER TABLE table_name
            ADD COLUMN column_name datatype constraint;
        DROP COLUMN
            ALTER TABLE table_name
            DROP COLUMN column_name;
        RENAME table
            ALTER TABLE table_name
            RENAME TO new_table_name;
        CHANGE COLUMN (rename) - we can also change datatype and its size of the column
            ALTER TABLE table_name
            CHANGE COLUMN old_name new_name new_datatype new_constraint;
        MODIFY Column (modify datatype and Size(greater or less than previous size)/ constraint)
            ALTER TABLE table_name
            MODIFY col_name new_datatype new_constraint;
*/

ALTER TABLE Student 
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE Student DROP COLUMN age;
ALTER TABLE Student RENAME TO Stud;
ALTER TABLE Student CHANGE COLUMN name Stud_Name VARCHAR(51);
ALTER TABLE Student MODIFY Stud_Name VARCHAR(51);       /*You can change the datatype and size(less or more) of the column*/
ALTER TABLE Student CHANGE COLUMN age Stud_Age INT;         /*we can also change datatype of column*/

/*Table related Queries
    TRUNCATE (to delete table's data)
        TRUNCATE TABLE table_name ;

    DROP TABLE - delete table
    TRUNCATE TABLE - delete table's data, not the table
*/
TRUNCATE TABLE Student;

/*Practice Question*/
ALTER TABLE Student CHANGE COLUMN name Full_Name VARCHAR(40);
DELETE FROM Student WHERE marks < 80;
ALTER TABLE Student DROP COLUMN grade;
/**/

SELECT * FROM Student;
DESC Student;

DROP TABLE Student;

/*Joins in SQL
    Join is used to combine rows from two or more tables, based on a related column between them.
    
    *not compulsary to be Foreign Key, only related data availabe is enough.

    1. INNER JOIN - Returns records that have matching values in both tables. (only Common data of both Table (A & B)).
                    SELECT column(s) FROM tableA INNER JOIN tableB ON tableA.col_name = tableB.col_name;

    2. Outer Join:
        a. LEFT JOIN  - Returns all records from the left table, and the matched records from the right table. (Table A's whole data & Common data of both Tables (A & B)) 
                    SELECT column(s) FROM tableA LEFT JOIN tableB ON tableA.col_name = tableB.col_name;

        b. RIGHT JOIN - Returns all records from the right table, and the matched records from the left table. (Table "B" whole data & Common data of both Tables (A & B)) 
                    SELECT column(s) FROM tableA RIGHT JOIN tableB ON tableA.col_name = tableB.col_name;

        c. FULL JOIN - Returns all records when there is a match in either left or right table. (All data of both table A & B)
                       use "UNION" Keyword for Full Join BECAUSE there is no "FULL JOIN" or "FULL OUTER JOIN" keyword in MySQL.
                       Syntax:  LEFT JOIN
                                UNION
                                RIGHT JOIN
                        So Syntax:
                            SELECT column(s) FROM tableA LEFT JOIN tableB ON tableA.col_name = tableB.col_name;
                            UNION
                            SELECT column(s) FROM tableA RIGHT JOIN tableB ON tableA.col_name = tableB.col_name;
        d. EXCLUSIVE JOIN: LEFT, RIGHT FULL

    3. Self JOIN - It is a regular join but the table is joined with itself. 
            SELECT column(s) FROM tableA AS a JOIN tableA AS b ON a.col_name = b.col_name;
*/

CREATE TABLE IF NOT EXISTS Student (
    Id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Student (Id, name)
VALUES 
(101,"adam"),
(102,"bob"),
(103,"casey");

CREATE TABLE IF NOT EXISTS Course(
    Course_Id INT PRIMARY KEY,
    Course VARCHAR(50)
);

INSERT INTO Course (Course_Id, course)
VALUES 
(102,"english"),
(105,"math"),
(103,"science"),
(107,"arts");


SELECT * FROM Student;
SELECT * FROM Course;

/*INNER JOIN*/
/*Alias - for alternate name use "AS" keyword.*/
SELECT * 
FROM Student AS s
INNER JOIN Course AS c
ON s.Id = c.Course_Id;

/*LEFT JOIN*/
SELECT * 
FROM Student AS s
LEFT JOIN Course AS c
ON s.Id = c.Course_Id;

/*RIGHT JOIN*/
SELECT * 
FROM Student AS s
RIGHT JOIN Course AS c
ON s.Id = c.Course_Id;

/*FULL JOIN*/
SELECT * 
FROM Student AS s
LEFT JOIN Course AS c
ON s.Id = c.Course_Id
UNION   /**/
SELECT * 
FROM Student AS s
RIGHT JOIN Course AS c
ON s.Id = c.Course_Id;


/*Practice: WAQ to display the right exclusive join.
Right Exclusive Join - right's table data which is not common to left's table data.
*/
SELECT * 
FROM Student AS s
RIGHT JOIN Course AS c
ON s.Id = c.Course_Id
WHERE s.Id IS NULL;

/*LEFT EXCLUSIVE JOIN*/
SELECT * 
FROM Student AS s
LEFT JOIN Course AS c
ON s.Id = c.Course_Id
WHERE c.Course_Id IS NULL;

/*FULL EXCLUSIVE JOIN - no common data / other than common data*/
SELECT * FROM Student AS s
LEFT JOIN Course AS c
ON s.Id = c.Course_Id
WHERE c.Course_Id IS NULL
UNION
SELECT * FROM Student AS s
RIGHT JOIN Course AS c
ON s.Id = c.Course_Id
WHERE s.Id IS NULL;


/*Self JOIN - Table Creation*/
CREATE TABLE IF NOT EXISTS Employee(
    Id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    manager_Id INT
);

INSERT INTO Employee VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

SELECT * FROM Employee;

/*Self JOIN - simple query to test*/
SELECT * FROM Employee AS a JOIN Employee AS b ON a.Id = b.manager_Id;
SELECT a.name, b.name FROM Employee AS a JOIN Employee AS b ON a.Id = b.manager_Id;

/*Self JOIN - main query*/
SELECT a.name AS manager_name, b.name 
FROM Employee AS a
JOIN Employee AS b
ON a.Id = b.manager_Id;


/*
UNION - It is used to combine the result-set of two or more SELECT statements.
        Gives UNIQUE records.
        *don't gives the duplicate values.
        *mostly used for FULL JOIN in MySQL.
    To Use it: 
        *every SELECT should have same no. of columns
        *columns must have similar data types
        *columns in every SELECT should be in same order
    Syntax:
        SELECT column(s) FROM tableA
        UNION
        SELECT column(s) FROM tableB

UNION ALL - gives the duplicate values from both the SELECT statements.
*/
/*UNION*/
SELECT name FROM Employee
UNION
SELECT name FROM Employee;

/*UNION ALL*/
SELECT name FROM Employee
UNION ALL
SELECT name FROM Employee;

/*SQL Sub Queries
    A Subquery or a Nested query or Inner query is a query within another SQL query.
    It involves 2 select statements.
        3 ways to write a query:
            1. write inside SELECT keyword.
            2. write inside FROM keyword.
            3. write inside WHERE keyword. - mostly used
                Syntax:
                    SELECT column(s)
                    FROM table_name
                    WHERE col_name operator
                    ( subquery );
*/
/*Give names of all students who scored more than class average*/
SELECT AVG(marks) FROM Student;
SELECT name FROM Student WHERE marks > (SELECT AVG(marks) FROM Student);    /*Dynamic Query*/

/*Find the names of all students with even roll numbers*/
SELECT rollNo, name FROM Student WHERE rollNo%2 = 0;
SELECT * FROM Student WHERE rollNo IN (2,4,6);
SELECT name FROM Student WHERE rollNo IN (SELECT rollNo from Student WHERE rollNo % 2 = 0); /* with sub-query*/

/*Sub Queries Example  with "FROM"*/
/*Find the max marks from the students of Bundi*/
SELECT * FROM Student WHERE city = "Bundi";

SELECT MAX(marks) FROM Student WHERE city = "Bundi";    /*Direct*/
SELECT MAX(marks) FROM (SELECT * FROM Student WHERE city = "Bundi") AS temp;    /*With Sub-Query  - "temp" because we have to mention table name after "FROM" */

/*Sub Queries Example  with "SELECT" - not frequently use*/
SELECT (SELECT AVG(marks) FROM Student) AS avereage;
SELECT (SELECT AVG(marks) FROM Student), name FROM Student;

/*MySQL Views - A view is a virtual table based on the result-set of an SQL statement.
    *A view always shows up-to-date data. The
    database engine recreates the view, every time a
    user queries it.

    *we can do operation on View normally like a normal table.
    *Doesn't effent on TABLES    
    Syntax:
        CREATE VIEW viewName AS SELECT column(s) FROM tableName;

*/
CREATE VIEW SudentView AS SELECT rollNo, name, marks FROM Student;

SELECT * FROM SudentView;
SELECT * FROM SudentView WHERE marks <= 80;

DROP VIEW SudentView;


SELECT * FROM Teacher;













SELECT * FROM Student;
SELECT * FROM Course;




SET SQL_SAFE_UPDATES = 1;       /*this command avoid updation, 0 = Safe Mode OFF, 1 = Safe Mode ON*/
DROP TABLE Teacher;
DROP DATABASE College;
/**/

Drop DATABASE ApnaCollege;