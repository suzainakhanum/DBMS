-- Employee Management System
-- STUDENT NAME : suzaina khanum
-- USN : 1RUA24BCA0088
-- Section : A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
-- output: 'root@localhost','Puranik-MacBook-Air.local','8.0.28','2025-10-15 19:02:43'

create database EmployeeManagementSystem;
use EmployeeManagementSystem;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert Departments
INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Pune'),
(3, 'Sales', 'Mumbai'),
(4, 'Finance', 'Delhi');

-- Insert Employees
INSERT INTO Employee (emp_id, emp_name, age, salary, designation, address, doj, dept_id) VALUES
(101, 'Ananya Rao', 28, 55000, 'HR Executive', 'Pune', '2021-04-10', 2),
(102, 'Rohan Singh', 30, 70000, 'Developer', 'Bangalore', '2019-06-12', 1),
(103, 'Priya Sharma', 25, 45000, 'Developer', 'Mumbai', '2022-01-15', 1),
(104, 'Vikram Das', 35, 60000, 'Sales Manager', 'Delhi', '2018-03-20', 3),
(105, 'Sneha Patil', 29, 52000, 'Accountant', 'Pune', '2020-08-05', 4);


-- 3. Update query 
-- Increase 5000 for all employees who work as 'Developer'.

UPDATE Employee
SET salary = salary + 5000
WHERE designation = 'Developer';

-- 4.Select with aggregate functions 
-- Display total employees, average, highest, and lowest salary per department.

SELECT dept_id, 
	COUNT(emp_id) AS total_employees,
    AVG(salary) AS Avgsalary,
    MAX(salary) AS maxsalary,
    MIN(salary) AS minsalary
FROM employee
GROUP BY dept_id;

-- Output:
-- '4','1','52000.000000','52000.00','52000.00'
-- '3','1','60000.000000','60000.00','60000.00'
-- '2','1','55000.000000','55000.00','55000.00'
-- '1','2','62500.000000','75000.00','50000.00'

-- SELECT with STRING FUNCTIONS
-- Q5. Display each employee’s name and designation in uppercase and also show a new
-- column combining their name and job title in a single sentence like:
-- “Ananya Rao works as HR Executive”.

SELECT 
	UPPER(emp_name) AS name_uppercase,
    UPPER(designation) AS designation_uppercase,
    CONCAT(emp_name , ' work as ' , designation) AS employee_info
FROM Employee;

-- Output:

-- 'ANANYA RAO','HR EXECUTIVE','Ananya Rao work as HR Executive'
-- 'ROHAN SINGH','DEVELOPER','Rohan Singh work as Developer'
-- 'PRIYA SHARMA','DEVELOPER','Priya Sharma work as Developer'
-- 'VIKRAM DAS','SALES MANAGER','Vikram Das work as Sales Manager'
-- 'SNEHA PATIL','ACCOUNTANT','Sneha Patil work as Accountant'

-- 6. SELECT with DATE FUNCTIONS
-- Q6. Write a query to display each employee’s joining year and the number of years they
-- have worked in the company till date.
SELECT
	emp_name, 
	YEAR(doj) AS joining_year,
    YEAR(CURDATE()) -  YEAR(doj) AS years_worked
FROM Employee;

-- Output:
-- 'Ananya Rao','2021','4'
-- 'Rohan Singh','2019','6'
-- 'Priya Sharma','2022','3'
-- 'Vikram Das','2018','7'
-- 'Sneha Patil','2020','5'

-- 7. SELECT using OPERATORS
-- Q7. List the names and salaries of employees whose salary is between ₹40,000 and
-- ₹80,000, excluding those who belong to the Sales department.

DESC Employee;

DESC Department;

SELECT emp_name, salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE salary BETWEEN 40000 AND 80000
AND d.dept_name <> 'Sales';


-- Output:
-- 'Ananya Rao','55000.00'
-- 'Rohan Singh','75000.00'
-- 'Priya Sharma','50000.00'
-- 'Sneha Patil','52000.00'


-- 8. INNER JOIN QUERY
-- Q8. Write a query to display each employee’s name, designation, department name, and
-- location using an INNER JOIN between Employee and Department tables.

SELECT 
    e.emp_name,
    e.designation,
    d.dept_name,
    d.location
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

-- output:
-- 'Rohan Singh','Developer','IT','Bangalore'
-- 'Priya Sharma','Developer','IT','Bangalore'
-- 'Ananya Rao','HR Executive','HR','Pune'
-- 'Vikram Das','Sales Manager','Sales','Mumbai'
-- 'Sneha Patil','Accountant','Finance','Delhi'

-- 9. LEFT OUTER JOIN QUERY
-- Q9. Display all employees and their department names using a LEFT OUTER JOIN.
-- (Include employees even if they are not assigned to any department.)

SELECT 
    e.emp_name,
    e.designation,
    d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

-- Output:
-- 'Ananya Rao','HR Executive','HR'
-- 'Priya Sharma','Developer','IT'
-- 'Rohan Singh','Developer','IT'
-- 'Sneha Patil','Accountant','Finance'
-- 'Vikram Das','Sales Manager','Sales'


-- 10. RIGHT OUTER JOIN QUERY
-- Q10. Display all departments and the employees working in them using a RIGHT OUTER
-- JOIN.
-- (Include departments even if they currently have no employees.)

SELECT 
    e.emp_name,
    e.designation,
    d.dept_name
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id = d.dept_id;

-- Output:
-- 'Rohan Singh','Developer','IT'
-- 'Priya Sharma','Developer','IT'
-- 'Ananya Rao','HR Executive','HR'
-- 'Vikram Das','Sales Manager','Sales'
-- 'Sneha Patil','Accountant','Finance'


-- 11. STORED PROCEDURE – INSERT
-- Q11. Create a stored procedure named InsertEmployee that accepts employee details as
-- parameters and inserts a new record into the Employee table.
-- Execute the procedure to insert a new employee record.

DELIMITER //

CREATE PROCEDURE InsertEmployee(
    IN p_emp_id INT,
    IN p_emp_name VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(50),
    IN p_address VARCHAR(100),
    IN p_doj DATE,
    IN p_dept_id INT
)
BEGIN
    INSERT INTO Employee VALUES(p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id);
END //

DELIMITER ;


CALL InsertEmployee(106, 'Karan Mehta', 32, 58000, 'Developer', 'Delhi', '2023-07-10', 1);


-- 12. STORED PROCEDURE – UPDATE
-- Q12. Create a stored procedure named UpdateSalary that updates an employee’s salary
-- based on their emp_id.
-- Call the procedure to update a specific employee’s salary.

DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;


CALL UpdateSalary(102, 78000);


-- 13. STORED PROCEDURE – DELETE
-- Q13. Create a stored procedure named DeleteEmployee that deletes an employee record
-- from the Employee table based on the given emp_id.
-- Call the procedure to remove an employee record.

DELIMITER //

CREATE PROCEDURE DeleteEmployee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM Employee
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;


CALL DeleteEmployee(105);

-- 14. COMPREHENSIVE QUERY
-- Q14. Display a report showing:
--  Employee Name
--  Department Name
--  Years Worked
--  Salary after increment
-- for all employees who have worked more than 2 years in the company.

SELECT 
    e.emp_name,
    d.dept_name,
    TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS years_worked,
    e.salary + 5000 AS salary_after_increment
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2;

-- Output:
-- 'Rohan Singh','IT','6','83000.00'
-- 'Priya Sharma','IT','3','55000.00'
-- 'Ananya Rao','HR','4','60000.00'
-- 'Vikram Das','Sales','7','65000.00'






