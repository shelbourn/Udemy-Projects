Load Data
INFILE 'C:\Users\matts\Projects\Udemy-Projects\oracleDB12cSQL\instructorAssets\emp.csv'
APPEND
INTO Table emp_load
FIELDS TERMINATED BY ','
(empno,
fname,
lname
)