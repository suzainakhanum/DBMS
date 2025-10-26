CREATE DATABASE SchoolDB;
USE SchoolDB;


-- Table: Classes
CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_name VARCHAR(50)
);

desc Classes;

-- Table: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    class_id INT,
    dob DATE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

desc Students;

-- Table: Marks
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

desc Marks;

-- Insert into Classes
INSERT INTO Classes VALUES
(1, 'Class 10A', 'Mr. Ramesh'),
(2, 'Class 10B', 'Ms. Priya'),
(3, 'Class 10C', 'Mr. Suresh');

select * from Classes

-- Output:
-- 1	Class 10A	Mr. Ramesh
-- 2	Class 10B	Ms. Priya
-- 3	Class 10C	Mr. Suresh
		

-- Insert into Students
INSERT INTO Students VALUES
(101, 'Asha', 'Rao', 1, '2009-04-12'),
(102, 'Rahul', 'Kumar', 1, '2009-06-05'),
(103, 'Sneha', 'Patil', 2, '2009-07-22'),
(104, 'Rohit', 'Sharma', 3, '2009-12-11'),
(105, 'Neha', 'Singh', 2, '2009-01-25');

select * from Students;

-- Output:
-- 101	Asha	Rao	1	2009-04-12
-- 102	Rahul	Kumar	1	2009-06-05
-- 103	Sneha	Patil	2	2009-07-22
-- 104	Rohit	Sharma	3	2009-12-11
-- 105	Neha	Singh	2	2009-01-25
-- 				
-- Insert into Marks
INSERT INTO Marks VALUES
(1, 101, 'Math', 88),
(2, 101, 'Science', 92),
(3, 102, 'Math', 75),
(4, 102, 'Science', 80),
(5, 103, 'Math', 85),
(6, 103, 'Science', 78),
(7, 104, 'Math', 90),
(8, 104, 'Science', 87),
(9, 105, 'Math', 82),
(10, 105, 'Science', 79);

select * from Marks;

-- Output:
-- 1	101	Math	88
-- 2	101	Science	92
-- 3	102	Math	75
-- 4	102	Science	80
-- 5	103	Math	85
-- 6	103	Science	78
-- 7	104	Math	90
-- 8	104	Science	87
-- 9	105	Math	82
-- 10	105	Science	79

-- JOIN Queries
-- Display class-wise student marks 

SELECT Classes.class_name,
       Marks.subject,
       Marks.marks_obtained,
       CONCAT(Students.first_name, ' ', Students.last_name) AS FullName
FROM Marks
JOIN Students ON Marks.student_id = Students.student_id
JOIN Classes ON Students.class_id = Classes.class_id
ORDER BY Classes.class_name, FullName;

-- Output:
-- Class 10A	Math	88	Asha Rao
-- Class 10A	Science	92	Asha Rao
-- Class 10A	Math	75	Rahul Kumar
-- Class 10A	Science	80	Rahul Kumar
-- Class 10B	Math	82	Neha Singh
-- Class 10B	Science	79	Neha Singh
-- Class 10B	Math	85	Sneha Patil
-- Class 10B	Science	78	Sneha Patil
-- Class 10C	Math	90	Rohit Sharma
-- Class 10C	Science	87	Rohit Sharma

-- Aggregate Functions --
-- Average marks per class 
SELECT Classes.class_name,
	   AVG(Marks.marks_obtained) AS AvgMarks
FROM Marks
JOIN Students 
ON Marks.Student_id = Students.Student_id
JOIN Classes
ON Students.class_id = Classes.class_id
GROUP BY Classes.class_name
ORDER BY AvgMarks DESC;

-- OUTPUT:
-- Class 10C	88.5000
-- Class 10A	83.7500
-- Class 10B	81.0000

-- Stored Procedures
-- INSERT new Student
DELIMITER //
create procedure InsertStudent (
	IN p_student_id INT ,
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_class_id INT,
    IN p_dob DATE
)
BEGIN 
	INSERT INTO Students VALUES (p_student_id , p_first_name , p_last_name, p_class_id , p_dob);
END //

DELIMITER ;


-- Update Marks

DELIMITER //

create procedure updateMarks (
	IN p_mark_id INT ,
    IN p_student_id INT,
    IN p_subject VARCHAR(50),
	IN p_marks_obtained INT 
)
BEGIN 
	UPDATE Marks
    SET marks_obtained = p_marks_obtained
    WHERE mark_id = p_mark_id;
END //

DELIMITER ;
