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

