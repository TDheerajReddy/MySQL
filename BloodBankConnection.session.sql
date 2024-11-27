CREATE DATABASE BloodBankDB;
USE BloodBankDB;
CREATE TABLE Donor(Donor_ID INT(6) PRIMARY KEY, Name VARCHAR(50), Date_Of_Birth DATE, Gender VARCHAR(6), Address VARCHAR(70));
CREATE TABLE Blood_Bank_Manager(Manager_ID INT(6) PRIMARY KEY, Name VARCHAR(50), Phone_Number VARCHAR(13));
CREATE TABLE Blood_Unit(Blood_Code INT(6) PRIMARY KEY, Blood_Amount INT(3), Donate_Date DATE, Blood_Type VARCHAR(3), Donor_ID INT(6) REFERENCES Donor(Donor_ID));
CREATE TABLE Blood_Bank(Blood_Bank_ID INT(6) PRIMARY KEY, Address VARCHAR(70), Blood_Code INT(6) REFERENCES Blood_Unit(Blood_Code), Manager_ID INT(6) UNIQUE REFERENCES Blood_Bank_Manager(Manager_ID));
CREATE TABLE Hospital(Hospital_ID INT(6) PRIMARY KEY, Name VARCHAR(50), Address VARCHAR(70), Email	VARCHAR(40), Blood_Bank_ID INT(6) UNIQUE REFERENCES Blood_Bank(Blood_Bank_ID));


-- Alter Attributes
ALTER TABLE Blood_Bank ADD(Hospital_ID INT(6));
ALTER TABLE Blood_Bank ADD FOREIGN KEY(Hospital_ID) REFERENCES Hospital(Hospital_ID);
-- ALTER TABLE Blood_Unit DROP COLUMN Doner_ID;
-- ALTER TABLE Blood_Unit ADD COLUMN Donor_ID INT(6);
-- ALTER TABLE Blood_Unit ADD FOREIGN KEY(Donor_ID) REFERENCES Donor(Donor_ID);

-- input values
INSERT INTO Donor(Donor_ID, Name, Date_Of_Birth, Gender, Address)VALUES(1, 'John', '1995-06-09', 'Male', 'H.No. B130, near MBS Hospital, Kota, Rajasthan');
INSERT INTO Donor VALUES(2, 'Boogy Man', '1995-06-09', 'Female', 'H.No. B120, near MBS Hospital, Kota, Rajasthan');
INSERT INTO Donor VALUES(3, 'Wick', '1995-03-09', 'Female', 'H.No. B180, near MBS Hospital, Kota, Rajasthan');
INSERT INTO Donor VALUES(4, 'Hero', '1994-08-09', 'Female', 'H.No. B190, near MBS Hospital, Kota, Rajasthan');
INSERT INTO Donor VALUES(5, 'Dan', '1990-05-08', 'Female', 'H.No. B150, near MBS Hospital, Kota, Rajasthan');

INSERT INTO Blood_Bank_Manager(Manager_ID, Name, Phone_Number)VALUES(100001,'Aditya','+916842371975');
INSERT INTO Blood_Bank_Manager VALUES(100002,'Sachin','+916842371976');
INSERT INTO Blood_Bank_Manager VALUES(100003,'Yogi','916842371977');
INSERT INTO Blood_Bank_Manager VALUES(100004,'Modi','+916842371978');
INSERT INTO Blood_Bank_Manager VALUES(100005,'Rahul','+916842371979');

INSERT INTO Blood_Unit(Blood_Code, Blood_Amount, Donate_Date, Blood_Type, Donor_ID)VALUES(200001, 120, '2023-11-26', 'A+', 2);
INSERT INTO Blood_Unit VALUES(200002, 110, '2023-10-16', 'AB+', 3);
INSERT INTO Blood_Unit VALUES(200003, 130, '2023-05-21', 'O+', 4);
INSERT INTO Blood_Unit VALUES(200004, 150, '2023-02-23', 'O-', 1);
INSERT INTO Blood_Unit VALUES(200005, 210, '2023-01-09', 'B+', 5);

