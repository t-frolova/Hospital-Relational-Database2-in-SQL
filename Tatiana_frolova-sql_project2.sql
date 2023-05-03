DROP SCHEMA IF EXISTS Final;

CREATE SCHEMA final;
USE final;

CREATE TABLE Diagnosis(
Diagnosis_id INT auto_increment PRIMARY KEY,
Diagnosis_name VARCHAR(50));

CREATE TABLE Patient_status(
Hospital_status_id INT auto_increment PRIMARY KEY,
Admission DATETIME NOT NULL,
Discharge DATETIME NOT NULL,
Diagnosis_id INT,
Restrictions VARCHAR(3) DEFAULT 'No',
CONSTRAINT Diagnosis_id_FK 
FOREIGN KEY (Diagnosis_id) REFERENCES Diagnosis(Diagnosis_id) On DELETE SET NULL);

-- DROP TABLE Patient_status;

CREATE TABLE Balance(
Balance_id INT auto_increment PRIMARY KEY,
Total_bill DECIMAL(10, 2),
Current_bill DECIMAL(7, 2),
Bill_status ENUM('Unpaid', 'Pending', 'Paid'));

-- DROP TABLE Balance;

CREATE TABLE Patient_Primary_Contact(
Primary_contact_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25),
Last_name VARCHAR(25),
Email_address VARCHAR(100),
Phone_number INT NOT NULL,
Relation_to_patient VARCHAR(20),
Hipaa ENUM('Yes', 'No')); 

-- DROP TABLE Patient_Primary_Contact;

CREATE TABLE Nurse(
Nurse_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
License_number INT,
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50));

-- DROP TABLE Nurse;

CREATE TABLE Physician(
Physician_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
Category VARCHAR(25),
License_number INT, 
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50));

-- DROP TABLE Physician;

CREATE TABLE Insurance(
Insurance_id INT auto_increment PRIMARY KEY,
Insurance_name VARCHAR(25) NOT NULL,
Insurance_holder_first_name VARCHAR(25) NOT NULL, 
Insurance_holder_last_name VARCHAR(25) NOT NULL,
Group_number INT,
Group_name VARCHAR(50),
Start_date DATE,
End_date DATE);

-- DROP TABLE Insurance;

CREATE TABLE Patient(
Patient_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
Birthdate DATE,
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50),
Room INT,
Hospital_status_id INT, 
Balance_id INT,
Primary_contact_id INT,
Nurse_id INT,
Physician_id INT,
Insurance_id INT,
CONSTRAINT Hospital_status_id_FK
FOREIGN KEY (Hospital_status_id)
REFERENCES Patient_status(Hospital_status_id) ON DELETE CASCADE,
CONSTRAINT Balance_id_FK
FOREIGN KEY (Balance_id)
REFERENCES Balance(Balance_id) ON DELETE SET NULL,
CONSTRAINT Primary_contact_id_FK
FOREIGN KEY (Primary_contact_id)
REFERENCES Patient_Primary_Contact(Primary_contact_id) ON DELETE SET NULL,
CONSTRAINT Nurse_id_FK
FOREIGN KEY (Nurse_id)
REFERENCES Nurse(Nurse_id) ON DELETE SET NULL,
CONSTRAINT Physician_id_FK
FOREIGN KEY (Physician_id)
REFERENCES Physician(Physician_id) ON DELETE SET NULL,
CONSTRAINT Insurance_id_FK
FOREIGN KEY (Insurance_id)
REFERENCES Insurance(Insurance_id) ON DELETE SET NULL);

-- DROP TABLE Patient;

-- Diagnosis table;

INSERT INTO Diagnosis(Diagnosis_name)
VALUES('Rhinovirus infection'),
('Rheumatism'),
('Graves disease'),
('Viral meningitis'),
('Neuronal neuropathies'),
('Hepatitis B'),
('Undifferentiated connective tissue disease'),
('Loiasis'),
('Autoimmune retinopathy'),
('Swine influenza'),
('Lyme disease'),
('Anemia'),
('Influenzae infection'),
('Chlamydophila pneumoniae'),
('Mycoplasma pneumonia');

-- Patient_status; 

