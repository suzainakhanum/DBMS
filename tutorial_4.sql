create database schools;
use schools;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Price INT,
    PublishDate DATE
);

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,
    BookID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
INSERT INTO Books VALUES
(101, 'The Alchemist', 'Paulo Coelho', 350, '2010-06-15'),
(102, 'Atomic Habits', 'James Clear', 450, '2018-10-16'),
(103, 'Clean Code', 'Robert Martin', 550, '2008-08-01'),
(104, 'Think Like a Monk', 'Jay Shetty', 400, '2020-09-08'),
(105, 'Python Crash Course', 'Eric Matthes', 500, '2019-05-10');

INSERT INTO Customers VALUES
(201, 'Arjun Rao', 'arjun@gmail.com', '2021-02-10'),
(202, 'Priya Nair', 'priya@yahoo.com', '2020-07-25'),
(203, 'John Smith', 'john@gmail.com', '2022-01-14'),
(204, 'Maria Lopez', 'maria@outlook.com', '2019-11-30');

INSERT INTO Orders VALUES
(301, 201, 102, '2022-03-05', 2),
(302, 202, 101, '2021-09-12', 1),
(303, 203, 105, '2022-05-20', 3),
(304, 204, 104, '2020-12-25', 1),
(305, 201, 103, '2021-11-18', 1);

SELECT UPPER(Name) FROM Customers;
/*'ARJUN RAO'
'PRIYA NAIR'
'JOHN SMITH'
'MARIA LOPEZ'
*/

SELECT LOWER(Name) FROM Customers;
/*'arjun rao'
'priya nair'
'john smith'
'maria lopez'
*/
SELECT LEFT(Title, 3) AS First3Letters FROM Books;
/*'The'
'Ato'
'Cle'
'Thi'
'Pyt'
'Jav'
'Pyt'
'C++'
'SQL'
*/
SELECT CustID, SUBSTRING_INDEX(Email, '@', -1) AS Domain FROM Customers;
/*'201','gmail.com'
'202','yahoo.com'
'203','gmail.com'
'204','outlook.com'
*/
SELECT Title, LENGTH(Title) AS TitleLength FROM Books;
/*'The Alchemist','13'
'Atomic Habits','13'
'Clean Code','10'
'Think Like a Monk','17'
'Python Crash Course','19'
'Java Basics','11'
'Python Guide','12'
'C++ Primer','10'
'SQL Essentials','14'
*/
SELECT REPLACE(Title, 'Book', 'Text') AS UpdatedTitle FROM Books;
/*'The Alchemist'
'Atomic Habits'
'Clean Code'
'Think Like a Monk'
'Python Crash Course'
'Java Basics'
'Python Guide'
'C++ Primer'
'SQL Essentials'
*/

SELECT CONCAT(Author, ' - ', Title) AS AuthorBook FROM Books;
/*'Paulo Coelho - The Alchemist'
'James Clear - Atomic Habits'
'Robert Martin - Clean Code'
'Jay Shetty - Think Like a Monk'
'Eric Matthes - Python Crash Course'
'James Gosling - Java Basics'
'Guido van Rossum - Python Guide'
'Bjarne Stroustrup - C++ Primer'
'Codd - SQL Essentials'
*/
SELECT * FROM Books WHERE Author LIKE '%a%';
/*'101','The Alchemist','Paulo Coelho','350','2010-06-15'
'102','Atomic Habits','James Clear','450','2018-10-16'
'103','Clean Code','Robert Martin','550','2008-08-01'
'104','Think Like a Monk','Jay Shetty','400','2020-09-08'
'105','Python Crash Course','Eric Matthes','500','2019-05-10'
'B101','Java Basics','James Gosling','450','2020-05-12'
'B102','Python Guide','Guido van Rossum','500','2021-07-20'
'B103','C++ Primer','Bjarne Stroustrup','600','2019-09-15'
*/


SELECT Title, YEAR(Pdate) AS PublishYear
FROM Books;
/*'The Alchemist',2010
'Atomic Habits',2018
'Clean Code',2008
'Think Like a Monk',2020
'Python Crash Course',2019
'Java Basics',2020
'Python Guide',2021
'C++ Primer',2019
'SQL Essentials',2022
*/

SELECT Name, MONTHNAME(JoinDate) AS JoinMonth FROM Customers;
/*'Arjun Rao','February'
'Priya Nair','July'
'John Smith','January'
'Maria Lopez','November'
*/
SELECT * FROM Customers WHERE YEAR(JoinDate) = 2021;
-- '201','Arjun Rao','arjun@gmail.com','2021-02-10'

SELECT OrderID, DAYNAME(ODate) 
FROM Orders;
/*'SRK23','Tuesday'
'SRK24','Friday'
'SRK25','Sunday'
'SRK26','Thursday'
*/
SELECT Title, TIMESTAMPDIFF(YEAR, PDate, CURDATE())
FROM Books;
/*'The Alchemist','15'
'Atomic Habits','6'
'Clean Code','17'
'Think Like a Monk','5'
'Python Crash Course','6'
'Java Basics','5'
'Python Guide','4'
'C++ Primer','6'
'SQL Essentials','3'
*/

SELECT Name, DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoin FROM Customers;
/*'Arjun Rao','1680'
'Priya Nair','1880'
'John Smith','1342'
'Maria Lopez','2118'
*/
SELECT * FROM Orders WHERE MONTH(ODate) = 12;
-- null
SELECT COUNT(*) AS TotalBooks FROM Books;
-- 9
SELECT AVG(Price) AS AvgPrice FROM Books;
-- '461.1111'

SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM Books;
-- '600','350'

SELECT COUNT(*) AS CustomersAfter2020 FROM Customers WHERE YEAR(JoinDate) > 2020;
-- 2
SELECT SUM(Quantity) AS TotalBooksOrdered FROM Orders;
-- 10
SELECT CustID, SUM(Quantity) AS TotalQty FROM Orders GROUP BY CustID;
/*'SDk2','2'
'SDk3','1'
'SDk4','4'
'SDk5','3'*/

SELECT BookID, AVG(Quantity) AS AvgQty FROM Orders GROUP BY BookID;
/*'B101','2.0000'
'B102','1.0000'
'B103','4.0000'
'B104','3.0000'
*/
SELECT BookID, SUM(Quantity) AS TotalQty
FROM Orders
GROUP BY BookID
ORDER BY TotalQty DESC
LIMIT 1;
-- 'B103','4'

SELECT o.BookID, SUM(o.Quantity * b.Price) AS Revenue
FROM Orders o
JOIN Books b ON o.BookID = b.BookID
GROUP BY o.BookID;
/*'B101','900'
'B102','500'
'B103','2400'
'B104','1050'
*/
SELECT YEAR(ODate) AS Year, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(ODate);
-- '2020','4'
