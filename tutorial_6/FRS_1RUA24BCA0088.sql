CREATE DATABASE FlightReservationDB;
USE FlightReservationDB;

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

desc Passengers;

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_name VARCHAR(50),
    destination VARCHAR(50)
);

desc Flights;

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

desc Bookings;

INSERT INTO Passengers VALUES
(1, 'Rahul', 'Sharma'),
(2, 'Priya', 'Patel'),
(3, 'Amit', 'Verma'),
(4, 'Neha', 'Reddy'),
(5, 'Vikas', 'Mehta'),
(6, 'Sneha', 'Nair'),
(7, 'Arjun', 'Singh'),
(8, 'Divya', 'Kapoor'),
(9, 'Rohan', 'Desai'),
(10, 'Kiran', 'Gupta');

select * from Passengers;

-- Output:
-- 1	Rahul	Sharma
-- 2	Priya	Patel
-- 3	Amit	Verma
-- 4	Neha	Reddy
-- 5	Vikas	Mehta
-- 6	Sneha	Nair
-- 7	Arjun	Singh
-- 8	Divya	Kapoor
-- 9	Rohan	Desai
-- 10	Kiran	Gupta


INSERT INTO Flights VALUES
(101, 'Air India', 'Delhi'),
(102, 'Indigo', 'Mumbai'),
(103, 'SpiceJet', 'Chennai'),
(104, 'Vistara', 'Bangalore'),
(105, 'AirAsia', 'Hyderabad'),
(106, 'GoFirst', 'Pune'),
(107, 'Emirates', 'Dubai'),
(108, 'Qatar Airways', 'Doha'),
(109, 'Etihad', 'Abu Dhabi'),
(110, 'Singapore Airlines', 'Singapore');

select * from Flights;

-- Output:
-- 101	Air India	Delhi
-- 102	Indigo	Mumbai
-- 103	SpiceJet	Chennai
-- 104	Vistara	Bangalore
-- 105	AirAsia	Hyderabad
-- 106	GoFirst	Pune
-- 107	Emirates	Dubai
-- 108	Qatar Airways	Doha
-- 109	Etihad	Abu Dhabi
-- 110	Singapore Airlines	Singapore

INSERT INTO Bookings VALUES
(1001, 1, 101, '2025-10-15'),
(1002, 2, 102, '2025-10-16'),
(1003, 3, 103, '2025-10-17'),
(1004, 4, 104, '2025-10-18'),
(1005, 5, 105, '2025-10-19'),
(1006, 6, 106, '2025-10-20'),
(1007, 7, 107, '2025-10-21'),
(1008, 8, 108, '2025-10-22'),
(1009, 9, 109, '2025-10-23'),
(1010, 10, 110, '2025-10-24');
	
select * from Bookings;

-- Output:
-- 1001	1	101	2025-10-15
-- 1002	2	102	2025-10-16
-- 1003	3	103	2025-10-17
-- 1004	4	104	2025-10-18
-- 1005	5	105	2025-10-19
-- 1006	6	106	2025-10-20
-- 1007	7	107	2025-10-21
-- 1008	8	108	2025-10-22
-- 1009	9	109	2025-10-23
-- 1010	10	110	2025-10-24

-- GROUP BY 
-- Total Passenger Per Flight
SELECT flight_id,
       COUNT(passenger_id) AS Total_Passengers
FROM Bookings
GROUP BY flight_id;

-- Output:
-- 101	1
-- 102	1
-- 103	1
-- 104	1
-- 105	1
-- 106	1
-- 107	1
-- 108	1
-- 109	1
-- 110	1

-- Display flight details for each passenger
SELECT Passengers.first_name,
	   Passengers.last_name,
       CONCAT(Passengers.first_name , ' ' , Passengers.last_name) AS FullName,
       Flights.flight_id,
       Flights.flight_name,
       Flights.destination ,
       Bookings.booking_date
FROM Bookings
JOIN Passengers 
ON Bookings.passenger_id = Passengers.passenger_id
JOIN Flights
ON Bookings.flight_id = Flights.flight_id;

-- Output:
-- Rahul	Sharma	Rahul Sharma	101	Air India	Delhi	2025-10-15
-- Priya	Patel	Priya Patel	102	Indigo	Mumbai	2025-10-16
-- Amit	Verma	Amit Verma	103	SpiceJet	Chennai	2025-10-17
-- Neha	Reddy	Neha Reddy	104	Vistara	Bangalore	2025-10-18
-- Vikas	Mehta	Vikas Mehta	105	AirAsia	Hyderabad	2025-10-19
-- Sneha	Nair	Sneha Nair	106	GoFirst	Pune	2025-10-20
-- Arjun	Singh	Arjun Singh	107	Emirates	Dubai	2025-10-21
-- Divya	Kapoor	Divya Kapoor	108	Qatar Airways	Doha	2025-10-22
-- Rohan	Desai	Rohan Desai	109	Etihad	Abu Dhabi	2025-10-23
-- Kiran	Gupta	Kiran Gupta	110	Singapore Airlines	Singapore	2025-10-24

-- Procedure
-- INSERT NEW Booking
DELIMITER //

create procedure InsertNewBooking (
	IN p_booking_id INT ,
    IN p_passenger_id INT,
    IN p_flight_id INT,
    IN p_booking_date DATE
)
BEGIN 
	INSERT INTO Bookings VALUES (p_booking_id , p_passenger_id, p_flight_id , p_booking_date);
END //

DELIMITER ;


-- Update Procedure :Update Booking
DELIMITER //

create procedure updateBooking (
	IN p_booking_id INT ,
    IN p_passenger_id INT,
    IN p_flight_id INT,
    IN p_booking_date DATE
)
BEGIN
	UPDATE Bookings
    SET booking_date = p_booking_date
    WHERE booking_id = p_booking_id;
END //

DELIMITER ;