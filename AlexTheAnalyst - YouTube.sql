-- Beginner
-- 00
DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;



CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');


--------------------------------------------------------------------------------------------------------------------
USE `Parks_and_Recreation`;
/*SELECT query
used to work with columns and specify what columns you want to see in your output*/

SELECT * FROM employee_demographics;
SELECT * FROM Parks_and_Recreation.employee_demographics; -- DatabaseName.TableName if we are outside the database - Best Practice

SELECT first_name, last_name, birth_date
FROM Parks_and_Recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age + 10 -- we use this format to read easy and for calculation etc
FROM Parks_and_Recreation.employee_demographics;

/* PEMDAS - is the order of operations for arithmatic or math within MySQL execution engine
    PEMDAS(Paranthesis, Exponent, Multiplication, Division, Addition, Substraction)
*/

SELECT first_name, 
last_name, 
(age + 10) * 10 + 10  /*PEMDAS*/
FROM Parks_and_Recreation.employee_demographics;

/*DISTINCT:
    select only a Unique values
*/
SELECT gender FROM employee_demographics;

SELECT DISTINCT(gender) 
FROM employee_demographics;

/*WHERE clause:
    used to filter rows of data/records
    specific condition
*/
-- RELATIONAL Operators - =, !=, >, >=, <, <=
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_salary
WHERE salary < 50000;

SELECT *
FROM employee_salary
WHERE salary <= 50000;

SELECT *
FROM employee_demographics
WHERE gender = "Female";

SELECT *
FROM employee_demographics
WHERE gender != "female";

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01";

-- LOGICAL Operators - AND, OR, NOT

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01"
AND gender = "Male";

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01"
OR gender = "Male";

SELECT *
FROM employee_demographics
WHERE birth_date > "1985-01-01"
OR NOT gender = "Male";

SELECT *
FROM employee_demographics
WHERE (first_name = "Leslie"
AND age = 44) OR age > 55;

/*LIKE statement:
    loking for a specific patterns
    it is used with -   % (anything), _ (a single character)
    this signs is used with Strings, date and etc which is written in a double quotes (" ") 
*/
SELECT *
FROM employee_demographics
WHERE first_name = "Jerr";

SELECT *
FROM employee_demographics
WHERE first_name LIKE "%er%";

SELECT *
FROM employee_demographics
WHERE first_name LIKE "a%";

SELECT *
FROM employee_demographics
WHERE first_name LIKE "a__";

SELECT *
FROM employee_demographics
WHERE first_name LIKE "a___%";

SELECT *
FROM employee_demographics
WHERE birth_date LIKE "1989%";

SELECT *
FROM employee_demographics
WHERE birth_date LIKE "198%";

SELECT *
FROM employee_demographics
WHERE birth_date LIKE "199%";

/*GROUP BY:
    used to group the rows that has same values.
    *SELECT satatement column is must match to GROUP BY column, if we are not performing an aggregate function
*/

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;    --group by 2 columns

/**AGGREGATE Function*/
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

/*ORDER BY:
  Sort result-set in Ascendig & Descending order
*/

SELECT *
FROM employee_demographics
ORDER BY first_name ASC;

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM employee_demographics
ORDER BY age;

SELECT *
FROM employee_demographics
ORDER BY gender, age;   -- both column is Ordered

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

SELECT *
FROM employee_demographics
ORDER BY age, gender;   -- "gender" columns is not ordered, because there is no Unique Values

SELECT *
FROM employee_demographics
ORDER BY 5, 4;      -- we can also use column positions. for Quick Query (Not a Best Practice)

/*HAVING v/s WHERE:
*WHERE condition is Not used with AGGREGATE Functions.
whereas
*HAVING condition is used with AGGREGATE Functions After the GROUP BY.

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;        - gives Error
*/

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation;

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation
HAVING AVG(salary) > 75000;

/*LIMIT:-
  Limit records row; / Shows limited rows of data/records
*/

SELECT *
FROM employee_demographics
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;       --parameter , start with row 2 and select next row/rows

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 3;       --parameter , start with row 2 and select next row/rows

/*Aliasing:-
    Change the Alternative name of Column for temporarly
*/

SELECT gender, AVG(age) AS avg_age  -- we can also use without "AS" keyword
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

/*JOINS:
    Joins allow us to combine 2 tables or more together if they have the common column and related data.
    1.INNER JOIN
    2.OUTER JOIN
    3.SELF JOIN
*/

SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;

/*1.INNER JOIN:-
    returns Matched values.
*/

SELECT * 
FROM employee_demographics AS dem
JOIN
employee_salary AS sal 
ON sal.employee_id = dem.employee_id;

--by default simple "JOIN" represents "INNER JOIN", we can write explicitly

SELECT dem.employee_id, age, occupation 
FROM employee_demographics AS dem
JOIN
employee_salary AS sal 
ON sal.employee_id = dem.employee_id;

/*OUTER JOIN
      LEFT OUTER JOIN - returns whole Left table and matched values from Right table.
      RIGHT OUTER JOIN - returns whole Right table and matched values from Left table.
*/

SELECT * 
FROM employee_demographics AS dem
LEFT JOIN
employee_salary AS sal 
ON sal.employee_id = dem.employee_id;

SELECT * 
FROM employee_demographics AS dem
RIGHT JOIN
employee_salary AS sal 
ON sal.employee_id = dem.employee_id;

/*SELF JOIN:- 
    Join table itself.
*/

SELECT emp1.employee_id AS emp_santa, 
emp1.first_name AS first_name_santa, 
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id, 
emp2.first_name AS emp_first_name, 
emp2.last_name AS emp_last_name
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id + 1 = emp2.employee_id;


/*Joining Multiple tables together*/
SELECT dem.first_name , dem.last_name, 
sal.salary, sal.occupation, 
sal.dept_id, pd.department_name
FROM employee_demographics AS dem
INNER JOIN
employee_salary AS sal 
ON sal.employee_id = dem.employee_id
INNER JOIN parks_departments AS pd 
ON sal.dept_id = pd.department_id;

SELECT * FROM parks_departments;

/*UNION:-
    allows us to combine rows together from Same or Separate tables
    by default its UNION DISTINCT
    UNION ALL

*/

SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, "OLD" AS Label
FROM employee_demographics WHERE age > 50


SELECT first_name, last_name, "OLD" AS Label
FROM employee_demographics WHERE age > 50
UNION
SELECT first_name, last_name, "Highly Paid Employee" AS Label
FROM employee_salary WHERE salary > 70000;


SELECT first_name, last_name, "OLD Man" AS Label
FROM employee_demographics WHERE age > 40 AND gender = "Male"
UNION
SELECT first_name, last_name, "OLD Lady" AS Label
FROM employee_demographics WHERE age > 40 AND gender = "Female"
UNION
SELECT first_name, last_name, "Highly Paid Employee" AS Label
FROM employee_salary WHERE salary > 70000
ORDER BY first_name, last_name;

/*STRING Functions
    *built in functions in MySQL
    *that will help us use strings and work with strings

    LENGTH(), UPPER(), LOWER(), TRIM(), LTRIM(), RTRIM(), SUBSTRING(), LEFT(), RIGHT()
*/

/*LENGTH() - returns length of the parameter*/
SELECT LENGTH("SkyFall");

SELECT first_name, LENGTH(first_name) 
FROM employee_demographics 
ORDER BY 2;         --COLUMN Position

/*UPPER() - returns in upper case of the parameter*/
SELECT UPPER("SkyFall");
SELECT first_name, UPPER(first_name) 
FROM employee_demographics;

/*LOWER() - returns in upper case of the parameter*/
SELECT LOWER("SkyFall");
SELECT first_name, LOWER(first_name) 
FROM employee_demographics;

/*TRIM() - Trim the black space from te text both sides(start & end).
LTRIM() - Trim the black space from text Left side.
RTRIM() - Trim the black space from text Right side.
*/
SELECT TRIM("   _     Sky Fall  _   ");
SELECT LTRIM("   _     Sky Fall  _    ");
SELECT RTRIM("   _     Sky Fall  _   ");

SELECT LTRIM("   _     Sky Fall  _   "), 
TRIM("   _     Sky Fall  _   "), 
RTRIM("   _     Sky Fall  _   ");

/*SUBSTRINGS:
LEFT(col_name, no.of_characters to be fetch) - returns Left side characters from a Column Name/String.
Ex:- LEFT(first_name, 4)

RIGHT(col_name, no.of_characters to be fetch) - returns Right side characters from a Column Name/String.
Ex:- RIGHT(first_name, 4)

SUBSTRING(col_name, start_position, no.of_characters) - returns No. of Characters from a Column Name where we mention Start Position.
Ex:- SUBSTRING(birth_date, 6, 2)
*/
SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;