INSERT INTO Patient_status( Admission, Discharge, Diagnosis_id, Restrictions)
VALUES('2021-12-16 22:37:33', '2021-12-26 12:37:33', 1, 'Yes'),
('2022-08-03 19:58:17', '2022-08-15 10:58:17', 2, 'No'),
('2022-03-29 12:45:04', '2022-04-29 12:00:04', 3, 'No'),
('2022-06-11 03:04:47', '2022-06-21 10:04:47', 4, 'Yes'),
('2022-04-10 18:22:37', '2022-04-30 10:22:37', 1, 'Yes'),
('2021-10-26 17:51:34', '2021-11-06 15:51:34', 6, 'Yes'),
('2022-04-20 16:36:07', '2022-04-30 11:36:07', 7, 'No'),
('2022-03-04 06:02:09', '2022-03-14 10:02:09', 13, 'No'),
('2022-06-27 18:14:16', '2022-07-4 13:14:16', 9, 'No'),
('2022-10-05 03:54:40', '2022-10-15 13:54:40', 10, 'Yes'),
('2022-01-02 20:14:46', '2022-01-12 10:14:46', 11, 'Yes'),
('2022-09-13 11:00:36', '2022-09-23 12:00:36', 12, 'Yes'),
('2022-09-30 10:45:04', '2022-09-30 10:45:04', 13, 'No'),
('2021-11-17 18:50:31', '2021-11-25 18:50:31', 14, 'No'),
('2022-09-22 07:02:13', '2022-09-22 07:02:13', 1, 'Yes');

-- Balance table;

INSERT INTO Balance(Total_bill, Current_bill, Bill_status)
VALUES(1201.48, 391.73, 'Unpaid'),
(0, 0, 'Paid'), 
(18.75, 126.83, 'Pending'),
(0, 286.04, 'Unpaid'),
(0, 602.05, 'Paid'),
(730.64, 316.97, 'Unpaid'),
(1349.96, 545.96, 'Unpaid'),
(0, 0, 'Paid'),
(0, 717.53, 'Paid'),
(574.90, 575.96, 'Pending'),
(476.62, 666.86, 'Unpaid'),
(309.75, 805.41,'Pending'),
(0, 0, 'Paid'),
(77.75, 202.64, 'Pending'),
(134.08, 95.08, 'Unpaid');

-- Patient_Primary_Contact table;

INSERT INTO Patient_Primary_Contact( First_name, Last_name, Email_address, Phone_number, Relation_to_patient, Hipaa)
VALUES('Patsy', 'Fay', 'Patsy.Fay@hotmail', 468862004, 'Spouse', 'Yes'),
('Pat', 'Graham', 'Pat.Graham@gmail.com', 295775159, NULL, 'Yes'),
('Evan', 'Pacoca', 'Evan.Pacoca@gmail.com', 653826185, 'Parent', 'No'),
('Roxanne', 'Balistreri', 'RoxanneBalistreri@hotmail', 985687025, 'Spouse', 'Yes'),
('Tiffany', 'Moen', 'TiffanyMoen@gmail.com', 28729614, 'Spouse', 'Yes'),
('Emmett', 'Zboncak', 'EmmettZboncak@gmail.com', 985837025, 'Parent', 'Yes'),
('Janice', 'Halvorson', 'JaniceHalvorson@gmail.com', 272978614, NULL, 'Yes'),
('Rossie', 'Red', 'Rossie55@gmail.com', 997730171, 'Spouse', 'No'),
('Adonis', 'Schuppe', 'Adonis_Schuppe@hotmail.com', 792728337, 'Parent', 'Yes'),
('Deon', 'Wolff', 'Deon.Wolff@hotmail.com', 704459077, NULL, 'Yes'),
('Doris', 'Morissette', 'Doris.Morissette@gmail.com', 426119006, 'Spouse', 'Yes'),
('Eloy', 'Pagac', 'Eloy.Pagac17@gmail.com', 407943241, 'Spouse', 'Yes'),
('Wendell', 'Rice', 'Wendell.Rice@gmail.com', 425040279, 'Parent', 'No'),
('Romaine', 'Harris', 'Romaine_Harris76@hotmail.com', '827973974', 'Spouse', 'Yes'),
('Kaylin', 'Schmeler', 'Kaylin.Schmeler89@yahoo.com', 851615319, NULL, 'Yes');


-- Nurse table;

