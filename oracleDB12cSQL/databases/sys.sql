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