CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

select * from titles;

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(25)
);
select * from departments;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (5) NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT(25) NULL,
	last_name VARCHAR NOT(25) NULL,
	sex VARCHAR NOT(1) NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
select * from employees;

-- setup two primary keys since the dept_emp table has many-many relationship,


CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR (4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from salaries


-- setup two primary keys since the dept_manager table has many-many relationship,
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from dept_manager;

