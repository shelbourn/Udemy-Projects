-----------------------------------------------

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
---------------------------------------------------

-- Aliases
SELECT LAST_NAME, LAST_NAME AS name, LAST_NAME lname, LAST_NAME "LAST name"
FROM employees;
---------------------------------------------------

-- Concatenation
SELECT FIRST_NAME, LAST_NAME, FIRST_NAME||LAST_NAME "full name",
FIRST_NAME||' '||LAST_NAME "full name with space"
FROM employees;

SELECT FIRST_NAME ||' works in department '|| DEPARTMENT_ID "Employee Department"
FROM employees;

--BEST PRACTICE
SELECT FIRST_NAME || q'( work's in department )'|| DEPARTMENT_ID "Employee Department"
FROM employees;
---------------------------------------------------

-- Distinct Operator (Shows only rows that are unique)
SELECT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

-- Distinct Operator with Multiple Columns
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES;
----------------------------------------------

-- Describe Operator
-- Describe displays the structure of a table
DESCRIBE EMPLOYEES;

DESC EMPLOYEES;
----------------------------------------------

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
-------------------------------------------

-- Using date values in the WHERE clause
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE='17-OCT-03';
----------------------------------------------

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
--------------------------------------------------

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
-----------------------------------------------

-- Using the IN operator (OR for values)
SELECT * FROM EMPLOYEES
WHERE SALARY IN (10000, 25000, 17000); -- The order of the values is not important
------------------------------------------------

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
-----------------------------------------------

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
-------------------------------------------------

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
--------------------------------------------------

-- Using the NOT EQUAL operator
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 50;

-- Above is the same as...
select *
from employees
where department_id != 50;
---------------------------------------------

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
-------------------------------------------

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
------------------------------------------------

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
---------------------------------------------------

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
----------------------------------------------------

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
------------------------------------------------

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
--------------------------------------------------

-- Specifying Column Name, Expressions, and Text
-- &column_name = salary :: &condition = salary > 10000 :: &order_column = employee_id
select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;
-------------------------------------------------

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
-----------------------------------------------------

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
------------------------------------------------

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
-----------------------------------------------

-- Functions
-- Single-row functions return one result per row
-- Multiple-row functions return one result per set of rows

/*
Character Functions
1.) Case conversion functions
2.) Character manipulation functions
*/
---------------------------------------------

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
----------------------------------------------

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
-----------------------------------------------

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
------------------------------------------------

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
-------------------------------------------

-- REPLACE function
-- Searches a text expression for a character string and, if found,
-- replaces it with a specified replacement string
select employee_id, first_name, replace (first_name, 'a', '*'), replace (first_name, 'en', '#')
from employees;

/*
The above query replaces 'a' with '*' and 'en' with '#'
*/
--------------------------------------------------

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
--------------------------------------------------

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
-------------------------------------------

-- TRUNC functions
-- To the left of the decimal place TRUNC turns digits into zeroes
-- To the right of the decimal place TRUNC deletes all digits after the specified parameter
select trunc (10.6565) from dual; -- With no parameters all decimals are truncated

select trunc (10.6565, 2) from dual; -- Truncates the two decimals after the first two digits to the right of the decimal place

select trunc (9998.6565, -2) from dual; -- Truncates (turns to zeroes) the digits two places to the left of the decimal place

select trunc (998.6565, -3) from dual;
-----------------------------------------

-- MOD Functions
-- Modulus: Returns the remainder of dividing two numbers
select mod (15, 2) from dual; -- 15/2 = 7 with a remainder of 1

select mod (15, 3) from dual; -- 15/3 =5 with a remainder of 0

-- the MOD function is often used to know if a number is odd or even by dividing by 2

select mod (100, 2) from dual; -- If MOD returns 0 then the number is even

select mod (101, 2) from dual; -- If MOD returns 1 then the number is odd
----------------------------------------------

-- Date Functions (SYSDATE)
-- Default date forat is DD-MM-RR(YEAR)

/*
Date + Number = Date
Date - Number = Date
Date - Date = Number of Days
Date + Number/24 = Date
*/

select first_name, hire_date
from employees;

/* Notes on year (RR) format
In general, if the value is between 50-99 returns 19xx format
A value between 0-49 will return in 20xx format
*/

-- What is SYSDATE
-- SYSDATE is a function that returns the current database server's date and time
select sysdate from dual;

-- Using arithmetic operators with dates
-- Date + Number = Date

select sysdate, sysdate + 3 from dual; -- adding days

-- Date - Number = Date

select sysdate, sysdate - 3 from dual; -- subtracting days

-- Data - Date = Number of Days

select employee_id, sysdate, hire_date, sysdate - hire_date, round (sysdate - hire_date), round ((sysdate - hire_date) / 365) years
from employees
order by years desc;

-- Date + Number/24 = Adding number of hours to a date

select sysdate + 5/24 from dual; -- Adding 5 hours to current server time

-- Example 1: We need to know how many weeks the employee 'Adam' has worked so far

select employee_id, first_name, sysdate - hire_date "Number of Days", round ((sysdate - hire_date) / 7) "Number of Weeks"
from employees
where first_name = 'Adam';
--------------------------------------------------

-- Date Functions (MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY)

-- MONTHS_BETWEEN Function
-- MONTHS_BETWEEN is more accurate than number of days divided by 30
-- Always put the larger number first in the MONTHS_BETWEEN parameters

select employee_id, first_name, months_between (sysdate, hire_date), (sysdate - hire_date) / 30
from employees;

-- NOTE: If date 1 is less than date 2 then the result will be negative
select employee_id, first_name, months_between (hire_date, sysdate)
from employees;

-- ADD_MONTHS Function
-- 1st parameter is date to add months to
-- 2nd parameter is the number of months to add

select employee_id, first_name, hire_date, add_months (hire_date, 4)
from employees;

-- Negative number for parameter subtracts months from date
select employee_id, first_name, hire_date, add_months (hire_date, -2)
from employees;

-- NEXT_DAY Function
-- Takes 2 parameters
-- 1st parameter: Valid date
-- 2nd parameter: Valid day of the week

select sysdate, next_day (sysdate, 'friday') from dual;
-- The above query retrieves the date of the next Friday from the SYSDATE

-- Days can also be referred to by number of the week
-- 1 = Sunday
-- 7 = Saturday
-- NLS_DATE_LANGUAGE
select sysdate, next_day (sysdate, 1) from dual;

-- LAST_DAY Function
-- This selects the last date of the month based on a given date

select last_day (sysdate) from dual;

-- *** GOOD EXAMPLE ***

/*
Display the employee number, first name, hire date, number of months employeed,
six month review date, first Friday after hire date,
for all employees who have been employeed for fewer than 150 months
*/

select employee_id, first_name, hire_date, add_months (hire_date, 6) "Review Date",
months_between (sysdate, hire_date) "Months Employed", next_day (hire_date, 'friday')
from employees
where months_between (sysdate, hire_date) < 150;
-------------------------------------------------

-- Date Functions (ROUND, TRUNC)

/*
The ROUND and TRUNC functions can be used for number and date values. When used with
dates, these functions round or truncate to the specified format model. Therefore, you can
round dates to the nearest year or month. If the format model is month, dates 1-15 result in
the first day of the current month. Dates 16-31 result in the first day of the next month. If the
format model is year, months 1-6 result in January 1 of the current year. Months 7-12 result in
January 1 of the next year.
*/

-- ROUND functions for dates formatted by month reset the date to the first day of the month for the 15th
-- day or earlier and to the first day of the following month for the 16th day or later
-- TRUNC function for dates formatted by month resets the day of the month to the first day of the month

select employee_id,
first_name,
hire_date,
round (hire_date, 'month'), trunc (hire_date, 'month')
from employees
order by hire_date;

-- ROUND functions formatted by year resets the date to the first day of the year if the month
-- is June or Earlier and the next year if the month is July or later
-- TRUNC functions formatted by year resets the date to the first day of the given year

select employee_id,
first_name,
hire_date,
round (hire_date, 'year'), trunc (hire_date, 'year')
from employees
order by hire_date;

-- Nesting Functions
-- Single-row functions can be nested to any level.
-- Nest functions are evaluated from the deepest level to the
-- least deep level.

select first_name, upper (first_name), substr (upper (first_name) ,1,3),
lpad (substr (upper (first_name), 1,3), 10, '*')
from employees;

-- Another example
-- Assume that there is a column in a table that contains a name with 3 segments
-- We need to split the string 'ahmed ali naser' to first_name, middle_name, last_name
-- using select statement

-- *** GOOD EXAMPLE ***

select 'ahmed ali naser' FULL_NAME,
substr ('ahmed ali naser', 1, instr ('ahmed ali naser', ' ', 1, 1) - 1) FIRST_NAME,
substr ('ahmed ali naser', instr ('ahmed ali naser', ' ', 1, 1) + 1 ,
instr ('ahmed ali naser', ' ', 1, 2) - instr ('ahmed ali naser', ' ', 1, 1) - 1) MIDDLE_NAME,
substr ('ahmed ali naser', instr ('ahmed ali naser', ' ', 1, 2) + 1) LAST_NAME
from dual;

select 'ahmed ali naser' FULL_NAME,
instr ('ahmed ali naser', ' ', 1, 1) - 1) FIRST_NAME
from dual;
-------------------------------------------------

-- Implicit Data Conversion vs Explicit
/*
CONVERSION FUNCTIONS:

1.) TO_DATE
2.) TO_CHAR
3.) TO_NUMBER
*/

-- Implicit Data Type Conversion = Done by Oracle
-- Explicit Data Type Conversion = Done by User using conversion function

/* Implicit Date Type Conversion:

-- Can convert VARCHAR or CHAR to NUMBER or DATE if the VARCHAR or CHAR is in a valid DATE or NUMBER format
-- Can convert NUMBER or DATE to VARCHAR or CHAR

*** BEST PRACTICE TO USE EXPLICIT DATA TYPE CONVERSION TO ENSURE RELIABILITY OF SQL STATEMENTS ***
---------------------------------------------

-- EXPLICIT DATA TYPE CONVERSION
-- TO_CHAR (With Dates)

/*
YYYY = Full year in numbers
YEAR = YEar spelled out
MM = Two-Digit value for month
MONTH = Full name of month
MON = Three-Letter abbreviation of month
DY = Three-Letter abbreviation of the day of week
DAY = Full name of the day of week
DD = Number day of the month

HH or HH12 = 12 hour time format
HH24 = 24 hour time format
MI = Minute
SS = Second
SSSSS = Seconds past midnight
*/

