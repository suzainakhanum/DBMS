-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-08-25 11:25:19'


-- Scenario: College Student Management System
create database Student;

-- CREATE AND LOAD THE database
use Student;
-- Write your SQL query below Codespace:

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  create table Departments(
  DepartmentID varchar(25) primary key,
  DepartmentName varchar(20),
  HOD varchar(20),
  ContactEmail varchar(25),
  PhoneNumber int,
  Location varchar(20));
  desc Departments;
  /*'DepartmentID','varchar(25)','NO','PRI',NULL,''
'DepartmentName','varchar(20)','YES','',NULL,''
'HOD','varchar(20)','YES','',NULL,''
'ContactEmail','varchar(25)','YES','',NULL,''
'PhoneNumber','int','YES','',NULL,''
'Location','varchar(20)','YES','',NULL,''*/

  
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  create table Course(
  CourseID varchar(25) primary key,
  CourseName varchar(20),
  Credits int,
  Duration int,
  Fee int,
  DepartmentID varchar(25),
  foreign key(DepartmentID) references Departments(DepartmentID));
    desc Course;
/*    'CourseID','varchar(25)','NO','PRI',NULL,''
'CourseName','varchar(20)','YES','',NULL,''
'Credits','int','YES','',NULL,''
'Duration','int','YES','',NULL,''
'Fee','int','YES','',NULL,''
'DepartmentID','varchar(25)','YES','MUL',NULL,''*/


  
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  create table Students(
  StudentID varchar(25) primary key,
  FirstName varchar(20),
  LastName varchar(20),
  Email varchar(25),
  DateOfBirth date,
  CourseID varchar(25),
  foreign key(CourseID) references Course(CourseID));
  desc Students;
  /*'StudentID','varchar(25)','NO','PRI',NULL,''
'FirstName','varchar(20)','YES','',NULL,''
'LastName','varchar(20)','YES','',NULL,''
'Email','varchar(25)','YES','',NULL,''
'DateOfBirth','date','YES','',NULL,''
'CourseID','varchar(25)','YES','MUL',NULL,''*/

  
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  create table Faculty(
  FacultyID varchar(25) primary key,
  FacultyName varchar(20),
  Qualification varchar(25),
  Email varchar(20),
  PhoneNumber int,
  DepartmentID varchar(25),
  foreign key(DepartmentID) references Departments(DepartmentID));
  desc Faculty;
  /*'FacultyID','varchar(25)','NO','PRI',NULL,''
'FacultyName','varchar(20)','YES','',NULL,''
'Qualification','varchar(25)','YES','',NULL,''
'Email','varchar(20)','YES','',NULL,''
'PhoneNumber','int','YES','',NULL,''
'DepartmentID','varchar(25)','YES','MUL',NULL,''*/


  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
  create table Enrollments(
  EnrollmentID varchar(25) primary key,
  Semester int,
  Year int,
  Grade int,
  StudentID varchar(20),
  CourseID varchar(25),
  foreign key(StudentID) references Students(StudentID),
  foreign key(CourseID) references Course(CourseID));
  desc Enrollments;
  /*'EnrollmentID','varchar(25)','NO','PRI',NULL,''
'Semester','int','YES','',NULL,''
'Year','int','YES','',NULL,''
'Grade','int','YES','',NULL,''
'StudentID','varchar(20)','YES','MUL',NULL,''
'CourseID','varchar(25)','YES','MUL',NULL,''*/

  
-- Specify the Key (Primary and Foreign) for each table while creating
SHOW TABLES;
/*'Course'
'Departments'
'Enrollments'
'Faculty'
'Students'*/


-- Write your SQL query below Codespace:

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
alter table Departments
add address varchar(25);
alter table Faculty
add address varchar(25);
alter table Students
add address varchar(25);
alter table Enrollments
add address varchar(25);
alter table Course
add address varchar(25);
-- 02: Modify the existing column from each table
alter table Departments
modify address varchar(10);
alter table Course
modify address varchar(10);
alter table Students
modify address varchar(10);
alter table Enrollments
modify address varchar(10);
alter table Faculty
modify address varchar(10);

-- 03 change the datatypes
alter table Enrollments
modify Year date;
desc Enrollments;
-- 04: Rename a column
alter table Students
Rename column StudentID to StudentsID;
desc Students;
-- 05: Drop a column
alter table Course
drop column address; 
desc Course;
-- 06: Rename the table
Rename table Students to DetailsofStudent;
-- 07: describe the structure of the new table
desc DetailsofStudent;
alter table  DetailsofStudent
drop column address;
-- Additional set of questions 
-- 1 Add a new column Address (VARCHAR(100)) to the Students table.
alter table DetailsofStudent
add Address VARCHAR(100);
-- 2 Add a column Gender (CHAR(1)) to the Students table.
alter table DetailsofStudent
add Gender CHAR(1);
-- 3 Add a column JoiningDate (DATE) to the Faculty table.
alter table Faculty
add JoiningDate DATE;
-- 4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
alter table Course
modify CourseName varchar(100);
-- 5 Modify the column Location in the Departments table to VARCHAR(80).
alter table Departments
modify Location varchar(80);
-- 6 Rename the column Qualification in the Faculty table to Degree.
alter table Faculty
Rename column Qualification to Degree;
-- 7 Rename the table Faculty to Teachers.
Rename table Faculty to Teachers;
-- 8 Drop the column PhoneNumber from the Departments table.
alter table Departments
drop column PhoneNumber;
-- 9 Drop the column Email from the Students table.
alter table DetailsofStudent
drop column email;
-- 10 Drop the column Duration from the Courses table.
alter table Course
drop column Duration ;

SHOW TABLES; -- Before dropping the table
/*'Course'
'Departments'
'DetailsofStudent'
'Enrollments'
'Teachers'*/


-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table Teachers;
drop table Enrollments;
drop table DetailsofStudent;
drop table Departments;
drop table Course;

SHOW TABLES; -- After dropping the table Enrollement and Course
-- empty;
-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01