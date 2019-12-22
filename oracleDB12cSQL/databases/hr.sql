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