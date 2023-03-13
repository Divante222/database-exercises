-- describe titles;

-- show create table titles;
/*
'titles', 'CREATE TABLE `titles` (\n  `emp_no` int NOT NULL,\n  
`title` varchar(50) NOT NULL,\n  `from_date` date NOT NULL,\n  `
to_date` date DEFAULT NULL,\n  
PRIMARY KEY (`emp_no`,`title`,`from_date`),
\n  CONSTRAINT `titles_ibfk_1` 
FOREIGN KEY (`emp_no`) REFERENCES `employees` 
(`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) 
ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/
use pagel_2194;
use employees;

describe departments;

describe employees;

describe dept_emp;

show create table dept_emp;
/*
'dept_emp', 'CREATE TABLE `dept_emp` 
(\n  `emp_no` int NOT NULL,\n 
 `dept_no` char(4) NOT NULL,\n  
 `from_date` date NOT NULL,\n  
 `to_date` date NOT NULL,\n  
 PRIMARY KEY (`emp_no`,`dept_no`),\n  
 KEY `dept_no` (`dept_no`),\n  
 CONSTRAINT `dept_emp_ibfk_1` 
 FOREIGN KEY (`emp_no`) REFERENCES 
 `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n 
 CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` 
 (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
 */
 
 select * 
 from employees;
 
 select * from departments;
 select * 
 from dept_emp;
 
 select *
 from employees -- employee is left and dept_emp is the right
 right join dept_emp on employees.emp_no = dept_emp.emp_no;
 
 use join_example_db;
 
 select *
 from users;
 
 select * 
 from roles;
 
 select * from users
right join roles on users.role_id = roles.id; -- seeing the nulls

use employees;

select *
from employees -- employee is left and dept_emp is the right
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

select employees.first_name, employees.last_name, departments.dept_name-- get specific information from tables
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where employees.gender = 'F';



select e.first_name, e.last_name, d.dept_name-- get specific information from tables
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where e.gender = 'F';

select * from employees -- using join for two tables that have the same primary key
join dept_emp using(emp_no) -- using




 