INSERT INTO Nurse(First_name, Last_name, License_number, Address, City, State, Zip_code, Phone_number, Email_address)
VALUES('Alycia', 'Rutherford', 61988, '949 Manley Lock', 'Dayton', 'OH', 43000, 1469268922, 'Alycia.Rutherford14@yhospital.com'),
('Alycia', 'Bredford', 77810, '70620 Leuschke Extension', 'Dayton', 'OH', 43001, 1742792633, 'AlyciaBredford@hospital.com'),
('Carli', 'Shields', 90213, '70620 Leuschke Extension', 'Dayton', 'OH', 43045, 1338568204, 'Carli.Shields@hospital.com'),
('Ashly', 'Rice', 15678, '70945 Maximillian Rest', 'Dayton', 'OH', 43040, 1950541304, 'Ashly.Rice@hospital.com'),
('Rhoda', 'Nader', 90256, '07848 Russel Villages', 'Dayton', 'OH', 43061, 705785315, 'Rhoda.Nader@hospital.com'),
('Lora', 'Brekke', 77810, '757 Clark Lane', 'Dayton', 'OH', 43064, 1317280871, 'Lora.Brekke@hospital.com'),
('Denise', 'Shields', 90713, '19601 Berniece Burgs', 'Dayton', 'OH', 43044, 1932511853, 'Denise.Shields@hospital.com'),
('Stephen', 'Mayert', 76290, '92681 Lind Turnpike', 'Dayton', 'OH', 43015, 1932511853, 'Stephen.Mayert@hospital.com'),
('Darlene', 'Ortiz', 88201, '743 Paucek Lane', 'Dayton', 'OH', 43011, 1783795556, 'Darlene.Ortiz@hospital.com'),
('Brian', 'Upton', 29820, '958 Keeling Port', 'Dayton', 'OH', 43017, 959337500, 'Brian.Upton@hospital.com');

-- Physician table;

INSERT INTO Physician(First_name, Last_name, Category, License_number, Address, City, State, Zip_code, Phone_number, Email_address)
VALUES('Brian', 'Upton', 'Dermatologist', 99108, '2642 Fabian Groves','Dayton', 'OH', 43000, 73254992, 'Brian.Upton@hospital.com'),
('Myrtle', 'Prohaska', 'Dermatologist', 87109, '45368 Adriana Route', 'Dayton', 'OH', 43010, 571629430, 'Myrtle.Prohaska@hospital.com'),
('Lora', 'Jacobson', 'Cardiologist', 15178,'31627 Patsy Shoals', 'Dayton', 'OH', 43005, 501617613,  'Lora.Jacobson@hospital.com'),
('Lee', 'Swift', 'Anaesthesiologist', 78190, '835 Marcus Turnpike', 'Dayton', 'OH', 43011, 654269852,  'Lee.Swift@hospital.com'),
('Luther', 'Metz', 'Allergist', 45019, '8819 Mayer Drive', 'Dayton', 'OH', 43030, 338568063, 'Luther.Metz@hospital.com'),
('Ricardo', 'Skiles', 'Dietitian', 81093, '934 Keefe Views', 'Dayton', 'OH', 43035, 562966715,  'Ricardo.Skiles@hospital.com'),
('George', 'Keeper', 'Dermatologist', 910458, '337 Mandy Point', 'Dayton', 'OH', 43066, 580188035, 'George.Keeper@hospital.com');


-- Insurance table;

INSERT INTO Insurance(Insurance_name, Insurance_holder_first_name, Insurance_holder_last_name, Group_number, Group_name, Start_date, End_date)
VALUES('Priority Health', 'Annie', 'Blanda', 7380171, 'Macejkovic Inc', '2022-03-10', '2023-03-10'),
('Care Sourse', 'Gregory', 'Hermann', 241831, 'Farrell Group', '2022-09-11', '2022-09-11' ),
('Aetna', 'Brandy', 'Crooks', 795957,'Douglas, Bahringer and Hills', '2022-01-22', '2022-01-22'),
('Humana', 'Cora', 'Kovacek', 827937, 'Zemlak - DuBuque', '2022-03-12', '2023-03-12'),
('Blue Cross', 'Milton', 'Grimes', 796752, 'Farrell Group', '2022-02-10', '2023-02-10'),
('Monolina', 'Inez', 'Sawayn', 692722, 'Macejkovic Inc', '2021-12-23', '2022-12-23'),
('eHealthInsurance', 'Guy', 'Block', 758337, 'Streich Connelly', '2022-10-07', '2023-10-07');

