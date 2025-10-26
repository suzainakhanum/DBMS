-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME:suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A
 
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ].         
-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-08-18 12:23:22'


-- Scenario: University Course Management System
CREATE database DBLab001;
use DBLab001;
-- Write your SQL query below Codespace:

Create Table student(
StudentID varchar(25)primary key,
FirstName varchar(20),
LastName  varchar(20),
Email  varchar(20),
DateOfBirth DATE);

-- Write your SQL query below Codespace:
desc student;
DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- Alter the table and 2 new columns
alter table student
add (rollnumber int, favsubject varchar(25));
desc student;
-- Modify a column data type
alter table student
modify favsubject varchar(20);
-- Rename a column
alter table student rename to students;
desc students;

desc students;
-- Drop a column
-- Rename the table



Create Table the(
CourseID int Primary Key,
CourseName varchar(25),
Credits varchar(20));
desc the;

-- Write your SQL query below Codespace:

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

/* OUTPUT :'CourseID','int','NO','PRI',NULL,''
'CourseName','varchar(25)','YES','',NULL,''
'Credits','varchar(20)','YES','',NULL,''*/


-- Alter the table and 2 new columns
alter table the
add (price int,timelimit time);
desc the;
/*'CourseID','int','NO','PRI',NULL,''
'CourseName','varchar(25)','YES','',NULL,''
'Credits','varchar(20)','YES','',NULL,''
'price','int','YES','',NULL,''
'timelimit','time','YES','',NULL,''*/

-- Modify a column data type
alter table the
modify price varchar(20);
-- Rename a column
alter table theis
rename column timelimit to timeslimit;
-- Drop a column
alter table theis
drop column price;
-- Rename the table
alter table the rename to theis;
desc theis;
/*'CourseID','int','NO','PRI',NULL,''
'CourseName','varchar(25)','YES','',NULL,''
'Credits','varchar(20)','YES','',NULL,''
'timeslimit','time','YES','',NULL,''*/
desc student;



CREATE TABLE enrollments (
    EnrollmentID   VARCHAR(25) PRIMARY KEY,
    StudentID      VARCHAR(25),
    CourseID       INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES theis(CourseID)
);


-- Write your SQL query below Codespace:

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
desc enrollments;
-- OUTPUT :
/*'EnrollmentID','varchar(25)','NO','PRI',NULL,''
'StudentID','varchar(25)','YES','MUL',NULL,''
'CourseID','int','YES','MUL',NULL,''
'EnrollmentDate','date','YES','',NULL,''*/


-- Alter the table and 2 new columns
alter table enrollments
add (fees int,specalization varchar(25));
-- Modify a column data type
alter table enrollments
modify specalization varchar(20);
-- Rename a column
alter table enrollments
rename column specalization to specalizations;
-- Drop a column
alter table enrollments
drop column specalizations;
-- Rename the table
alter table enrollments rename to enroll;
desc enroll;
/*'EnrollmentID','varchar(25)','NO','PRI',NULL,''
'StudentID','varchar(25)','YES','MUL',NULL,''
'CourseID','int','YES','MUL',NULL,''
'EnrollmentDate','date','YES','',NULL,''
'fees','int','YES','',NULL,''*/

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.
alter table students
add phonenumber int; 

-- Write your SQL query below Codespace:

-- DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
desc students;
/*'StudentID','varchar(25)','NO','PRI',NULL,''
'FirstName','varchar(20)','YES','',NULL,''
'LastName','varchar(20)','YES','',NULL,''
'Email','varchar(20)','YES','',NULL,''
'DateOfBirth','date','YES','',NULL,''
'rollnumber','int','YES','',NULL,''
'favsubject','varchar(20)','YES','',NULL,''
'phonenumber','int','YES','',NULL,''*/

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table theis
modify Credits decimal(10);

-- Task 6: Drop Tables

-- SHOW TABLES; -- Before dropping the table
show tables;

-- Drop the 'Courses' and 'Enrollments' tables from the database.
drop table enroll;
drop table theis;
-- Write your SQL query below Codespace:

-- SHOW TABLES; -- After dropping the table Enrollement and Course
show tables;
-- students

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01