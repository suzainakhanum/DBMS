CREATE DATABASE HotelDB;
USE HotelDB;

-- Guests Table
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15)
);

desc Guests;

-- Rooms Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10,2)
);

desc Rooms;

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

desc Bookings;

-- Guests
INSERT INTO Guests VALUES
(1, 'Rahul', 'Sharma', '9876543210'),
(2, 'Priya', 'Patel', '9876501234'),
(3, 'Amit', 'Verma', '9876512345'),
(4, 'Neha', 'Reddy', '9876523456'),
(5, 'Vikas', 'Mehta', '9876534567'),
(6, 'Sneha', 'Nair', '9876545678'),
(7, 'Arjun', 'Singh', '9876556789'),
(8, 'Divya', 'Kapoor', '9876567890'),
(9, 'Rohan', 'Desai', '9876578901'),
(10, 'Kiran', 'Gupta', '9876589012');

select * from Guests;
-- Rooms
INSERT INTO Rooms VALUES
(101, 'Single', 2000.00),
(102, 'Double', 3500.00),
(103, 'Suite', 5000.00),
(104, 'Single', 2000.00),
(105, 'Double', 3500.00),
(106, 'Suite', 5000.00),
(107, 'Single', 2000.00),
(108, 'Double', 3500.00),
(109, 'Suite', 5000.00),
(110, 'Single', 2000.00);

select * from Rooms;

-- Output:
-- 101	Single	2000.00
-- 102	Double	3500.00
-- 103	Suite	5000.00
-- 104	Single	2000.00
-- 105	Double	3500.00
-- 106	Suite	5000.00
-- 107	Single	2000.00
-- 108	Double	3500.00
-- 109	Suite	5000.00
-- 110	Single	2000.00
		

-- Bookings
INSERT INTO Bookings VALUES
(1001, 1, 101, '2025-10-01', '2025-10-05'),
(1002, 2, 102, '2025-10-02', '2025-10-06'),
(1003, 3, 103, '2025-10-03', '2025-10-08'),
(1004, 4, 104, '2025-10-04', '2025-10-07'),
(1005, 5, 105, '2025-10-05', '2025-10-09'),
(1006, 6, 106, '2025-10-06', '2025-10-10'),
(1007, 7, 107, '2025-10-07', '2025-10-11'),
(1008, 8, 108, '2025-10-08', '2025-10-12'),
(1009, 9, 109, '2025-10-09', '2025-10-13'),
(1010, 10, 110, '2025-10-10', '2025-10-14');

select * from Bookings;

-- Output:
-- 1001	1	101	2025-10-01	2025-10-05
-- 1002	2	102	2025-10-02	2025-10-06
-- 1003	3	103	2025-10-03	2025-10-08
-- 1004	4	104	2025-10-04	2025-10-07
-- 1005	5	105	2025-10-05	2025-10-09
-- 1006	6	106	2025-10-06	2025-10-10
-- 1007	7	107	2025-10-07	2025-10-11
-- 1008	8	108	2025-10-08	2025-10-12
-- 1009	9	109	2025-10-09	2025-10-13
-- 1010	10	110	2025-10-10	2025-10-14

-- GROUP BY AND JOIN 
-- Total Revenue Per Room Type

SELECT Rooms.room_type,
	   SUM(DATEDIFF(Bookings.check_out , Bookings.check_in ) * Rooms.price_per_night) AS Total_Revenue
FROM Bookings
JOIN Rooms 
ON Bookings.room_id = Rooms.room_id
GROUP BY Rooms.room_type;

-- Output:
-- Single	30000.00
-- Double	42000.00
-- Suite	65000.00


-- Booking guests per duration 
SELECT Guests.first_name , Guests.last_name,
	   CONCAT(Guests.first_name, ' ', Guests.last_name) AS FullName,
	   DATEDIFF(Bookings.check_out , Bookings.check_in) AS Booking_Duration
FROM Bookings
JOIN Guests
ON Bookings.guest_id = Guests.guest_id;

-- Guest and Booking Details
SELECT Guests.first_name , Guests.last_name,
	   Rooms.room_type,
	   Bookings.check_out , Bookings.check_in
FROM Bookings
JOIN Guests
ON Bookings.guest_id = Guests.guest_id
JOIN Rooms
ON Bookings.room_id = Rooms.room_id;

-- Output:
-- Rahul	Sharma	Single	2025-10-05	2025-10-01
-- Priya	Patel	Double	2025-10-06	2025-10-02
-- Amit	Verma	Suite	2025-10-08	2025-10-03
-- Neha	Reddy	Single	2025-10-07	2025-10-04
-- Vikas	Mehta	Double	2025-10-09	2025-10-05
-- Sneha	Nair	Suite	2025-10-10	2025-10-06
-- Arjun	Singh	Single	2025-10-11	2025-10-07
-- Divya	Kapoor	Double	2025-10-12	2025-10-08
-- Rohan	Desai	Suite	2025-10-13	2025-10-09
-- Kiran	Gupta	Single	2025-10-14	2025-10-10

-- Procedure - Insert New Booking
DELIMITER //
create procedure InsertBooking (
	IN p_booking_id INT ,
    IN p_guest_id INT,
    IN p_room_id INT,
    IN p_check_in DATE,
    IN p_check_out DATE 
)
BEGIN 
	INSERT INTO Booking VALUES ( p_booking_id , p_guest_id , p_room_id , p_check_in , p_check_out);
END //

DELIMITER ;

-- Update Booking dates
DELIMITER //

CREATE PROCEDURE UpdateBooking (
    IN p_booking_id INT,
    IN p_check_in DATE,
    IN p_check_out DATE
)
BEGIN
    
    UPDATE Bookings
    SET check_in = p_check_in,
        check_out = p_check_out
    WHERE booking_id = p_booking_id;
END //

DELIMITER ;