-- Patient table;

INSERT INTO Patient(First_name, Last_name, Birthdate, Address, City, State, Zip_code, Phone_number, Email_address, Room,
Hospital_status_id, Balance_id, Primary_contact_id, Nurse_id, Physician_id, Insurance_id)
VALUES('Michele', 'Fay', '1978-04-24', '068 Collier Keys', 'Dayton', 'OH', 43010, 710877133, 'MicheleFay@gmail.com', 7024, 1, 1, 1, 1, 4, 1),
('Oliver', 'Adams', '1957-08-14', '1164 Rashad Brook', 'Dayton', 'OH', 43034, 655023048, 'OliverAdams@gmail.com', 2701, 2, 2, 2, 2, 3, 2),
('Ignacio', 'Hoeger', '1987-07-04', '562 Murazik Inlet', 'Dayton', 'OH', 43030, 852477832, 'IgnacioHoeger@gmail.com', 1122, 3, 3, 3, 5, 3, 3),
('Mack', 'Runte', '1946-02-06', '4169 Leonora Shores', 'Dayton', 'OH', 43031, 423619240, 'MackRunte@gmail.com', 2288, 4, 4, 4, 2, 1, 4),
('Candace', 'Mayer', '1960-11-27', '31149 Gutmann Skyway', 'Dayton', 'OH', 43010, 272371076, 'CandaceMayer@gmail.com', 5071, 5, 5, 5, 3, 5, 5),
('Seth', 'Schmitt', '1996-03-06', '725 West Crossing', 'Dayton', 'OH', 43014, 644270696, 'SethSchmitt@gmail.com', 5301, 6, 6, 6, 6, 4, 6),
('Alan', 'Walter', '1973-05-04', '3306 Sage Prairie', 'Dayton', 'OH', 430310, 482177428, 'Alan.Walter@gmail.com', 2130, 7, 7, 7, 4, 4, 7),
('Camille', 'Koss', '1964-10-29', '84137 Hermann Islands', 'Dayton', 'OH', 43037, 373858751, 'CamilleKoss@gmail.com', 3307, 8, 8, 8, 10, 2, 7),
('Ira', 'Doyle', '1996-01-20', '817 Adams Parks', 'Dayton', 'OH', 43064, 402535828, 'IraDoyle@gmail.com', 4021, 9, 9, 9, 4, 1, 1),
('Drew', 'Stehr', '2000-08-03', '1724 Kelli Circles', 'Dayton', 'OH', 430360, 484573953, 'DrewStehr@gmail.com', 6601, 10, 10, 10, 4, 3, 2),
('Alan', 'Lind', '1954-12-17', '12894 Shayna Viaduct', 'Dayton', 'OH', 430360, 828507016, 'Alan.Lind@gmail.com', 6210, 11, 11, 11, 4, 2, 1),
('Chad', 'Kuhic', '2004-08-05', '52006 Jarred Lane', 'Dayton', 'OH', 430330, 324558675, 'Chad.Kuhic@hotmail.com', 3402, 12, 12, 12, 3, 4, 7),
('Ruth', 'Hegmann', '1994-05-16', '34359 Felipa Lake', 'Dayton', 'OH', 430366, 322242709, 'Ruth.Hegmann@hotmail.com', 5287, 13, 13, 13, 9, 6, 6),
('Nettie', 'Roob', '1958-02-25', '12708 Wisozk Hills', 'Dayton', 'OH', 430310, 1516366652, 'Nettie.Roob@gmail.com', 2109, 14, 14, 14, 9, 3, 7),
('Tanya', 'Dickens', '1980-04-16', '97481 Ullrich Pine', 'Dayton', 'OH', 43019, 23859193, 'TanyaDickens@gmail.com', 7201, 15, 15, 15, 2, 3, 2);


DESCRIBE Diagnosis;
DESCRIBE Patient_primary_contact;
DESCRIBE Balance;
DESCRIBE Patient_status;
DESCRIBE Nurse;
DESCRIBE Physician;
DESCRIBE Insurance;
DESCRIBE Patient;

SELECT * FROM Diagnosis;
SELECT * FROM Patient_primary_contact;
SELECT * FROM Balance;
SELECT * FROM Patient_status;
SELECT * FROM Nurse;
SELECT * FROM Physician;
SELECT * FROM Insurance;
SELECT * FROM Patient;