select sysdate from dual;

select to_char(sysdate, 'dd.mm.yyyy') from dual;

-- In the query below you can use 'AM' or 'PM' and get the same result.
select to_char(sysdate, 'dd.mm.yyyy hh:mm:ss AM') from dual;

-- 24 Hour time format
select to_char(sysdate, 'dd.mm.yyyy hh24:mm:ss AM') from dual;

-- 'fm'(format) in front of TO_CHAR arguement removes unnecessary zeroes and spaces
-- Arguements to TO_CHAR function are case-sensitive ('month' = july, 'MONTH' = JULY)
select first_name, hire_date, to_char (hire_date, 'dd month yyyy') HIREDATE,
to_char (hire_date, 'fmdd month yyyy') HIREDATE
from employees;

select to_char (sysdate, 'FMDD "OF" MONTH YYYY') from dual;

-- 'sp' spells out the date
select to_char (sysdate, 'FMDDsp "OF" MONTH YYYY') from dual;

-- 'th' adds 'th' to the end of the date
select to_char (sysdate, 'fmDDspth "OF" MONTH YYYY') from dual;

-- Lists all the employees who were employed in 2003
-- Converts HIRE_DATE to a year value and only retrieves the year portion of the hire date
select * from employees
where to_char (hire_date, 'yyyy') = '2003';

-- List all the employees who were employed in February
select * from employees
where to_char (hire_date, 'mm') = '02'; -- '02' is required because 'fmMM' was not used

-- Use 'fmDD' if you only want to search for '2' since 'fm' removes all zeroes and spaces
select * from employees
where to_char (hire_date, 'fmMM') = '2';
----------------------------------------------

-- Using TO_CHAR with Numbers
-- Syntax: TO_CHAR(number, 'format_model')

/*
ADDITIONAL FORMAT ELEMENTS:
9 = Represents a number
0 = Forces a zero to be displayed
$ = Places a floating dollar sign
L = Uses the floating local currency symbol
. = Prints a decimal point
, = Prints a comma as a thousands indicator
*/

select to_char (1598) from dual;

select to_char (1598, '9999') from dual;

select to_char (1598, '9,999') from dual;

select to_char (1598, '$9,999') from dual;

-- 'L' shows the local currency symbol
select to_char (1598, 'L9,999') from dual;

-- 'G' and the ',' produce the same result with the thousands separator
-- 'G' cannot be used with '.'  or ','
select to_char (1598, '$9G999') from dual;
----------------------------------------------

select to_char (1598.87) from dual;

select to_char (1598.87, '9999.99') from dual;

select to_char (1598.87, '9,999.99') from dual;

select to_char (1598.87, '$9,999.99') from dual;

-- The below query will result in an error because you cannot use 'G' or 'D' with '.' or ','
select to_char (1598.87, '$9G999.99') from dual;

-- 'D' and the '.' produce the same result with the decimal point
-- 'D' cannot be used with '.' or ','
select to_char (1598.87, '$9G999D99') from dual;

-- The below query will round the decimal to the tenths place
select to_char (1598.87, '9999.9') from dual;
-------------------------------------------------------

-- The below query will fail because it is asking Oracle to convert a 4-digit number into 2 digits.
-- Oracle will return '###' when the query fails
select to_char (1598.87, '99') from dual;

-- The below query will treat '0' like '9'
select to_char (1598.87, '0000') from dual;

-- The below query will add a leading '0'
select to_char (1598.87, '00000') from dual;

select to_char (1598.87, '00000000') from dual;

-- The below query will treat the '0' like a '9'
select to_char (1598.87, '0999') from dual;

-- The 5th '0' will be leading and the 4th '0' will be treated as a '9'
select to_char (1598.87, '00999') from dual;

select to_char (1598989, '9G999G999') from dual;

select to_char (-1598, '9999') from dual;

-- 'MI' places the minus side on the right side for negative numbers
select to_char (1598, '9999mi') from dual;

select to_char (-1598, '9999mi') from dual;

-- 'PR' parenthesizes negative numbers
select to_char (1598, '9999PR') from dual;

select to_char (-1598, '9999PR') from dual;

-- *** BEST PRACTICES ***

-- Use the format below because we do not know the length of the numbers in our tables
select to_char (1598, '999,999,999') from dual;

-- Removes the white space from the above query
select to_char (1598, 'FM999,999,999') from dual;

-- *** IMPORTANT: NOTE ON WHITE SPACES ***

/*
Where Oracle converts numbers to characters it leaves a white space in front
of the number returned to save space for a negative sign in case the number is
negative.
*/

select to_char (7, '9') from dual;

-- Can use this to remove the white space
select to_char (7, 'FM9') from dual;

select to_char (-7, '9') from dual;

select length ('-7') from dual;

select length ('7') from dual;

------------------------------------------

-- TO_NUMBER, TO_DATE Functions
-- To convert CHAR to NUMBER, the CHAR must have a valid NUMBER format
-- To convert CHAR to DATE, the CHAR must have a valid DATE format

-- Using TO_DATE function

select to_date ('10-11-2015', 'dd-mm-yyyy') from dual;

-- Even though '.' is used, Oracle displays date as DD-MM-YYYY because that is the default format
select to_date ('10.11.2015', 'dd.mm.yyyy') from dual;

-- Default date format for Oracle is DD-MON-RR (Year)
-- 'MONTH' is a valid date format for the name of the month spelled out (November)
select to_date ('10.november.2015', 'dd.month.yyyy') from dual;

select * from employees
where hire_date > to_date ('10-11-2003', 'dd-mm-yyyy');

-- Oracle with remove white spaces
select * from employees
where hire_date > to_date ('10-11-        2003', 'dd-mm-yyyy');

-- When using 'fx' the format should match exactly
select * from employees
where hire_date > to_date ('10-11- 2003', 'fxdd-mm- yyyy');

-- *** IMPORTANT - Differences between RR and YY formats ***

/*
RR Format:

In general, if the value is between 50-99 THIS returns 19xx year.
In general, if the value is between 0-49 THIS returns 20xx year
*/

select to_date ('1-1-85', 'dd-mm-rr') from dual;

-- Shows the CHAR representation of the date, which is '1985
select to_char(to_date ('1-1-85', 'dd-mm-rr'), 'yyyy') from dual;

/*
YY Format:

In general, YY does not do any logical formatting.
YY assumes that '85' refers to the 85th year of the current century, which will be '2085'
*/

select to_date ('1-1-85', 'dd-mm-yy') from dual;

--Shows the CHAR representation of the date, which is '2085'
select to_char (to_date ('1-1-85', 'dd-mm-yy'), 'yyyy') from dual;

/*
*** BEST PRACTICE ***

Always use 'YYYY' format and use 4-digit dates in your queries
where TO_DATE is used.

-- Use '1985' instead of '85'
select to_char (to_date ('1-1-1985', 'dd-mm-yy'), 'yyyy') from dual;
*/
---------------------------------------------

-- General Single-Row Functions
-- NVL, NVL2, NULLIF, and COALESCE Functions

/*
NVL (expr1, expr2)
NVL2 (expr1, expr2, expr3)
NULLIF (expr1, expr2)
COALESCE (expr1, expr2, ..., exprN)

NVL = Converts a null value to an actual value.
expression values should have the same data type.
nvl(COMMISSION_PCT, NUMBER), nvl(HIRE_DATE, DATE)

NVL2 = If expr1 is not null, NVL2 returns expr2.
If expr1 is null, NVL2 returns expr3.
expr1 can have any data type.

NULLIF = Compares two expressions and returns NULL if they are equal.
Returns the first expression if they are not equal.

COALESCE = Returns the first non-NULL expression in the
expression list
*/

-- NVL Function

-- Tests if COMMISSION_PCT is NULL. If so then it returns second expression (0)
select employee_id, first_name, commission_pct, nvl(commission_pct, 0)
from employees;

select employee_id, first_name, job_id, nvl (job_id, 'No Job Yet')
from employees;

select employee_id, first_name, hire_date, nvl (hire_date, '1-jan-03')
from employees;

-- IMPORTANT EXAMPLE
-- Because COMMISSION_PCT is a number, if you are asked to return
-- 'No Commission' if the employee's commission percentage is NULL
-- Then you have to first convert the COMMISSION_PCT to a CHAR
-- Before passing it through the NVL function

select employee_id, first_name, commission_pct, nvl (to_char(commission_pct), 'No Commission')
from employees;

-- Using the NVL2 Function
-- If expr1 is not NULL, the expr2 is returned
-- If expr1 is NULL, then expr3 is returned
-- Expr1, expr2, and expr3 do not need to have the same data types
-- Expr2 and expr3 MUST HAVE the SAME data type

select employee_id, first_name, commission_pct, nvl2 (commission_pct, commission_pct, 0)
from employees;

-- NVL2 is almost like an IF/ELSE statement for queries
select employee_id, first_name, commission_pct,
nvl2 (commission_pct, 'Salary plus Commission', 'Salary Only') Income
from employees;

-- Using NULLIF Function
-- If expr1 = expr2 then NULL is returned, else it returns expr1

-- Returns NULL if length (first_name) = length (last_name)
-- Returns length (first_name) if length (first_name) != length (last_name)
select first_name, length (first_name), last_name, length (last_name),
nullif (length (first_name), length (last_name)) Results
from employees;

-- COALESCE Function
-- Returns the first non-NULL value in expression list

select employee_id, first_name, commission_pct, manager_id, salary,
coalesce (commission_pct, manager_id, salary),
nvl (nvl (commission_pct, manager_id), salary) -- Nested NVL statement equivalent to COALESCE function
from employees;
------------------------------------------

-- Conditional Expressions
-- CASE Function

/*
Conditional Expressions:

Provide the use of the IF/THEN/ELSE statement within SQL
Includes CASE and DECODE functions

NOTE: CASE complies with the ANSI SQL standard.
DECODE is specific to Oracle's syntax.
CASE is more flexible and widely-used
*/

/*
CASE Expression:

CASE expr WHEN comparison_expr1 THEN return_expr1
[WHEN comparison_expr2 THEN return_expr2
WHEN comparison_exprN THEN return_exprN
ELSE else_expr]
END

'WHEN'  = 'IF'

*** ALL KEYWORDS ARE MANDATORY EXCEPT ELSE KEYWORD ***
*/

