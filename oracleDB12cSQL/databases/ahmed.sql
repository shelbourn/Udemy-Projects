-- Continued from "sys.sql"

-- Testing privs granted to ROLES

-- Diplays SESSION privs (granted directly or through a ROLE)
-- CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, & SELECT ANY TABLE were granted via ROLEs
select * from session_privs;

-- Displays granted SYSTEM privs that were granted directly, not through a ROLE
select * from user_sys_privs;

-- Diplays granted ROLES
select * from user_role_privs;

-- Displays SYSTEM privs granted via ROLEs
select * from role_sys_privs;

-- Displays ROLE TABLE OBJECT privs granted
select * from role_tab_privs
where role = 'IUD_EMP';
--------------------------------------

create table student
( student_id number,
  student_name varchar2(100)
);

grant select on
student to public;

select * from hr.locations;

select * from demo.emp;

update hr.employees
set salary = salary+10
where employee_id = 100;
------------------------------------------------

-- Using WITH GRANT Option

--ahmed connection
--1 create this table
create table course
( course_id number,
  course_name varchar2(100)
);

--2

-- HR can GRANT SELECT privalege on COURSE to other users
grant select
on course
to hr
with grant option;


--3 go and open new session or connection to hr
--do this : select * from ahmed.course
--then this:
/*
grant select
on ahmed.course
to demo
with grant option;
*/

--4 open new session or connection to demo
--do this : select * from ahmed.course

--5 now ahmed he will do this
revoke select
on course
from hr;

--6 then hr and also demo can not do this: select * from ahmed.course