-- Tasks and queries;


-- Joins. Join 4 tables;
-- Query with a right outer join in order to show patients’ full name and their Physicians’ full name, Nurses full name, and Primary contacts’ full name; Ordered by Patient first name;

SELECT CONCAT(p.First_name, ' ', p.Last_name) AS 'Patient full name',
CONCAT(ph.First_name, ' ', ph.Last_name) AS 'Physician full name',
CONCAT(n.First_name, ' ', n.Last_name) AS 'Nurse Full Name',
CONCAT(pr.First_name, ' ', pr.Last_name) AS 'Patient Primary Contact'
FROM Patient p
LEFT OUTER JOIN Physician ph 
ON p.Physician_id = ph.Physician_id
LEFT OUTER JOIN Nurse n
ON p.Nurse_id = n.Nurse_id 
LEFT OUTER JOIN patient_primary_contact pr
ON pr.Primary_contact_id = p.Primary_contact_id
ORDER BY p.first_name;

-- Formatting date and date math
-- Use your date column, either calculate the number of days from the date to today or if you have 2 date columns, subtract 1 date from another.
-- Total days each of Patient stays in the hospital;

SELECT first_name, Last_name,
DATEDIFF(Discharge, Admission) AS "Total days in the hospital"
FROM Patient JOIN patient_status USING (hospital_status_id);

-- Display your date data. Format the date to the day name, month name, date, and 4-digit year;

SELECT first_name, last_name, 
DATE_FORMAT(Start_date, '%a-%M-%D-%Y') AS 'Insurance Starting Date'
FROM Patient JOIN Insurance USING (Insurance_id);

-- Display your time zone;

SELECT @@system_time_zone;

-- Subqueries and merge statements:  Write a query for each of the tasks below.  In other words, do not combine two tasks in the same query;
-- Create a subquery that calculates the average of the numeric column with nulls and then if the row has a null, replace the null with the average number;

SET SQL_SAFE_UPDATES =0; 
SELECT * FROM balance;
DROP PROCEDURE IF EXISTS replaceNull;
DELIMITER **
CREATE PROCEDURE replaceNull()
BEGIN
DECLARE bill_avg DECIMAL;
SET bill_avg = (SELECT AVG(current_bill) FROM Balance);
UPDATE Balance
SET current_bill = bill_avg WHERE current_bill IS NULL;
END**
DELIMITER ;
CALL replaceNull();
SELECT * FROM balance;
ROLLBACK;

-- Create a subquery  with  where and order by clauses;

SELECT first_name, last_name, total_bill
FROM Patient JOIN balance USING(balance_id)
WHERE total_bill > 0 IN (SELECT total_bill FROM balance)
ORDER BY total_bill ASC;

-- Create a subquery with extracted data from one table and use it to limit data from another table (for examples look at Chapter 7’s lecture notes, page 1 the vendor ID example);

SELECT Patient_id, first_name, Last_name 
FROM Patient  
WHERE Patient_id IN 
(SELECT Insurance_id 
FROM Insurance 
WHERE Insurance_name ='Humana');

-- Use a subquery with a not in operator;

SELECT first_name, last_name, city 
FROM Patient
WHERE city NOT IN (SELECT city FROM Patient WHERE city = 'Miamisburg');

-- Use a subquery in a DDL action;

CREATE TABLE Insurance_subquery_table 
AS SELECT * FROM Insurance WHERE Insurance_id = 5;

SELECT * FROM Insurance_subquery_table;

-- Create a query with a CTE (with statement);

WITH table_cte AS
(SELECT Patient_id, first_name, Last_name, MAX(total_bill) AS 'Highest Balance'
FROM Balance JOIN Patient USING(balance_id))
SELECT * FROM table_cte;

-- Views;

-- Create a simple view;

DROP VIEW IF EXISTS Patient_view;

CREATE VIEW Patient_view AS 
SELECT first_name, last_name
FROM Patient
WHERE first_name LIKE 'A%' OR 'B%'
ORDER BY first_name;

SELECT * FROM Patient_view;

-- Create a view with a check option;

DROP VIEW IF EXISTS withcheck_view;

CREATE VIEW withcheck_view AS
SELECT first_name, last_name, total_bill 
FROM Patient JOIN balance USING( balance_id)
WHERE total_bill > 0
ORDER BY total_bill DESC
WITH CHECK OPTION;

