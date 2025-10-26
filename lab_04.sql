-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME:suzaina khanum
-- USN:1RUA24BCA0088
-- SECTION:A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

-- 'root@localhost','Puranik-MacBook-Air.local','8.0.28','2025-09-01 16:51:30'




# Time Action Message Duration / Fetch

# Time Action Message Duration / Fetch

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
CREATE DATABASE Library;
USE Library;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table :
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session


CREATE TABLE Books (
    Book_ID VARCHAR(20) PRIMARY KEY,
    Author VARCHAR(20),
    Book_no VARCHAR(20),
    Book_Price DECIMAL(8, 2)
);

CREATE TABLE  Members (
Member_ID VARCHAR(20) PRIMARY KEY,
FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Membership_Type VARCHAR(12)
    );
   

desc Books;
desc Members;
 




-- Paste the Output below for the given command ( DESC TableName;)
/*Book_ID varchar(20) NO PRI
Author varchar(20) YES
Book_no varchar(20) YES
Book_Price decimal(8,2) YES

Member_ID varchar(20) NO PRI
FullName varchar(100) YES
Email varchar(100) YES UNI
PhoneNumber varchar(15) YES
Membership_Type varchar(12) YES*/



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies.
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
alter table Book
rename column Book_Price to Price;
desc Books;

alter table Books
add avialable_copies varchar(10),
add total_copies varchar(12);
desc Books;

alter table Books
modify Book_no varchar(25);

desc Books;

desc Members;

alter table Books
add BookName varchar(50);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
select * from Books;

-- B001 Harshad Meheta 500.00 5 10 The Hard Thing


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Books(Book_ID, BookName, Author, Price, avialable_copies, total_copies)
VALUES('B001','The Hard Thing', 'Harshad Meheta', 500, 5, 10);

desc Books;

INSERT INTO Members(Member_ID, FullName, Email, PhoneNumber, Membership_Type)
VALUES('MOO1','Akash bhat','Akashrbhat73@gmail.com', '7406078302', 'Silver');

desc Members;










-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from members;

-- MOO1 Akash bhat Akashrbhat73@gmail.com 7406078302 Silver



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


alter table Books
add column published_Year varchar(15);

desc Books;






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
select * from Books;
select * from Members;

-- B001 Harshad Meheta 500.00 5 10 The Hard Thing

-- MOO1 Akash bhat Akashbhat73@gmail.com 7406078302 Silver


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

UPDATE members
SET Membership_Type = 'Gold'
WHERE FullName = 'Emma Wilson' AND Membership_Type = 'Silver';

desc members;







-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
select * from members;

-- 'MOO1','Harsha Puranik','harshapuranik79@gmail.com','7406078302','Silver'

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

Delete From Members
WHERE FullName = 'Akash bhat';

select * from Members;
-- null




-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

CREATE TABLE Member (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    MemberName VARCHAR(100)
);

CREATE TABLE Book (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200)
);


CREATE TABLE Borrows  (
    Borrow_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT,
    Book_ID INT,
    Borrow_Date DATETIME,
    Return_Date DATETIME,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);




INSERT INTO Borrows (Member_ID, Book_ID, Borrow_Date, Return_Date)
VALUES (2, 102, '2024-06-01', NULL);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

SELECT m.MemberName
FROM Borrows b
JOIN Member m ON b.Member_ID = m.Member_ID
WHERE b.Book_ID = 102;








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from  Borrows;

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task --