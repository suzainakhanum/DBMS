-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/*'root@localhost', 'LAPTOP-P620D6E5', '8.0.43', '2025-08-18 11:33:16'*/

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth
create table student(
student_id varchar(20) Primary key,
firstname varchar(30),
lastname varchar(30),
Email varchar(40) unique,
dob date
);
desc student;
-- Write your SQL query below Codespace:

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'lastname', 'varchar(30)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
*/
-- Alter the table and 2 new columns
alter table student
add(gender varchar(30), age int);
desc student;
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'lastname', 'varchar(30)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(30)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
*/
-- Modify a column data type
alter table student
modify lastname varchar(60);
desc student;
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'lastname', 'varchar(60)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(30)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
*/
-- Rename a column
alter table student
rename column lastname to surname;
desc student;
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'surname', 'varchar(60)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(30)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
*/
-- Drop a column
alter table student
drop column gender;
desc student;
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'surname', 'varchar(60)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
*/

-- Rename the table
alter table student 
rename to studentdetails;
desc studentdetails;
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'surname', 'varchar(60)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
*/


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses(
CourseID varchar(20)primary key,
CourseName varchar(30),
credits int
);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT : 
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
alter table courses
add (subjects varchar(30),timings decimal(10,2));
desc courses;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'subjects', 'varchar(30)', 'YES', '', NULL, ''
'timings', 'decimal(10,2)', 'YES', '', NULL, ''
*/

-- Modify a column data type
alter table courses
modify subjects varchar(50);
desc courses;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'subjects', 'varchar(50)', 'YES', '', NULL, ''
'timings', 'decimal(10,2)', 'YES', '', NULL, ''
*/
-- Rename a column
alter table courses
rename column timings to timings_of_each_subject;
desc courses;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'subjects', 'varchar(50)', 'YES', '', NULL, ''
'timings_of_each_subject', 'decimal(10,2)', 'YES', '', NULL, ''
*/
-- Drop a column 
alter table courses
drop timings_of_each_subject;
desc courses;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'subjects', 'varchar(50)', 'YES', '', NULL, ''
*/

-- Rename the table
alter table courses
rename to course_for_bca;
desc course_for_bca;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'subjects', 'varchar(50)', 'YES', '', NULL, ''
*/

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments(
EnrollmentID varchar(20)primary key,
student_id varchar(20),
CourseID varchar(30),
EnrollmentDate date,
foreign key(student_id) references studentdetails(student_id),
foreign key(CourseID) references course_for_bca(CourseID)
);
DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
*/
-- Alter the table and 2 new columns
alter table ENROLLMENTS
add(student_address varchar(20), fee_payment varchar(20));
desc ENROLLMENTS;
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'student_address', 'varchar(20)', 'YES', '', NULL, ''
'fee_payment', 'varchar(20)', 'YES', '', NULL, ''
*/
-- Modify a column data type
alter table ENROLLMENTS
modify student_address varchar(70);
desc ENROLLMENTS;
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'student_address', 'varchar(70)', 'YES', '', NULL, ''
'fee_payment', 'varchar(20)', 'YES', '', NULL, ''*/

-- Rename a column
alter table ENROLLMENTS
rename column fee_payment to fee_structure;
desc ENROLLMENTS;
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'student_address', 'varchar(70)', 'YES', '', NULL, ''
'fee_structure', 'varchar(20)', 'YES', '', NULL, ''*/

-- Drop a column
alter table ENROLLMENTS
drop fee_structure;
desc ENROLLMENTS;
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'student_address', 'varchar(70)', 'YES', '', NULL, ''
*/
-- Rename the table
alter table ENROLLMENTS
rename to ENROLLMENTS_DETAILS;
desc ENROLLMENTS_DETAILS;
/*'EnrollmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'student_id', 'varchar(20)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'student_address', 'varchar(70)', 'YES', '', NULL, ''
*/
-- Task 4: Alter the Students Table


-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table studentdetails
add PhoneNumber int;
DESC studentdetails ; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
/*'student_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(30)', 'YES', '', NULL, ''
'surname', 'varchar(60)', 'YES', '', NULL, ''
'Email', 'varchar(40)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''*/

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table course_for_bca
modify Credits varchar(60);
DESC course_for_bca;
/*'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'Credits', 'varchar(60)', 'YES', '', NULL, ''
'subjects', 'varchar(50)', 'YES', '', NULL, ''
*/
-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table
/*'course_for_bca'
'enrollments_details'
'studentdetails'*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table ENROLLMENTS_DETAILS;
drop table course_for_bca;

SHOW TABLES; -- After dropping the table Enrollement and Course
-- 'studentdetails'

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01