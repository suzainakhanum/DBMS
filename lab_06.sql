-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-09-08 11:28:48'

create database work;
use work;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate
create table employee(
EmpID varchar(25) primary key,
FirstName varchar(20),
LastName varchar(20),
Salary int,
BirthDate date,
HireDate date
); 

-- 2. Insert 10 records to employee;
INSERT INTO employee (EmpID, FirstName, LastName, Salary, BirthDate, HireDate) VALUES
(1, 'Akash', 'Bhat', 50000, '1999-05-10', '2022-06-15'),
(2, 'Ramesh', 'Kumar', 45000, '1995-08-20', '2020-03-10'),
(3, 'Suresh', 'Sharma', 55000, '1990-01-15', '2018-11-05'),
(4, 'Priya', 'Verma', 60000, '1996-03-25', '2021-01-12'),
(5, 'Kiran', 'Patel', 48000, '1998-07-30', '2022-09-01'),
(6, 'Meena', 'Rao', 52000, '1997-10-12', '2020-05-18'),
(7, 'Rahul', 'Singh', 58000, '1994-02-05', '2019-07-20'),
(8, 'Sneha', 'Nair', 62000, '1993-09-17', '2017-12-01'),
(9, 'Vikas', 'Gupta', 47000, '1999-11-22', '2023-04-10'),
(10, 'Anita', 'Joshi', 53000, '1992-06-28', '2016-08-25');



-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table Orders(
OrderID varchar(25) primary key,
OrderDate date,
totalAmount int,
EmpID varchar(25),
foreign key (EmpID) references employee(EmpID)
);

-- 4. Insert 10 records to Orders
INSERT INTO Orders (OrderID, OrderDate, totalAmount, EmpID) VALUES   
(1, "1999-05-10", 2000, 1),
(2, "1999-05-11", 2000, 2),
(3, "1999-05-12", 2000, 3),
(4, "1999-05-13", 2000, 4),
(5, "1999-05-14", 2000, 5),
(6, "1999-05-15", 2000, 6),
(7, "1999-05-16", 2000, 7),
(8, "1999-05-17", 2000, 8),
(9, "1999-05-18", 2000, 9),
(10, "1999-05-19", 2000, 10);


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
select *from employee;
/*'1','Akash','Bhat','50000','1999-05-10','2022-06-15'
'10','Anita','Joshi','53000','1992-06-28','2016-08-25'
'2','Ramesh','Kumar','45000','1995-08-20','2020-03-10'
'3','Suresh','Sharma','55000','1990-01-15','2018-11-05'
'4','Priya','Verma','60000','1996-03-25','2021-01-12'
'5','Kiran','Patel','48000','1998-07-30','2022-09-01'
'6','Meena','Rao','52000','1997-10-12','2020-05-18'
'7','Rahul','Singh','58000','1994-02-05','2019-07-20'
'8','Sneha','Nair','62000','1993-09-17','2017-12-01'
'9','Vikas','Gupta','47000','1999-11-22','2023-04-10'*/
select * from Orders;
/*'1','1999-05-10','2000','1'
'10','1999-05-19','2000','10'
'2','1999-05-11','2000','2'
'3','1999-05-12','2000','3'
'4','1999-05-13','2000','4'
'5','1999-05-14','2000','5'
'6','1999-05-15','2000','6'
'7','1999-05-16','2000','7'
'8','1999-05-17','2000','8'
'9','1999-05-18','2000','9'
*/
-- Write the SQL Query below this line.




-- Output: 



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(salary)
from employee;


-- Output: 
/*'50000'
'53000'
'45000'
'55000'
'60000'
'48000'
'52000'
'58000'
'62000'
'47000'
*/

/* b. Absolute Values: Show absolute values of salaries */
select ABS(salary)
from employee;
-- Output: 

/* c. Ceiling Values: Get ceiling values of order amounts */
select Ceil(totalAmount)
from Orders;
-- Output: 
/*'2000'
'2000'
'2000'
'2000'
'2000'
'2000'
'2000'
'2000'
'2000'
'2000'
*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*)
from employee;
-- Output: '10'


/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary)
from employee;
-- Output: '530000'

/* c. Average Order Amount: Find average order value */
select avg(totalAmount)
from Orders;
-- Output: '2000.0000'


/* d. Max/Min Salary: Find highest and lowest salaries */
select max(salary)
from employee;
select min(salary)
from employee;
-- Output: '62000' max
-- '45000' min



-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select ucase(FirstName)
from employee;
select lcase(FirstName)
from employee;
-- Output: 
/*'AKASH'
'ANITA'
'RAMESH'
'SURESH'
'PRIYA'
'KIRAN'
'MEENA'
'RAHUL'
'SNEHA'
'VIKAS'
*/
/*'akash'
'anita'
'ramesh'
'suresh'
'priya'
'kiran'
'meena'
'rahul'
'sneha'
'vikas'
*/

/* b. Concatenate Names: Create full names */
select concat(FirstName,LastName)
from employee;
-- Output:
/*'AkashBhat'
'AnitaJoshi'
'RameshKumar'
'SureshSharma'
'PriyaVerma'
'KiranPatel'
'MeenaRao'
'RahulSingh'
'SnehaNair'
'VikasGupta'
*/ 

/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTRING(FirstName, 1, 3)
FROM employee;

-- Output: 
/*'Aka'
'Ani'
'Ram'
'Sur'
'Pri'
'Kir'
'Mee'
'Rah'
'Sne'
'Vik'
*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
select cast(OrderDate as char)
from Orders;
-- Output:
/*'1999-05-10'
'1999-05-19'
'1999-05-11'
'1999-05-12'
'1999-05-13'
'1999-05-14'
'1999-05-15'
'1999-05-16'
'1999-05-17'
'1999-05-18'
*/ 

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select curdate();
select current_time();
-- Output: '2025-09-08','12:19:20'


/* b. Extract Year: Get year from order dates */
SELECT extract(year from OrderDate)
FROM Orders;
-- Output: 
/*'1999'
'1999'
'1999'
'1999'
'1999'
'1999'
'1999'
'1999'
'1999'
'1999'
*/
/* c. Add Months: Add 3 months to order dates */
SELECT extract(month from OrderDate) + 3
FROM Orders;
-- Output: 
/*'8'
'8'
'8'
'8'
'8'
'8'
'8'
'8'
'8'
'8'
*/

/* d. Days Since Order: Calculate days between order date and now */
select OrderID, datediff(now() , OrderDate)
from Orders;
-- Output: 
/*'1','9618'
'10','9609'
'2','9617'
'3','9616'
'4','9615'
'5','9614'
'6','9613'
'7','9612'
'8','9611'
'9','9610'
*/

-- END of the Task -- 