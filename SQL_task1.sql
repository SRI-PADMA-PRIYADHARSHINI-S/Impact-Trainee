CREATE DATABASE TASK;
USE TASK;
create table emp_table(
emp_ID VARCHAR(5) PRIMARY KEY, 
emp_name varchar(20), 
emp_salary DECIMAL(7,2),
emp_doj varchar(20)
);
 
create table dept_table(
dept_ID VARCHAR(5) PRIMARY KEY NOT NULL,
dept_name VARCHAR(25) NOT NULL,
dept_manager VARCHAR(25) NOT NULL,
dept_salary DECIMAL(7,2) NOT NULL
);
 
create table project_table(
project_ID VARCHAR(5) PRIMARY KEY NOT NULL,
project_name VARCHAR(25) NOT NULL,
project_manager VARCHAR(30) NOT NULL
);
 
INSERT INTO project_table VALUES
('P1','Project01','Gopi'),
('P2','Project02','Ram'),
('P3','Project01','Siva');
 
drop table project_table;
select * from project_table;
 
INSERT INTO dept_table VALUES
('D1','Testing','Renu', 65000),
('D2','Developer','Vimal',66000),
('D3','.Net','Jayaram',75000),
('D4','HR','Revathi', 55000),
('D5','Insurance','Rimali',35000);
 
select * from dept_table;
 
INSERT INTO emp_table VALUES 
('E1','Ilmathi', 20000, '2024-11-13'),
('E2','Tharu', 40000, '2024-11-14'),
('E3','Jo', 55000, '2024-11-15'),
('E4','Jeeva', 78000, '2024-11-17'),
('E5', 'Hari', 45000, '2020-05-22');
 
ALTER TABLE emp_table ADD dept_name VARCHAR(30), ADD dept_ID VARCHAR(10), ADD manager VARCHAR(10);
UPDATE emp_table set dept_name='HR',  dept_ID='D1', manager='Renu' WHERE emp_ID='E1';
UPDATE emp_table set dept_name='Developer',  dept_ID='D2', manager='Vimal' WHERE emp_ID='E2';
UPDATE emp_table set dept_name='Testing',  dept_ID='D3', manager='Jayaram' WHERE emp_ID='E3';
UPDATE emp_table set dept_name='.NET',  dept_ID='D4', manager='Revathi' WHERE emp_ID='E4';
UPDATE emp_table set dept_name='Insurance',  dept_ID='D5', manager='Rimali' WHERE emp_ID='E5';
 
 
 
drop table emp_table;
 
-- Write a query to display all rows and columns from the employees table.
SELECT * FROM emp_table;
SET SQL_SAFE_UPDATES = 0;
 
-- Retrieve only the name and salary of all employees from the employees table
SELECT emp_name, emp_salary from emp_table;
 
-- Write a query to find all employees whose salary is greater than 50,000. 
SELECT * FROM emp_table where emp_salary>50000;
 
-- List all employees who joined the company in the year 2020.
SELECT * from emp_table where YEAR(emp_doj)=2020;
 
-- Retrieve the details of employees whose names start with the letter 'A'.
SELECT * from emp_table WHERE emp_name LIKE 'A%';
 
 
-- Write a query to calculate the average salary of all employees.
SELECT AVG(emp_salary) as emp_avg_sal from emp_table;
 
-- Find the total number of employees in the company.
SELECT COUNT(emp_ID) FROM emp_table;
 
-- Write a query to find the highest salary in the employees table.
SELECT * from emp_table where emp_salary=(select MAX(emp_salary) from emp_table);
 
-- Calculate the total salary paid by the company for all employees.
SELECT SUM(emp_salary) as overall_sal from emp_table;
 
-- Find the count of employees in each department.
SELECT dept_name , COUNT(*) FROM emp_table GROUP BY dept_name;
 
-- Write a query to retrieve employee names along with their department names
SELECT emp_table.emp_name, dept_table.dept_name from emp_table inner join dept_table on emp_table.dept_ID=dept_table.dept_ID;
 
-- List all employees who have a manager (self-join on employees table).
select A.emp_name, B.manager from emp_table A 
join emp_table B ON B.emp_id=A.emp_id where B.manager IS NOT NULL;
 
