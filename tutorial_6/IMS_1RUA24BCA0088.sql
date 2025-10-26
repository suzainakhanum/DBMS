CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact VARCHAR(15)
);

desc Suppliers;

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

desc Products;

-- SupplyOrders Table
CREATE TABLE SupplyOrders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

desc SupplyOrders;

-- Suppliers
INSERT INTO Suppliers VALUES
(1, 'ABC Supplies', '9876543210'),
(2, 'XYZ Traders', '9876501234'),
(3, 'PQR Industries', '9876512345'),
(4, 'LMN Distributors', '9876523456'),
(5, 'RST Enterprises', '9876534567'),
(6, 'GHI Corp', '9876545678'),
(7, 'JKL Suppliers', '9876556789'),
(8, 'MNO Traders', '9876567890'),
(9, 'DEF Suppliers', '9876578901'),
(10, 'UVW Industries', '9876589012');

select * from Suppliers;

-- Output:
-- 1	ABC Supplies	9876543210
-- 2	XYZ Traders	9876501234
-- 3	PQR Industries	9876512345
-- 4	LMN Distributors	9876523456
-- 5	RST Enterprises	9876534567
-- 6	GHI Corp	9876545678
-- 7	JKL Suppliers	9876556789
-- 8	MNO Traders	9876567890
-- 9	DEF Suppliers	9876578901
-- 10	UVW Industries	9876589012
		

-- Products
INSERT INTO Products VALUES
(101, 'Laptop', 50000.00),
(102, 'Keyboard', 1500.00),
(103, 'Mouse', 800.00),
(104, 'Monitor', 12000.00),
(105, 'Printer', 8000.00),
(106, 'Desk', 4000.00),
(107, 'Chair', 2000.00),
(108, 'Router', 3000.00),
(109, 'Switch', 5000.00),
(110, 'USB Cable', 200.00);

select * from Products;

-- Output:

-- 101	Laptop	50000.00
-- 102	Keyboard	1500.00
-- 103	Mouse	800.00
-- 104	Monitor	12000.00
-- 105	Printer	8000.00
-- 106	Desk	4000.00
-- 107	Chair	2000.00
-- 108	Router	3000.00
-- 109	Switch	5000.00
-- 110	USB Cable	200.00
		
-- SupplyOrders
INSERT INTO SupplyOrders VALUES
(1001, 1, 101, 10, '2025-10-01'),
(1002, 2, 102, 50, '2025-10-02'),
(1003, 3, 103, 100, '2025-10-03'),
(1004, 4, 104, 20, '2025-10-04'),
(1005, 5, 105, 15, '2025-10-05'),
(1006, 6, 106, 30, '2025-10-06'),
(1007, 7, 107, 40, '2025-10-07'),
(1008, 8, 108, 25, '2025-10-08'),
(1009, 9, 109, 10, '2025-10-09'),
(1010, 10, 110, 200, '2025-10-10');

select * from SupplyOrders;

-- Output:
-- 1001	1	101	10	2025-10-01
-- 1002	2	102	50	2025-10-02
-- 1003	3	103	100	2025-10-03
-- 1004	4	104	20	2025-10-04
-- 1005	5	105	15	2025-10-05
-- 1006	6	106	30	2025-10-06
-- 1007	7	107	40	2025-10-07
-- 1008	8	108	25	2025-10-08
-- 1009	9	109	10	2025-10-09
-- 1010	10	110	200	2025-10-10

-- Total quantities supplied per Supplier

SELECT Suppliers.supplier_name,
	   SUM(SupplyOrders.quantity)  AS Total_Quantiy
FROM SupplyOrders
JOIN Suppliers
ON SupplyOrders.supplier_id = Suppliers.supplier_id
GROUP BY Suppliers.supplier_name;

-- Output:
-- ABC Supplies	10
-- XYZ Traders	50
-- PQR Industries	100
-- LMN Distributors	20
-- RST Enterprises	15
-- GHI Corp	30
-- JKL Suppliers	40
-- MNO Traders	25
-- DEF Suppliers	10
-- UVW Industries	200

-- Supply Orders in October 25
SELECT Suppliers.supplier_name , Products.product_name , SupplyOrders.quantity , SupplyOrders.order_date
FROM SupplyOrders 
JOIN Suppliers 
ON SupplyOrders.supplier_id = Suppliers.supplier_id
JOIN Products
ON SupplyOrders.product_id = Products.product_id
WHERE MONTH(SupplyOrders.order_date ) = 10 AND YEAR(SupplyOrders.order_date) = 2025;

-- OUTPUT:
-- ABC Supplies	Laptop	10	2025-10-01
-- XYZ Traders	Keyboard	50	2025-10-02
-- PQR Industries	Mouse	100	2025-10-03
-- LMN Distributors	Monitor	20	2025-10-04
-- RST Enterprises	Printer	15	2025-10-05
-- GHI Corp	Desk	30	2025-10-06
-- JKL Suppliers	Chair	40	2025-10-07
-- MNO Traders	Router	25	2025-10-08
-- DEF Suppliers	Switch	10	2025-10-09
-- UVW Industries	USB Cable	200	2025-10-10

-- Procedure
-- INSERT NEW SupplyOrder
DELIMITER //

create procedure InsertSupplyOrder (
	IN p_order_id INT,
    IN p_supplier_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_order_date DATE
)
BEGIN 
	INSERT INTO SupplyOrder VALUES (p_order_id, p_supplier_id , p_product_id , p_quanity, p_order_date);
END //

DELIMITER ;

-- Update SupplyOrder quantity

DELIMITER //

CREATE PROCEDURE UpdateSupplyOrder (
    IN p_order_id INT,
    IN p_supplier_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_order_date DATE
)
BEGIN
   
    UPDATE SupplyOrders
    SET quantity = p_quantity
    WHERE order_id = p_order_id;
END //

DELIMITER ;

