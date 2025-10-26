CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    city VARCHAR(50)
);

desc Patients;

CREATE TABLE Doctors (
    doctor_id VARCHAR(20) PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

desc Doctors;

CREATE TABLE Appointments (
    appointment_id VARCHAR(20) PRIMARY KEY,
    patient_id VARCHAR(20),
    doctor_id VARCHAR(20),
    appointment_date DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Patients (patient_id, patient_name, gender, dob, city)
VALUES
('P1', 'Alice', 'Female', '1990-05-12', 'Bengaluru'),
('P2', 'Bob', 'Male', '1985-08-20', 'Mumbai'),
('P3', 'Charlie', 'Male', '1992-12-02', 'Delhi'),
('P4', 'Diana', 'Female', '1988-07-15', 'Chennai'),
('P5', 'Ethan', 'Male', '1995-03-22', 'Hyderabad');

select * from Patients;

-- Output:
-- P1	Alice	Female	1990-05-12	Bengaluru
-- P2	Bob	Male	1985-08-20	Mumbai
-- P3	Charlie	Male	1992-12-02	Delhi
-- P4	Diana	Female	1988-07-15	Chennai
-- P5	Ethan	Male	1995-03-22	Hyderabad

INSERT INTO Doctors (doctor_id, doctor_name, specialization, phone)
VALUES
('D1', 'Dr. Sharma', 'Cardiology', '9876543210'),
('D2', 'Dr. Mehta', 'Neurology', '9876543211'),
('D3', 'Dr. Iyer', 'Orthopedics', '9876543212');

Select * from Doctors;

-- Output:
-- 	D1	Dr. Sharma	Cardiology	9876543210
-- 	D2	Dr. Mehta	Neurology	9876543211
-- 	D3	Dr. Iyer	Orthopedics	9876543212

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, diagnosis)
VALUES
('A1', 'P1', 'D1', '2025-10-01', 'Heart Checkup'),
('A2', 'P2', 'D2', '2025-10-02', 'Migraine'),
('A3', 'P3', 'D1', '2025-10-03', 'Blood Pressure'),
('A4', 'P4', 'D3', '2025-10-04', 'Fracture'),
('A5', 'P5', 'D1', '2025-10-05', 'Chest Pain');

Select * from Appointments;

-- Output:
-- A1	P1	D1	2025-10-01	Heart Checkup
-- A2	P2	D2	2025-10-02	Migraine
-- A3	P3	D1	2025-10-03	Blood Pressure
-- A4	P4	D3	2025-10-04	Fracture
-- A5	P5	D1	2025-10-05	Chest Pain


-- List all appointments with patient & doctor names

Select Patients.patient_id , Patients.patient_name , Doctors.doctor_id, Doctors.doctor_name, Appointments.appointment_id , Appointments.appointment_date
FROM Appointments 
JOIN Patients 
ON Appointments.patient_id = Patients.patient_id
JOIN Doctors
ON Appointments.doctor_id = Doctors.doctor_id

-- Output:
-- P1	Alice	D1	Dr. Sharma	A1	2025-10-01
-- P3	Charlie	D1	Dr. Sharma	A3	2025-10-03
-- P5	Ethan	D1	Dr. Sharma	A5	2025-10-05
-- P2	Bob	D2	Dr. Mehta	A2	2025-10-02
-- P4	Diana	D3	Dr. Iyer	A4	2025-10-04

-- Aggregate Function -- 
-- Count total patients per doctor 

SELECT Doctors.doctor_name, Doctors.specialization, COUNT(Appointments.patient_id) AS Total_patients
FROM Doctors
LEFT JOIN Appointments
ON Doctors.doctor_id = Appointments.doctor_id
GROUP BY Doctors.doctor_name, Doctors.specialization;

-- Output:
-- Dr. Sharma	Cardiology	3
-- Dr. Mehta	Neurology	1
-- Dr. Iyer	Orthopedics	1

-- Stored Procedure to Insert Appointment
DELIMITER //

create procedure InsertAppointment (
	IN p_appointment_id  VARCHAR(20),
    IN p_patient_id VARCHAR(20),
    IN p_doctor_id VARCHAR(20),
    IN p_appointment_date date,
    IN p_diagnosis VARCHAR(255)
)
BEGIN 
	 INSERT INTO Appointments(appointment_id, patient_id, doctor_id, appointment_date, diagnosis)
     VALUES (p_appointment_id, p_patient_id, p_doctor_id, p_appointment_date, p_diagnosis);
END //

DELIMITER ;

-- Update Procedure

DELIMITER //

create procedure UpdateAppointment (
	IN p_appointment_id VARCHAR(20),
    IN p_patient_id VARCHAR(20),
    IN p_doctor_id VARCHAR(20),
    IN p_appointment_date DATE,
    IN p_diagnosis VARCHAR(255)
)
BEGIN 
	Update Appointments
		SET diagnosis = p_diagnosis,
			appointment_date = p_appointment_date
		WHERE appointment_id = p_appointment_id ;
END //
DELIMITER ;
