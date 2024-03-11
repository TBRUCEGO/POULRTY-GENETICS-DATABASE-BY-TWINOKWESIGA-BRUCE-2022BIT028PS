SHOW DATABASES;
USE POULTRY;
CREATE TABLE Farmers(FarmerID INT PRIMARY KEY, FirstName VARCHAR(50),LastName VARCHAR(50),ContactNumber VARCHAR(15)); 

CREATE TABLE Farms(FarmID INT PRIMARY KEY, FarmName VARCHAR(100),Location VARCHAR(100), FarmerID INT, FOREIGN KEY(FarmerID) REFERENCES Farmers(FarmerID));

CREATE TABLE PoultryHouses(HouseID INT PRIMARY KEY,FarmID INT,Capacity INT,HouseType VARCHAR(20), Temperature VARCHAR(20), FOREIGN KEY (FarmID) references Farms(FarmID));
  
CREATE TABLE Chickens(ChickenID INT PRIMARY KEY, HouseID INT,Breed VARCHAR(50), AgeMonths INT, HealthStatus VARCHAR (20), FOREIGN KEY (HouseID) REFERENCES PoultryHouses(HouseID));  

USE POULTRY;
CREATE TABLE Feeding_schedule(scheduleID INT PRIMARY KEY, HouseID INT, FeedTime TIME, FeedType VARCHAR(50), FOREIGN KEY(HouseID) REFERENCES PoultryHouses(HouseID));

CREATE TABLE Egg_Production(Tray_ID INT PRIMARY KEY,ChickenID INT,TrayDate DATE, FOREIGN KEY(ChickenID) REFERENCES Chickens(ChickenID));

CREATE TABLE HealthRecords(RecordID INT PRIMARY KEY,ChickenID INT, VaccinationDate DATE, Medication VARCHAR(15), FOREIGN KEY(ChickenID) REFERENCES Chickens(ChickenID));

CREATE TABLE Sales(TransactionID INT PRIMARY KEY, FarmID INT, ProductID INT, QuantitySold INT, Price DECIMAL(10,2), FOREIGN KEY(FarmID) REFERENCES Farms(FarmID));

CREATE TABLE Employees(EmployeeID INT PRIMARY KEY, FarmID INT, Employee_Role VARCHAR(50), FOREIGN KEY(FarmID) REFERENCES Farms(FarmID));

CREATE TABLE EquipmentMaintenance(MaintenanceID INT PRIMARY KEY, FarmID INT,EquipmentName VARCHAR(25),MaintenanceDate DATE, Task VARCHAR(25), FOREIGN KEY (FARMID) REFERENCES Farms(FARMID));

DESCRIBE Farmers;

INSERT INTO Farmers VALUES(1,'Byamukama','Syson','+256780014501'),
(2,'Karuka','Benson','+256780014502'),
(3,'Atuha','Richard','+256780014503'),
(4,'Bariyo','Kenneth','+256780014504'),
(5,'Opio','Ronald','+256780014505'),
(6,'Karahuka','Obed','+256780014506'),
(7,'Asiimwe','Ronah','+256780014507'),
(8,'Tusiime','Benitah','+256780014508'),
(9,'Agaba','Ritah','+256780014509'),
(10,'Ndiyo','Jane','+256780014534');

SELECT * FROM FARMERS;

INSERT INTO FARMS VALUES(101,'Green Acres Farm','Ruharo',2),
(102,'Sunrise Poultry Farm','Kamakuzi',5),
(103,'Harvest haven farm','Kakiika',9),
(104,'Abariyo farm','Rutii',8),
(105,'fresh start farm','Ndejje',1),
(106,'Amate farm','Ruharo',7),
(107,'Orchard View farm','Mukono',3),
(108,'Golden harvest farm','Kyengera',10),
(109,'Blue sky Acres','Boma',6),
(110,'Organic farm','Rutooma',4);

SELECT * FROM FARMS;

INSERT INTO POULTRYHOUSES VALUES(1001,101,5000,'Layer','Automatic'),
(1002,102,1000,'Broiler','Manual'),
(1003,103,500,'kuroilers','Automic'),
(1004,104,1000,'local','manual'),
(1005,105,500,'kuroilers','automatic'),
(1006,106,6000,'local','manual'),
(1007,107,1000,'broiler','manual'),
(1008,108,5000,'layers','manual'),
(1009,109,5100,'kuroilers','automatic'),
(1010,110,200,'local','manual');

