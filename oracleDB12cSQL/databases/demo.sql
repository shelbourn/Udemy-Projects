-- System Privileges & Privileges Practice Part 2
-----------------------------------------

-- Testing SYSTEM privs

-- The user DEMO can know his SYSTEM privs by using this query
select * from session_privs;

-- If the user has CREATE TABLE privs then he can INSERT, UPDATE, DELETE, SELECT,
-- ALTER, INDEX on any table they create

create table emp
( empid number constraint emp_pk primary key,
  ename varchar2(100)
);

insert into emp values (1, 'khaled');

select * from emp;

alter table emp
add (salary number);

select * from emp;

create sequence emp_s;

-- DEMP can also create an index for the table he created
create index ename_ind on emp (ename);

create or replace view emp_v
as
select empid, ename
from emp;

select * from user_sequences;

select * from user_indexes;

select * from emp_v;

-- Now the user DEMO wants to change his password because the DBA created his
-- default password as "demo1234"

alter user demo identified by demo_green;
---------------------------------------------

-- Testing OBJECT privs

-- The user demo can use SELECT * FROM EMPLOYEES (without the "HR") only if there is
-- a public synonym on the table EMPLOYEES
select * from hr.employees;

-- There is no public synonym for the table EMPLOYEES
select * from all_synonyms
where table_name = 'EMPLOYEES';

-- No privs for this operation
update hr.employees
set department_id = null
where employee_id = 1;

-- UPDATE has been granted on SALARY only
update hr.employees
set salary = 500
where employee_id = 1;
---------------------------------------

-- Privilege Dictionary Tables

select * from session_privs;

-- Displays all System privs granted
select * from user_sys_privs;

-- Displays all Table Object privs granted
select * from user_tab_privs_recd
order by 2; -- ORDER BY column #2

-- Displays all Column Object privs granted
select * from user_col_privs_recd;
--------------------------------------

-- Granting Privileges to other users
grant select on emp to hr;

-- Displays all table privs granted to other users
select * from user_tab_privs_made;

-- Grants UPDATE on ENAME column ONLY to HR
grant update (ename) on emp to hr;

-- Displays all column privs granted to other users
select * from user_col_privs_made;
-----------------------------------------

-- Creating ROLEs Practice
-- Go to "sys.sql"
-----------------------------------------

-- WITH GRANT option Practice

select * from ahmed.course;
-----------------------------------------