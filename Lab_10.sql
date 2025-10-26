-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A

SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- root@localhost RVU-PC-025 8.4.6 2025-10-13 11:39:05
-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:
create database DBLab008;
use DBLab008;

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
create table Employee (
empid INT PRIMARY KEY,
empname VARCHAR(50),
age INT,
salary DECIMAL(10,2),
designation VARCHAR(30),
address VARCHAR(100),
date_of_join DATE
);

desc Employee;

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
salary decimal(10,2) YES
empname varchar(50) YES
empid int NO PRI
designation varchar(30) YES
date_of_join date YES
age int YES
address varchar(100) YES


-- insert 10 records to the table
-- Write your SQL query below Codespace:
INSERT INTO Employee(empid, empname, age, salary , designation , address, date_of_join)
VALUES
(101, 'Amit Sharma', 29, 55000.00, 'Software Engineer', '123 MG Road, Bengaluru', '2023-06-15'),
(102, 'Priya Menon', 34, 72000.00, 'Project Manager', '45 Residency Road, Bengaluru', '2022-03-10'),
(103, 'Rahul Verma', 26, 48000.00, 'QA Analyst', '78 Indiranagar, Bengaluru', '2024-01-20'),
(104, 'Sneha Reddy', 31, 60000.00, 'UI/UX Designer', '56 Koramangala, Bengaluru', '2023-09-05'),
(105, 'Karan Joshi', 28, 51000.00, 'DevOps Engineer', '89 Whitefield, Bengaluru', '2022-11-30'),
(106, 'Meera Iyer', 40, 85000.00, 'HR Manager', '12 Jayanagar, Bengaluru', '2021-07-18'),
(107, 'Vikram Singh', 35, 78000.00, 'Data Scientist', '34 HSR Layout, Bengaluru', '2023-04-22'),
(108, 'Anjali Desai', 30, 62000.00, 'Business Analyst', '67 BTM Layout, Bengaluru', '2022-08-14'),
(109, 'Rohit Nair', 27, 50000.00, 'Frontend Developer', '90 Bannerghatta Road, Bengaluru', '2024-05-01'),
(110, 'Divya Kapoor', 33, 70000.00, 'Backend Developer', '21 Malleshwaram, Bengaluru', '2023-12-09');

SELECT * FROM Employee;
-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
101 Amit Sharma 29 55000.00 Software Engineer 123 MG Road, Bengaluru 2023-06-15
102 Priya Menon 34 72000.00 Project Manager 45 Residency Road, Bengaluru 2022-03-10
103 Rahul Verma 26 48000.00 QA Analyst 78 Indiranagar, Bengaluru 2024-01-20
104 Sneha Reddy 31 60000.00 UI/UX Designer 56 Koramangala, Bengaluru 2023-09-05
105 Karan Joshi 28 51000.00 DevOps Engineer 89 Whitefield, Bengaluru 2022-11-30
106 Meera Iyer 40 85000.00 HR Manager 12 Jayanagar, Bengaluru 2021-07-18
107 Vikram Singh 35 78000.00 Data Scientist 34 HSR Layout, Bengaluru 2023-04-22
108 Anjali Desai 30 62000.00 Business Analyst 67 BTM Layout, Bengaluru 2022-08-14
109 Rohit Nair 27 50000.00 Frontend Developer 90 Bannerghatta Road, Bengaluru 2024-05-01
110 Divya Kapoor 33 70000.00 Backend Developer 21 Malleshwaram, Bengaluru 2023-12-09


-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure



-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
DELIMITER //

