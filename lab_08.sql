-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: suzaina khanum
-- USN: 1RUA24BCA0088
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- 'root@localhost','apples-MacBook-Air.local','8.4.6','2025-09-22 11:29:51'

-- Write your code below this line along with the output 
create database the;
use the;
-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create table customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

-- insert 5 records
INSERT INTO customer (customer_id, customer_name, city)
VALUES (1, 'Ramesh', 'Bangalore'),
(2, 'Suresh', 'Mysore'),
(3, 'Akash', 'Udupi');


-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
create table Orders(
order_id INT PRIMARY KEY,
customer_id INT,
product_name VARCHAR(50),
order_date DATE,
foreign key(customer_id) references customer(customer_id)
);
    -- insert 5 records
    -- Insert orders for customers
INSERT INTO Orders (order_id, customer_id, product_name, order_date)
VALUES (101, 1, 'Laptop', '2025-09-20'),
(102, 2, 'Mobile', '2025-09-21'),
(103, 3, 'Headphones', '2025-09-22');



-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/
SELECT o.order_id, o.product_name, o.order_date, c.customer_name, c.city
FROM Orders o
INNER JOIN Customer c ON o.customer_id = c.customer_id
WHERE c.city = 'Bangalore';
-- '101','Laptop','2025-09-20','Ramesh','Bangalore'

SELECT c.customer_name, o.product_name
FROM Customer c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','Laptop'
'Suresh','Mobile'
'Akash','Headphones'
*/
SELECT c.customer_name, o.order_date
FROM Customer c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','2025-09-20'
'Suresh','2025-09-21'
'Akash','2025-09-22'
*/
SELECT o.order_id, c.customer_name
FROM Orders o
INNER JOIN Customer c ON o.customer_id = c.customer_id;
/*'101','Ramesh'
'102','Suresh'
'103','Akash'
*/
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customer c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/*'Ramesh','1'
'Suresh','1'
'Akash','1'
*/



/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates.
-- Write your code below this line along with the output 
*/
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name, o.order_date
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/*'1','Ramesh','101','Laptop','2025-09-20'
'2','Suresh','102','Mobile','2025-09-21'
'3','Akash','103','Headphones','2025-09-22'
*/
SELECT c.customer_name, o.product_name
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','Laptop'
'Suresh','Mobile'
'Akash','Headphones'
*/
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/*'1','Ramesh','101'
'2','Suresh','102'
'3','Akash','103'
*/
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/*'Ramesh','1'
'Suresh','1'
'Akash','1'
*/
SELECT c.customer_id, c.customer_name, c.city
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- null
 SELECT c.customer_name, o.order_date
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','2025-09-20'
'Suresh','2025-09-21'
'Akash','2025-09-22'
*/

/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */
SELECT o.order_id, o.product_name, c.customer_name, c.city
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'101','Laptop','Ramesh','Bangalore'
'102','Mobile','Suresh','Mysore'
'103','Headphones','Akash','Udupi'
*/
SELECT o.order_id, o.product_name, c.customer_name
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'101','Laptop','Ramesh'
'102','Mobile','Suresh'
'103','Headphones','Akash'
*/
SELECT o.product_name, c.customer_name
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Laptop','Ramesh'
'Mobile','Suresh'
'Headphones','Akash'
*/
SELECT o.order_id, c.city
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'101','Bangalore'
'102','Mysore'
'103','Udupi'
*/
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
/*'Ramesh','1'
'Suresh','1'
'Akash','1'
*/
SELECT c.customer_id, c.customer_name, c.city
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
-- null



/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  SELECT c.customer_id, c.customer_name, o.order_id, o.product_name, o.order_date
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name, o.order_date
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'1','Ramesh','101','Laptop','2025-09-20'
'2','Suresh','102','Mobile','2025-09-21'
'3','Akash','103','Headphones','2025-09-22'
*/
SELECT c.customer_name, o.product_name
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product_name
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','Laptop'
'Suresh','Mobile'
'Akash','Headphones'
*/
SELECT c.customer_id, o.order_id
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'1','101'
'2','102'
'3','103'
*/
SELECT c.customer_name, o.order_date
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Ramesh','2025-09-20'
'Suresh','2025-09-21'
'Akash','2025-09-22'
*/
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;
-- null
SELECT c.city, o.product_name
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.city, o.product_name
FROM Customer c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
/*'Bangalore','Laptop'
'Mysore','Mobile'
'Udupi','Headphones'
*/

  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output*/ 
     SELECT *
FROM Customer
NATURAL JOIN Orders;
/*'1','Ramesh','Bangalore','101','Laptop','2025-09-20'
'2','Suresh','Mysore','102','Mobile','2025-09-21'
'3','Akash','Udupi','103','Headphones','2025-09-22'
*/
SELECT customer_name, product_name
FROM Customer
NATURAL JOIN Orders;
/*'Ramesh','Laptop'
'Suresh','Mobile'
'Akash','Headphones'
*/
SELECT customer_name, order_date
FROM Customer
NATURAL JOIN Orders;
/*'Ramesh','2025-09-20'
'Suresh','2025-09-21'
'Akash','2025-09-22'
*/
SELECT city, product_name
FROM Customer
NATURAL JOIN Orders;

/*'Bangalore','Laptop'
'Mysore','Mobile'
'Udupi','Headphones'
*/
  
  
  -- END OF THE EXPERIMENT