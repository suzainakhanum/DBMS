/*Activity:
1. School Database (Example Tables) 
(StudentID, FirstName, LastName, DOB, Class, Marks, City)
(TeacherID, FirstName, LastName, Subject, HireDate, Salary)
(CourseID, CourseName, Credits)
(EnrollID, StudentID, CourseID, Grade)
2. Declare the keys as per requirement
3.   Perform the below SQL functions on the Student database. 
	  1.Display the details  of all students.
      2. Show the  last 3 characters of course names.
      3. Concatenate FirstName and LastName of teachers as fullname
      4. Find the length of each student’s name.
      5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
      6.Find the absolute difference between maximum and minimum marks.
      7. Round off teachers’ salaries to the nearest thousand.
      8.Show the square root of each course credit.
      9. Display students’ marks along with ceiling and floor values. 
	  10. Find the modulus of total marks divided by 5.
      11. Display the current date and time.
      12.Show the year and month of hire for all teachers. 
      13. List students who were born in January. 
      14. Find the difference in days between today and a teacher’s HireDate. 
      15. Find the total number of students in the school. 
      16. Calculate the average salary of teachers.
      17. Find the highest and lowest marks in the Student table.*/
      
create database School;
use School;
create table Student(
StudentID varchar(25) primary key,
FirstName varchar(20),
LastName varchar(20),
DOB date,
Class varchar(20),
Marks int,
City varchar(20)
);
create table Teacher(
TeacherID varchar(25) primary key,
FirstName varchar(20),
LastName varchar(20),
HireDate date,
Subject varchar(20),
Salary int
);
create table Course(
CourseID varchar(25) primary key,
CourseName varchar(20),
Credits int
);
create table Enrollment(
EnrollID varchar(25) primary key,
Grade varchar(20),
StudentID varchar(25),
CourseID varchar(25),
foreign key(StudentID) references Student(StudentID),
foreign key(CourseID) references Course(CourseID)
);
INSERT INTO Student (StudentID, FirstName, LastName, DOB, Class, Marks, City) VALUES
('S001', 'Akash', 'Bhat', '2002-05-15', 'BCA-2ndYear', 85, 'Bangalore'),
('S002', 'Rohit', 'Sharma', '2001-09-20', 'BCA-3rdYear', 78, 'Mysore'),
('S003', 'Sneha', 'Kumar', '2003-01-10', 'BCom-1stYear', 92, 'Mangalore'),
('S004', 'Ananya', 'Reddy', '2002-07-25', 'BSc-2ndYear', 88, 'Hubli'),
('S005', 'Vikram', 'Shetty', '2001-12-05', 'BCA-3rdYear', 74, 'Udupi');

select * from Student;
/*'S001','Akash','Bhat','2002-05-15','BCA-2ndYear','85','Bangalore'
'S002','Rohit','Sharma','2001-09-20','BCA-3rdYear','78','Mysore'
'S003','Sneha','Kumar','2003-01-10','BCom-1stYear','92','Mangalore'
'S004','Ananya','Reddy','2002-07-25','BSc-2ndYear','88','Hubli'
'S005','Vikram','Shetty','2001-12-05','BCA-3rdYear','74','Udupi'
*/
INSERT INTO Teacher (TeacherID, FirstName, LastName, HireDate, Subject, Salary) VALUES
('T001', 'Sharath', 'Kumar', '2015-06-12', 'Maths', 45000),
('T002', 'Meena', 'Reddy', '2018-08-20', 'English', 42000),
('T003', 'Ravi', 'Shetty', '2012-01-15', 'Computer', 55000),
('T004', 'Anusha', 'Patil', '2019-11-05', 'Science', 40000),
('T005', 'Kiran', 'Gowda', '2016-03-25', 'Commerce', 48000);


select concat(FirstName,LastName)
from Teacher;
/*'SharathKumar'
'MeenaReddy'
'RaviShetty'
'AnushaPatil'
'KiranGowda'
*/
SELECT  FirstName, LastName, LENGTH(FirstName)
FROM Student;
/*'Akash','Bhat','5'
'Rohit','Sharma','5'
'Sneha','Kumar','5'
'Ananya','Reddy','6'
'Vikram','Shetty','6'
*/
select replace(Subject ,"Maths", "Mathematics")
from  Teacher;
/*'Mathematics'
'English'
'Computer'
'Science'
'Commerce'
*/
select max(marks)
from Student;
-- '92'
select min(marks)
from Student;
-- '74'
select ABS(max(marks) - min(marks))
from Student;
-- '18'
select round(salary)
from Teacher;
/*'45000'
'42000'
'55000'
'40000'
'48000'
*/
INSERT INTO Course (CourseID, CourseName, Credits) VALUES
('C001', 'Mathematics', 4),
('C002', 'Computer Science', 3),
('C003', 'Physics', 4);

select sqrt(Credits)
from Course;
/*'2'
'1.7320508075688772'
'2'
*/
SELECT FirstName, Marks, CEIL(Marks) And FLOOR (Marks)
FROM Student;
/*'Akash','85','1'
'Rohit','78','1'
'Sneha','92','1'
'Ananya','88','1'
'Vikram','74','1'
*/
SELECT SUM(Marks) % 5
FROM Student;
-- '2'
Select current_date();
-- '2025-09-10'
Select current_time();
-- '19:22:56'
select extract(Year from HireDate)
from Teacher;
/*'2015'
'2018'
'2012'
'2019'
'2016'
*/
select extract(Month from HireDate)
from Teacher;
/*'6'
'8'
'1'
'11'
'3'
*/
SELECT *
FROM Student
WHERE EXTRACT(MONTH FROM DOB) = 1;
-- 'S003','Sneha','Kumar','2003-01-10','BCom-1stYear','92','Mangalore'
select datediff(now(), HireDate)
from Teacher;
/*'3743'
'2578'
'4987'
'2136'
'3456'
*/
select count(*)
from Student;
-- '5'
select avg(salary)
from Teacher;
-- '46000.0000'
select max(Marks)
from Student;
-- '92'
select min(Marks)
from Student;
-- '74'