-- CASE expression Method 1
-- 'IT_PROG', 'ST_CLERK', and 'SA_REP' are case sensitive
-- Restricted to making comparisons in one column
select first_name, job_id, salary,
      case job_id when 'IT_PROG' then 1.10 * salary
                  when 'ST_CLERK' then 1.15 * salary
                  when 'SA_REP' then 1.20 * salary
      else salary
      end "REVISED_SALARY" -- Alias
from employees;      

-- CASE expression Method 2
-- This method is more flexible *** BEST PRACTICE ***
-- You can make the condition after WHEN
-- Can include any columns for conditions
select first_name, job_id, salary,
      case  when job_id = 'IT_PROG' then 1.10 * salary
            when job_id = 'ST_CLERK' then 1.15 * salary
            when job_id = 'SA_REP' then 1.20 * salary
      else salary
      end "REVISED_SALARY"
from employees;     

-- If no 'ELSE' statement is used then NULL will appear for unmatched conditions
-- Any employee without a job title of IT_PROG, ST_CLERK, or SA_REP
-- Will have a NULL value in the 'REVISED_SALARY' column
select first_name, job_id, salary,
      case job_id when 'IT_PROG' then 1.10 * salary
                  when 'ST_CLERK' then 1.15 * salary
                  when 'SA_REP' then 1.20 * salary
      end "REVISED_SALARY"
from employees;      

-- The below statement is not logically corrent
-- If the first condition is met then it shows the result
-- regardless of any other conditions
-- Since the if statements are ordered by ascending salary values
-- All salaries above 3000 will show 'Salary > 3000'
select salary,
      case  when salary > 3000 then 'salary > 3000'
            when salary > 4000 then 'salary > 4000'
            when salary > 10000 then 'salary > 10000'
      end FFF -- Alias
from employees;     

-- The correct logic is as follows:
select salary,
      case  when salary > 10000 then 'salary > 10000'
            when salary > 4000 then 'salary > 4000'
            when salary > 3000 then 'salary > 3000'
      end FFF -- Alias
from employees;
------------------------------------------------

-- Using the DECODE Function

/*
DECODE Function:
(CASE expression is more powerful and flexible than DECODE)

Facilitates conditional inquiries by doing the work of a 
CASE expression or an IF/THEN/ELSE statement

DECODE (column/expression, search1, result1
        [, search2, result2, ...,]
        [, default])
*/

select last_name, job_id, salary,
      decode (job_id, 'IT_PROG', 1.10 * salary,
                      'ST_CLERK', 1.15 * salary,
                      'SA_REP', 1.20 * salary,
              salary) -- salary is default value if no conditions are met
      REVISED_SALARY -- Alias
from employees;      

-- If there is no default value for non-matched conditions then NULL will be returned
select last_name, job_id, salary,
      decode (job_id, 'IT_PROG', 1.10 * salary,
                      'ST_CLERK', 1.15 * salary,
                      'SA_REP', 1.20 * salary
            )          
      REVISED_SALARY -- Alias
from employees; 

/*
*** IMPORTANT NOTE ABOUT CASE/DECODE ***

Write the CASE/DECODE statements spanning multiple lines for
readability.

THIS IS A BEST PRACTICE!
*/

-- IMPORTANT EXAMPLE
-- Diplay tax for employees as follows:
-- If salary < 3000 then tax = 0%
-- If salary 3000 - 7000 then tax = 10%
-- If salary > 7000 then tax = 20%
-- For this you should use CASE and not DECODE because it is more flexible

select employee_id, first_name, salary,
      case  when salary < 3000 then salary * 0.0
            when salary between 3000 and 7000 then round (salary * 0.10) -- Rounds to nearest integer
            when salary > 7000 then round (salary * 0.20)
      end Tax -- Alias
from employees;   
-------------------------------------------------

-- Introduction to Group Functions / Multi-Row Functions

-- Single-Row Functions return one result per row
-- Multi-Row Functions return one result per set of rows

/* Types of Group Functions

* AVG
* COUNT
* MAX
* MIN
* SUM
* LISTAGG
* STDDEV
* VARIANCE

*/

-- Group Funciton Syntax: group_function(DISTINCT|ALL0 expr) ALL is default so is not necessary to include
-- Group Function Data Types: CHAR, VARCHAR2, NUMBER, DATE
-- All group functions ignore NULL values
-----------------------------------------------------------------

-- Group Function Examples

-- MAX and MIN Functions
select salary
from employees
order by salary desc;

select max(salary), min(salary)
from employees;

-- You can use MAX and MIN with VARCHAR
select max(first_name), min(first_name)
from employees;

-- You can use MAX and MIN with DATES too
select max(hire_date), min(hire_date)
from employees;
----------------------------------------------------

-- SUM and AVG Functions (Works only with NUMBER)

select sum(salary), avg(salary)
from employees;

-- You can not use SUM and AVG with VARCHAR or DATE
select sum(first_name), avg(first_name)
from employees;
-----------------------------------------------------

--COUNT Function

select * from employees;

-- COUNT(*) returns the number of rows in a table including duplicate rows and includes NULL values
select count(*) from employees;

select count(1) from employees; -- this is equal to COUNT(*)

-- COUNT(COLUMN) ignores NULL values. NULLs will not be counted.
select count(commission_pct)
from employees;

select count(department_id) from employees; -- NULLS will not be counted

select count(distinct department_id) from employees;

select count(commission_pct) from employees;

-- You can include NULL values in the count by using NVL
select count(nvl(commission_pct, 0)) from employees;

-- Using WHERE condition with COUNT function
select count(employee_id)
from employees
where department_id=90; -- This counts employees with DEPARTMENT_ID = 90
-----------------------------------------------------

-- LISTAGG Function

select first_name
from employees
where department_id = 30
order by first_name;

-- LISTAGG aggregates results into one line
-- 'WITHIN GROUP' is mandatory
select listagg(first_name, ', ') -- ', ' is the list separator
          within group (order by first_name) "Emp_List" -- Alias
from employees
where department_id = 30;
---------------------------------------------------------

-- *** IMPORTANT ***
-- GROUP BY and HAVING Clause

-- Using GROUP BY Clause

-- Goal is to return each department and them sum of salaries
-- The below query will result in an error

-- IMPORTANT *** KNOW ERROR CODE ORA-00937 ***

/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*/

select department_id, sum(salary)
from employees;

-- Correct query below
select department_id, sum(salary)
from employees
group by department_id -- All COLUMNS is SELECT statement should be in the GROUP BY clause
order by department_id;

select department_id, job_id, sum(salary)
from employees
group by department_id, job_id -- All COLUMNS in SELECT must be in GROUP BY
order by 1, 2; -- Order By 1st column in SELECT statement and then the 2nd

-- *** IMPORTANT ***
-- Know error code: ORA-00979 "Not a GROUP BY expression"
-- This will result in error, JOB_ID should also be in GROUP BY clause
-- The error will be "Not a GROUP BY expression"
select department_id, job_id, sum(salary)
from employees
group by department_id
order by 1, 2; -- All columns in the SELECT statement should be in GROUP BY clause

-- *** IMPORTANT ***
-- You can not use GROUP BY clause with column aliases
-- Error Code: ORA-00904 "Invalid Identifier"
select department_id d, sum(salary)
from employees
group by d;

-- You can use ORDER BY with aliases
select department_id d, sum(salary)
from employees
group by department_id
order by d;

-- WHERE, GROUP BY, and ORDER BY
-- WHERE first, then GROUP BY, then ORDER BY
select department_id, sum(salary)
from employees
where department_id > 30
group by department_id
order by department_id;

-- *** IMPORTANT ***
-- You can not use WHERE to retrict groups
-- Can not use ANY GROUP FUNCITONS in WHERE clause
-- Error Code: ORA-00934 "Group function is not allowed here"
select department_id, sum(salary)
from employees
where sum(salary) > 156400 -- this is not correct, you should use HAVING instead
group by department_id
order by department_id;

-- Using HAVING Clause
-- Use HAVING to make conditions on group funcitons
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) > 150000
order by department_id;

-- *** IMPORTANT ***
-- You could use HAVING clause before GROUP BY, but it is not recommended
select department_id, sum(salary)
from employees
having sum(salary) > 150000
group by department_id
order by department_id;

-- You can make nested group functions
select department_id, sum(salary)
from employees
group by department_id
order by 1;

-- *** IMPORTANT ***
-- You can nest ONLY TWO group functions
select max(sum(salary))
from employees
group by department_id
order by 1;
-------------------------------------------
-- *** ONE OF MOST IMPORTANT CHAPTERS ***
-- Displaying data from multiple tables using JOINS

-- Notes on JOINS

-- Know the Entity Relation Diagram (ERD) before writing JOINS
-- Must know the table structure before writing JOINS
-- Know the requirements before choosing which JOIN to use
-- 2 types of Oracle JOIN syntax -- OLD (not ANSI) and NEW (ANSI and referred to as 1999 syntax)
-- Each query has one main table that contains the result
-- Perform the query on the main table to get the results before executing any JOINS.
-- Foreign Key is the most important component of the JOIN operation
-- JOIN conditions used in the WHERE clause
-------------------------------------------------------

-- Cartesian Product

/*
Cartesian Product is formed when:

* A JOIN condition is omitted
* A JOIN condition is invalid
* All rows in the first table are joined with all rows in the second table
* Resulting table will be number of rows in first table multiplied by number of rows in second table
* Resulting table will show each row in table one match with every row in table two
*/

-- To avoid a Cartesian Product always include a valid JOIN condition in a WHERE clause.

-- DEPARTMENT_ID is the FK to the DEPARTMENTS table
select employee_id, first_name, department_id
from employees;

-- This query shows DEPARTMENT_ID, DEPARTMENT_NAME, from DEPARTMENTS
select department_id, department_name
from departments;

-- If you try to display data from multiple tables with the JOIN condition then the result will be the Cartesian Product
-- Prefix is only necessary if two tables share a common column
-- Using a prefix is a best practice
select
employees.employee_id, -- 'employee' is the prefix telling Oracle that 'employee_id' comes from the 'employees' table
employees.first_name,
departments.department_id,
departments.department_name
from employees, departments
order by employee_id;
------------------------------------------------

