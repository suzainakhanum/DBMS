CREATE DATABASE PayrollDB;
USE PayrollDB;

-- Table: Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

desc Departments;

-- Table: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

desc Employees;

-- Table: Salaries
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    basic_salary DECIMAL(10,2),
    allowances DECIMAL(10,2),
    deductions DECIMAL(10,2),
    pay_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

desc Salaries;

-- Departments
INSERT INTO Departments VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Marketing');

select * from Departments;

-- OUTPUT :
-- 1	Human Resources
-- 2	Finance
-- 3	IT
-- 4	Sales
-- 5	Marketing
	

-- Employees
INSERT INTO Employees VALUES
(101, 'Asha', 'Rao', '2020-01-15', 1),
(102, 'Rahul', 'Kumar', '2019-03-22', 2),
(103, 'Sneha', 'Patil', '2021-07-10', 3),
(104, 'Rohit', 'Sharma', '2022-09-05', 4),
(105, 'Neha', 'Singh', '2021-05-12', 5),
(106, 'Vikram', 'Gupta', '2020-11-10', 3),
(107, 'Meera', 'Joshi', '2019-12-18', 2),
(108, 'Arjun', 'Desai', '2022-02-20', 1),
(109, 'Ananya', 'Patel', '2021-08-25', 4),
(110, 'Kiran', 'Das', '2020-06-30', 5);

select * from Employees;

-- OUTPUT :
-- 101	Asha	Rao	2020-01-15	1
-- 102	Rahul	Kumar	2019-03-22	2
-- 103	Sneha	Patil	2021-07-10	3
-- 104	Rohit	Sharma	2022-09-05	4
-- 105	Neha	Singh	2021-05-12	5
-- 106	Vikram	Gupta	2020-11-10	3
-- 107	Meera	Joshi	2019-12-18	2
-- 108	Arjun	Desai	2022-02-20	1
-- 109	Ananya	Patel	2021-08-25	4
-- 110	Kiran	Das	2020-06-30	5
-- 				

-- Salaries
INSERT INTO Salaries VALUES
(1, 101, 40000.00, 5000.00, 2000.00, '2025-10-01'),
(2, 102, 55000.00, 8000.00, 3500.00, '2025-10-01'),
(3, 103, 60000.00, 10000.00, 4000.00, '2025-10-01'),
(4, 104, 45000.00, 7000.00, 2500.00, '2025-10-01'),
(5, 105, 48000.00, 6000.00, 3000.00, '2025-10-01'),
(6, 106, 62000.00, 9000.00, 5000.00, '2025-10-01'),
(7, 107, 53000.00, 4000.00, 2000.00, '2025-10-01'),
(8, 108, 47000.00, 3000.00, 1000.00, '2025-10-01'),
(9, 109, 51000.00, 5000.00, 2500.00, '2025-10-01'),
(10, 110, 48000.00, 6000.00, 2000.00, '2025-10-01');

select * from Salaries;

-- OUTPUT :
-- 1	101	40000.00	5000.00	2000.00	2025-10-01
-- 2	102	55000.00	8000.00	3500.00	2025-10-01
-- 3	103	60000.00	10000.00	4000.00	2025-10-01
-- 4	104	45000.00	7000.00	2500.00	2025-10-01
-- 5	105	48000.00	6000.00	3000.00	2025-10-01
-- 6	106	62000.00	9000.00	5000.00	2025-10-01
-- 7	107	53000.00	4000.00	2000.00	2025-10-01
-- 8	108	47000.00	3000.00	1000.00	2025-10-01
-- 9	109	51000.00	5000.00	2500.00	2025-10-01
-- 10	110	48000.00	6000.00	2000.00	2025-10-01


-- Queries

-- Total Salary Payout
SELECT SUM(Salaries.basic_salary + Salaries.allowances - Salaries.deductions) AS Total_Payout
FROM Salaries;

-- OUTPUT : 544500.00

-- Average Salary
SELECT AVG(Salaries.basic_salary + Salaries.allowances - Salaries.deductions) AS AVG_Salary
FROM Salaries;

-- OUTPUT : 54450.000000

-- Maximum and Minimum Salary
SELECT MAX(Salaries.basic_salary + Salaries.allowances - Salaries.deductions) AS MAX_Salary,
	   MIN(Salaries.basic_salary + Salaries.allowances - Salaries.deductions) AS MIN_Salary
FROM Salaries;

-- OUTPUT : 66000.00	43000.00

-- Total Employees Per Department
SELECT Departments.dept_name,
	   COUNT(Employees.emp_id) AS Total_Employees
FROM Employees
JOIN Departments
ON Employees.dept_id = Departments.dept_id
GROUP BY Departments.dept_id;

-- OUTPUT :
-- Human Resources	2
-- Finance	2
-- IT	2
-- Sales	2
-- Marketing	2

-- Employees Details with  Department and Net Salary
SELECT Employees.emp_id,
	   CONCAT(Employees.first_name, ' ', Employees.last_name) AS FullName,
       Departments.dept_name,
       Salaries.basic_salary , Salaries.allowances , Salaries.deductions,
       (Salaries.basic_salary + Salaries.allowances - Salaries.deductions) AS NetSalary
FROM Employees
JOIN Salaries
ON Employees.emp_id = Salaries.emp_id
JOIN Departments
ON Employees.dept_id = Departments.dept_id;

-- OUTPUT :
-- 101	Asha Rao	Human Resources	40000.00	5000.00	2000.00	43000.00
-- 108	Arjun Desai	Human Resources	47000.00	3000.00	1000.00	49000.00
-- 102	Rahul Kumar	Finance	55000.00	8000.00	3500.00	59500.00
-- 107	Meera Joshi	Finance	53000.00	4000.00	2000.00	55000.00
-- 103	Sneha Patil	IT	60000.00	10000.00	4000.00	66000.00
-- 106	Vikram Gupta	IT	62000.00	9000.00	5000.00	66000.00
-- 104	Rohit Sharma	Sales	45000.00	7000.00	2500.00	49500.00
-- 109	Ananya Patel	Sales	51000.00	5000.00	2500.00	53500.00
-- 105	Neha Singh	Marketing	48000.00	6000.00	3000.00	51000.00
-- 110	Kiran Das	Marketing	48000.00	6000.00	2000.00	52000.00


-- Procedure
-- Insert New Record
DELIMITER //
CREATE PROCEDURE InsertSalary(
    IN p_salary_id INT,
    IN p_emp_id INT,
    IN p_basic_salary DECIMAL(10,2),
    IN p_allowances DECIMAL(10,2),
    IN p_deductions DECIMAL(10,2),
    IN p_pay_date DATE
)
BEGIN
    INSERT INTO Salaries VALUES (p_salary_id, p_emp_id, p_basic_salary, p_allowances, p_deductions, p_pay_date);
END //
DELIMITER ;

-- UPDATE Salary 

DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_basic_salary DECIMAL(10,2),
    IN p_allowances DECIMAL(10,2),
    IN p_deductions DECIMAL(10,2)
)
BEGIN
    UPDATE Salaries
    SET basic_salary = p_basic_salary,
        allowances = p_allowances,
        deductions = p_deductions
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

