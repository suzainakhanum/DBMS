-- Create Database
CREATE DATABASE BankingDB;
USE BankingDB;

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    city VARCHAR(50)
);

desc Customers;

-- Table: Accounts
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

desc Accounts;
-- Table: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(10), -- 'Deposit' or 'Withdraw'
    amount DECIMAL(15,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

desc Transactions;

-- Insert into Customers
INSERT INTO Customers VALUES
(1, 'Asha', 'Rao', '1988-04-12', 'Bangalore'),
(2, 'Rahul', 'Kumar', '1990-10-05', 'Mysore'),
(3, 'Sneha', 'Patil', '1992-07-22', 'Mangalore');

select * from Customers;

-- Output:
-- 1	Asha	Rao	1988-04-12	Bangalore
-- 2	Rahul	Kumar	1990-10-05	Mysore
-- 3	Sneha	Patil	1992-07-22	Mangalore
				

-- Insert into Accounts
INSERT INTO Accounts VALUES
(101, 1, 'Savings', 50000.00),
(102, 2, 'Current', 75000.00),
(103, 3, 'Savings', 60000.00);

-- Output:
-- 1	Asha	Rao	1988-04-12	Bangalore
-- 2	Rahul	Kumar	1990-10-05	Mysore
-- 3	Sneha	Patil	1992-07-22	Mangalore
				

-- Insert into Transactions
INSERT INTO Transactions VALUES
(1, 101, 'Deposit', 10000.00, '2025-10-01'),
(2, 101, 'Withdraw', 5000.00, '2025-10-05'),
(3, 102, 'Deposit', 20000.00, '2025-10-03'),
(4, 103, 'Withdraw', 10000.00, '2025-10-02'),
(5, 102, 'Withdraw', 5000.00, '2025-10-10');

-- Output:

-- Aggregate functions --

-- Total transactions amount per account

SELECT Accounts.account_id,
	   SUM(CASE WHEN Transactions.transaction_type = 'Deposit' THEN amount
				WHEN Transactions.transaction_type = 'Withdraw' THEN -amount
		   END) AS Net_transaction 
FROM Accounts 
JOIN Transactions
ON Accounts.account_id = Transactions.account_id
GROUP BY Accounts.account_id;
				
-- Output:
-- 101	5000.00
-- 102	15000.00
-- 103	-10000.00

-- MAX and MIN Transactions
SELECT MAX(amount) AS Max_Transaction,
       MIN(amount) AS Min_Transaction
FROM Transactions;

-- Output: 20000.00	5000.00

-- Date Functions 
-- Transactions in October 2025
SELECT Transactions.transaction_id ,
	   Accounts.account_id,
       Transactions.transaction_type,
       Transactions.amount,
       Transactions.transaction_date
FROM Transactions
JOIN Accounts
ON Transactions.account_id = Accounts.account_id
WHERE MONTH(transaction_date) = 10 AND  YEAR(transaction_date) = 2025;

-- Output:
-- 1	101	Deposit	10000.00	2025-10-01
-- 2	101	Withdraw	5000.00	2025-10-05
-- 3	102	Deposit	20000.00	2025-10-03
-- 5	102	Withdraw	5000.00	2025-10-10
-- 4	103	Withdraw	10000.00	2025-10-02

-- JOIN Queries
-- Customers details with their accounts and balance
SELECT Customers.customer_id,
	   CONCAT(Customers.first_name , ' ' , Customers.last_name) AS FullName,
       Accounts.account_id,
       Accounts.account_type,
       Accounts.balance
FROM Customers
JOIN Accounts
ON Customers.customer_id = Accounts.customer_id;

-- Output:
-- 1	Asha Rao	101	Savings	50000.00
-- 2	Rahul Kumar	102	Current	75000.00
-- 3	Sneha Patil	103	Savings	60000.00

-- Procedure

-- 1.Procedure to insert transaction 
DELIMITER //

create procedure InsertTransaction (
	IN p_transaction_id INT,
    IN p_account_id INT,
    IN p_transaction_type VARCHAR(10), 
    IN p_amount DECIMAL(15,2),
    IN p_transaction_date DATE
)
BEGIN 
	INSERT INTO Transactions VALUES ( p_transaction_id , p_account_id, p_transaction_type, p_amount, p_transaction_date);
    
    IF transaction_type = 'Deposit' THEN
		UPDATE Accounts
        SET balance = balance + amount
        WHERE  account_id = p_account_id;
	ELSEIF transaction_type = 'Withdraw' THEN 
		UPDATE Accounts
        SET balance = balance - amount
        WHERE account_id = p_account_id;
	END IF;
END //

DELIMITER ;
        
		
END //

DELIMITER ;    

-- 2. Procedure to Update transaction 
DELIMITER //

create procedure UpdateTransaction (
	IN p_transaction_id INT ,
    IN p_account_id INT,
    IN p_transaction_type VARCHAR(10), 
    IN p_amount DECIMAL(15,2),
    IN p_transaction_date DATE
)
BEGIN 
	UPDATE Transactions
    SET  amount  = p_amount
    WHERE transaction_id  = p_transaction_id;
END //

DELIMITER ;