-- Old JOINS / EQUIJOINS (SIMPLE JOIN / INNER JOIN)
-- Joins two tables based on FK

-- EQUIJOIN, INNER JOIN, SIMPLE JOIN examples
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id -- EQUIJOIN clause
order by employee_id;

-- Examples using additional conditions
-- Additional conditions should be included after WHERE clause (JOIN condition)
select
employees.employee_id,
employees.first_name,
employees.department_id, -- Prefix here is required since DEPARTMENT_ID exists in both tables
departments.department_name
from employees, departments
where employees.department_id = departments.department_id -- EQUIJOIN clause
and employees.department_id > 40
order by employee_id;

-- Using Table Aliases
select
emp.employee_id, -- Using table aliases
emp.first_name, -- Using table aliases
emp.department_id, -- Using table aliases
dept.department_name -- Using table aliases
from employees emp, departments dept -- Assigning table aliases
where emp.department_id = dept.department_id
order by employee_id;

-- Joining more than 2 tables with EQUIJOIN
select
emp.employee_id,
emp.first_name,
emp.department_id,
dept.department_name,
dept.location_id,
loc.city
from employees emp, departments dept, locations loc
where emp.department_id = dept.department_id
and dept.location_id = loc.location_id
order by employee_id;
------------------------------------------------

-- Old JOINS / NONEQUIJOINS (Not commonly used)
-- JOIN that joins a table with something other than the EQUALITY operator
-- Does not use the PK/FK relationship (Uses something like SALARY and JOB_GRADE to join)
-- Not common to use nonEQUIJOIN, instead sub-queries are used instead

-- JOB_GRADES table does not exist in HR database
create table JOB_GRADES
(
grade_level varchar2(3),
lowest_sal number,
highest_sal number
);

-- Creating records for JOB_GRADES table
insert into job_grades (grade_level, lowest_sal, highest_sal)
values('A', 1000, 2999);

insert into job_grades (grade_level, lowest_sal, highest_sal)
values('B', 3000, 5999);

insert into job_grades (grade_level, lowest_sal, highest_sal)
values('C', 6000, 9999);

insert into job_grades (grade_level, lowest_sal, highest_sal)
values('D', 10000, 14999);

insert into job_grades (grade_level, lowest_sal, highest_sal)
values('E', 15000, 24999);

insert into job_grades (grade_level, lowest_sal, highest_sal)
values('F', 25000, 40000);

commit;

select * from job_grades;

-- nonEQUIJOIN Example. Join using another operator other than [ = ]
select emp.employee_id, emp.first_name, emp.salary, grades.grade_level
from employees emp, job_grades grades
where emp.salary between grades.lowest_sal and grades.highest_sal;

-- Another way to execute the above statement
select emp.employee_id, emp.first_name, emp.salary, grades.grade_level
from employees emp, job_grades grades
where emp.salary >= grades.lowest_sal and emp.salary <= grades.highest_sal;
---------------------------------------------------

-- *** IMPORTANT ***
-- Old Joins / OUTER JOIN
-- With a NATURAL/EQUIJOIN any null values in the table being joined will not appear in the result
-- In this case, an OUTER JOIN must be used to show the data
-- OUTER JOIN indicated by (+) operator
-- (+) always placed in the JOIN condition with the table that has the missing data
-- If a FK in TABLE1 has NULL values and it is the main table that you want to display data from
-- the the OUTER JOIN should be on the TABLE2 side which has the reference from TABLE1
-- If TABLE1 has NULL values and (+) placed on TABLE2 then all rows from TABLE1 will appear in result
-- IF TABLE2 has NULL values and (+) placed on TABLE1 then all rows from TABLE2 will appear in result
-- OUTER JOIN is used to show non-matched rows in results

-- EXAMPLES

-- EQUIJOIN first
-- One employee will be missing because there is a NULL value in DEPARTMENT_ID
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;

-- OUTER JOIN for above statement (case 1)
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id(+)
order by employee_id;

-- OUTER JOIN for above statement (case 2)
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id(+) = departments.department_id
order by employee_id;

-- Old JOINS / SELF JOIN
-- Joining a table to itself (imagine one table consists of two tables)

--SELF JOIN examples
select employee_id, first_name, manager_id
from employees;

-- I was to display the manager's name --> SELF JOIN
select
worker.employee_id,
worker.first_name,
worker.manager_id,
manager.first_name Manager
from
employees worker, -- Repeat the table twice to "split" it into two tables
employees manager -- Repeat the table twice to "split" it into two tables
where worker.manager_id = manager.employee_id;

-- Place the (+) sign for OUTER JOIN on the table where the data is missing from the JOIN result
select
worker.employee_id,
worker.first_name,
worker.manager_id,
manager.first_name Manager
from
employees worker, -- Repeat the table twice to "split" it into two tables
employees manager -- Repeat the table twice to "split" it into two tables
where worker.manager_id = manager.employee_id(+);

/*
*** GOOD EXAMPLE ***

Retrieve all the employees (employee_id, first_name, department_id_ who's salary > 2500
And display their department name, and department location and department city and country.
All employees should appear even if they have no department.
*/

-- Number of records should equal records in the query below
-- The EMPLOYEES table is the main table

select count(*)
from employees
where salary > 2500;

-- Now we need to determine which columns we need
-- from EMPLOYEES we need employee_id, first_name, department_id
-- from DEPARTMENTS we need department_name and location_id
-- from LOCATIONS we need city and country_id
-- from COUNTRIES we need country_name

-- The number of rows in the below query is equal to the number of rows in the query below

select
emp.employee_id,
emp.first_name,
emp.department_id,
emp.salary,
dept.department_name,
dept.location_id,
loc.city,
countries.country_name
from employees emp, departments dept, locations loc, countries
where emp.department_id = dept.department_id(+) -- Since there are NULL values in the emp.department_id column, you have to add OUTER JOINS to all joined tables otherwise data will be missing
and dept.location_id = loc.location_id(+)
and loc.country_id = countries.country_id(+)
and emp.salary > 2500;
------------------------------------------------------

-- 1999 (NEW) JOINS / CROSS JOIN (Cartesian Product)
/*
select last_name, department_name
from employees
cross join departments;

ALL RECORDS IN EMPLOYEES TABLE MATCHED WITH EACH AND EVERY ROW IN DEPARTMENTS TABLE
*/

-- EXAMPLES

-- 1999 Format
select
employees.employee_id,
employees.first_name,
departments.department_id,
departments.department_name
from employees
cross join
departments
order by employee_id;

-- Old Format
select
employees.employee_id,
employees.first_name,
departments.department_id,
departments.department_name
from employees, departments
order by employee_id;
----------------------------------------

-- 1999 (NEW) JOINS / NATURAL JOINS
-- Not commonly used
-- JOINS tables by matching names with same data types in two tables
-- If columns have the same name but different data types the an error is returned

/*
select department_id, department_name, location_id, city
from departments
natural join locations;
*/

-- NATURAL JOIN between DEPARTMENTS and LOCATIONS
select
departments.department_id,
departments.department_name,
location_id, -- Cannot use a prefix in the matched column
locations.city
from departments
natural join locations;

-- You can made a NATURAL JOIN using old formation as EQUIJOIN
select
departments.department_id,
departments.department_name,
departments.location_id,
locations.city
from departments, locations
where departments.location_id = locations.location_id;

-- *** IMPORTANT NOTE ***
-- If you try to make a NATURAL JOIN between EMPLOYEES and DEPARTMENTS the results will be wrong
-- Because it will join 2 columns DEPARTMENT_ID and MANAGER_ID

-- Use WHERE for additional conditions and then AND if necessary
-- WHERE comes after NATURAL JOIN statement
select
departments.department_id,
departments.department_name,
location_id, -- Cannot use a prefix in the matched column
locations.city
from departments
natural join locations
where departments.department_id > 20; -- Use WHERE and then AND

-- 1999 (NEW) JOINS / USING Clause
select
employees.employee_id,
employees.first_name,
department_id, -- You cannot use a prefix table name in the matched column
departments.department_name
from employees join
departments
using(department_id) -- You can use the USING clause with multiple columns
order by employee_id;

-- Below query is the same as above with the OLD sytanx
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;
---------------------------------------------------

-- *** IMPORTANT ***
-- 1999 (New) Format / ON Clause
-- Equivalent to OLD Format EQUIJOIN

/*
select
employees_employee_id,
employees.first_name,
departments.department_id, -- Here prefix should be used if column is shared
departments.department_name
from employees join
departments
on (employees.department_id = departments.department_id)
order by employee_id;
*/

-- Examples

-- OLD Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;

--1999 (NEW) Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees join departments
on (employees.department_id = departments.department_id)
where employee_id = 100 -- Use WHERE for additional conditions after ON clause
order by employee_id;

-- Can also use ON with NONEQUIJOIN
-- 1999 (NEW) Format
select emp.employee_id, emp.first_name, emp.salary, grades.grade_level
from employees emp join
job_grades grades
on emp.salary between grades.lowest_sal and grades.highest_sal;

-- Old Format
select emp.employee_id, emp.first_name, emp.salary, grades.grade_level
from employees emp,
job_grades grades
where emp.salary between grades.lowest_sal and grades.highest_sal;

-- Using ON with SELF JOIN
-- 1999 (NEW) Format
select
worker.employee_id,
worker.first_name,
worker.manager_id,
manager.first_name
from
employees worker join
employees manager
on (worker.manager_id = manager.employee_id);

-- OLD Format
select
worker.employee_id,
worker.first_name,
worker.manager_id,
manager.first_name
from
employees worker,
employees manager
where worker.manager_id = manager.employee_id;

-- Joining 3 Tables using ON clause
-- 1999 (NEW) Format
select
emp.employee_id,
emp.first_name,
emp.department_id,
dept.department_name,
dept.location_id,
loc.city
from employees emp
join departments dept
on (emp.department_id = dept.department_id)
join locations loc
on (dept.location_id = loc.location_id)
order by employee_id;

-- OLD Format
select
emp.employee_id,
emp.first_name,
emp.department_id,
dept.department_name,
dept.location_id,
loc.city
from employees emp, departments dept, locations loc
where emp.department_id = dept.department_id
and dept.location_id = loc.location_id
order by employee_id;
-----------------------------------------------------

-- 1999 (NEW) Format / Left - Right - Full Outer JOIN

