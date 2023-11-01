CREATE SCHEMA doc_appointment;
use doc_appointment;

-- CREATED TABLE FOR DOCTOR SPECIALITY
CREATE TABLE speciality (
  speciality_id INT NOT NULL AUTO_INCREMENT,
  speciality_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (speciality_id)
);

-- CREATED TABLE FOR DOCTOR DETAILS
CREATE TABLE doctor_details (
  doctor_id INT NOT NULL AUTO_INCREMENT,
  doctor_fname VARCHAR(100) NOT NULL,
  doctor_lname VARCHAR(100) NOT NULL,
  doctor_dob DATE NOT NULL,
  doctor_practicing_from DATE NOT NULL,
  PRIMARY KEY (doctor_id)
);

-- CREATED TABLE FOR SHOWING DOCTOR ID AND DOCTOR SPECIALITY
CREATE TABLE doctor_speciality (
  id INT NOT NULL AUTO_INCREMENT,
  doctor_id INT NOT NULL,
  speciality_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (doctor_id) REFERENCES doctor_details(doctor_id),
  FOREIGN KEY (speciality_id) REFERENCES speciality(speciality_id)
);

-- CREATED TABLE TO SHOW QUALIFICATIONS OF THE DOCTORS
CREATE TABLE qualification_of_doctor (
  id INT NOT NULL AUTO_INCREMENT,
  doctor_id INT NOT NULL,
  qualification_name VARCHAR(100) NOT NULL,
  university_name VARCHAR(100) NOT NULL,
  pass_out_year DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (doctor_id) REFERENCES doctor_details(doctor_id)
);

-- CREATED TABLE FOR DOCTORS AFFILIATED WITH WHICH HOSPITAL
CREATE TABLE hospital_affiliation (
  id INT NOT NULL AUTO_INCREMENT,
  hospital_affiliation_id INT NOT NULL,
  doctor_id INT NOT NULL,
  hospital_name VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code INT NOT NULL,
  doctor_start_date DATE NOT NULL,
  doctor_end_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (doctor_id) REFERENCES doctor_details(doctor_id)
);
CREATE INDEX idx_hospital_affiliation_id ON hospital_affiliation(hospital_affiliation_id);

-- CREATED TABLE TO SHOW PATIENT DETAILS
CREATE TABLE patient_details (
  patient_id INT NOT NULL AUTO_INCREMENT,
  patient_fname VARCHAR(100) NOT NULL,
  patient_lname VARCHAR(100) NOT NULL,
  patient_insurance_no INT,
  contact_no BIGINT NOT NULL,
  email_id VARCHAR(200),
  PRIMARY KEY (patient_id)
);

-- CREATED TABLE TO SHOW OFFICE DETAILS AND TO SHOW FIRST AND SECOND CONSULTATION FEE
CREATE TABLE office_details (
  id INT NOT NULL AUTO_INCREMENT,
  office_id INT NOT NULL,
  hospital_affiliation_id INT NOT NULL,
  doctor_id INT,
  first_appointment_fee DECIMAL(10,2),
  followup_appointment_fee DECIMAL(10,2),
  patient_insurance_no INT,
  contact_no BIGINT,
  street VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  zip_code INT,
  PRIMARY KEY (id),
  FOREIGN KEY (hospital_affiliation_id) REFERENCES hospital_affiliation(hospital_affiliation_id),
  FOREIGN KEY (doctor_id) REFERENCES doctor_details(doctor_id)
);
CREATE INDEX idx_office_id ON office_details (office_id);
ALTER TABLE office_details DROP COLUMN patient_insurance_no, DROP COLUMN street;

-- CREATED TABLE TO SHOW STATUS OF APPOINTMENT
CREATE TABLE doc_appointment.appointment_status (
  status_id INT NOT NULL AUTO_INCREMENT,
  appointment_status VARCHAR(10) NOT NULL,
  PRIMARY KEY (status_id)
);

