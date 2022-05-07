-- Creating tables for PH-EmployeeDB
create table departments (
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
	);
	
create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	primary key (emp_no)
);



create table dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

create table dept_emp (
	emp_no int not null,
	dept_no varchar(6) not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no)
);


create table titles (
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, from_date)
);



select * from departments;

select * from employees;

select * from titles;

select * from salaries;

select * from dept_manager;

select * from dept_emp;

select first_name, last_name
from employees
where birth_date BETWEEN '1952-01-01' AND '1955-12-31'

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

--Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1885-01-01' AND '1988-12-31');

-- Number the employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1885-01-01' AND '1988-12-31');

--Create a new table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND ' 1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;





SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND ' 1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info