-- Left Outer JOIN
-- Equivalent to 'WHERE employees.department_id = departments.department_id(+)'
-- Left table is MAIN TABLE
-- All rows from left table will show in the results, even if they do not match the conditions

/*
select
employees_employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
left outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;
*/

-- Right Outer JOIN
-- Equivalent to 'WHERE employees.department_id(+) = departments.department_id'
-- Right table is MAIN TABLE
-- All rows from right table will show in the results, even if they do not match the conditions

/*
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
right outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;
*/

-- Full Outer JOIN
-- Displays all rows from all tables that are joined

/*
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
full outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;
*/

-- EXAMPLES
-- Left Outer JOIN / 1999 Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
left outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;

-- Left Outer Join / Old Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id(+)
order by employee_id;

-- Right Outer Join / 1999 Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
right outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;

-- Right Outer Join / Old Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id(+) = departments.department_id
order by employee_id;

-- Full Outer Join / 1999 Format
select
employees.employee_id,
employees.first_name,
employees.department_id,
departments.department_name
from employees
full outer join departments
on (employees.department_id = departments.department_id)
order by employee_id;
----------------------------------------------------

-- *** IMPORTANT ***
-- Using Subqueries to Solve Queries
-- Inner Query executes before Outer Query
-- Result of subquery is used by main query

/*
Subquery Syntax:

SELECT select_list
FROM table
WHERE expr operator
      (SELECT select_list
      FROM table);
*/

-- Single Row Subqueries
-- Who has salary > Abel's salary (assume Abel is the LAST_NAME)
-- You need to know Abel's salary
select salary from employees where last_name = 'Abel';

-- Full query using subquery
select employee_id, first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'Abel');

-- Can put subquery on the left side, but THIS IS NOT RECOMMENDED
select employee_id, first_name, last_name, salary
from employees
where (select salary from employees where last_name = 'Abel') < salary;

-- *** IMPORTANT NOTE ***
-- When using single-row operator, then the subquery should also return a single row
-- Single-row operators: =, >, <, >=, <=, <>, !=
select * from employees
where job_id = (select job_id from employees where last_name = 'Abel');

-- *** IMPORTANT ***
-- This SELECT statement will give error "single-row subquery returns more than one row"
-- Error Code: ORA-01427 'Single-Row subquery returns more than one row'
select * from employees
where salary > (select salary from employees where department_id = 30); -- Many employees work in DEPARTMENT_ID 30

select salary from employees where department_id = 30;

-- Using group functions in subquery
-- We want the employee who has the highest salary
select * from employees
where salary = (select max(salary) from employees);

--Subquery using HAVING
-- HAVING is like the WHERE clause but with GROUP BY conditions
-- This query retrieves all departments grouped by department_id where the department has more employees than department 90
select department_id, count(employee_id)
from employees
group by department_id
having count(employee_id) > (select count(*)
                            from employees
                            where department_id = 90);
                            
-- If the subquery returns no rows then all SELECT statements will return no rows.
select employee_id, first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'dddd'); -- returns no rows
------------------------------------------------

-- Multiple Row Subqueries
-- Return more than one row
-- Use multiple row operators
-- Multiple Row operators: IN, ANY, ALL
-- ANY must be preceded by =, !=, >, <, <=, >=
-- ALL must be preceded by =, !=, >, <, <=, >=

-- EXAMPLES

select salary from employees where department_id = 90;

-- Using IN
-- Returns values that match any value in a list of values
select employee_id, first_name, last_name, salary
from employees
where salary in (select salary from employees where department_id = 90);
-- Can also be queried like this: IN (24000, 17000)

-- Using ANY
-- Returns all values that meet ANY of the conditions of the subquery
-- = ANY is equivalent to IN
select employee_id, first_name, last_name, salary
from employees
where salary >= any (select salary from employees where department_id = 90);

-- Using ALL
-- Returns only the values that meet ALL of the conditions in the subquery
select employee_id, first_name, last_name, salary
from employees
where salary >= ALL (select salary from employees where department_id = 90);
-----------------------------------------------------------

-- *** IMPORTANT ***
-- NULL Values and subqueries

-- When you want to retrieve the employees who have no manager, we use IS NULL
select * from employees
where manager_id is null;
-- You Cannot use manager_id=NULL

-- If the subquery returns NULL with IN operator then this is okay
-- IN is equivalent to =ANY
select * from employees
where manager_id in (100, 101, NULL);

-- If the subquery returns NULL with the NOT IN operator, then no records will be retrieved
-- NOT IN is equivalent to <> ALL
select * from employees
where manager_id not in (100, 101, NULL);

-- If the subquery set contains one NULL value, then this is okay with IN operator
select employee_id, first_name, last_name, salary
from employees
where employee_id in (select manager_id from employees); -- Some MANAGER_ID values are NULL, but this is okay with IN

-- If the subquery set contains one NULL value, this will return no results with NOT IN operator
select employee_id, first_name, last_name, salary
from employees
where employee_id not in (select manager_id from employees); -- Some MANAGER_ID values are NULL, this will return no records with NOT IN
------------------------------------------------------

-- EXISTS and NOT EXISTS
-- IN and NOT IN used for small sets of values
-- EXISTS and NOT EXISTS used for large sets of values
-- Use EXISTS/NOT EXISTS over IN/NOT IN

-- Retrieve all the departments that have employees
select * from departments dept
where department_id in (select department_id from employees emp);

-- Use table aliases when using EXISTS/NOT EXISTS operators
-- Use DISTINCT modifier to make the data more useful
select * from departments dept
where exists (select distinct department_id from employees emp where emp.department_id = dept.department_id);

-- Retrieve all the departments that have no employees
select * from departments dept
where not exists (select distinct department_id from employees emp where emp.department_id = dept.department_id);
------------------------------------------------------

-- Using Set Operators (UNION, UNION ALL, INTERSECT, MINUS)

/*
Set Operators combine the results of two or more queries into one result.
Queries containing set operators are also called 'compound queries'.

UNION: Returns rows from both queries after eliminating duplicates.

UNION ALL Returns rows from both queries, including all duplicates.

INTERSECT: Returns rows that are common to both queries.

MINUS: Returns rows in the first query that are not present in the second query.
*/

/******** IMPORTANT *********
UNION:

* Number of columns being selected must be the same
* Data types of columns being selected must be in the same data type group
  (numeric or character)
* NULL values are not ignored
* *** IMPORTANT *** By default, the output is sorted in ascending order of the columns in the select clause
* Column names do not need to be identical
* UNION operates over all columns being selected

UNION ALL:

* Same as UNION except:
* Duplicate rows are not eliminated
* Output is not sorted by default

INTERSECT:

* Number of columns and the data types of the columns being selected by the 
  SELECT statements in the queries must be identical in all the SELECT
  statements
* Reversing the order of the intersect tables does not alter the result
* Does not ignore NULL values

MINUS

* Number of columns used in the SELECT statements must be the same
* Data types of columns in the SELECT statements must be of the same data type group
*/

-- Examples

-- UNION Operator

select * from employees
where employee_id = 176; -- His JOB_ID now is SA_REP

select * from job_history
where employee_id = 176;

-- The UNION between EMPLOYEES and JOB_HISTORY
/* 1.) The number of columns should match
   2.) The data type should match
   3.) Duplicates will be eliminated
   4.) The query order is ASC for ALL columns
*/

select employee_id, job_id from employees
where employee_id = 176
union
select employee_id, job_id from job_history
where employee_id = 176;

-- Both columns in the result are sorted by ASC
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

-- UNION ALL

-- The UNION ALL between EMPLOYEES and JOB_HISTORY
/*  1.) The number of columns should match
    2.) The data type should match
    3.) Duplicates will not be eliminated
    4.) The results will not be sorted by default
*/

select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;

-- The column name from the first SELECT statement will display in the results
-- In this example emp_id and job will appear as column headings
select employee_id emp_id, job_id job -- Aliases
from employees
union
select employee_id emno, job_id jobid
from job_history
order by emp_id; -- ORDER BY must also use column alias from first query

-- INTERSECT
-- Retrieves rows shared by both SELECT statements

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history
order by employee_id;

select * from employees
where employee_id = 176;

select * from job_history
where employee_id = 176;

-- *** IMPORTANT ***
-- Adding the DEPARTMENT_ID column with return only one result because
-- there is only one record where the data is matched in EMPLOYEE_ID, JOB_ID, and DEPARTMENT_ID
-- In the EMPLOYEES table employee 176 is a SA_REP
select employee_id, job_id, department_id
from employees
intersect
select employee_id, job_id, department_id
from job_history
order by employee_id;

-- MINUS Operator
-- Returns rows found in Query 1 and not in Query 2
-- Returns the employees who have not changed their jobs.
-- Records exist in the EMPLOYEES table, but not in the JOB_HISTORY table
-- JOB_HISTORY table only stores information for employees who have changed jobs.

select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history
order by employee_id;

-- *** IMPORTANT ***
-- Matching Dummy Columns
-- For Dummy column you basically want to make the dummy column set to a value of 0
-- TO_CHAR(NULL) for character data types and 0 for NUMBER data types.

-- EMAIL exists in EMPLOYEE table, but not in JOB_HISTORY table
select employee_id, job_id, email
from employees
union
select employee_id, job_id, to_char(null) email -- to_char because EMAIL is CHARACTER data type
from job_history
order by employee_id;

-- SALARY exists in EMPLOYEES table, but not in JOB_HISTORY table.
-- SALARY is data type number
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0 salary -- salary is an alias
from job_history
order by employee_id;

-- *** IMPORTANT ***
-- ORDER BY clause must come last after all SELECT statements and only once
select employee_id, job_id, phone_number
from employees
union
select employee_id, job_id, to_char(null) phone_number
from job_history
order by employee_id;

-- *** IMPORTANT ***
-- ORDER BY can only see column names used in the first SELECT statement
select employee_id emp_id, job_id, salary
from employees
union
select employee_id empno, job_id, 0 salary
from job_history
order by emp_id; -- If you try to use empno it will return an error.

-- *** IMPORTANT ***
-- You can use column number to solve the issue of definining column name
select employee_id emp_id, job_id, salary
from employees
union
select employee_id empno, job_id, 0 salary
from job_history
order by 1;
------------------------------------------------

-- *** IMPORTANT! ***
-- INTRODUCTION TO DML (DATA MANIPULATION LANGUAGE)

