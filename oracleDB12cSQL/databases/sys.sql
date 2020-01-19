-- System Privileges & Privileges Practice 1

-- Connect to SYS database as SYSDBA on the ORCL container DB database

-- 1.) You have to connect as SYSDBA
-- 2.) When the DBA connects, it will be on the CONTAINER DB (ORCL)
-- So the user should move to the pluggable database first

show con_name;

-- Move to the ORCL pluggable DB
alter session set container = orclpdb;

show con_name;

-- The DBA can view all the users available from the ALL_USERS dictionary table
select * from all_users;

-- Use this query to view the system privileges map
select * from system_privilege_map;

-- Now let's create a new user called DEMO

-- This query will create user DEMO with password "demo1234"
-- This user will not be able to login until they are granted session privileges
create user demo identified by demo1234;

-- The following queries grant SYSTEM privileges to user DEMO
-- You can also do this GRANT CREATE SESSION, CREATE TABLE TO DEMO
grant create session to demo;

grant create table to demo;

-- DBA must allocate table size to users
grant unlimited tablespace to demo;

grant create sequence to demo;

grant create view to demo;

grant create synonym to demo;
--------------------------------------------

-- The following queries grant OBJECT privileges to DEMO
grant select on hr.employees to demo;

grant delete on hr.employees to demo;

grant update (salary) on hr.employees to demo;

-- Grants all privs to demo that exist in HR for LOCATIONS table
grant all on hr.locations to demo;

grant select, insert
on hr.jobs to demo;

-- Grants SELECT on HR.COUNTRIES to ALL users in the DB
grant select
on hr.countries
to public;
-----------------------------------------------

-- System Privileges & Privileges Practice 2
-- Go to "demo.sql"
------------------------------------------------

-- Creating ROLEs Practice

-- Connect as SYSDBA

show con_name;

alter session set container = orclpdb;

create role manager;

grant create table, create view, create sequence
to manager;

-- Displays all SYSTEM privs granted to ROLES
select * from role_sys_privs
where role = 'MANAGER';
----------------------------------

create user ahmed identified by ahmed123;

grant create session to ahmed;

grant unlimited tablespace to ahmed;

grant manager to ahmed;
----------------------------------

create role qonly;

-- Grants SELECT on any table
grant select any table to qonly;

grant qonly to ahmed;

create role iud_emp;

grant insert, update, delete
on hr.employees
to iud_emp;

grant iud_emp to ahmed;

-- Displays all Table privs for ROLES
select * from role_tab_privs
where role = 'IUD_EMP';
-------------------------------------------

-- Remainder of lesson in "ahmed.sql"
----------------------------------------------

-- DROP USER Statement (Not regulary used)
-- Cannot drop a user who is currently connected to DB

alter session set container = orclpdb;

drop user ahmed; -- Returns an error because AHMED has created objects

-- CASCADE must be used to drop AHMED and all the user's OBJECTS
drop user ahmed cascade;
----------------------------------------------

-- Manipulating Data

/*
What is a Data Warehouse?

* A data warehouse is a relational DB that is designed for query and analysis
  rather than for transaction processing.
* It usually contains historical data derived from transaction data, but can
  include data from other sources.
* In addition to a relational DB, a data warehouse environment includes an
  extraction, transportation, transformation, and loading (ETL) solution. And
  also an online analytical processing (OLAP) engine.
* Queries on the data warehouse are useful for reporting, analytics, and data
  mining.
  */
-------------------------------------------------

-- Explicit default value in INSERT & UPDATE statement