-- CREATED TABLE TO SHOW THE APPOINTMENT DETAILS OF THE PATIENT
CREATE TABLE appointment_details (
  appointment_id INT NOT NULL AUTO_INCREMENT,
  office_id INT NOT NULL,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  status_id INT NOT NULL,
  appointment_date DATE NOT NULL,
  patient_fname VARCHAR(100) NOT NULL,
  patient_lname VARCHAR(100) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  PRIMARY KEY (appointment_id),
  FOREIGN KEY (office_id) REFERENCES doc_appointment.office_details (office_id),
  FOREIGN KEY (patient_id) REFERENCES doc_appointment.patient_details (patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doc_appointment.doctor_details (doctor_id),
  FOREIGN KEY (status_id) REFERENCES doc_appointment.appointment_status (status_id)
);
ALTER TABLE appointment_details
MODIFY start_time TIME NOT NULL,
MODIFY end_time TIME NOT NULL;
ALTER TABLE appointment_details DROP COLUMN patient_fname, DROP COLUMN patient_lname;

-- CREATED TABLE TO GET THE PREVIOUS RECORDS OF THE PATIENTS
CREATE TABLE patient_record (
  record_id INT NOT NULL AUTO_INCREMENT,
  office_id INT NOT NULL,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  previous_appointment_date DATE,
  previous_appointment_time TIMESTAMP,
  previous_medical_history VARCHAR(500),
  previous_bill_amount FLOAT,
  doctors_comments VARCHAR(500),
  office_comments VARCHAR(500),
  PRIMARY KEY (record_id),
  FOREIGN KEY (office_id) REFERENCES office_details(office_id),
  FOREIGN KEY (patient_id) REFERENCES patient_details(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctor_details(doctor_id)
);
ALTER TABLE patient_record
MODIFY previous_appointment_time TIME NOT NULL;

-- CREATED TABLE TO SHOW THE WEEKLY AVAILABILITY OF THE DOCTORS
CREATE TABLE doctor_availability (
  id INT NOT NULL AUTO_INCREMENT,
  office_id INT NOT NULL,
  doctor_id INT NOT NULL,
  working_days VARCHAR(10) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  is_available CHAR(1) NOT NULL,
  reason_for_unavailability VARCHAR(500),
  PRIMARY KEY (id),
  FOREIGN KEY (office_id) REFERENCES doc_appointment.office_details(office_id),
  FOREIGN KEY (doctor_id) REFERENCES doc_appointment.doctor_details(doctor_id)
);
ALTER TABLE doctor_availability
MODIFY start_time TIME,
MODIFY end_time TIME;
ALTER TABLE doctor_availability
CHANGE COLUMN working_days days_of_week VARCHAR(100) NOT NULL;

USE doc_appointment;
INSERT INTO speciality (speciality_id, speciality_name) VALUES 
('001', 'Allergy and immunology'),
('002', 'Anesthesiology'),
('003', 'Dermatology'),
('004', 'Diagnostic Radiology'),
('005', 'Emergency Medicine'),
('006', 'Internal Medicine'),
('007', 'Medical Genetics'),
('008', 'Neurology'),
('009', 'Nuclear Medicine'),
('010', 'Obstetrics and Gynecology'),
('011', 'Ophthalmology'),
('012', 'Pathology'),
('013', 'Pediatrics'),
('014', 'Physical Medicine and Rehabilitation'),
('015', 'Preventive Medicine'),
('016', 'Psychiatry'),
('017', 'Radiation Oncology'),
('018', 'Surgery'),
('019', 'Urology');

INSERT INTO doctor_details (doctor_id, doctor_fname, doctor_lname, doctor_dob, doctor_practicing_from)
VALUES 
(1000, 'Raj', 'Sharma', '1976-04-12', '2000-01-01'),
(1001, 'Robert', 'Zane', '1984-02-11', '2010-01-01'),
(1002, 'Emily', 'Anderson', '1982-07-22', '2008-01-01'),
(1003, 'John', 'Smith', '1975-09-17', '2003-01-01'),
(1004, 'Maria', 'Garcia', '1988-05-31', '2015-01-01'),
(1005, 'Michael', 'Brown', '1980-12-01', '2006-01-01'),
(1006, 'Catherine', 'Wilson', '1979-06-05', '2001-01-01'),
(1007, 'James', 'Johnson', '1972-11-11', '1998-01-01'),
(1008, 'Sarah', 'Taylor', '1990-03-15', '2018-01-01'),
(1009, 'Daniel', 'Davis', '1978-01-22', '2004-01-01'),
(1010, 'Karen', 'Jackson', '1985-08-10', '2011-01-01'),
(1011, 'Mark', 'Wilson', '1974-06-19', '2002-01-01'),
(1012, 'Jessica', 'Lee', '1983-04-29', '2009-01-01'),
(1013, 'David', 'Gonzalez', '1987-09-02', '2014-01-01'),
(1014, 'Amy', 'Clark', '1981-11-15', '2007-01-01'),
(1015, 'Kevin', 'Lopez', '1977-02-28', '2000-01-01'),
(1016, 'Julie', 'Green', '1989-07-06', '2017-01-01'),
(1017, 'Steven', 'Campbell', '1973-03-25', '1999-01-01'),
(1018, 'Lauren', 'Rodriguez', '1992-05-12', '2020-01-01'),
(1019, 'Andrew', 'Thomas', '1971-12-07', '1997-01-01');

INSERT INTO doctor_speciality (id, doctor_id, speciality_id) VALUES
(001, 1000, 001),
(002, 1001, 002),
(003, 1002, 005),
(004, 1003, 006),
(005, 1004, 003),
(006, 1005, 004),
(007, 1006, 009),
(008, 1007, 008),
(009, 1008, 007),
(010, 1009, 010),
(011, 1010, 011),
(012, 1011, 012),
(013, 1012, 013),
(014, 1013, 014),
(015, 1014, 015),
(016, 1015, 016),
(017, 1016, 017),
(018, 1017, 018),
(019, 1018, 019),
(020, 1019, 018);

INSERT INTO qualification_of_doctor (id, doctor_id, qualification_name, university_name, pass_out_year) VALUES
(100, 1000, 'MD', 'Harvard University', '2000-05-30'),
(101, 1001, 'MBBS', 'Johns Hopkins University', '2010-03-15'),
(102, 1002, 'PhD', 'Columbia University', '2008-06-20'),
(103, 1003, 'MD', 'Stanford University', '2003-02-28'),
(104, 1004, 'MBBS', 'University of California, San Francisco', '2014-08-10'),
(105, 1005, 'MS', 'Yale University', '2004-11-25'),
(106, 1006, 'MD', 'Duke University', '1999-12-02'),
(107, 1007, 'PhD', 'University of Pennsylvania', '1998-05-05'),
(108, 1008, 'MD', 'Johns Hopkins University', '2007-09-12'),
(109, 1009, 'MBBS', 'Columbia University', '2003-10-01'),
(110, 1010, 'MD', 'Harvard University', '2009-07-08'),
(111, 1011, 'MS', 'University of California, Los Angeles', '2001-01-16'),
(112, 1012, 'MD', 'University of Chicago', '2006-04-21'),
(113, 1013, 'PhD', 'New York University', '2013-06-11'),
(114, 1014, 'MD', 'University of Michigan', '2006-09-27'),
(115, 1015, 'MS', 'Columbia University', '2017-03-09'),
(116, 1016, 'MD', 'University of Pittsburgh', '2008-08-06'),
(117, 1017, 'PhD', 'University of California, San Diego', '2014-12-14'),
(118, 1018, 'MBBS', 'University of California, Los Angeles', '2016-05-18'),
(119, 1019, 'MD', 'University of California, San Francisco', '2007-11-23');

INSERT INTO hospital_affiliation (id, hospital_affiliation_id, doctor_id, hospital_name, city, state, zip_code, doctor_start_date, doctor_end_date)
VALUES
(1, 5000, 1000, 'Oceanview Medical Center', 'SanDiego', 'California', 22120, '2010-01-01', NULL ),
(2, 5001, 1001, 'Brighter Days Hospital', 'Dallas', 'Texas', 34521, '2009-02-01', NULL),
(3, 5000, 1002, 'Oceanview Medical Center', 'SanDiego', 'California', 22120, '2010-03-01', NULL),
(4, 5002, 1003, 'Summit Health and Wellness', 'Orlando', 'Florida', 43256, '2009-04-01', NULL),
(5, 5002, 1004, 'Summit Health and Wellness', 'Orlando', 'Florida', 43256, '2007-05-01', NULL),
(6, 5003, 1005, 'Valley Medical Center', 'Rochester', 'New York', 23453, '2012-06-01', NULL),
(7, 5004, 1006, 'Harmony General Hospital', 'Springfield', 'Illinois', 56321, '2003-07-01', NULL),
(8, 5001, 1007, 'Brighter Days Hospital', 'Dallas', 'Texas', 34521, '2009-08-01', NULL),
(9, 5000, 1008, 'Oceanview Medical Center', 'SanDiego', 'California', 22120, '2012-09-01', NULL),
(10, 5001, 1009, 'Brighter Days Hospital', 'Dallas', 'Texas', 34521, '2011-10-01', NULL),
(11, 5000, 1010, 'Oceanview Medical Center', 'SanDiego', 'California', 22120, '2003-11-01', NULL),
(12, 5002, 1011, 'Summit Health and Wellness', 'Orlando', 'Florida', 43256, '2014-12-01', NULL),
(13, 5002, 1012, 'Summit Health and Wellness', 'Orlando', 'Florida', 43256, '2015-01-01', '2020-12-12'),
(14, 5003, 1013, 'Valley Medical Center', 'Rochester', 'New York', 23453, '2012-02-01', NULL),
(15, 5004, 1014, 'Harmony General Hospital', 'Springfield', 'Illinois', 56321, '2003-03-01', NULL),
(16, 5001, 1015, 'Brighter Days Hospital', 'Dallas', 'Texas', 34521, '2021-04-01', NULL),
(17, 5003, 1016, 'Valley Medical Center', 'Rochester', 'New York', 23453, '2021-05-01', NULL),
(18, 5004, 1017, 'Harmony General Hospital', 'Springfield', 'Illinois', 56321, '2015-06-01', '2022-03-04'),
(19, 5001, 1018, 'Brighter Days Hospital', 'Dallas', 'Texas', 34521, '2019-07-01', NULL),
(20, 5000, 1019, 'Oceanview Medical Center', 'SanDiego', 'California', '22120', '2019-03-04', NULL);

INSERT INTO patient_details (patient_id, patient_fname, patient_lname, patient_insurance_no, contact_no, email_id) VALUES
(10000, 'John', 'Doe', 123456, 9876543210, 'john.doe@example.com'),
(10001, 'Jane', 'Smith', 234567, 8765432109, 'jane.smith@example.com'),
(10002, 'David', 'Brown', 345678, 7654321098, 'david.brown@example.com'),
(10003, 'Emily', 'Jones', 456789, 6543210987, 'emily.jones@example.com'),
(10004, 'Sarah', 'Davis', 567890, 5432109876, 'sarah.davis@example.com'),
(10005, 'Michael', 'Miller', 678901, 4321098765, 'michael.miller@example.com'),
(10006, 'Jessica', 'Wilson', 789012, 3210987654, 'jessica.wilson@example.com'),
(10007, 'Christopher', 'Taylor', 890123, 2109876543, 'christopher.taylor@example.com'),
(10008, 'Amanda', 'Anderson', 901234, 1098765432, 'amanda.anderson@example.com'),
(10009, 'Daniel', 'Thomas', 102345, 987654321, 'daniel.thomas@example.com');

INSERT INTO office_details (id, office_id, hospital_affiliation_id, doctor_id, first_appointment_fee, followup_appointment_fee, contact_no, city, state, zip_code) VALUES 
(1, 50, 5000, 1000, 100, 80, '9238473265', 'SanDiego', 'California', 22120),
(2, 51, 5001, 1001, 75, 55, '6172134627', 'Dallas', 'Texas', 34521),
(3, 50, 5000, 1002, 100, 80,'9238473265', 'SanDiego', 'California', 22120),
(4, 52, 5002, 1003, 90, 70, '4137652345', 'Orlando', 'Florida', 43256),
(5, 52, 5002, 1004, 90, 70, '4137652345', 'Orlando', 'Florida', 43256),
(6, 53, 5003, 1005, 90, 70, '7861234245', 'Rochester', 'New York', 23453),
(7, 54, 5004, 1006, 80, 60, '6662124444', 'Springfield', 'Illinois', 56321),
(8, 51, 5001, 1007, 75, 55, '6172134627', 'Dallas', 'Texas', 34521),
(9, 50, 5000, 1008, 100, 80, '9238473265', 'SanDiego', 'California', 22120),
(10, 51, 5001, 1009, 75, 55, '6172134627', 'Dallas', 'Texas', 34521),
(11, 50, 5000, 1010, 100, 80,'9238473265', 'SanDiego', 'California', 22120),
(12, 52, 5002, 1011, 90, 70, '4137652345',  'Orlando', 'Florida', 43256),
(13, 52, 5002, 1012, 90, 70, '4137652345', 'Orlando', 'Florida', 43256),
(14, 53, 5003, 1013, 90, 70, '7861234245', 'Rochester', 'New York', 23453),
(15, 54, 5004, 1014, 80, 60, '6662124444', 'Springfield', 'Illinois', 56321),
(16, 51, 5001, 1015, 75, 55, '6172134627', 'Dallas', 'Texas', 34521),
(17, 53, 5003, 1016, 90, 70, '7861234245', 'Rochester', 'New York', 23453),
(18, 54, 5004, 1017, 80, 60, '6662124444', 'Springfield', 'Illinois', 56321),
(19, 51, 5001, 1018, 75, 55, '6172134627', 'Dallas', 'Texas', 34521),
(20, 50, 5000, 1019, 100, 80, '9238473265', 'SanDiego', 'California', 22120);

INSERT INTO doc_appointment.appointment_status (status_id, appointment_status) 
VALUES 
(1, 'Confirmed'), 
(2, 'Confirmed'), 
(3, 'Waiting'), 
(4, 'Waiting'), 
(5, 'Not Avail'), 
(6, 'Waiting'), 
(7, 'Waiting'), 
(8, 'Waiting');

INSERT INTO appointment_details (appointment_id, office_id, doctor_id, patient_id, status_id, appointment_date, start_time, end_time)
VALUES
(1, 50, 1000, 10000, 1, '2022-04-15', '12:00:00', '13:00:00'),
(2, 51, 1001, 10001, 2, '2022-04-12', '14:30:00', '15:00:00'),
(3, 50, 1002, 10002, 3, '2022-05-02', '11:00:00', '12:00:00'),
(4, 52, 1003, 10003, 4, '2022-05-03', '09:00:00', '11:00:00'),
(5, 52, 1004, 10004, 5, '2022-06-03', '14:00:00', '16:00:00'),
(6, 53, 1005, 10005, 6, '2022-03-23', '11:00:00', '14:00:00');

INSERT INTO patient_record (record_id, office_id, patient_id, doctor_id, previous_appointment_date, previous_appointment_time, previous_medical_history, previous_bill_amount, doctors_comments, office_comments) 
VALUES 
(1, 50, 10000, 1000, '2022-01-12', '14:00:00', NULL, 120, 'Regular Checkup', 'All dues clear'),
(2, 51, 10001, 1001, '2022-01-29', '12:00:00', 'Diabetes stage 1', 100, 'Under Observation', 'Amount Pending'),
(3, 50, 10002, 1002, '2021-12-12', '11:00:00', NULL, 90, 'Regular Checkup', 'All dues clear'),
(4, 52, 10003, 1000, '2021-12-23', '09:00:00', 'Lung Cancer stage 1', 200, 'Under Observation', 'All dues clear'),
(5, 52, 10004, 1001, '2022-02-12', '13:00:00', 'Diabetes stage 1', 100, 'Under Observation', 'Amount Pending'),
(6, 53, 10005, 1004, '2022-03-22', '12:00:00', NULL, 80, 'Regular Checkup', 'All dues clear');

-- INSERTED DATA INTO doctor_availability TABLE
INSERT INTO doctor_availability (id, office_id, doctor_id, days_of_week, start_time, end_time, is_available, reason_for_unavailability) VALUES
(1, 50, 1000, 'Monday', '08:00:00', '17:00:00', 'Y', NULL),
(2, 50, 1000, 'Wednesday', '08:00:00', '17:00:00', 'Y', NULL),
(3, 51, 1001, 'Tuesday', '08:00:00', '17:00:00', 'Y', NULL),
(4, 51, 1001, 'Wednesday', '08:00:00', '17:00:00', 'Y', NULL),
(5, 50, 1002, 'Thursday', '08:00:00', '17:00:00', 'Y', NULL),
(6, 52, 1003, 'Friday', '08:00:00', '17:00:00', 'Y', NULL),
(7, 52, 1003, 'Saturday', '08:00:00', '17:00:00', 'Y', NULL),
(8, 52, 1004, 'Sunday', '08:00:00', '17:00:00', 'Y', NULL),
(9, 52, 1004, 'Not Available', '00:00:00', '00:00:00', 'N', 'Vacation'),
(10, 53, 1005, 'Monday', '08:00:00', '17:00:00', 'Y', NULL),
(11, 54, 1006, 'Monday', '08:00:00', '17:00:00', 'Y', NULL),
(12, 51, 1007, 'Wednesday', '08:00:00', '17:00:00', 'Y', NULL),
(13, 51, 1007, 'Thursday', '08:00:00', '17:00:00', 'Y', NULL),
(14, 50, 1008, 'Monday', '08:00:00', '17:00:00', 'Y', NULL),
(15, 51, 1009, 'Tuesday', '08:00:00', '17:00:00', 'Y', NULL),
(16, 50, 1010, 'Thursday', '08:00:00', '17:00:00', 'Y', NULL),
(17, 52, 1011, 'Thursday', '08:00:00', '17:00:00', 'Y', NULL),
(18, 52, 1012, 'Tuesday', '08:00:00', '17:00:00', 'Y', NULL),
(19, 53, 1013, 'Friday', '08:00:00', '17:00:00', 'Y', NULL),
(20, 54, 1014, 'Saturday', '08:00:00', '17:00:00', 'Y', NULL),
(21, 51, 1015, 'Saturday', NULL, NULL, 'N', 'Vacation'),
(22, 53, 1016, 'Sunday', '08:00:00', '17:00:00', 'Y', NULL),
(23, 54, 1017, 'Wednesday', '8:00:00', '17:00:00',	'Y', NULL),
(24, 51, 1018, 'Thursday', '08:00:00', '17:00:00', 'Y', NULL),
(25, 50, 1019, 'Tuesday', NULL, NULL, 'N', 'Business Tour');

-- -CREATED TRIGGER FOR doctor_details, IF ANY VALUE IS NULL, QUERY WILL RUN INTO ERROR
DELIMITER //
CREATE TRIGGER doctor_details_insert_trigger
BEFORE INSERT ON doctor_details
FOR EACH ROW
BEGIN
  IF NEW.doctor_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_id';
  END IF;
  IF NEW.doctor_fname IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_fname';
  END IF;
  IF NEW.doctor_lname IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_lname';
  END IF;
  IF NEW.doctor_dob IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_dob';
  END IF;
  IF NEW.doctor_practicing_from IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_practicing_from';
  END IF;
END //
DELIMITER ;

INSERT INTO doctor_details(doctor_id, doctor_fname, doctor_lname, doctor_dob, doctor_practicing_from) VALUES
(1020, 'Harvey', 'Paulsen', '1989-12-04', '2022-03-23');

-- --CREATED TRIGGER FOR patient_details, IF ANY VALUE WHILE INSERTION IS NULL, QUERY WILL RUN INTO ERROR
DELIMITER //
CREATE TRIGGER patient_details_null_check BEFORE INSERT ON patient_details
FOR EACH ROW
BEGIN
    IF NEW.patient_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_id';
    END IF;
    IF NEW.patient_fname IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_fname';
    END IF;
    IF NEW.patient_lname IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_lname';
    END IF;
    IF NEW.patient_insurance_no IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_insurance_no';
    END IF;
    IF NEW.contact_no IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in contact_no';
    END IF;
    IF NEW.email_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in email_id';
    END IF;
END// 
DELIMITER ;

-- CREATED PROCEDURE TO SELECT ALL RECORDS FROM patient_records (CALL NAME - ALLRECORDS;)
DELIMITER $$
CREATE PROCEDURE ALLRECORDS()
BEGIN
  SELECT * FROM patient_record;
END $$
DELIMITER ;

-- CREATED A FUNCTION TO GET NUMBER OF PATIENTS IN THE WHOLE HOSPITAL CHAIN
DELIMITER $$
CREATE FUNCTION get_all_patients()
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(*) INTO total FROM patient_details;
RETURN total;
END $$
DELIMITER ;

-- VIEW THAT SHOWS WHICH DOCTOR WORKS AT WHICH HOSPITAL IN WHICH STATE
CREATE VIEW doctor_hospital_view AS
SELECT d.doctor_id, d.doctor_fname, d.doctor_lname, h.hospital_name, h.city, h.state
FROM doctor_details d
JOIN hospital_affiliation h ON d.doctor_id = h.doctor_id;

-- VIEW THAT SHOWS HOSPITAL FIRST CONSULTATION FEE SORTED BY ASC
CREATE VIEW hospital_office_fee AS 
SELECT o.first_appointment_fee, h.hospital_name, o.state
FROM hospital_affiliation h 
INNER JOIN office_details o ON h.hospital_affiliation_id = o.hospital_affiliation_id 
ORDER BY o.first_appointment_fee ASC;