/*
DML Statements:

1.) SELECT
2.) INSERT: Add new rows to a table
3.) UPDATE: Modify existing rows in a table
4.) DELETE/TRUNCATE (TRUNCATE is DDL): Remove existing rows from a table
5.) MERGE

A transaction consists of a collection of DML statements that form a logical unit of work.

*** KNOW THE TABLE STRUCTURE BEFORE YOU USE ANY DML STATEMENTS ***
*** KNOW THE CONSTRAINTS ON A TABLE BEFORE USING ANY DML STATEMENTS ***
*/
-------------------------------------------

-- INSERT Statement

-- 1.) Always describe (DESC) the table before using the INSERT statement to know the table's structure
desc departments;

-- 2.)  Try to determine the constraints of the table
--      Go to the table from the tree on the left of SQL Developer, select the table, and then go to the 'Constraints' tab

-- 3.)  List the columns in the same table order, the put related values (this is a BEST PRACTICE
-- First Syntax (RECOMMENDED)
insert into departments (department_id, department_name, manager_id, location_id)
values                  (71, 'Development 1', 100, 1700);
commit; -- Use the COMMIT command to save changes (Separate Statement)

-- Second Syntax (NOT RECOMMENDED)
-- Can INSERT without putting the column names
-- But the order in values should be the same as the columns are ordered in the table
-- This method requires that you insert values for ALL columns in the table
insert into departments
values (72, 'Development 2', 100, 1700);
commit;

-- You can change the order as you see fit when you list the column names
-- But you should always map the values correctly to the order of the columns
insert into departments (department_name, manager_id, location_id, department_id)
values                  ('Development 3', 100, 1700, 73);
commit;

-- 4.) Inserting rows with NULL values
-- The IMPLICIT METHOD: don't put the column in the list, make sure the column can have a NULL value
-- the Oracle server automatically makes it a NULL value
-- The MANAGER_ID and LOCATION_ID will be NULL in the following INSERT statement
-- MANAGER_ID and LOCATION_ID can be left out of the INSERT statement because they can have NULL values
-- The other two columns are required
insert into departments (department_id, department_name)
values                  (74, 'Development 4');

-- the EXPLICIT METHOD (PREFERRED), done by the user by specifying the NULL keyword
insert into departments (department_id, department_name, manager_id, location_id)
values                  (75, 'Development 5', null, null);
commit;

-- 5.) Inserting special values like SYSDATE, or other functions
-- Here, JOB_ID value must match available values
insert into employees (employee_id, first_name, last_name, email, hire_date, job_id)
values                (1, 'Matthew', 'Shelbourn', 'mattshelbourn@gmail.com', sysdate, 'IT_PROG');

-- When using TO_DATE, best practice is to use 'YYYY' for year format
insert into employees (employee_id, first_name, last_name, email, hire_date, job_id)
values                (2, 'Samer', 'Ali', 'samer@gmail.com', to_date('20-07-2015', 'dd-mm-yyyy'), 'IT_PROG');

-- 6.) Using the '&' character with INSERT
-- & character creates a prompt window for entering values into the columns
insert into departments (department_id, department_name)
values                  (&dept_id, '&dname');

commit;

-- 7.) You can use INSERT with subqueries
create table XX_EMP
(EMPNO number,
FNAME varchar2 (100),
SALARY number);

select * from xx_emp;

-- INSERT into XX_EMP using SELECT statment
-- Below query inserts EMPLOYEE_ID, FIRST_NAME, and SALARY from EMPLOYEES tables into XX_EMP table
insert into xx_emp (empno, fname, salary)
select employee_id, first_name, salary
from employees;

select * from xx_emp;

commit;
------------------------------------------------------

-- Common errors with INSERT Statements

-- 1.) Inserting existing values, and this value is a FK (SHOULD BE UNIQUE VALUE)
-- DEPARTMENT_ID = 10
insert into departments (department_id, department_name, manager_id, location_id)
values                  (10, 'Development 1', 100, 1700);

-- 2.) Inserting FK value that doesn't exist in the reference table (FK table)
-- LOCATION_ID = 1
insert into departments (department_id, department_name, manager_id, location_id)
values                  (5, 'Development 1', 100, 1);

-- 3.) Inserting mismatched data type (Expecting number and received string)
-- LOCATION_ID = 'D1'
insert into departments (department_id, department_name, manager_id, location_id)
values                  (5, 'Development 1', 100, 'D1');

-- 4.) Inserting a value that is too long
-- DEPARTMENT_NAME = 'The development and research department'
insert into departments (department_id, department_name, manager_id, location_id)
values                  (5, 'The Development and Research Department', 100, 1700);
----------------------------------------------------------

-- UPDATE Statement
-- UPDATE has to refer to a unique value if only updating one row
-- In general, use the PK column in the WHERE clause to identify a single row for UPDATE

-- 1.) It is logical to UPDATE always based on the PK for the table
-- Without the WHERE clause every employee in the EMPLOYEES table would be updated
select * from employees
where employee_id = 100;

update employees
set salary = 24100
where employee_id = 100;
commit;

select * from employees
where employee_id = 100;

-- 2.) Making an UPDATE on another condition (not using the PK) can be dangerous because multiple rows may be updated
update employees
set salary = 24000
where first_name = 'Steven'; -- More than one employee could have the first name 'Steven'
commit;

select * from employees
where first_name = 'Steven';

-- 3.) For more practice, lets create a table called COPY_EMP
-- This table is a copy of the EMPLOYEES table, we don't want to make changes to the original table

create table COPY_EMP
as
select * from employees;

select * from copy_emp;

update employees
set first_name = 'MATTHEW'
where first_name = 'Matthew';

commit;

select * from employees
where first_name = 'MATTHEW';

update employees
set last_name = 'SHELBOURN'
where last_name = 'Shelbourn';

commit;

-- 4.) You can update more than one column at the same time
update copy_emp
set salary = 24100, department_id=10
where employee_id = 100;
commit;

select * from copy_emp;

-- 5.) If there is no WHERE clause then then the UPDATE statement will update all rows
update copy_emp
set phone_number = '515.123.4567';

commit;

select * from copy_emp;

-- 6.) In UPDATE, you can set the column values to NULL
update copy_emp
set department_id = null
where employee_id = 100;

commit;

select * from copy_emp
where employee_id = 100;

-- 7.) Using subqueries with UPDATE
-- Make the salary for employee 100 like the salary for employee 200
select * from copy_emp
where employee_id in (100, 200);

update copy_emp
set salary = (select salary from copy_emp where employee_id = 200)
where employee_id = 100;
commit;

select * from copy_emp
where employee_id in (100, 200);

-- Another example
-- Set the salary and department id for employee 105 like the salary and department id for employee 108
select * from copy_emp
where employee_id in (105, 108);

-- METHOD 1 (PREFERRED METHOD)
update copy_emp
set (salary, department_id) = (select salary, department_id from copy_emp where employee_id = 108)
where employee_id = 105;

-- METHOD 2
update copy_emp
set salary        = (select salary from copy_emp where employee_id = 108),
    department_id = (select department_id from copy_emp where employee_id = 108)
where employee_id = 105;  

commit;
----------------------------------------------------

-- DELETE Statement
-- Removes records from a table
-- Without a WHERE condition all results would be deleted from a table

-- 1.) Let's create a DEPARTMENTS table copy so that we can mess with it
create table dept_copy
as select * from departments;

select * from dept_copy;

desc dept_copy;

-- 2.)
SELECT* FROM DEPT_copy
where department_id = 10;

delete from dept_copy
where department_id = 10;
commit;

select * from dept_copy
where department_id = 10;

-- 3.) The keyword FROM is optional in DELETE statements
delete dept_copy
where department_id = 10;
commit;

-- 4.) If there is no WHERE condition then all rows in the table will be deleted
delete from dept_copy;

-- 5.) You can ROLLBACK the DELETE
rollback;

select * from dept_copy;

-- 6.) DELETE based on subquery
delete from dept_copy
where department_id in (select department_id from dept_copy where department_name like '%Public%');

rollback;

-- 7.) DELETE based on another table
-- Query below deletes all departments from DEPT_COPY that don't have employees assigned to them
delete from dept_copy dept
where not exists (select 1 from employees emp where emp.department_id = dept.department_id);

rollback;

-- In this example you can not delete (ERROR thrown) because there is a child record found
-- But how will you remove this department which has employees???
-- In order to remove DEPARTMENT_ID = 90 you have to remove all employees in that department first
delete from departments
where department_id = 90;

-- 9.) TRUNCATE (DDL Statement)
-- Removes all rows from table
-- No ROLLBACK allowed
-- DELETE allows ROLLBACK
truncate table dept_copy; -- No ROLLBACK allowed

select * from dept_copy; -- the table is empty

/*
TRUNCATE vs DELETE

TRUNCATE: DDL Statement, No ROLLBACK, Not fired with triggers, no WHERE clause, recovers space

DELETE: DML Statement, ROLLBACK, Fired with triggers, Can have WHERE clause, Does not recover space
*/

-------------------------------------------

-- Database Transactions

/*
DATABASE TRANSACTIONS INCLUDE ONE OF THE FOLLOWING:

* DML statements that constitute one consistent change to the data (can be multiple statements)
    * One DML statement may trigger another DML statement, but they are both technically linked to one statement
* One DDL statement
* One data control language (DCL) statement
*/
---------------------------------------------

-- *** IMPORTANT ***
--COMMIT and ROLLBACK statements

-- Database Transactions start when the 1st DML statement is executed
-- Database Transactions end with one of the following events:
    -- A COMMIT or ROLLBACK statement is issued
    -- A DDL or DCL statement executes (auto commit)
    -- THe user exits SQL Developer or SQL Plus
    -- The system crashes
    
/*
Advantages of COMMIT and ROLLBACK Statements

* Ensure data consistency
* Preview data changes before making changes permanent
* Group logically related operations (with one COMMIT statement at the end)
*/

/*
Explicit Transaction Control Statements:

* COMMIT: ends the current transaction by making all pending data changes permanent
* SAVEPOINT: Makes a save point within the current transaction
* ROLLBACK: Ends the current transactions by discarding all pending data changes
* ROLLBACK TO SAVEPOINT: Rolls back the current transaction to a specified save point. Discards all changes and save points made after the save point being rolled back to
*/