SELECT first_name, RIGHT(first_name, 4)
FROM employee_demographics;

SELECT first_name, SUBSTRING(first_name, 3, 2)
FROM employee_demographics;

SELECT first_name, 
LEFT(first_name, 4), 
RIGHT(first_name, 4), 
SUBSTRING(first_name, 3, 2), 
birth_date
FROM employee_demographics;

SELECT birth_date, 
SUBSTRING(birth_date, 6, 2) AS Month
FROM employee_demographics;


/*REPLACE() - replace char/string with anothe one 
    REPLACE(col_name, Char/String to be replaced, replacing Char/String) is case sensitive
*/

SELECT first_name, REPLACE(first_name,"a","z") FROM employee_demographics;
SELECT first_name, REPLACE(first_name,"ar","zq") FROM employee_demographics;
SELECT first_name, REPLACE(first_name,"ar","z") FROM employee_demographics;

/*LOCATE() - locate position of a CHar/String
    LOCATE(Char/String, col_name/String)
*/
SELECT LOCATE("e","ALEXANDER");
SELECT LOCATE("x","ALEXANDER");
SELECT first_name, LOCATE("an", first_name) FROM employee_demographics;

/*CONCAT() - concat col_fields/Strings together*/
SELECT first_name, last_name, 
CONCAT(first_name, " ", last_name) AS full_name
FROM employee_demographics;


/*CASE statement:
    CASE statemet allows us to add logic in our SELECT statement, 
    it's sort of like If-Else statement
    We can add multiple WHEN statements
*/

SELECT first_name, 
last_name, age,
CASE
    WHEN age <= 30 THEN "Young"
END
FROM employee_demographics;

SELECT first_name, 
last_name, age,
CASE
    WHEN age <= 30 THEN "Young"
    WHEN age BETWEEN 31 AND 50 THEN "Old"
    WHEN age > 50 THEN "Very Old"
END AS age_bracket
FROM employee_demographics;


/*Q. Pay Increase & Bonus
        sal < 50000 = 5% increament
        sal > 50000 = 7% increament
        Finance Department = 10% Bonus
*/

SELECT CONCAT(first_name," ",last_name) AS Full_Name, 
salary,
CASE
    WHEN salary <= 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS Increament,
CASE
    WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;
SELECT * FROM parks_departments;

/*SUBQUERY:
    It is a query within another query.
    Used with 
        WHERE clause
        FROM statement
        SELECT statement
*/

--SUBQUERY with WHERE clause
SELECT * FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id 
    FROM employee_salary 
    WHERE dept_id = 1
    );

--SUBQUERY with SELECT statement
SELECT first_name, salary, 
(SELECT AVG(salary) 
FROM employee_salary)
FROM employee_salary; 