select*from poultryhouses;

INSERT INTO Chickens VALUES(101,1001,'white leghorn',6,'healthy'),
(102,1002,'rhode island',4,'vaccinated'),
(103,1003,'buff',3,'vaccinated'),
(104,1004,'Ankole',5,'healthy'),
(105,1005,'sebright',4,'vaccinated'),
(106,1006,'silkies',3,'healthy'),
(107,1007,'cochin',4,'vaccinated'),
(108,1008,'Ankole',5,'vaccinated'),
(109,1009,'swedish',4,'swedish'),
(110,1010,'sebright',3,'sebright');

select*from chickens;
DROP TABLE CHICKENS;

CREATE TABLE Chickens(ChickenID INT PRIMARY KEY, HouseID INT,Breed VARCHAR(50), AgeMonths INT, HealthStatus VARCHAR (20), FOREIGN KEY (HouseID) REFERENCES PoultryHouses(HouseID));  
SELECT*FROM CHICKENS;

INSERT INTO FEEDING_SCHEDULE values(301,1001,'08:34','layers pellets'),
(302,1002,'16:00','Broilers crumbles'),
(303,1003,'13:30','mixed maize'),
(304,1004,'15:08','layer pellets'),
(305,1005,'17:00','mixed maize'),
(306,1006,'14:00','mashed pellet'),
(307,1007,'13:00','mixed maize'),
(308,1008,'09:45','pellets'),
(309,1009,'14:55','pellets'),
(310,1010,'15:00','mixed maize');

INSERT INTO EGG_PRODUCTION VALUES(401,101,'2023-05-11'),
(402,102,'2023-06-03'),
(403,103,'2023-07-04'),
(404,104,'2023-03-11'),
(405,105,'2022-11-12'),
(406,106,'2022-06-04'),
(407,107,'2022-06-13'),
(408,108,'2023-09-14'),
(409,109,'2022-11-12'),
(410,110,'2023-04-25');

SELECT*FROM EGG_PRODUCTION;

INSERT INTO HEALTHRECORDS VALUES(501,101,'2024-02-15','Newcastle');

INSERT INTO HEALTHRECORDS VALUES(502,102,'2024-02-09','Respository'),
(503,103,'2024-02-16','influenza'),
(504,104,'2024-02-11','Gumboro'),
(505,105,'2024-03-01','Gumboro'),
(506,106,'2024-09-11','Newcastle'),
(507,107,'2024-02-24','influenza'),
(508,108,'2024-02-13','Gumboro'),
(509,109,'2024-03-07','Gumboro'),
(510,110,'2024-09-11','Newcastle');

select*from healthrecords;

INSERT INTO SALES VALUES(601,101,11,200,40000000),
(602,102,22,41,1239400),
(603,103,33,50,1000000),
(604,104,44,20,400000),
(605,105,55,33,330000),
(606,106,66,70,1400000),
(607,107,77,41,1239400),
(608,108,79,50,1000000),
(609,109,88,20,400000),
(610,110,99,33,330000);

SELECT*FROM SALES;

INSERT INTO EMPLOYEES VALUES(701,101,'Farm manager'),
(702,102,'veterinary'),
(703,103,'vaccinator'),
(704,104,'veterinary'),
(705,105,'casual'),
(706,106,'vaccinator'),
(707,107,'veterinary'),
(708,108,'vaccinator'),
(709,109,'veterinary'),
(710,110,'casual');

INSERT INTO EQUIPMENTMAINTENANCE VALUES(801,101,'Feeder','2024-01-22','cleaning'),
(802,102,'drinker','2023-03-09','inspection of equipment'),
(803,103,'floor','2023-03-14','cleaning'),
(804,104,'troughs','2023-02-15','inspection'),
(805,105,'brooding lamps','2034-01-13','replaced'),
(806,106,'drinkers', '2024-04-14','replaced'),
(807,107,'drinker','2023-03-09','inspection of equipment'),
(808,108,'floor','2023-03-14','cleaning'),
(809,109,'troughs','2023-02-15','inspection'),
(810,110,'brooding lamps','2034-01-13','replaced');

select*from equipmentmaintenance;