/*
*** IMPORTANT***

Implicit Transaction Processing

An automatic COMMIT occurs in the following circumstances:

* A DDL statement is issued
* a DCL statement is issued
* Normal exit from SQL Developer or SQL Plus without explicitly issuing COMMIT or ROLLBACK statements
* Auto COMMIT in SQL Developer only happens upon normal exit when Auto-Commit is enabled

An automatic ROLLBACK occurs when there is an abnormal termination of SQL Developer or SQL Plus or a system failure
*/
-----------------------------------------------

-- *** IMPORTANT ***
-- COMMIT and ROLLBACK Practice

/* Notes about COMMIT and ROLLBACK (Before Commit)

* The prepvious state of the data can be recovered
* The current session can review the results of the DML operations by using the SELECT statement
* Other sessions CANNOT view the results of the DML statements issued by the current session
* The affected rows are LOCKED. Other sessions CANNOT change the data in the affected rows.

  Notes about COMIT and ROLLBACK (After COMMIT)
  
  * Data changes are saved in the database
  * The previous state of data is overwritten
  * All sessions can view the results
  * Locks on the affected rows are released. Those rows are available for other sessions to manipulate
  * All SAVEPOINTs are erased
*/

-- Case 1 -- Issuing a DML statement then issuing COMMIT
select * from employees
where employee_id in (200, 201);

select * from departments
where department_id = 1;

-- 1.)
update employees
set salary = salary + 100
where employee_id = 200;

-- 2.)
update employees
set salary = salary + 50
where employee_id = 201;

-- 3.)
insert into departments  (department_id, department_name, manager_id, location_id)
values                  (1, 'ADMINISTRATION 2', 200, 1700);

-- 4.) When COMMIT is issued then queries 1, 2, 3 will be committed
commit;

select * from employees
where employee_id in (200, 201);

select * from departments
where department_id = 1;
--------------------------------------

-- Case 2 -- Issuing DML statements and then issuing a ROLLBACK
-- 5.)
delete from departments
where department_id = 1;

-- 6.)
delete from employees
where employee_id = 1;

-- Now when you run a query you will not find the records
select * from departments
where department_id = 1;

select * from employees
where employee_id = 1;

-- 7.) When you do a ROLLBACK the data will be restored to a state before queries 5 and 6
rollback;

select * from departments
where department_id = 1;

select * from employees
where employee_id = 1;
----------------------------------------------

-- *** IMPORTANT ***
-- Case 3 -- Statement-Level ROLLBACK
select * from employees
where employee_id in (106, 107);

-- 8.)
delete from employees
where employee_id = 106;

-- 9.)
delete from departments; -- statement-level ROLLBACK for this statement due to integrity constraints

-- 10.)
delete from employees
where employee_id = 107;

-- So the DML 9 will not be executed, Oracle issues a ROLLBACK only for this statement (statement-level ROLLBACK)
-- Other statements require an explicit COMMIT or ROLLBACK
rollback;

select * from employees
where employee_id in (106, 107);
------------------------------------------

-- *** IMPORTANT ***
-- Case 4 -- Issuing DML statements then doing one DDL/DCL statement
-- This issues an automatic COMMIT

-- 11.)
insert into departments (department_id, department_name, manager_id, location_id)
values                  (1000, 'dept1', 200, 1700);

-- 12.)
insert into departments (department_id, department_name, manager_id, location_id)
values                  (1001, 'dept2', 200, 1700);

-- 13.) -- DDL Statement (COMMIT automatically issued)
create table test_table
( EMP_ID number,
  NAME varchar2(100)
);

rollback;

select * from departments
where department_id in (1000, 1001);

-- Now even if you issued a ROLLBACK DML 11 and 12 would have already been committed implicitly by Oracle due to the DDL statement
------------------------------------------------------

-- Case 5 -- Using SAVEPOINT
select * from employees
where employee_id = 108;

update employees
set salary = salary + 10
where employee_id = 108;

savepoint A;

select * from employees
where employee_id = 108;

update employees
set salary = salary + 20
where employee_id = 108;

select * from employees
where employee_id = 108;

rollback to savepoint a; -- Can ROLLBACK again to original values

select * from employees
where employee_id = 108;

-- Now you can issue a COMMIT or ROLLBACK
commit;

select * from employees
where employee_id = 108;
-------------------------------------------------

-- Case 6 -- Using ROW LOCK
select * from employees
where employee_id = 109;

update employees
set salary = salary + 20
where employee_id = 109;

select * from employees
where employee_id = 109;

-- Now go to another session and try to update the same record
-- The second session will not be able to modify the rows active in the first session
-- The data available to the second session will be the data as it was before any modifications in the first session
-- First session must be unlocked with COMMIT or ROLLBACK
/*
update employees
set department_id = 10
where employee_id = 109;
*/

commit;
-------------------------------------------

-- Case 7 -- FOR UPDATE Clause

-- FOR UPDATE locks the rows in use for any other uses or sessions
-- The other sessions will not be able to modify the data being used by the first session until a COMMIT or ROLLBACK is issued
-- When a session issues a statement on a locked row/rows SQL Developer will just have a blank processing screen
select * from employees
where department_id = 10
for update; -- Locks records for employees with DEPARTMENT_ID = 10

/*
If this query is issued in a second session after a FOR UPDATE is placed then the records will be locked
and the query will not be able to be executed

update employees
set salary = 4400
where department_id = 10;
*/

-- Rows are released when user in session 1 issues a COMMIT or ROLLBACK
commit;
-------------------------------------------

-- FOR UPDATE NOWAIT

/*
If a user in session 2 locks rows by issuing a statement that modifies rows
User in session 1 can use the FOR UPDATE NOWAIT clause with a query to retrieve an error immediately
if the rows are locked by another session instead of the query hanging and waiting
for the lock to be released by the other session
*/

/*
Session 2 Query:

update employees
set salary = 4400
where department_id = 10;
*/

-- Session 1 Query
select * from employees
where department_id = 10
for update nowait;

commit;
----------------------------------------------------

 -- FOR UPDATE WAIT (TIME SPECIFICATION)
 
 /*
 If a user in another session locks rows with a query that modifies rows
 FOR UPDATE WAIT (TIME) in the first session will issue a query and wait a specified amount of time
 for the second session to release the lock before retrieving an error.
 This allows for the user in session 1 to wait a specified amount of time for the rows to be
 unlocked instead of waiting indefinitely or retrieving an error immediately.
 */
 
 /*
 Session 2 Query
 
 update employees
 set salary = 4400
 where department_id = 10;
 */
 
 -- Session 1 Query
 select * from employees
 where department_id = 10
 for update wait 10;
 
 commit;
 -------------------------------------------
 select employee_id, first_name, emp.department_id, department_name
 from employees emp, departments dept
 where emp.department_id = dept.department_id
 and emp.department_id = 10
 for update;
 
 -- Now try to open another session and issue the same query
 -- It will lock all the rows in table EMPLOYEES for DEPARTMENT_ID = 10
 -- It will also lock the row DEPARTMENT_ID = 10 in the DEPARTMENTS table
 ---------------------------------------------
 
 -- FOR UPDATE OF (COLUMN NAME)
 
 /* Locks all rows that have the column lised in the FOR UPDATE OF clause
    Queries in other sessions will work as long as they don't include rows that have
    the column listed in the FOR UPDATE OF clause
*/

 select employee_id, first_name, emp.department_id, department_name
 from employees emp, departments dept
 where emp.department_id = dept.department_id
 and emp.department_id = 10
 for update of salary;
--------------------------------------------

-- DDL & Naming Rules

/*
DDL COMMANDS

* CREATE
* ALTER
* DROP
* RENAME
* TRUNCATE
*/

/*
  Oracle Table Structures
  
  * Tables can be created at any time, even when users are using the DB
  * You don't need to specify the size of the table.
    Size will be defined by the amount of space a table will use over time.
    It is important, however, to estimate how much space a table will use over time
  * Table structure can be modified online
*/

/*
  *** IMPORTANT ***
  
  Naming Rules
  
  Table names and column names must:
  
  * Begin with a letter
  * Be 1-30 characters long
  * Contain only A-Z, a-z, 0-9, _, $, and #
  * Not duplicate the name of another object owned by the same user
  * Not be an Oracle server-reserved word
  
  NOTES:
  
  * Use descriptive names for tables and other database objects
  * Names are not case-sensitive
  * Can use quoted identifiers (surrounded by " ")
  * Quoted identifiers are case-sensitive
*/
----------------------------------------------

-- Naming Rules Examples

-- 1.) -- The object (table) should start with a letter
create table 2emp
(empno number); -- results in error

-- *** IMPORTANT ***
-- 2.) -- The table name should be 30 characters or less
-- Oracle 12c 12.1 allows table names of 30 characters or less
-- Oracle 12c 12.2 allows table names of 128 character or less
-- Therefore, the below query will work in 12.2, but not in 12.1
create table employees_and_hr_information_table
(empno number); -- This is allowed in Oracle 12c 12.2

-- 3.) -- Table name should only contain A-Z, a-z, 0-9, _, $, #
create table emp-t
(empno number); -- returns an error ( - ) not allowed

-- 4.) -- Table name should not be a duplicate of another object owned by the same user
create table employees
(empno number); -- returns an error

-- 5.) -- Names should not be an Oracle reserved word (SELECT, FROM, WHERE, TABLE, etc)
create table select
(empno number);

create table "select"
(empno number);

drop table "select";
----------------------------------------------------

-- Data Types (Part 1)

/*
  Oracle Data Types
  
  * VARCHAR2(size): Variable-length character data (max size must be specified)
    Minimum size is 1
    Max Size (MAX_SWL_STRING_SIZE = EXTENDED) = 32,767 bytes
    MAX Size (MAX_SQL_STRING_SIZE = LEGACY) = 4,000 bytes
    
  * CHAR(size): Fixed-length character data of length size (bytes)
    Default and minimum size is 1, max size is 2,000
    
  * NUMBER(p, s): Number have precision (p) and scale (s)
    Precision is the total number of decimal digits. (Range from 1-38)
    Scale is the number of digits to the right of the decimal point (Range from -84-127)
    
    NOTE: Having a negative SCALE value will round the number (-1 rounds to the 10s, -2 rounds to the 100s, etc)
          Without specifying the P and S values you are able to enter whatever number you'd like
    
  * DATE: Date and time values to the nearest second
    Range from January 1, 4712 B.C. and December 31, 9999 A.D.
    
    NOTE:
    
    Difference between VARCHAR2 and CHAR:
    
    * VARCHAR2(20) and only 2 bytes are used then the remaining 18 bytes will be released from memory
    * CHAR(20) and only 2 bytes are used then the remaining 18 bytes will NOT be released from memory
*/    