INSERT INTO Blood_Bank(Blood_Bank_ID, Address, Blood_Code, Manager_ID)VALUES(999991, 'MBS Blood Bank, nayapura, Kota, Rajasthan', 200004, 100005);
INSERT INTO Blood_Bank VALUES(999992, 'Omni Blood Bank, station, Kota, Rajasthan', 200002, 100004, NULL);
INSERT INTO Blood_Bank VALUES(999994, 'Appolo Blood Bank, gumanpura, Kota, Rajasthan', 200003, 100002, NULL);
INSERT INTO Blood_Bank VALUES(999993, 'Tata Blood Bank, dadabari, Kota, Rajasthan', 200001, 100001, NULL);
INSERT INTO Blood_Bank VALUES(999995, 'SMS Blood Bank, station, Jaipur, Rajasthan', 200005, 100003, NULL);

INSERT INTO Hospital(Hospital_ID, Name, Address, Email, Blood_Bank_ID)VALUES(500001, 'Sudha Hospital', 'dadabari, Kota, Rajasthan', 'sudhakota@gmail.com', 999993);
INSERT INTO Hospital VALUES(500002, 'Appolo Hospital', 'dadabari, Kota, Rajasthan', 'appolokota@gmail.com', 999994);
INSERT INTO Hospital VALUES(500003, 'Maheswari Hospital', 'Gumanpura, Kota, Rajasthan', 'maheswarikota@gmail.com', 999991);
INSERT INTO Hospital VALUES(500004, 'Garg Hospital', 'dadabari, Kota, Rajasthan', 'garghkota@gmail.com', 999995);
INSERT INTO Hospital VALUES(500005, 'Omni Hospital', 'talwandi, Kota, Rajasthan', 'omnikota@gmail.com', 999992);


UPDATE Blood_Bank SET Hospital_ID = 500001 WHERE Blood_Bank_ID = 999993;
UPDATE Blood_Bank SET Hospital_ID = 500002 WHERE Blood_Bank_ID = 999994;
UPDATE Blood_Bank SET Hospital_ID = 500003 WHERE Blood_Bank_ID = 999991;
UPDATE Blood_Bank SET Hospital_ID = 500004 WHERE Blood_Bank_ID = 999995;
UPDATE Blood_Bank SET Hospital_ID = 500005 WHERE Blood_Bank_ID = 999992;

Select Blood_Bank.Address, Blood_Unit.Blood_Amount, Blood_Bank_Manager.Name from Blood_Bank join Blood_Bank_Manager ON Blood_Bank.Manager_ID = Blood_Bank_Manager.Manager_ID join Blood_Unit ON Blood_Bank.Blood_Code = Blood_Unit.Blood_Code;

alter table Blood_Bank_Manager CHANGE COLUMN phone Phone_Number  VARCHAR(13);

select * from Blood_Bank_Manager;

-- Q1. 𝐖𝐫𝐢𝐭𝐞 𝐚𝐧 𝐒𝐐𝐋 𝐪𝐮𝐞𝐫𝐲 𝐭𝐨 𝐫𝐞𝐩𝐨𝐫𝐭 𝐚𝐥𝐥 Hospitals 𝐰𝐡𝐨 𝐧𝐞𝐯𝐞𝐫 assign to a blood bank 𝐚𝐧𝐲𝐭𝐡𝐢𝐧g ?
SELECT h.name AS hospital FROM hospital h LEFT JOIN Blood_Bank b ON h.Hospital_ID = b.Hospital_ID WHERE b.Hospital_ID IS NULL;
-- OR
SELECT h.name AS hospital FROM hospital h WHERE h.Hospital_ID NOT IN (SELECT Blood_Bank.Hospital_ID FROM Blood_Bank);

