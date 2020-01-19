-- Continued from "sys.sql"

-- Testing privs granted to ROLES

-- Diplays SESSION privs
select * from session_privs;

-- Displays granted SYSTEM privs
select * from user_sys_privs;

-- Diplays granted ROLES
select * from user_role_privs;