--SUBQUERY with FROM statement -- Q. average of age of maximum age
SELECT gender, AVG(age), 
MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT *
FROM (SELECT gender, AVG(age), 
MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS aggregated_table;

-- back tick( ` ) for the field( MAX(age) is a field itself of the subquery ) of subquery.
SELECT gender, AVG(`MAX(age)`)
FROM (SELECT gender, AVG(age), 
MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS aggregated_table
GROUP BY gender;

-- to ignore back tick we can use Alias name
SELECT AVG(max_age), AVG(min_age)
FROM (SELECT gender, 
    AVG(age) avg_age, 
    MAX(age) max_age, 
    MIN(age) min_age, 
    COUNT(age)
    FROM employee_demographics
    GROUP BY gender) AS aggregated_table;       -- average of age of maximum age



/*Window Functions:
    *Somewhat like a GROUP BY except they don't roll everything up into one row when grouping
    *Windows functions allows to look at a partition or a group but they each keep their 
        own unique rows in the output
    -row numbers, rank, dense rank
*/

--Compare GROUP BY & Windows Function ( OVER() )
SELECT gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;        --GROUP BY:- it rolls everything up into one row

SELECT dem.first_name, dem.last_name, gender, 
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;   /*OVER() :- avg salary for everything / every row, 
                                            and we can add columns in SELECT query whereas in GROUB BY method we can't do this*/
-----------------------------------------------------------------------------------------------------
/*Rolling total: 
    are going to start at specific value and add on values from susequent rows based off of your partition*/

SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;       --SUM salary of all Employees based on gender Partition , Order By Employee ID

SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
SUM(salary) OVER(ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;       --SUM salary of all Employees without gender partition, Order By Employee ID
-----------------------------------------------------------------------------------------------------
/*ROW Number: 
    ROW_NUMBER() OVER() -   return unique row number/records row - for repeat Row Number we do Partition

    RANK() - RANK() is going to give it to more of an official Rank.
                But when it encounters Duplicate value based off of the ORDER BY then it assign same Rank.
                So the next number assign is positionally.
    DENSE_RANK()    -   Same as RANK(), But when it encounters Duplicate value based off of the ORDER BY then it assign same Rank.
                        So the next number assign is numerically.
*/
SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;       --no repeatition row number

SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;       --repeatition row number with Partition gender

SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;       --repeatition row number with Partition gender Order By salary

--RANK()
SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;

--DENSE RANK()
SELECT dem.employee_id, dem.first_name, 
dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;


--------------------------------------Advance MySQL-----------------------------------
-- 01:58:00

/*CTEs - Common Table Expressions:
    *Purpose of the CTE is to be able to perform more advanced calculations something yo can't easily do OR can't do at all within just one query.
    *Readability
    *They are going to allow you to define a subquery block that you can then reference  within the main query.
    *We can name subquery block and it will be a little bit more standardized a little bit better formatted than actually using a subquery
    You can actually create multiple CTEs within just one(Complex Queries) / joining complex queries together
    Use Experience persons in place of Sub-Queries

    it's like temporarily table but not stored in the database

    To Create CTE:
        WITH CTE_Example AS (_______sub query_____) SELECT column(s) FROM CTE_Example;
*/

WITH CTE_Example AS (
    SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT *
FROM CTE_Example;   --all columns are there

WITH CTE_Example AS (
    SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example;       -- average of all rows, average b/w both Females & Males, it's like average of average


SELECT AVG(avg_sal)
FROM (SELECT gender, AVG(salary) avg_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
    GROUP BY gender
) AS example_subquery;      -- above example performed by sub-query


WITH CTE_Example AS (
    SELECT employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > "1985-01-01"
),
CTE_Example2 AS (
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
ON CTE_Example.employee_id = CTE_Example2.employee_id;      --Multiple CTE Tables


WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS (
    SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT *
FROM CTE_Example;       -- at starting "WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS (", this will over-write the column name within our CTE query / this is default column name

/*Temporary Tables: (Temp Table)
    Only visible to the session that they are created in.
    if we created Temp Table in a session and we exited it , when we return, its not available there
    It basically look like a Real Table, except it just lives in memory(RAM)
        we can do DML operations 
        we can reuse this temp table before exited the session
    Use:
        *Storing intermediate results for complex queries, somewhat like a CTE.
        *Using to manipulate data brfore we insert it into a permanent table
        Testing with Database(store procedures, manipulating data, complex queries)
    2 Methods to create Temp Table
*/
--Method 1 to Create Temporary table
CREATE TEMPORARY TABLE temp_table (
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    favorite_mobie VARCHAR(100)
);

SELECT * FROM temp_table;

INSERT INTO temp_table
VALUES("ALEX","Freberg","Lord of the rings: The Two Towers");

SELECT * FROM employee_salary;

--Method 2 to Create Temporary table
CREATE TEMPORARY TABLE salary_over_50k_temp
    SELECT * 
    FROM employee_salary
    WHERE salary >= 50000;      --Create Conditional Temp table 

SELECT * FROM salary_over_50k_temp;


-- 02:16:42
/*Stored Procedures:
    *Is used to save our SQL code that can reuse it.
    *When you save it, you can call that store preocedures and it's going to execute all the code 
        that you wrote within your store procedure.
    *It's really helpful for storing complex queries, simplifying repetitive code, and just enhancing
         performance overall.
*/
CREATE PROCEDURE large_salaries()
    SELECT * 
    FROM employee_salary
    WHERE salary >= 50000;

--reuse Procedure
CALL large_salaries();
CALL Parks_and_Recreation.large_salaries();

/*DELIMITER:
    by default semicolon ( ; ) is De-limiter, but we can use "DELIMITER $$" OR "DELIMITER //" keyword to avoid semicolon ( ; )

    its like script.
*/

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
    SELECT * 
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT * 
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;         -- execute in XAMM SERVER

CALL large_salaries2();     -- execute in XAMM SERVER. There two Tables Displayed/Retrieved


USE `Parks_and_Recreation`;
/*PARAMETERS:
    parameters are variables that are passed as input into a store procedure
    parameter when we call procedure/function & argument when we define function defination.
*/
-- 02:25:00

DELIMITER $$
CREATE PROCEDURE large_salaries4(emp_id INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = emp_id;
END $$
DELIMITER ;         -- execute in XAMM SERVER

CALL large_salaries4(1);
SELECT * FROM employee_salary;

DROP PROCEDURE IF EXISTS large_salary;

/*Triggers:-
    Automatic revoke when an event takes place. / Trigger happens when an event takes place.
    *It is a block of code that executes automatically when an event takes place on a specific table.


DELIMITER :- In MySQL , a "delimiter" is a special character or sequeunce of characters used to signal the end of a statement. 
The default delimiter is the semicolon(";"), but it can be using the "DELIMITER" command. This is particularly useful 
when defining complex statements like Stored Procedures or Triggers, which may contain multiple semicolons within their body.

By redefining the delimiter(e.g: "$$" or "//"), you can encapsulate multiple SQL commands within a single execution block.
*/
--02:28:50

--Practice whenever the employee_salary table is inserted a record then it automatically inserts record in employee_demographics table

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
    AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
        INSERT INTO employee_demographics (employee_id, first_name, last_name) 
        VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;         -- execute in XAMM SERVER

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13,"Jean-Ralphio", "Saperstien", "Entertainment 720 CEO", "100000", NULL);


/*EVENT:-
    *An Event takes place when it's scheduled.
    *So this is more of a scheduled automator.


( CREATE EVENT monthly_delete_invoices
ON SCHEDULE AT "2024-11--11" )

OR

( CREATE EVENT monthly_delete_invoices
ON SCHEDULE EVERY 1 MONTH STARTS "2024-10-10" ENDS "2024-12-10" )

Eg 1- Create EVENT;
DELIMITER $$
CREATE EVENT IF NOT EXISTS monthly_delete_invoices
ON SCHEDULE EVERY 1 MONTH STARTS "2024-10-10" ENDS "2024-12-10"
DO BEGIN
    DELETE FROM Invoices WHERE amount < 2000;
END $$
DELIMITER;

Eg 2- Change/Modify/Update EVENT;
DELIMITER $$
ALTER EVENT IF EXISTS monthly_delete_invoices
ON SCHEDULE EVERY 1 MONTH STARTS "2024-10-10" ENDS "2024-12-10"
DO BEGIN
    DELETE FROM Invoices WHERE amount < 2000;
END $$
DELIMITER;
*/

--Q.Remove record where employee age is 60 because he/she is retired
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DELETE 
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES;
SHOW VARIABLES LIKE "event%";
 
SELECT *
FROM employee_demographics;

SHOW DATABASES;

/*DATA CLEANING:
    data clwanig of raw data
    useable format
    fix lot of issues in RAW data.
    visualization
02:42:40
*/
CREATE DATABASE world_layoffs;

USE world_layoffs;

ALTER TABLE `layoffs` CHANGE `total_laid_off` `total_laid_off` INT(5) NULL DEFAULT NULL;

ALTER TABLE `layoffs` CHANGE `funds_raised_millions` `funds_raised_millions` INT(6) NULL DEFAULT NULL;

SELECT * FROM layoffs;

--1. Remove duplicates
--2. Standardize the data(spellings, repeate)
--3. Look at the NULL values or Blank values (populate)
--4. Remove unnecessary Columns / Rows

-- Create Duplicate table of RAW data-set   -   Best Practice
CREATE TABLE IF NOT EXISTS layoffs_staging LIKE layoffs;

SELECT * FROM layoffs_staging;

INSERT layoffs_staging SELECT * FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

--1. Remove duplicates
WITH duplicate_cte AS (
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, industry, 
    total_laid_off, percentage_laid_off, `date`, 
    stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * FROM duplicate_cte
WHERE row_num > 1;

SELECT * FROM layoffs_staging
WHERE company = "Oda";

SELECT * FROM layoffs_staging
WHERE company = "Casper";

-- 02:57:00

DESC layoffs_staging;

Create new table with 
CREATE TABLE IF NOT EXISTS layoffs_staging2 (
    `company` varchar(29),
    `location` varchar(16),
    `industry` varchar(15),
    `total_laid_off` INT DEFAULT NULL,
    `percentage_laid_off` varchar(5),
    `date` varchar(10),
    `stage` varchar(14),
    `country` varchar(20),
    `funds_raised_millions` INT DEFAULT NULL,
    `row_num` INT
);

DESC layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, industry, 
    total_laid_off, percentage_laid_off, `date`, 
    stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE row_num > 1;

-- 02:59:00
DELETE FROM layoffs_staging2
WHERE row_num > 1;

--2. Standardizing Data -  finding issues in your data and then fixing it.

SELECT * FROM layoffs_staging2;

-- company name extra spaces
SELECT DISTINCT(company), company
FROM layoffs_staging2;

SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- Industry column
USE world_layoffs;

SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY industry;

SELECT * 
FROM layoffs_staging2
WHERE industry LIKE "crypto%";

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE "crypto%";

-- location
SELECT DISTINCT(location)
FROM layoffs_staging2
ORDER BY location;

-- country
SELECT DISTINCT(country)
FROM layoffs_staging2
ORDER BY country LIMIT 100;

SELECT *
FROM layoffs_staging2
WHERE country LIKE "United States%"
ORDER BY country LIMIT 2000;

-- TRAILING : which means comming at the end
SELECT DISTINCT(country), TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE "United States%";

SELECT * 
FROM layoffs_staging2;

-- date column - if a column name has same name as keyword then we use back tick ( ` )
SELECT `date`
FROM layoffs_staging2;

-- STR_TO_DATE(`date`, format)  ,   Capital (Y) is used for 4 digits for year or last 2 digits "% Y", and small (m and d) is good.
SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


--3. Look at the NULL values or Blank values (populate)
-- 03:16:00
USE world_layoffs;
SELECT * FROM layoffs_staging2;
SELECT * 
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = '';


SELECT * 
FROM layoffs_staging2
WHERE company = "Airbnb";

SELECT t1.company, t1.industry, t2.industry, t1.location, t2.location
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE (t1.industry = '' OR t1.industry IS NULL)
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT * 
FROM layoffs_staging2
WHERE company = "Bally%";   -- we can't do anything about this

--4. Remove unnecessary Columns / Rows
SELECT * FROM layoffs_staging2
WHERE total_laid_off = 0
AND percentage_laid_off = '';   -- delete data that has nothing to do. No Use of Data

DELETE FROM layoffs_staging2
WHERE total_laid_off = 0
AND percentage_laid_off = '';

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-------------------------------------------------------------NOW DATA is CLEANED----------------------------------------------------------


-- Exploratory Data Analysis
SELECT * FROM layoffs_staging2;
SELECT MAX(total_laid_off), MAX(percentage_laid_off) FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT `date`, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY `date`
ORDER BY 2 DESC;

SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, SUM(percentage_laid_off) 
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, SUM(percentage_laid_off), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, AVG(percentage_laid_off), AVG(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;        --this does't help us that much

SELECT industry, AVG(percentage_laid_off), AVG(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;        --this does't help us that much



-- Progression of Layoffs / Rolling Sum

SELECT SUBSTRING(`date`, 6, 2) AS Month,
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Month;

SELECT SUBSTRING(`date`, 1, 7) AS Month,
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Month
ORDER BY Month;

SELECT * 
FROM layoffs_staging2
WHERE `date` IS NULL;


-- Month is a temporary column, so this is not used in WHERE clause ERROR: Unknown column 'Month' in 'where clause'
--CTE
WITH Rolling_Total AS (
    SELECT SUBSTRING(`date`, 1, 7) AS Month,
    SUM(total_laid_off) AS total_laid
    FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY Month
    ORDER BY Month
)
SELECT Month, total_laid,
 SUM(total_laid) OVER(ORDER BY Month) AS rolling_total
FROM Rolling_Total;


SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH Company_Year (Company, Years, Total_Laid) AS (
    SELECT company, YEAR(`date`), SUM(total_laid_off)
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
    ORDER BY 3 DESC
)
SELECT *, DENSE_RANK() OVER(PARTITION BY Years ORDER BY Total_Laid DESC) AS Ranking
 FROM Company_Year
 WHERE Years IS NOT NULL
 ORDER BY Ranking;

WITH Company_Year (Company, Years, Total_Laid) AS (
    SELECT company, YEAR(`date`), SUM(total_laid_off)
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
    ORDER BY 3 DESC
), Company_Year_Rank AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY Years ORDER BY Total_Laid DESC) AS Ranking
    FROM Company_Year
    WHERE Years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;


