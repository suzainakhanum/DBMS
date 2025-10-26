CREATE DATABASE CinemaDB;
USE CinemaDB;

-- Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    duration INT, -- in minutes
    genre VARCHAR(50)
);

desc Movies;

-- Shows Table
CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    show_time DATETIME,
    hall VARCHAR(50),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

desc Shows;

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    show_id INT,
    tickets INT,
    booking_date DATE,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

desc Bookings;

-- Movies
INSERT INTO Movies VALUES
(1, 'Avengers: Endgame', 181, 'Action'),
(2, 'The Batman', 175, 'Action'),
(3, 'Frozen II', 103, 'Animation'),
(4, 'Joker', 122, 'Drama'),
(5, 'Inception', 148, 'Sci-Fi'),
(6, 'Titanic', 195, 'Romance'),
(7, 'Interstellar', 169, 'Sci-Fi'),
(8, 'Parasite', 132, 'Thriller'),
(9, 'Spider-Man: No Way Home', 148, 'Action'),
(10, 'The Lion King', 118, 'Animation');

select * from Movies;

-- Output: 

-- 1	Avengers: Endgame	181	Action
-- 2	The Batman	175	Action
-- 3	Frozen II	103	Animation
-- 4	Joker	122	Drama
-- 5	Inception	148	Sci-Fi
-- 6	Titanic	195	Romance
-- 7	Interstellar	169	Sci-Fi
-- 8	Parasite	132	Thriller
-- 9	Spider-Man: No Way Home	148	Action
-- 10	The Lion King	118	Animation
			
-- Shows
INSERT INTO Shows VALUES
(101, 1, '2025-10-15 10:00:00', 'Hall A'),
(102, 1, '2025-10-15 14:00:00', 'Hall B'),
(103, 2, '2025-10-16 11:00:00', 'Hall A'),
(104, 3, '2025-10-16 15:00:00', 'Hall C'),
(105, 4, '2025-10-17 10:00:00', 'Hall B'),
(106, 5, '2025-10-17 14:00:00', 'Hall A'),
(107, 6, '2025-10-18 12:00:00', 'Hall C'),
(108, 7, '2025-10-18 16:00:00', 'Hall B'),
(109, 8, '2025-10-19 11:00:00', 'Hall A'),
(110, 9, '2025-10-19 15:00:00', 'Hall C');

select * from Shows;

-- Output:

-- 101	1	2025-10-15 10:00:00	Hall A
-- 102	1	2025-10-15 14:00:00	Hall B
-- 103	2	2025-10-16 11:00:00	Hall A
-- 104	3	2025-10-16 15:00:00	Hall C
-- 105	4	2025-10-17 10:00:00	Hall B
-- 106	5	2025-10-17 14:00:00	Hall A
-- 107	6	2025-10-18 12:00:00	Hall C
-- 108	7	2025-10-18 16:00:00	Hall B
-- 109	8	2025-10-19 11:00:00	Hall A
-- 110	9	2025-10-19 15:00:00	Hall C
			

-- Bookings
INSERT INTO Bookings VALUES
(1001, 'Rahul Sharma', 101, 2, '2025-10-10'),
(1002, 'Priya Patel', 102, 4, '2025-10-11'),
(1003, 'Sneha Patil', 103, 1, '2025-10-12'),
(1004, 'Rohit Kumar', 104, 3, '2025-10-12'),
(1005, 'Neha Singh', 105, 2, '2025-10-13'),
(1006, 'Amit Joshi', 106, 5, '2025-10-13'),
(1007, 'Kiran Das', 107, 2, '2025-10-14'),
(1008, 'Anita Rao', 108, 1, '2025-10-14'),
(1009, 'Vikram Singh', 109, 3, '2025-10-15'),
(1010, 'Sonia Mehta', 110, 2, '2025-10-15');

-- OUTPUT :
-- 101	1	2025-10-15 10:00:00	Hall A
-- 102	1	2025-10-15 14:00:00	Hall B
-- 103	2	2025-10-16 11:00:00	Hall A
-- 104	3	2025-10-16 15:00:00	Hall C
-- 105	4	2025-10-17 10:00:00	Hall B
-- 106	5	2025-10-17 14:00:00	Hall A
-- 107	6	2025-10-18 12:00:00	Hall C
-- 108	7	2025-10-18 16:00:00	Hall B
-- 109	8	2025-10-19 11:00:00	Hall A
-- 110	9	2025-10-19 15:00:00	Hall C

-- Tickets Count per movie

SELECT Movies.movie_name , 
	   SUM(Bookings.tickets) AS Total_tickets
FROM Bookings
JOIN Shows 
ON Bookings.show_id = Shows.show_id
JOIN Movies
ON Shows.movie_id = Movies.movie_id
GROUP BY Movies.movie_name
ORDER BY Total_tickets DESC;

-- Output:
-- Avengers: Endgame	6
-- Inception	5
-- Frozen II	3
-- Parasite	3
-- Joker	2
-- Titanic	2
-- Spider-Man: No Way Home	2
-- The Batman	1
-- Interstellar	1

-- Customer and Movie Details

SELECT Bookings.customer_name , Movies.movie_name , Shows.show_time , Bookings.tickets
FROM Bookings 
JOIN Shows 
ON Bookings.show_id = Shows.show_id
JOIN Movies
ON Shows.movie_id =  Movies.movie_id
ORDER BY Bookings.customer_name;

-- OUTPUT:
-- Amit Joshi	Inception	2025-10-17 14:00:00	5
-- Anita Rao	Interstellar	2025-10-18 16:00:00	1
-- Kiran Das	Titanic	2025-10-18 12:00:00	2
-- Neha Singh	Joker	2025-10-17 10:00:00	2
-- Priya Patel	Avengers: Endgame	2025-10-15 14:00:00	4
-- Rahul Sharma	Avengers: Endgame	2025-10-15 10:00:00	2
-- Rohit Kumar	Frozen II	2025-10-16 15:00:00	3
-- Sneha Patil	The Batman	2025-10-16 11:00:00	1
-- Sonia Mehta	Spider-Man: No Way Home	2025-10-19 15:00:00	2
-- Vikram Singh	Parasite	2025-10-19 11:00:00	3

-- Procedure -- 

-- Insert Booking -- 
DELIMITER //

create procedure InsertBooking (
	IN  p_booking_id INT ,
	IN p_customer_name VARCHAR(100),
    IN p_show_id INT,
	IN p_tickets INT,
	IN p_booking_date DATE
)
BEGIN 
	INSERT INTO Booking VALUES ( p_booking_id, p_customer_name , p_show_id , p_tickets, p_booking_date);
END //

DELIMITER ;

-- Update Booking --

DELIMITER //

create procedure Updateooking (
	IN  p_booking_id INT ,
	IN p_customer_name VARCHAR(100),
    IN p_show_id INT,
	IN p_tickets INT,
	IN p_booking_date DATE
)

BEGIN 
	UPDATE Bookings
    SET tickets = p_tickets
    WHERE booking_id = p_booking_id;
END //

DELIMITER ;
    
