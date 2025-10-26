create database cms;
use cms;

create table Student (
Studentid VARCHAR(20) PRIMARY KEY,
Studentname VARCHAR(100),
gender VARCHAR(10),
dob DATE,
city VARCHAR(30)
);

desc Student;

Select * from Student;

create table Course (
courseid VARCHAR(20) PRIMARY KEY,
coursename VARCHAR(100),
duration INT,
fee decimal(8, 2)
);

desc Course;

Select * from Course;

create table Enrollment (
Enrollmentid VARCHAR(20) PRIMARY KEY,
Studentid VARCHAR(20),
courseid VARCHAR(20),
enrollmentdate decimal(8, 2),
grade VARCHAR(20),
FOREIGN KEY (Studentid) REFERENCES Student(Studentid),
FOREIGN KEY (courseid) REFERENCES Course(courseid)
);

desc Enrollment;

Select * from Enrollment;

INSERT INTO Student (Studentid, Studentname, gender, dob, city)
VALUES
(1, 'Harsha Puranik', 'Male', '2006-05-28', 'Bengaluru'),
(2, 'Aarav Sharma', 'Male', '2005-03-15', 'Mumbai'),
(3, 'Priya Verma', 'Female', '2006-08-22', 'Delhi'),
(4, 'Rohan Gupta', 'Male', '2005-11-09', 'Chennai'),
(5, 'Sneha Iyer', 'Female', '2006-01-30', 'Hyderabad'),
(6, 'Vikram Singh', 'Male', '2005-07-18', 'Pune'),
(7, 'Ananya Reddy', 'Female', '2006-04-25', 'Bengaluru'),
(8, 'Karan Patel', 'Male', '2006-09-12', 'Ahmedabad'),
(9, 'Meera Nair', 'Female', '2005-12-05', 'Kochi'),
(10, 'Siddharth Rao', 'Male', '2005-06-20', 'Mysuru');

select * from Student;

-- Output:
-- 1	Harsha Puranik	Male	2006-05-28	Bengaluru
-- 10	Siddharth Rao	Male	2005-06-20	Mysuru
-- 2	Aarav Sharma	Male	2005-03-15	Mumbai
-- 3	Priya Verma	Female	2006-08-22	Delhi
-- 4	Rohan Gupta	Male	2005-11-09	Chennai
-- 5	Sneha Iyer	Female	2006-01-30	Hyderabad
-- 6	Vikram Singh	Male	2005-07-18	Pune
-- 7	Ananya Reddy	Female	2006-04-25	Bengaluru
-- 8	Karan Patel	Male	2006-09-12	Ahmedabad
-- 9	Meera Nair	Female	2005-12-05	Kochi

INSERT INTO Course (courseid, coursename, duration, fee) 
VALUES
('C1', 'AI', 7, 25000),
('C2', 'Data Science', 6, 30000),
('C3', 'Web Development', 5, 20000),
('C4', 'Cyber Security', 8, 35000),
('C5', 'Cloud Computing', 6, 32000),
('C6', 'Machine Learning', 7, 28000),
('C7', 'Blockchain Technology', 6, 30000),
('C8', 'Full Stack Development', 9, 40000),
('C9', 'Database Management', 4, 18000),
('C10', 'Mobile App Development', 6, 27000);

SELECT * FROM Course;

-- Output:
-- C1	AI	7	25000.00
-- C10	Mobile App Development	6	27000.00
-- C2	Data Science	6	30000.00
-- C3	Web Development	5	20000.00
-- C4	Cyber Security	8	35000.00
-- C5	Cloud Computing	6	32000.00
-- C6	Machine Learning	7	28000.00
-- C7	Blockchain Technology	6	30000.00
-- C8	Full Stack Development	9	40000.00
-- C9	Database Management	4	18000.00

alter table Enrollment
modify column enrollmentdate date;


INSERT INTO Enrollment (Enrollmentid, Studentid, courseid, enrollmentdate , grade)
VALUES
('E1', 1, 'C1', '2020-09-02', 'A+'),
('E2', 2, 'C2', '2020-10-10', 'A'),
('E3', 3, 'C3', '2021-01-15', 'B+'),
('E4', 4, 'C4', '2021-03-20', 'A'),
('E5', 5, 'C5', '2021-04-05', 'A+'),
('E6', 6, 'C6', '2021-06-18', 'B'),
('E7', 7, 'C7', '2021-07-25', 'A'),
('E8', 8, 'C8', '2022-02-10', 'B+'),
('E9', 9, 'C9', '2022-05-12', 'A'),
('E10', 10, 'C10', '2022-07-30', 'A+');

Select * from Enrollment;

-- Output:
-- E1	1	C1	2020-09-02	A+
-- E10	10	C10	2022-07-30	A+
-- E2	2	C2	2020-10-10	A
-- E3	3	C3	2021-01-15	B+
-- E4	4	C4	2021-03-20	A
-- E5	5	C5	2021-04-05	A+
-- E6	6	C6	2021-06-18	B
-- E7	7	C7	2021-07-25	A
-- E8	8	C8	2022-02-10	B+
-- E9	9	C9	2022-05-12	A

