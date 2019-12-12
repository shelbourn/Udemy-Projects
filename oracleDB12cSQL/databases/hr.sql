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
select * from employees
where department_id = 90
order by employee_id;

-- NULL values in ORDER BY ** IMPORTANT **
select * from employees
order by commission_pct; -- NULL values come last by default in ascending order

select * from employees
order by commission_pct desc; -- NULL values come first by default in descending order

-- NULLS FIRST makes NULLS appear first, then the remainder of the results ordered in ascending order by default
select * from employees
order by commission_pct nulls first;

-- You can use ORDER BY using aliases as well
select first_name n -- n given as alias to FIRST_NAME
from employees
order by n;

-- Ordering by expressions
select employee_id, salary, salary + 100
from employees
order by salary + 100;

-- Can order by columns not in the SELECT statement
select employee_id, salary
from employees
order by department_id; -- but this is not logical and not recommended.

-- Can order by more than one column
select department_id, first_name, salary
from employees
order by department_id, first_name; -- orders first by department_id and then by first_name

select department_id, first_name, salary
from employees
order by department_id asc, first_name desc;

-- Can order by the column number as it appears in the SELECT statement
select department_id, first_name, salary
from employees
order by 1; -- refers to the first column named in the SELECT statement (DEPARTMENT_ID)

select department_id, first_name, salary
from employees
order by 1, 3; -- Order by column 1 and then by column 3

-- Using the FETCH clause (Used for top-end queries i.e. top 3 sales people)
-- Using SQL row limition clause in query
select employee_id, first_name
from employees
order by employee_id;

select employee_id, first_name
from employees
order by employee_id
fetch first 5 rows only;

select employee_id, first_name
from employees
order by employee_id
fetch first 50 percent rows only;

select employee_id, first_name
from employees
order by employee_id
offset 5 rows fetch next 5 rows only;

select employee_id, first_name
from employees
order by employee_id
offset 4 rows fetch next 50 percent rows only;

-- Using TIES with FETCH
select employee_id, first_name, salary
from employees
order by salary desc;

select employee_id, first_name, salary
from employees
order by salary desc
fetch first 2 rows only; -- Even though record 2 and 3 both have the same salary, this query will only retrieve the first two records

select employee_id, first_name, salary
from employees
order by salary desc
fetch first 2 rows with ties; -- Includes both records that have the same salary

-- Using substitution variables
/*
Use substitution variables to:
Temporarily store values with single ampersand (&) and double ampersand (&&) substitution
Use substitution variables to supplement the following:
WHERE conditions
ORDER BY clauses
Column expressions
Table names
Entire SELECT statments
*/

select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num; -- When using the single (&) the variable will be discarded after it is used

-- Using (&) with VARCHAR
select employee_id, first_name, last_name, salary, department_id
from employees
where first_name = '&ename' -- FIRST_NAME tied to variable 'ename'. STRINGS ARE CASE-SENSITIVE!!!
order by 2;

-- The query above is the same as this...
select employee_id, first_name, last_name, salary, department_id
from employees
where first_name = &ename -- With no sing quote marks now you have to include the quotes in the SQL prompt window
order by 2;

-- Specifying Column Name, Expressions, and Text
-- &column_name = salary :: &condition = salary > 10000 :: &order_column = employee_id
select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

-- DEFINE / UNDEFINE statements
/*
Use the DEFINE command to create and assign a value to a variable.
Use the UNDEFINE command to remove a variable.
DEFINE assigns a value to a variable for the ENTIRE SESSION, unlike the (&) which is destroyed immediately after execution.
*/

define employee_num = 200; -- This variable is valid for the current session only

select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num;

undefine employee_num; -- Deletes variable 'employee_num'

-- ACCEPT / PROMPT commands and alteration
-- You can change the prompt message as follows
-- ACCEPT / PROMPT commands should be executed with the SELECT statement together.
accept dept_id prompt 'Please enter the department ID'; -- 'dept_id' is the variable and the PROMPT is the message that pops up
select * from employees
where department_id = &dept_id;

