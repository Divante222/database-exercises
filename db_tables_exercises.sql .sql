show databases;
select database();
show tables;
use employees;
select database();
show tables;

/*integers date time, strings*/

/*Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
I know salaries has a numeric type column I checked it*/

/*Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
titles, employees, dept_emp, departments*/

/*Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
I know salaries does, mayble titles for the time people got them, demp_emp because it seems like it would contain general info, 
dept_manager because it should contain basic info on the managers*/

/*What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
*/
/* they both have numbers in the first column that Identify the department or employee*/


select * from dept_manager;

/*
CREATE TABLE quotes (
    emp_no INT UNSIGNED NOT NULL,
    dept_no VARCHAR(50),
    from_date  VARCHAR(100) NOT NULL,
    to_date TEXT NOT NULL,
    PRIMARY KEY (emp_no)
);*/

