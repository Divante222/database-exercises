create table quote(
id INT NOT NULL auto_increment,
author varchar(50) NOT NULL,
content varchar(240) NOT NULL,
primary key(id));

describe quote;

alter table quote
add unique(content);
describe quote;

create table authors(
id int not null auto_increment,
first_name varchar(100) not null,
last_name varchar(100) not null, 
primary key (id),
unique(first_name, last_name));

describe authors;

show create table authors;
/*'authors', 'CREATE TABLE `authors` (\n  `id` int NOT NULL AUTO_INCREMENT,\n  
`first_name` varchar(100) NOT NULL,\n  `last_name` varchar(100) NOT NULL,\n  
PRIMARY KEY (`id`),\n  UNIQUE KEY `first_name` (`first_name`,`last_name`)\n) 
ENGINE=InnoDB DEFAULT CHARSET=latin1'*/

show create table employees;
/*CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1*/
use employees;

alter table employee
add unique(birth_date);

describe employees;
use pagel_2194;

create table authors(
id int not null auto_increment,
first_name varchar(100) not null,
last_name varchar(100) not null,
primary key(id),
unique(first_name,last_name));
describe authors;

use employees;

describe employees;