undefine dept_id -- Deletes the dept_id variable

accept emp_from prompt 'Please enter the starting employee number.';
accept emp_to prompt 'Please enter the ending employee number.';
select * from employees
where employee_id between &emp_from and &emp_to;

undefine emp_from
undefine emp_to

--Double ampersand / SET VERIFY / SET DEFINE
-- The double ampersand defines the variable and assigns it at the same time, and it can be re-used.
select * from departments where department_id = &&p;

undefine p; -- && variable remains until the end of the session

select employee_id, last_name, job_id, &&column_name -- this defines the column name
from employees
order by &column_name;

undefine column_name;

/*
Use the VERIFY command to toggle the display of the substitution variable,
both before and after SQL Developer replaces substitution variables with values.
*/

-- The VERIFY command should be executed with the SELECT statement
-- VERIFY shows the old output and the new output in the SCRIPT OUTPUT tab
set verify on
select employee_id, last_name, salary
from employees
where employee_id = &e_num;

-- Using SET DEFINE OFF
-- Use to prevent Oracle server from displaying the prompt window for specific responses
select * from departments
where department_name like '%&t%'; -- Here we are trying to retrieve records that have the '&' in the name, but Oracle see '&' as a variable.

set define off; -- Disables the '&' character for indicating a variable

select * from departments
where department_name like '%&t%';

-- Functions
-- Single-row functions return one result per row
-- Multiple-row functions return one result per set of rows

/*
Character Functions
1.) Case conversion functions
2.) Character manipulation functions
*/

--  Case conversion functions (UPPER, LOWER, INITCAP)
select employee_id, first_name, upper (first_name), lower (first_name), initcap (first_name)
from employees;

-- Single row functions can be used with the SELECT, WHERE, and ORDER BY clauses.

select employee_id, first_name, upper (first_name), lower (first_name), initcap (first_name)
from employees
where upper (first_name) = 'PATRICK';

select employee_id, first_name, upper (first_name), lower (first_name), initcap (first_name)
from employees
where upper (first_name) = upper ('patrick')
order by upper (first_name);

-- Character Manipulation Functions (CONCAT, SUBSTR, LENGTH)
-- CONCAT function (Equivalent to concatentation operator [||])
-- CONCAT function can only take two arguements (arguement 1, arguement 2)
-- The CONCAT operator (||) is more flexible because it can take more than 2 arguements
select employee_id, upper (first_name), last_name, upper (concat(first_name, last_name))
from employees;

select employee_id, first_name, last_name, first_name || ' ' || last_name || ' ' || salary "Full Name with Salary"
from employees;

-- SUBSTR (sub-string) function
-- Can take 3 arguements (column/expression, m, n)
-- m is the starting position, n is the number of character for the sub-string
select employee_id,
first_name,
substr (first_name, 1, 3),
substr (first_name, 2, 4),
substr (first_name, 2), -- without the n value the sub-string will stop at the end of the string
substr (first_name, -3) -- with a negative value the sub-string will start from the end of the string
from employees;

-- LENGTH function
-- Returns the length of an expression, value, or string
select first_name, length (first_name)
from employees;

-- Character Manupulation Functions (INSTR)
-- Takes 3 arguements
-- instr (column/expression, m, n)
-- m is the starting search positions, n is the occurrence
-- 1 is the default for m and n
-- n refers to the occurrence of the searched for string. (2nd occurrence of 'E', etc)
-- INSTR stands for 'IN STRING'
-- INSTR can be more than 1 character

/*
INSTR returns the numeric position of a named string.
Optionally, you can provide a position m to start searching,
and the occurrence n of the string. m and n default to 1,
meaning the search starts at the beginning of the string
and reports the first occurrence.
*/

select first_name,
instr (first_name, 'e'),
instr (first_name, 'e', 2),
instr (first_name, 'e', 5),
instr (first_name, 'e', 1, 2)
from employees
where first_name = 'Nanette';