-- Find the names of employees who are working on multiple projects (using employees and projects tables).
SELECT E.emp_name
FROM emp_table E
JOIN project_table P ON e.emp_ID = P.emp_ID
GROUP BY E.emp_name
HAVING COUNT(DISTINCT P.project_ID) > 1;
 
-- Write a query to display all projects and the employees assigned to them.
SELECT project_table.project_name, emp_table.emp_name
FROM project_table
INNER JOIN emp_table
ON project_table.emp_ID= emp_table.emp_ID;
 
-- Retrieve the names of employees who do not belong to any department.
SELECT emp_table.emp_name from emp_table
LEFT JOIN dept_table
on emp_table.emp_ID = dept_table.dept_ID
where dept_table.dept_ID IS NULL;
 
-- Write a query to find the employees with the second-highest salary.
select MAX(emp_salary) FROM emp_table
WHERE emp_salary<(SELECT MAX(emp_salary) FROM emp_table);
 
-- Retrieve the names of employees whose salary is above the department average salary.
SELECT emp_name from emp_table
INNER JOIN dept_table
ON emp_ID=dept_ID
WHERE emp_salary > (
SELECT AVG(emp_salary) FROM emp_table
INNER JOIN dept_table
ON emp_ID=dept_ID
WHERE  dept_ID=dept_ID
);
 
ALTER table dept_table ADD dept_loc VARCHAR(30);
UPDATE dept_table set dept_loc='New York' where dept_ID='D1';
UPDATE  dept_table set dept_loc='New York' where dept_ID='D2';
UPDATE  dept_table set dept_loc='Chennai' where dept_ID='D3';
UPDATE  dept_table set dept_loc='Chennai' where dept_ID='D4';
UPDATE  dept_table set dept_loc='Salem' where dept_ID='D5';
UPDATE  dept_table set dept_loc='Salem' where dept_ID='D6';
 
 
-- List all employees who work in a department located in 'New York'
select * from dept_table where dept_ID in ( select dept_ID from emp_table where dept_loc='Chennai');
 
-- Write a query to find employees who work in either the 'HR' or 'Finance' department.
select * from emp_table where dept_ID in (SELECT dept_ID from dept_table where dept_name in ('HR','Finance'));
 
ALTER table emp_table ADD project_ID varchar(5);
UPDATE emp_table SET project_ID='D1' where emp_ID='E1';
UPDATE emp_table SET project_ID='D2' where emp_ID='E2';
UPDATE emp_table SET project_ID='D3' where emp_ID='E3';
 
alter table project_table add emp_ID varchar(5);
UPDATE project_table set emp_ID='E1' where project_ID='P1';
UPDATE project_table set emp_ID='E2' where project_ID='P2';
UPDATE project_table set emp_ID='E3' where project_ID='P3';
 
 
-- Retrieve the names of employees who are working on both Project 01 and Project 02.
SELECT e.emp_name
FROM emp_table e
JOIN project_table P ON e.emp_ID = P.emp_ID
WHERE P.project_ID IN ('Project01', 'Project02')
GROUP BY e.emp_name
HAVING COUNT(DISTINCT P.project_ID) = 2;
 
-- Find employees who are not assigned to any project.
select * from emp_table e join project_table p on e.emp_ID = p.emp_ID WHERE p.project_name is NULL;
 
-- Write a query to add a new employee to the employees table.
UPDATE emp_table SET emp_ID = 'E6', emp_name='Suwathi', emp_salary=56000, emp_doj='2018-04-12', dept_name='Admin', dept_ID='D6', manager='Alan', project_ID='D4';
SELECT * FROM emp_table;
 
-- Update the salary of all employees in the 'IT' department by 10%.
UPDATE emp_table
SET emp_salary = emp_salary * 1.10
WHERE dept_name = 'HR';
SELECT * FROM emp_table;
 
-- Delete all employees who have not worked for more than 5 years.
DELETE FROM emp_table
WHERE emp_doj <= CURDATE() - INTERVAL 4 YEAR;
select * from emp_table;
 
 
-- Add a unique constraint to the email column in the employees table
ALTER table emp_table add emp_email varchar(50) UNIQUE;
 