SELECT * FROM withcheck_view;

-- Create a complex view;

DROP VIEW IF EXISTS complex_view;
CREATE VIEW complex_view AS
SELECT CONCAT(p.First_name, ' ', p.Last_name, ' todays nurse is ', 
n.First_name, ' ', n.Last_name)
FROM Patient p
JOIN Nurse n 
ON p.Nurse_id = n.Nurse_id
ORDER BY p.first_name;

SELECT * FROM complex_view;

-- Update a record in a simple view;

SET sql_safe_updates = 0;
SET AUTOCOMMIT = 0;

DROP VIEW IF EXISTS update_view;

SELECT * FROM Insurance WHERE Insurance_name  =  'Priority Health';

CREATE VIEW update_view AS
SELECT Insurance_id, Insurance_name, Insurance_holder_first_name, Insurance_holder_last_name 
FROM Insurance;

SELECT * FROM update_view;

UPDATE update_view SET Insurance_name  =  'Cigna'
WHERE Insurance_name  =  'Priority Health';

SELECT * FROM update_view WHERE Insurance_name  = 'Cigna';
SELECT * FROM update_view;
ROLLBACK;

-- Display only the to 10 records in one of your tables;

DROP VIEW IF EXISTS limit_view;

CREATE VIEW limit_view AS
SELECT patient_id, first_name, last_name, insurance_name 
FROM Patient JOIN insurance USING( insurance_id)
ORDER BY patient_id ASC
LIMIT 10;

SELECT * FROM limit_view;

-- Indexes;
-- Create an index (other than unique or primary key);

CREATE INDEX Diagnosis_index ON Diagnosis(Diagnosis_name);

SHOW INDEX FROM Diagnosis;

-- List all indexes using a query;

DROP PROCEDURE IF EXISTS my_index;

DELIMITER //
CREATE PROCEDURE my_index()
BEGIN
SHOW INDEX FROM Diagnosis; 
SHOW INDEX FROM Insurance;
SHOW INDEX FROM Physician; 
SHOW INDEX FROM Patient_status;
SHOW INDEX FROM Patient;
SHOW INDEX FROM Patient_primary_contact;
SHOW INDEX FROM Balance;
SHOW INDEX FROM Nurse;
END //
DELIMITER ;
CALL my_index();


-- Procedures and functions;
-- Create and call a stored procedure that reads data from a table;

DROP PROCEDURE IF EXISTS Procedure_1;

DELIMITER //
CREATE PROCEDURE Procedure_1()
BEGIN
SELECT balance_id, current_bill, ROUND((current_bill + current_bill * 0.075), 2)
AS 'Current bill with tax'
FROM Balance;
END// 
DELIMITER ;

CALL Procedure_1();

-- Create and call a stored procedure that has a case statement;

DROP PROCEDURE IF EXISTS Procedure_2;
DELIMITER //
CREATE PROCEDURE Procedure_2()
BEGIN
SELECT balance_id, Total_bill,
CASE
WHEN Total_bill> 0.00 THEN  'Send mail with total bill balance '
ELSE  ' No action'
END "ANSWER"
FROM Balance
WHERE balance_id =3;
END //
DELIMITER ;

CALL Procedure_2();

-- Create and call a stored procedure that has an if statement;

DROP PROCEDURE IF EXISTS Procedure_3;