-- Character Manipulation functions (LPAD, RPAD, REPLACE, TRIM)
-- LPAD & RPAD return an expression left-padded or right-padded to a length of n characters
select employee_id, first_name, salary, lpad (salary, 10, '&'), rpad (salary, 10, '*')
from employees;

/*
The above query will return the salary of each employee extended to 10 characters.
With the LPAD, the left side of the the salary will be filled in with '#'
to 10 characters if the salary is less than 10 characters.
With the RPAD, the right side of the salary will be filled with '*'
to 10 characters if the salary is less than 10 characters.
*/

-- REPLACE function
-- Searches a text expression for a character string and, if found,
-- replaces it with a specified replacement string
select employee_id, first_name, replace (first_name, 'a', '*'), replace (first_name, 'en', '#')
from employees;

/*
The above query replaces 'a' with '*' and 'en' with '#'
*/

-- TRIM function
-- DUAL is a public table that you can use to view the results from functions and calculations
select * from dual;

select 1+1+3 from dual;

select 1+5 from employees;

-- TRIM syntax:
-- TRIM ( [ [ LEADING | TRAILING | BOTH ] trim_character FROM ] string1 )
-- If LEADING or TRAILING is not used then the default will be to trim from beginning and end
-- TRIM cannot remove any characters from the middle of a string
select trim (' ' from ' khaled khudari ') V from dual;

select trim (leading ' ' from ' khaled khudari ') V from dual; -- removes the leading ' '

select trim (trailing ' ' from ' khaled khudari ') V from dual; -- removes the trailing ' '

select trim (both ' ' from ' khaled khudari ') V from dual; -- removes both ' ' from the string.

select trim ('k' from 'khaled khudari') V from dual;

select trim (leading 'k' from 'khaled khudari') V from dual;

select trim (trailing 'k' from 'khaled khudari') V from dual;

select trim ('  khaled khudari  ') V from dual; -- If no character is specified to be trimmed then spaces will be removed by default.

select trim (leading 'M' from 'Matthew Shelbourn') from dual; -- Characters are CASE SENSITIVE 'm' will not work in this case

-- Number Functions (ROUND, TRUNC, MOD)
-- ROUND: Rounds value to specified decimal place
-- TRUNC: Truncates value to a specified decimal value
-- MOD: (Modulus) Returns remaineder of division of two numbers
select round (10.5) from dual; -- If no rounding decimal value is given then it will round to the nearest whole number

select round (150.49) from dual;

select round (10.48, 1) from dual; -- Rounds to one digit after decimal (10s place)

select round (10.499, 1) from dual; -- 10.5

select round (10.499, 2) from dual; -- 10.50

select round (10.493, 2) from dual;

select round (55.993, 1) from dual;

select round (55.993, -1) from dual; -- Negative values round numbers to the left of the decimal place

select round (55.493, -2) from dual; -- 55 rounded up equals 100

select round (555.493, -2) from dual;

select round (570.493, -3) from dual;

select round (470.493, -3) from dual;

select round (1470.493, -2) from dual;

-- TRUNC functions
-- To the left of the decimal place TRUNC turns digits into zeroes
-- To the right of the decimal place TRUNC deletes all digits after the specified parameter
select trunc (10.6565) from dual; -- With no parameters all decimals are truncated

select trunc (10.6565, 2) from dual; -- Truncates the two decimals after the first two digits to the right of the decimal place

select trunc (9998.6565, -2) from dual; -- Truncates (turns to zeroes) the digits two places to the left of the decimal place

select trunc (998.6565, -3) from dual;

-- MOD Functions
-- Modulus: Returns the remainder of dividing two numbers
select mod (15, 2) from dual; -- 15/2 = 7 with a remainder of 1

select mod (15, 3) from dual; -- 15/3 =5 with a remainder of 0

-- the MOD function is often used to know if a number is odd or even by dividing by 2

select mod (100, 2) from dual; -- If MOD returns 0 then the number is even

select mod (101, 2) from dual; -- If MOD returns 1 then the number is odd

