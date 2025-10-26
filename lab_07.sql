-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    USER(),
    @@hostname AS Host_Name,
    VERSION() AS MySQL_Version,
    NOW() AS Current_Date_Time;
-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-09-15 18:55:56'

-- Write your code below this line along with the output 

create database employee;
use employee;
CREATE TABLE Employees (  
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(100),  
    Age INT,  
    Salary DECIMAL(10,2),  
    DepartmentID INT,  
    HireDate DATE,  
    Address VARCHAR(255)  
);  

INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 

/* 
Exercise 1: Arithmetic Operators
Addition, Subtraction, Multiplication, Division
Q1 - Add a bonus (10% of Salary) to each employee’s salary. */

UPDATE Employees
SET Salary = Salary + (Salary * 0.10);
select * from Employees;

/* 
Q2 - Subtract tax (15% of Salary) from each employee’s salary.
 
Q3 - Calculate the yearly salary from the monthly salary.

-- Modulus Operator
Q4 - Find the remainder when employees’ ages are divided by 5.*/

--  Write your code below this line along with the output  

Select Salary*0.85 AS Salary_tax from Employees;  
  
update Employees
set Salary = Salary*0.85;  
  
select Salary*12 AS Annual_salary from Employees;  
/*
673200.00
617100.00
841500.00
1009800.00
561000.00
785400.00
650760.00
1099560.00
718080.00
953700.00
*/
select age%5 as remainder_5 from Employees;
/*
0
3
0
0
2
2
4
0
1
3
*/
/* Exercise 2: Logical Operators: AND, OR, NOT

Q5 - Retrieve employees older than 30 AND with salary > 50000.

Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.

Q7 - Retrieve employees NOT living in City G.*/




-- Write your code below this line along with the output 

select * from Employees
where Age >30 and Salary>50000;
/* 
 3	Charlie Brown	35	70125.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	84150.00	3	2018-07-25	101 Maple St, City D
6	Frank Miller	32	65450.00	5	2020-11-18	303 Cedar St, City F
8	Hank Adams	45	91630.00	2	2017-12-12	505 Spruce St, City H
9	Ivy Green	31	59840.00	4	2023-02-14	606 Redwood St, City I
10	Jack White	38	79475.00	5	2019-08-08	707 Elm St, City J
*/
		
select * from Employees where DepartmentID=1 or Salary >70000;
/*
1	Alice Johnson	30	56100.00	1	2020-03-15	123 Main St, City A
3	Charlie Brown	35	70125.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	84150.00	3	2018-07-25	101 Maple St, City D
7	Grace Lee	29	54230.00	1	2021-04-05	404 Walnut St, City G
8	Hank Adams	45	91630.00	2	2017-12-12	505 Spruce St, City H
10	Jack White	38	79475.00	5	2019-08-08	707 Elm St, City J
*/						
 select * from Employees where Address != 'City G'; 
 /*
1	Alice Johnson	30	56100.00	1	2020-03-15	123 Main St, City A
3	Charlie Brown	35	70125.00	3	2019-01-10	789 Pine St, City C
4	David Wilson	40	84150.00	3	2018-07-25	101 Maple St, City D
7	Grace Lee	29	54230.00	1	2021-04-05	404 Walnut St, City G
8	Hank Adams	45	91630.00	2	2017-12-12	505 Spruce St, City H
10	Jack White	38	79475.00	5	2019-08-08	707 Elm St, City J
*/						
/* Exercise 3: Comparison Operators

Q8 - Equality, Inequality, Greater Than, Less Than

Q9 - Find employees with salary = 60000.

Q10 -  
Q11 - Retrieve employees younger than 25 with salary > 50000 

Q12 - List employees aged 25–35.

Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).

Q14 - Find employees with names starting with A.

Q15 - List employees with no address.

*/

-- Write your code below this line along with the output 

select * from Employees
where Salary = 60000;

select * from Employees;

SELECT *FROM Employees WHERE age BETWEEN 25 AND 35;

SELECT * FROM Employees WHERE DepartmentID IN (1, 2, 3);

SELECT *
FROM Employees
WHERE Name LIKE 'A%';

SELECT *
FROM Employees
WHERE Address IS NULL OR Address = '';

/*

Exercise 5: Set Operators: UNION.

Q16 - Retrieve names from the HR department hired in 2022 OR 2023.

Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.

Q18 - Find employees hired in 2023 but not in 2022. */

SELECT name
FROM Employees
WHERE DepartmentID = 1
  AND (YEAR(HireDate) = 2022 OR YEAR(HireDate) = 2023);
  
SELECT EmployeeID, name
FROM Employees
WHERE DepartmentID = 3
GROUP BY EmployeeID, name
HAVING 
    SUM(CASE WHEN YEAR(HireDate) < 2020 THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN YEAR(HireDate) > 2020 THEN 1 ELSE 0 END) > 0;
    
    
SELECT *
FROM Employees
WHERE YEAR(HireDate) = 2023
  AND EmployeeID NOT IN (
      SELECT EmployeeID
      FROM Employees
      WHERE YEAR(HireDate) = 2022
  );
