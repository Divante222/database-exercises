use join_example_db;

select * from users;

select * from roles;

select * from users
join roles on users.role_id = roles.id;

select * from users
left join roles on users.role_id = roles.id;

select * from users
right join roles on users.role_id = roles.id;

select roles.name as role_name, count(users.name) as number_of_employees from users
right join roles on users.role_id = roles.id
group by role_name;

use employees;

select d.dept_name,concat(e.first_name, ' ' , e.last_name) as current_department_manager from  employees as e
join dept_manager as dm using(emp_no)
join departments as d using(dept_no)
where dm.to_date > curdate()
order by dept_name
;

select d.dept_name,concat(e.first_name, ' ' , e.last_name) as current_department_manager from  employees as e
join dept_manager as dm using(emp_no)
join departments as d using(dept_no)
where dm.to_date > curdate()
and e.gender like 'F'
order by dept_name;

select count(de.emp_no) as count, t.title from dept_emp as de
join titles  as t using(emp_no)
join departments as d using(dept_no) 
where t.to_date > curdate() and de.to_date> curdate()
and d.dept_name = 'Customer Service'
group by t.title;

select d.dept_name, concat(e.first_name, ' ' , e.last_name) as current_department_manager , s.salary from employees as e
join salaries as s using(emp_no)
join dept_manager as dm using(emp_no)
join departments as d using(dept_no)
where s.to_date > curdate()
and dm.to_date > curdate()
order by d.dept_name;

select d.dept_no, d.dept_name, count(emp_no) as number_employees from dept_emp as de
join departments as d using(dept_no)
where de.to_date > curdate()
group by d.dept_no, d.dept_name
;

select d.dept_name, round(avg(s.salary),2) as average_salary from dept_emp as de
join salaries as s on de.emp_no = s.emp_no
	and de.to_date > curdate()
    and s.to_date > curdate()
join departments as d using(dept_no)
group by d.dept_name 
order by average_salary desc
limit 1;

select e.first_name, e.last_name , s.salary from employees as e
join dept_emp as de on e.emp_no = de.emp_no
	and de.to_date > curdate()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > curdate()
join departments as d on de.dept_no = d.dept_no
	and d.dept_name = 'Marketing'
order by s.salary desc
limit 1;

select e.first_name, e.last_name, s.salary, d.dept_name 
from employees as e
join dept_manager as dm on e.emp_no = dm.emp_no
	and dm.to_date > curdate()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > curdate()
join departments as d using(dept_no)
order by s.salary desc
limit 1;

select d.dept_name,
	round(avg(s.salary), 2) as avg_dept_salary
from departments as d 
join dept_emp as de using(dept_no)
join salaries as s using(emp_no)
group by d.dept_name
order by avg_dept_salary desc;

select * from salaries;
select * from departments;
select * from titles;
select * from dept_emp;
select * from employees;
select * from dept_manager;
select * from departments;