-- Practice with NUMBER data type

create table test
(n1 number,
n2 number (5, 3)
);

insert into test values (1655.66, 1.34); -- Valid entry

insert into test values (20.25, 23.347); -- Valid entry

insert into test values (444.25, 23.3493666); -- Second number will be rounded after a scale of 3

insert into test values (444.25, 233.3493666); -- Returns an error because PRECISION is exceeded

insert into test values (444.25, 500); -- Returns an error because PRECISION is exceeded

insert into test values (444.25, 23.3493666);

select * from test;

create table test2
(n3 number (3, -2));

insert into test2 values (335); -- Rounds to 100s place

select * from test2;

insert into test2 values (335.09);

select * from test2;

insert into test2 values (355);

select * from test2;
---------------------------------------------------

-- Data Types (Part 2)

-- CREATE TABLE Examples

/*
  Additional Data Types
  
  * LONG: Variable-length character data (up to 2 GB)
  * CLOB: Character large object. Max size: 4 GB
  * NCLOB: Character large object containing Unicode characters. Max size: 4 GB
  * RAW(size): Raw binary data of length (size) bytes. Must specify size.
  * LONG RAW: Raw binary data of variable length of up to 2 GB
  * BLOB: Binary large object. Max size: 4 GB
  * BFILE: Binary data stored in a external file. Max size: 4 GB
  * ROWID: Base 64 string representing the unique address of a row and its table.
    Primarily for values returned by the ROWID pseudocolumn
    
  *** IMPORTANT ***
  
  GUIDELINES:
  
  * A LONG column is not copied when a table is created using a subquery
  * A LONG column cannot be included in a GROUP BY or an ORDER BY clause
  * Only one LONG column can be used per table
  * No constraints can be defined on a LONG column (No PK, FK, etc)
  * You might want to use a CLOB column rather than a LONG column
*/    

/*
  Date/Time Data Types
  
  * TIMESTAMP: Date with fractional seconds
  * INTERVAL YEAR TO MONTH: Stored as an interval of years and months
    Represents the difference in two different dates/times
  * INTERVAL DAY TO SECOND: Stored as an interval of days, hours, minutes, and seconds
    Represents the difference in two different dates/times
*/    
----------------------------------------------------------

-- Creating Tables without Constraints

-- In order to use CREATE TABLE you MUST have 1.) CREATE TABLE privaleges and 2.) Data storage space

-- 1.) -- Creating a table without any constraints
create table XX_emp_test
( emp_id number,
  ename varchar2 (100),
  salary number (8, 2),
  start_date date,
  commission number (2, 2),
  emp_pic blob,
  emp_notes long -- Might be better to use CLOB
);

select * from xx_emp_test;

-- 2.) -- Creating table/columns using double quotations (" ") - NOT RECOMMENDED BY ORACLE
create table "XX_eMP_dOUBLE" -- case sensitive
( emp_id number,
  "Ename" varchar2 (100)
);  

select * from "XX_eMP_dOUBLE"; -- You MUST use the (" ") when querying the table

select emp_id, "Ename"
from "XX_eMP_dOUBLE"; -- Because "Ename" was created using (" ") you MUST use (" ") when querying

-- 3.) -- Using the default values
create table xx_emp_test1
( emp_id number,
  ename varchar2 (100),
  salary number (8, 2),
  start_date date default sysdate, -- default can be any valid date and will be used if the user does not specify a date
  commission number (2, 2)
);

insert into xx_emp_test1  (emp_id, ename)
values                    (1, 'matthew');

commit;

select * from xx_emp_test1;

-- 4.) -- You can query the table you created by using the dictionary tables (user_tables)
select table_name from user_tables; -- USER_TABLES stores all tables that you have created

select owner, table_name from all_tables -- ALL_TABLES displays all tables that you own and all that you have privaleges to
where owner = 'HR'; -- ALL_TABLES displays all tables in DB for any owner
-------------------------------------------

-- Types of Constraints and Why We Use Them

/*
  Use constraints to do the following:
  
  * Enforce rulse on the data in the table whenever a row is inserted, updated, or deleted.
  * Prevent the dropping of a table if there are dependencies from other tables
  * Provide rules for Oracle tools, such as Oracle Developer
*/

/*
  Constraint Commands
  
  * NOT NULL: Column cannot contain a NULL value
  * UNIQUE: Column or combination of columns whose values must be unique for all rows in that table
    Can be NULL
  * PRIMARY KEY: Uniquely identifies each row of the table
    Cannot be NULL
  * FOREIGN KEY: Establishes and enforces a referential integrity between the column
    and a column of the referenced table such that the values in one table must
    match the values in another table
  * CHECK: Specifies a condition that must be true
*/

/*
  Constraint Guidelines
  
  * You can name a constraint or the Oracle server generates a name by usingthe SYS_Cn format
    'n' in SYS_Cn is a number
  * Create a constraint at either of the following times:
    * At the same time as the creation of the table
    * After the creation of the table
  * Define a constraint at the column or table level (table level constraints are more powerful & flexible)
  * View a constraint in the data dictionary
*/  
-------------------------------------------

-- Creating Tables with Column Level Constraints)
create table xx_emp_col_const
  ( emp_id number constraint xx_emp_col_const_pk primary key,
    ename varchar2 (100) constraint xx_emp_col_const_uk1 unique,
    salary number not null,
    gender char (1) constraint xx_emp_col_const_chq check (gender in ('M', 'F')),
    dept_id number constraint xx_emp_col_const_fk1 references departments (department_id) -- Foreign Key
  );  


select * from user_constraints -- Data Dictionary table storing all user constraints
where table_name = 'XX_EMP_COL_CONST'; -- Case sensitive

/*
  Oracle Constraint Abbreviations
  
  * P: Primary Key
  * R: Foreign Key (Referenced Tbale)
  * U: Unique Key
  * C: Check
*/  

-- Testing the CHECK constraint
insert into xx_emp_col_const  (emp_id, ename, salary, gender, dept_id)
values                        (1, 'matthew', 500, 'D', NULL); -- D is not a valid gender

insert into xx_emp_col_const  (emp_id, ename, salary, gender, dept_id)
values                        (1, 'matthew', 500, NULL, NULL); -- valid entry

select * from xx_emp_col_const;

-- Testing the UNIQUE constraints
insert into xx_emp_col_const  (emp_id, ename, salary, gender, dept_id)
values                        (2, 'matthew', 500, NULL, NULL); -- 'matthew' is a duplicate entry so this returns an error
--------------------------------------------

-- *** IMPORTANT ***
-- Creating Tables with Table Level Constraints (Best Practice)

-- You can make more than one column a PK
-- Using this method forces you to name the constraints
-- Constraints will appear at the end of the table
create table xx_emp_col_const1
  ( emp_id1 number,
    emp_id2 number,
    ename varchar2 (100),
    salary number not null, -- *** IMPORTANT *** NOT NULL is the only constraint that cannot be at the table level
    gender char (1),
    dept_id number,
    constraint xx_emp_col_const1_pk primary key (emp_id1, emp_id2), -- Can have only one PRIMARY KEY constraint per table
    constraint xx_emp_col_const1_uk1 unique (ename), -- Can have many UNIQUE constraints per table
    constraint xx_emp_col_const1_chq check (gender in ('M', 'F')), -- Can have many CHECK constraints per table
    constraint xx_emp_col_const1_fk1 foreign key (dept_id) references departments (department_id) -- Can have many FOREIGN KEY constraints per table
  );  
---------------------------------------------

-- *** IMPORTANT ***
-- Constraint Guidelines

/*
  NOT NULL Constraint
  
  * Ensures that the column contains no NULL values
  * Columns without the NOT NULL constraint can have NULL values by default
  * NOT NULL constraints must be defined at the column level. CANNOT BE DEFINED AT THE TABLE LEVEL
  * PRIMARY KEYs inherit a NOT NULL constraint because PKs must hold a value
*/

desc xx_emp_col_const1; -- Shows the PKs as being NOT NULL

/*
  UNIQUE Constraint
  
  * Can have composite UNIQUE constraints
  * *** IMPORTANT *** Oracle automatically creates a unique index for UNIQUE and PRIMARY KEY constraints
  * With composite UNIQUE constraints:
    * Inserting NULL values into both column is allowed
    * Multiple rows can have both columns with NULL values
    * Inserting one identical NOT NULL value and one NULL value into multiple rows is not allowed
      because the values would not be unique
*/      
      
/*
  PRIMARY KEY Constraint
  
  * Only one PRIMARY KEY constraint can be designated for each table
  * PRIMARY KEY can be composite (multiple columns) or single
  * Oracle automatically creates a PRIMARY KEY index when a PK is established
*/

/*
  FOREIGN KEY Constraint
  
  * *** IMPORTANT *** Value in FOREIGN KEY column must match the PRIMARY KEY value in the parent table
    column OR be NULL
*/  
---------------------------------------------

-- ON DELETE CASCADE
/*
  * ON DELETE CASCADE is added to a child table
  * If data is deleted from the master table then then corresponding data will also
    be deleted from the chil table
*/    

delete from departments; -- Error returned because this is a master table and has dependencies
-- dependencies must be deleted first before a master table can be deleted

create table dept1
  ( deptno number,
    dname varchar2 (100),
    constraint dept1_pk primary key (deptno)
  );
  
insert into dept1 (deptno, dname)
values            (1, 'HR DEPT');
  
insert into dept1 (deptno, dname)
values            (2, 'PO DEPT');

commit;

select * from dept1;

create table emp1
( empid number primary key, -- Column level constraint. Name will be automatically generated by Oracle
  ename varchar2 (100),
  deptno number,
  constraint emp1_fk foreign key (deptno) references dept1 (deptno) on delete cascade
);  

insert into emp1 values (1, 'matthew', '1');
insert into emp1 values (2, 'michael', '1');
insert into emp1 values (3, 'andrew', '1');
insert into emp1 values (4, 'audrey', '2');
insert into emp1 values (5, 'hugh', '2');

commit;

select * from emp1;

delete from dept1
where deptno = 1;

select * from emp1;