delimiter //
CREATE PROCEDURE Procedure_3()
BEGIN
DECLARE Bill_due_var DECIMAL(9,2);
SELECT SUM(total_bill)
INTO Bill_due_var
FROM Balance;
IF Bill_due_var > 3000 THEN
SELECT CONCAT(Bill_due_var, ' Total debt, therefore, totals balance exceeds the limit. 
A meeting with the accounting department needs to be set up') AS 'Send email';
ELSE
SELECT CONCAT(Bill_due_var, ' No action needed');
END IF;
END //
delimiter ;
CALL Procedure_3();

-- Create and call a stored procedure that has a conditional handler for SQLWARNING;

DROP PROCEDURE IF EXISTS Procedure_4;

DELIMITER //
CREATE PROCEDURE Procedure_4()
BEGIN
DECLARE Bill_due_var DECIMAL(9,2);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SHOW ERRORS;
END;
DECLARE CONTINUE HANDLER FOR SQLWARNING
BEGIN
SHOW WARNINGS;
END;
SELECT balance_id, current_bill, ROUND((current_bill + current_bill * 0.075), 2)
AS 'Current bill with tax'
FROM Balance;
END//
DELIMITER ;

CALL Procedure_4();

-- Create a procedure that has a transaction;

SELECT * FROM Diagnosis
ORDER BY Diagnosis_id;

SET AUTOCOMMIT = 0;
DROP PROCEDURE IF EXISTS Procedure_5;

DELIMITER //
CREATE PROCEDURE Procedure_5()

BEGIN
DECLARE SQL_ERROR TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
SET SQL_ERROR = TRUE;
START TRANSACTION;

INSERT INTO Diagnosis 
VALUES(16, 'UTI'),
(17, 'Unknown'),
(18, 'Lyme');

IF SQL_ERROR=FALSE THEN COMMIT;
SELECT 'THE TRANSACTION WAS COMMITTED';
ELSE
ROLLBACK;
SELECT 'THE TRANSACTION WAS ROLLED BACK';
END IF;
END//
DELIMITER ;

CALL Procedure_5();

ROLLBACK;

-- Create and use a stored function;

DROP FUNCTION IF EXISTS Function_full_name;

CREATE FUNCTION Function_full_name(First_name VARCHAR(50), Last_name VARCHAR(50))
RETURNS VARCHAR(50) DETERMINISTIC
RETURN CONCAT(First_name, ' ', Last_name);

SELECT Patient_id, Function_full_name(First_name, Last_name) AS 'Full Name', Admission
FROM Patient JOIN patient_status USING(hospital_status_id);

-- Triggers;
-- Create and use an update trigger;

SET autocommit = 0;
SELECT * FROM Diagnosis;
DROP TRIGGER IF EXISTS tr_Diagnosis;

CREATE TRIGGER tr_Diagnosis
BEFORE UPDATE ON Diagnosis FOR EACH ROW
SET NEW.Diagnosis_name = UPPER(NEW.Diagnosis_name);

UPDATE Diagnosis SET Diagnosis_name = 'Covid' WHERE Diagnosis_name = 'Swine influenza';
SELECT * FROM Diagnosis;

ROLLBACK;

-- Create and use a trigger that saves data to a separate table;

SET autocommit = 0;
SELECT * FROM Diagnosis;
DROP TRIGGER IF EXISTS tr_Diagnosis_insert;
CREATE TABLE New_diagnosis_table(Diagnosis_add_name VARCHAR(20));

DELIMITER //
CREATE TRIGGER tr_Diagnosis_insert
BEFORE INSERT ON Diagnosis FOR EACH ROW
BEGIN
INSERT INTO New_diagnosis_table VALUES ( 'NEW Diagnosis added');
END //
DELIMITER ;

INSERT INTO Diagnosis VALUES(20, 'Covid');
SELECT * FROM Diagnosis;
SELECT * FROM New_diagnosis_table;
ROLLBACK;

-- Undo
-- Show a rollback using a savepoint;

CREATE TABLE Diagnosis_copy AS 
SELECT * FROM Diagnosis;

SELECT * FROM Diagnosis_copy;

COMMIT;
UPDATE Diagnosis_copy SET Diagnosis_name = 'Bacterial meningitis' 
WHERE Diagnosis_name = 'Viral meningitis';

SAVEPOINT ONE;

UPDATE Diagnosis_copy SET Diagnosis_name = 'Rhinovirus' 
WHERE Diagnosis_name = 'Rhinovirus infection';
SELECT * FROM Diagnosis_copy;

ROLLBACK TO ONE;
SELECT * FROM Diagnosis_copy;

DROP TABLE Diagnosis_copy;


-- Create a user with the password root
-- Grant them select, insert, update on only one database/schema. Display the list of users

CREATE USER 'Tatiana'@'localhost' IDENTIFIED BY 'Tatiana';

GRANT SELECT, INSERT, UPDATE ON final. * TO 'Tatiana'@'localhost';

SHOW GRANTS FOR 'Tatiana'@'localhost';

-- DROP USER 'Tatiana'@'localhost';


-- The Users and Privileges

SHOW GRANTS FOR 'Tatiana'@'localhost';

-- Status and System Variables

SHOW STATUS;








