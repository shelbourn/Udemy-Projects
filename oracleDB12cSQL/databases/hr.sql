-- Select Statement
SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM employees;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY+100, SALARY+(SALARY*0.10)
FROM employees;

SELECT LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM employees;

SELECT LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT, COMMISSION_PCT+10
FROM employees;

-- Aliases
SELECT LAST_NAME, LAST_NAME AS name, LAST_NAME lname, LAST_NAME "LAST name"
FROM employees;

-- Concatenation
SELECT FIRST_NAME, LAST_NAME, FIRST_NAME||LAST_NAME "full name",
FIRST_NAME||' '||LAST_NAME "full name with space"
FROM employees;

SELECT FIRST_NAME ||' works in department '|| DEPARTMENT_ID "Employee Department"
FROM employees;

--BEST PRACTICE
SELECT FIRST_NAME || q'( work's in department )'|| DEPARTMENT_ID "Employee Department"
FROM employees;

-- Distinct Operator (Shows only rows that are unique)
SELECT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

-- Distinct Operator with Multiple Columns
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES;

-- Describe Operator
-- Describe displays the structure of a table
DESCRIBE EMPLOYEES;

DESC EMPLOYEES;

-- Restricting data retrieval with WHERE clause
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90;

SELECT *
FROM EMPLOYEES
WHERE SALARY=24000;

/* NOTES on WHERE CLAUSE: 
1.) Character strings and date values are enclosed within single quotation marks.
2.) Character values are case-sensitive and date values are format-sensitive.
3.) The default date display format is DD-MON-RR.
*/

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME='Steven';

-- This won't work because character strings in where clause are case-sensitive
-- Data inside the table are case-sensitive
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME='steven';

-- Using date values in the WHERE clause
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE='17-OCT-03';

-- Using Comparison Operators
SELECT * FROM EMPLOYEES
WHERE SALARY >= 10000;

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE > '17-OCT-03';

-- Comparison operators with character strings use ASCII code
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME > 'Alberto';

-- Comparison with sorting using ORDER BY clause
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME > 'Alberto'
ORDER BY FIRST_NAME;

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME < 'Alberto'
ORDER BY FIRST_NAME;

/* For more information about character strings using comparison operators go to:
https://docs.oracle.com/cd/B12037_01/server.101/b10759/sql_elements002.htm
*/

-- Using the BETWEEN AND Operator
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000 -- Always put the lower limit first
ORDER BY FIRST_NAME;

SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 20000 AND 10000; -- No result when the higher limit is first

-- You can use operators with VARCHAR columns also
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'C'
ORDER BY FIRST_NAME;

/* There are employees with first names that start with 'C' but they do not show up
in the previous BETWEEN query because they are greater than just the character 'C'.
If you wanted to include all the employees with first names that start with 'C'
the query would look like this:

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'D'
ORDER BY FIRST_NAME;
*/
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME;

-- Includes employees with first names that begin with 'C'
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'A' AND 'D'
ORDER BY FIRST_NAME;

-- Using the IN operator (OR for values)
SELECT * FROM EMPLOYEES
WHERE SALARY IN (10000, 25000, 17000); -- The order of the values is not important

/* Using the LIKE operator. Usually used with _ or %
_ means one character
% means zero or more characters
*/

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%'; -- All first names that start with 'S'

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%s'; -- All first names that end with 's'

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%am%'; -- All first names that include 'am'

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_d%'; -- All first names where the second character is a 'd'

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__s%'; -- All first names where the third character is an 's'

-- Now suppose there is a value in any column containing _ or % (i.e. job_id)
-- Then there must be a special way to search for these characters

-- Incorrect method for searching
SELECT JOB_ID
FROM JOBS
WHERE JOB_ID LIKE 'SA_%'; -- This would include 'SAP cons' which has a space when we are only looking for jobs that start with 'SA_'

-- Correct method of searching
SELECT JOB_ID
FROM JOBS
WHERE JOB_ID LIKE 'SA/_%' escape '/'; -- The '/' escapes the character that follows it

-- Another example: Suppose we have a job_id called MANA%GER
-- And we need to pick all the JOB_ID that have the '%' character
SELECT JOB_ID
FROM JOBS
WHERE JOB_ID LIKE '%/%%' escape '/'; -- Retrieves all JOB_ID that include the character '%'

-- Using the IS NULL operator
SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;

-- Select employees who do not receive commission
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- Incorrect useage
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT=NULL;

-- Using NOT Operater
-- Can also use NOT IN, NOT LIKE, IS NOT NULL, NOT BETWEEN AND

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT IN (100, 101);

SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'S%'; -- All employees who's names do not begin with the letter 'S'

-- Using the NOT EQUAL operator
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 50;

-- Above is the same as...
select *
from employees
where department_id != 50;

-- Using logical operators (AND, OR, NOT)
-- Defining conditions using the logical operators (AND, OR, NOT)
-- The AND operator requires that both arguements are TRUE
select employee_id, last_name, job_id, department_id
from employees
where salary >= 10000
and department_id = 90
order by last_name;

-- The OR operator requires that either arguement be TRUE
select employee_id, last_name, job_id, department_id
from employees
where salary >= 10000
or department_id = 90
order by last_name;

-- Another example using multiple AND operators
select employee_id, last_name, job_id, salary, department_id, commission_pct
from employees
where salary > 2000
and department_id in (60, 90)
and commission_pct is null
order by last_name;

-- IMPORTANT
-- SQL execution with logical operators has priorities
-- AND takes precedence over OR
-- In this statement 'JOB_ID = 'AD_PRES' AND SALARY > 15000' will execute first
select last_name , job_id, salary
from employees
where job_id = 'SA_REP' -- First condition
or job_id = 'AD_PRES' and salary > 15000 -- Second condition
order by last_name;

-- The query above is the same as this...
select last_name, job_id, salary
from employees
where job_id = 'SA_REP'
or (job_id = 'AD_PRES' and salary > 15000)
order by last_name;

/* RULES OF PRECEDENCE

1.) Arithmetic Operators
2.) Concatenation Operator
3.) Comparison conditions
4.) IS [NOT] NULL, LIKE, [NOT] IN
5.) [NOT] BETWEEN
6.) Not equal to
7.) NOT logical operator
8.) AND logical operator
9.) OR logical operator

You can use parenthesis () or brackets [] to override rules of precedence
*/

-- When you use parenthesis you can override any priorities
select last_name, job_id, salary
from employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES') -- First condition
and salary > 15000 -- Second condition
order by last_name;

-- BEST PRACTICE IS TO USE PARENS FOR CONDITIONS

-- Using the ORDER BY clause
select * from employees
order by hire_date; -- The default order is always ASC (ascending)

select * from employees
order by hire_date ASC; -- Same as above. No need to put ASC because the default is always ASC

-- ORDER BY descending
select * from employees
order by hire_date desc;

-- Using WHERE and ORDER BY