CREATE PROCEDURE InsertEmployee (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    INSERT INTO Employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
END //

DELIMITER ;


-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.

      -- If not, display a message: "Invalid age, employee not added."
DELIMITER //

CREATE PROCEDURE InsertEmployeeWithAgeCheck (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    IF p_age BETWEEN 18 AND 60 THEN
        INSERT INTO Employee(empid, empname, age, salary, designation, address, date_of_join)
        VALUES (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
    ELSE
        SELECT 'Invalid age, employee not added.' AS Message;
    END IF;
END //

DELIMITER ;


       
   


-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
DELIMITER //

CREATE PROCEDURE InsertEmployeeWithDefaultSalary (
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    DECLARE final_salary DECIMAL(10,2);

    IF p_salary IS NULL THEN
        SET final_salary = 20000.00;
    ELSE
        SET final_salary = p_salary;
    END IF;

    INSERT INTO Employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES (p_empid, p_empname, p_age, final_salary, p_designation, p_address, p_date_of_join);
END //

DELIMITER ;
         

-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER //

CREATE PROCEDURE ThreeEmployees ()
BEGIN
    INSERT INTO Employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES
    (201, 'Neha Rao', 27, 52000.00, 'Content Writer', '12 MG Road, Bengaluru', '2024-03-01'),
    (202, 'Arjun Mehta', 32, 68000.00, 'Marketing Lead', '45 Indiranagar, Bengaluru', '2023-07-15'),
    (203, 'Tanya Singh', 25, 49000.00, 'Graphic Designer', '78 Koramangala, Bengaluru', '2024-10-10');
END //

DELIMITER ;


     




     









-- B.  Update Procedure

-- Update Salary:
-- Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.
 
DELIMITER //

create procedure UpdateSalary (
	IN p_empid INT,
    IN p_new_salary decimal(10, 2)
)
BEGIN 
	Update Employee
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;
    


-- Increment Salary by Percentage:
-- Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.
DELIMITER //

create procedure IncrementsalaryforManagers ()
BEGIN 
	Update Employee
    SET salary  = salary * 1.10
    WHERE designation LIKE '%Manager%';
END //

DELIMITER ;

-- Update Designation:
-- Write a procedure to update the designation of an employee by empid.
-- Example: Promote an employee from 'Clerk' to 'Senior Clerk'.
DELIMITER //

create procedure Updatedesignation (
	IN p_emp_id INT,
    IN p_new_designation VARCHAR(30)
)
BEGIN 
	Update Employee
    SET designation = p_new_designation
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;

-- Update Address:
-- Write a procedure to update the address of an employee when empid is given as input.
DELIMITER //

create procedure updateaddress (
	IN p_emp_id INT,
    IN p_new_address VARCHAR(100)
)
BEGIN 
	UPDATE Employee
    SET address = p_new_address
    WHERE  emp_id = p_emp_id;
END //

DELIMITER ;

-- Conditional Update (Age Check):
-- Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."
DELIMITER  // 

create procedure ConditionalSalaryUpdate (
	IN p_emp_id INT,
    IN p_new_salary DECIMAL(10, 2)
)
BEGIN 
	DECLARE emp_age INT;
    
    SELECT age INTO emp_age 
    FROM Employee
    WHERE emp_id = p_emp_id;
    
    If emp_age > 40 THEN 
    update Employee
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
ELSE 
	SELECT ' Not eligible for salary update.' AS Message;
  END IF;
END //

DELIMITER ;
    


-- C. Delete Procedure

-- Delete by empid:
-- Write a stored procedure named DeleteEmployee to delete an employee record using their empid.
DELIMITER //

create procedure DeleteEmployee (
	IN p_emp_id INT
)
BEGIN 
	DELETE FROM Employee
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;

-- Delete by Designation:
-- Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').
DELIMITER //

create procedure DeleteBYDestination (
	IN p_designation VARCHAR(30)
)

BEGIN 
	DELETE FROM Employee
    WHERE designation = p_designation;
END //

DELIMITER ;

-- Delete Based on Salary Range:
-- Write a procedure to delete employees whose salary is less than ₹15000.

DELIMITER //

create procedure DeleteLowSalaryEmployees ()
BEGIN 
	DELETE FROM Employee
    WHERE salary < 15000;
END //

DELIMITER ;

-- Delete by Joining Year:
-- Write a procedure to delete employees who joined before the year 2015.

DELIMITER //

create procedure deletebyJoiningYear ()
BEGIN 
	DELETE FROM Employee
    WHERE YEAR(date_of_join) < 2015;
END //

DELIMITER ;

-- End of Lab Experiment
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01