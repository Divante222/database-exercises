show databases;

use albums_db;

select database();

show tables;

use employees;

select database();

show tables;

SHOW CREATE table employees;
/*
'employees', 'CREATE TABLE `employees` 
(\n  `emp_no` int NOT NULL,\n  
`birth_date` date NOT NULL,\n  
`first_name` varchar(14) NOT NULL,
\n  `last_name` varchar(16) NOT NULL,\n  
`gender` enum(\'M\',\'F\') NOT NULL,\n  
`hire_date` date NOT NULL,\n  
PRIMARY KEY (`emp_no`)\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/

-- int, string, date, enum

/*
Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
*/
-- the ones I """think""" have a numeric type column
-- employees, salaries, dept_employees, dept_manager

-- Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- the ones I """think""" have a string type column
-- departments, dept_emp, dept_manager, employees, salaries, titles

-- Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- the ones I """think""" have a date type
-- departments, dept_emp, dept_manager, employees, salaries, titles

/*
What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
*/
-- there is none

select * from employees;
select * from departments;

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
show create table dept_manager;
/* 'dept_manager', 

'CREATE TABLE `dept_manager`
(\n  `emp_no` int NOT NULL,\n  
`dept_no` char(4) NOT NULL,\n  
`from_date` date NOT NULL,\n  
`to_date` date NOT NULL,\n  
PRIMARY KEY (`emp_no`,`dept_no`),
\n  KEY `dept_no` (`dept_no`),\n  
CONSTRAINT `dept_manager_ibfk_1` 
FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n  
CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) 
ENGINE=InnoDB DEFAULT CHARSET=latin1'

