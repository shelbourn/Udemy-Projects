-- System Privileges & Privileges Practice Part 2

-- The user DEMO can know hi privs by using this query
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
