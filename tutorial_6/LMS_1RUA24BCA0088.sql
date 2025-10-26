CREATE DATABASE LibraryDB;
USE LibraryDB;


CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

desc Members;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    total_copies INT,
    available_copies INT
);

desc Books;

CREATE TABLE IssueRecords (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

desc IssueRecords;

INSERT INTO Members (name, email, join_date) VALUES
('Harsha', 'harsha@gmail.com', '2024-01-10'),
('Rahul', 'rahul@gmail.com', '2024-02-15'),
('Sahana', 'sahana@gmail.com', '2024-03-01'),
('Arjun', 'arjun@gmail.com', '2024-03-12'),
('Meera', 'meera@gmail.com', '2024-03-20'),
('Kiran', 'kiran@gmail.com', '2024-04-01'),
('Ananya', 'ananya@gmail.com', '2024-04-05'),
('Vikram', 'vikram@gmail.com', '2024-04-10'),
('Neha', 'neha@gmail.com', '2024-04-15'),
('Rohit', 'rohit@gmail.com', '2024-04-20');

select * from Members;

-- OUTPUT:
-- 1	Harsha	harsha@gmail.com	2024-01-10
-- 2	Rahul	rahul@gmail.com	2024-02-15
-- 3	Sahana	sahana@gmail.com	2024-03-01
-- 4	Arjun	arjun@gmail.com	2024-03-12
-- 5	Meera	meera@gmail.com	2024-03-20
-- 6	Kiran	kiran@gmail.com	2024-04-01
-- 7	Ananya	ananya@gmail.com	2024-04-05
-- 8	Vikram	vikram@gmail.com	2024-04-10
-- 9	Neha	neha@gmail.com	2024-04-15
-- 10	Rohit	rohit@gmail.com	2024-04-20

INSERT INTO Books (title, author, total_copies, available_copies) VALUES
('Python Programming', 'John Smith', 5, 5),
('Data Structures', 'Mark Lee', 3, 3),
('Operating Systems', 'Galvin', 4, 4),
('DBMS Concepts', 'Navathe', 6, 6),
('Computer Networks', 'Tanenbaum', 5, 5),
('AI Basics', 'Stuart Russell', 3, 3),
('Java Fundamentals', 'Herbert Schildt', 4, 4),
('Web Development', 'Jon Duckett', 5, 5),
('C Programming', 'Dennis Ritchie', 5, 5),
('Cloud Computing', 'Rajkumar Buyya', 3, 3);

select * from Books;

-- OUTPUT:	
-- 1	Python Programming	John Smith	5	5
-- 2	Data Structures	Mark Lee	3	3
-- 3	Operating Systems	Galvin	4	4
-- 4	DBMS Concepts	Navathe	6	6
-- 5	Computer Networks	Tanenbaum	5	5
-- 6	AI Basics	Stuart Russell	3	3
-- 7	Java Fundamentals	Herbert Schildt	4	4
-- 8	Web Development	Jon Duckett	5	5
-- 9	C Programming	Dennis Ritchie	5	5
-- 10	Cloud Computing	Rajkumar Buyya	3	3

INSERT INTO IssueRecords (member_id, book_id, issue_date, return_date) VALUES
(1, 1, '2024-03-01', NULL),
(2, 2, '2024-03-05', '2024-03-10'),
(3, 3, '2024-04-01', NULL),
(4, 4, '2024-04-02', '2024-04-08'),
(5, 5, '2024-04-05', NULL),
(6, 6, '2024-04-07', '2024-04-12'),
(7, 7, '2024-04-10', NULL),
(8, 8, '2024-04-11', '2024-04-18'),
(9, 9, '2024-04-15', NULL),
(10, 10, '2024-04-18', '2024-04-25');

select * from IssueRecords;

-- OUTPUT :
-- 1	1	1	2024-03-01	
-- 2	2	2	2024-03-05	2024-03-10
-- 3	3	3	2024-04-01	
-- 4	4	4	2024-04-02	2024-04-08
-- 5	5	5	2024-04-05	
-- 6	6	6	2024-04-07	2024-04-12
-- 7	7	7	2024-04-10	
-- 8	8	8	2024-04-11	2024-04-18
-- 9	9	9	2024-04-15	
-- 10	10	10	2024-04-18	2024-04-25

-- Queries

-- Total issued books per member(Aggregate)

SELECT Members.name, COUNT(IssueRecords.issue_id) AS total_issued
FROM Members
LEFT JOIN IssueRecords ON Members.member_id = IssueRecords.member_id
GROUP BY Members.member_id;
				
-- Members with issued book
SELECT Members.name, Books.title, IssueRecords.issue_date, IssueRecords.return_date
FROM Members
JOIN IssueRecords ON Members.member_id = IssueRecords.member_id
JOIN Books ON IssueRecords.book_id = Books.book_id;

-- OUTPUT :
-- Harsha	Python Programming	2024-03-01	
-- Rahul	Data Structures	2024-03-05	2024-03-10
-- Sahana	Operating Systems	2024-04-01	
-- Arjun	DBMS Concepts	2024-04-02	2024-04-08
-- Meera	Computer Networks	2024-04-05	
-- Kiran	AI Basics	2024-04-07	2024-04-12
-- Ananya	Java Fundamentals	2024-04-10	
-- Vikram	Web Development	2024-04-11	2024-04-18
-- Neha	C Programming	2024-04-15	
-- Rohit	Cloud Computing	2024-04-18	2024-04-25

-- Books that are currently issued(not returned yet)
SELECT Books.title, Members.name, IssueRecords.issue_date
FROM IssueRecords
JOIN Books ON IssueRecords.book_id = Books.book_id
JOIN Members ON IssueRecords.member_id = Members.member_id
WHERE IssueRecords.return_date IS NULL;

-- Output :
-- Python Programming	Harsha	2024-03-01
-- Operating Systems	Sahana	2024-04-01
-- Computer Networks	Meera	2024-04-05
-- Java Fundamentals	Ananya	2024-04-10
-- C Programming	Neha	2024-04-15

-- 4.Books that are not returned
SELECT Members.name, Books.title,
       DATEDIFF(CURDATE(), IssueRecords.issue_date) AS days_pending
FROM IssueRecords
JOIN Members ON IssueRecords.member_id = Members.member_id
JOIN Books ON IssueRecords.book_id = Books.book_id
WHERE IssueRecords.return_date IS NULL;
	
-- OUTPUT :
-- Harsha	Python Programming	604
-- Sahana	Operating Systems	573
-- Meera	Computer Networks	569
-- Ananya	Java Fundamentals	564
-- Neha	C Programming	559

-- Procedure Update
DELIMITER // 

create procedure UpdateBookAvailabilty (
	IN  p_book_id INT ,
    IN p_title VARCHAR(100),
	IN p_author VARCHAR(100),
    IN p_total_copies INT,
    IN p_available_copies INT
)
BEGIN 
	UPDATE Books
    SET available_copies = p_available_copies
    WHERE book_id = p_book_id;
END //

DELIMITER ;

