CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert into Customers
INSERT INTO Customers VALUES
(1, 'Asha', 'Rao', 'asha.rao@example.com', 'Bangalore'),
(2, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'Mysore'),
(3, 'Sneha', 'Patil', 'sneha.patil@example.com', 'Mangalore'),
(4, 'Rohit', 'Sharma', 'rohit.sharma@example.com', 'Hubli'),
(5, 'Neha', 'Singh', 'neha.singh@example.com', 'Udupi');

select * from Customers;

-- Output:
-- 1	Asha	Rao	asha.rao@example.com	Bangalore
-- 2	Rahul	Kumar	rahul.kumar@example.com	Mysore
-- 3	Sneha	Patil	sneha.patil@example.com	Mangalore
-- 4	Rohit	Sharma	rohit.sharma@example.com	Hubli
-- 5	Neha	Singh	neha.singh@example.com	Udupi
				

-- Insert into Products
INSERT INTO Products VALUES
(101, 'Laptop', 50000.00, 50),
(102, 'Smartphone', 20000.00, 100),
(103, 'Headphones', 3000.00, 150),
(104, 'Smartwatch', 8000.00, 80),
(105, 'Keyboard', 1500.00, 200);

select * from Products;

-- Output:
-- 101	Laptop	50000.00	50
-- 102	Smartphone	20000.00	100
-- 103	Headphones	3000.00	150
-- 104	Smartwatch	8000.00	80
-- 105	Keyboard	1500.00	200
			

-- Insert into Orders
INSERT INTO Orders VALUES
(1, 1, 101, 1, '2025-10-10'),
(2, 2, 102, 2, '2025-10-12'),
(3, 3, 103, 3, '2025-10-13'),
(4, 4, 104, 1, '2025-10-14'),
(5, 5, 105, 4, '2025-10-15'),
(6, 2, 103, 1, '2025-10-16');

select * from Orders;

-- Output:
-- 1	1	101	1	2025-10-10
-- 2	2	102	2	2025-10-12
-- 3	3	103	3	2025-10-13
-- 4	4	104	1	2025-10-14
-- 5	5	105	4	2025-10-15
-- 6	2	103	1	2025-10-16

-- Aggregate functions -- 
-- Total Sales per product 
SELECT Products.product_name,
	   SUM(Orders.quantity * Products.price) AS Total_Sales
FROM Products
JOIN Orders 
ON Products.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY Total_Sales DESC;

-- Output:
-- Laptop	600000.00
-- Smartphone	240000.00
-- Smartwatch	96000.00
-- Headphones	36000.00
-- Keyboard	18000.00

-- Most Purchase Product 
SELECT Products.product_name,
       SUM(Orders.quantity) AS Total_Quantity
FROM Products
JOIN Orders 
ON Products.product_id = Orders.product_id
GROUP BY Products.product_name
ORDER BY Total_Quantity DESC
LIMIT 1;

-- Output: Headphones	4

-- JOIN Queries
-- customer details with their products

SELECT Customers.customer_id ,
	   Products.product_name,
	   Orders.quantity,
       Orders.order_date,
       CONCAT(first_name, ' ' , last_name) AS Fullname
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id;

-- Output:
-- 1	Laptop	1	2025-10-10	Asha Rao
-- 2	Smartphone	2	2025-10-12	Rahul Kumar
-- 2	Headphones	1	2025-10-16	Rahul Kumar
-- 3	Headphones	3	2025-10-13	Sneha Patil
-- 4	Smartwatch	1	2025-10-14	Rohit Sharma
-- 5	Keyboard	4	2025-10-15	Neha Singh

-- Procedure 
-- Update Product Stock 

DELIMITER // 
create procedure updateProductStock (
	IN p_product_id INT ,
    IN p_product_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_stock INT
)
BEGIN 
	UPDATE Products
    SET Stocks = p_stock
    WHERE product_id = p_product_id;
END //

DELIMITER ;