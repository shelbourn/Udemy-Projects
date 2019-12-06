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