-- Aggregate Functions

-- Total number of students 
SELECT COUNT(*) AS Total_Students
FROM Student;
				
-- Output: 10

-- Average course fee
SELECT AVG(fee) AS Avg_FEE
FROM Course;

-- Output: 28500.000000

-- MAX AND MIN FEE
SELECT MAX(fee) AS Maxfee,
	   MIN(fee) AS Minfee
FROM Course;

-- Output: 40000.00	18000.00

-- Date Functions 

-- List of enrollments with year and month 

SELECT Enrollmentid, Studentid ,
		YEAR(enrollmentdate) AS YEAR,
        MONTH(enrollmentdate) AS MONTH
FROM Enrollment;

-- Output:
-- E1	1	2020	9
-- E10	10	2022	7
-- E2	2	2020	10
-- E3	3	2021	1
-- E4	4	2021	3
-- E5	5	2021	4
-- E6	6	2021	6
-- E7	7	2021	7
-- E8	8	2022	2
-- E9	9	2022	5

-- Students older than 21 years (as of 2025)

SELECT Studentname , dob, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS Age
FROM Student
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 21;

-- INNER JOIN --
SELECT Student.Studentname , Course.coursename, Enrollment.grade
FROM Student
INNER JOIN Enrollment 
ON Student.Studentid = Enrollment.Studentid
INNER JOIN Course
ON Course.courseid = Enrollment.courseid;

-- Output:

-- Harsha Puranik	AI	A+
-- Siddharth Rao	Mobile App Development	A+
-- Aarav Sharma	Data Science	A
-- Priya Verma	Web Development	B+
-- Rohan Gupta	Cyber Security	A
-- Sneha Iyer	Cloud Computing	A+
-- Vikram Singh	Machine Learning	B
-- Ananya Reddy	Blockchain Technology	A
-- Karan Patel	Full Stack Development	B+
-- Meera Nair	Database Management	A

-- LEFT OUTER JOIN 
-- List all students and their enrollment(if any)
SELECT Student.Studentname, Enrollment.courseid , Enrollment.grade
FROM Student
LEFT JOIN Enrollment
ON Student.Studentid = Enrollment.Studentid;

-- Output:
-- Harsha Puranik	C1	A+
-- Siddharth Rao	C10	A+
-- Aarav Sharma	C2	A
-- Priya Verma	C3	B+
-- Rohan Gupta	C4	A
-- Sneha Iyer	C5	A+
-- Vikram Singh	C6	B
-- Ananya Reddy	C7	A
-- Karan Patel	C8	B+
-- Meera Nair	C9	A

-- RIGTH OUTER JOIN
-- List all courses with enrolled students (if any)
SELECT Course.courseid, Enrollment.Studentid, Enrollment.grade
FROM Course
RIGHT JOIN Enrollment
ON Course.courseid = Enrollment.courseid;

-- Output:

-- C1	1	A+
-- C10	10	A+
-- C2	2	A
-- C3	3	B+
-- C4	4	A
-- C5	5	A+
-- C6	6	B
-- C7	7	A
-- C8	8	B+
-- C9	9	A

-- GROUPBY AND ORDERBY
-- Number of students enrolled per course

SELECT Course.coursename , COUNT(Enrollment.Studentid) AS Total_Students
FROM Course
JOIN Enrollment
ON Course.courseid = Enrollment.courseid
GROUP BY Course.coursename
ORDER BY Total_Students DESC;

-- Output:
-- AI	1
-- Mobile App Development	1
-- Data Science	1
-- Web Development	1
-- Cyber Security	1
-- Cloud Computing	1
-- Machine Learning	1
-- Blockchain Technology	1
-- Full Stack Development	1
-- Database Management	1

-- Courses Order by fee
SELECT * from Course
ORDER BY fee DESC;

-- Output:
-- C8	Full Stack Development	9	40000.00
-- C4	Cyber Security	8	35000.00
-- C5	Cloud Computing	6	32000.00
-- C2	Data Science	6	30000.00
-- C7	Blockchain Technology	6	30000.00
-- C6	Machine Learning	7	28000.00
-- C10	Mobile App Development	6	27000.00
-- C1	AI	7	25000.00
-- C3	Web Development	5	20000.00
-- C9	Database Management	4	18000.00

-- Stored Procedures 
-- Procedure to insert new student 
DELIMITER //

CREATE PROCEDURE InsertStudent (
    IN Studentid VARCHAR(20), 
    IN Studentname VARCHAR(100),
    IN gender VARCHAR(10),
    IN dob DATE,
    IN city VARCHAR(30)
)
BEGIN 
    INSERT INTO Student (Studentid, Studentname, gender, dob, city)
    VALUES (Studentid, Studentname, gender, dob, city);
END //

DELIMITER ;

-- Procedure to update new fee
DELIMITER //
create procedure Updatecoursefee (
	IN p_courseid VARCHAR(20),
	IN p_coursename VARCHAR(100),
	IN p_duration INT,
	IN p_fee decimal(8, 2)
)
BEGIN 
	update Course
    SET fee = p_fee
    WHERE courseid = p_courseid;
END //
DELIMITER ;



