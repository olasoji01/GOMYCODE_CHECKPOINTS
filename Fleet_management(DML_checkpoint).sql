-- DATA MANIPULATION LANGUAGE CHECKPOINT
--  What You're Aiming For: The objective here is to implement SQL DML queries to manage records within the database tables defined in the relational schema.
-- Instructions:
--    Write SQL queries to insert the provided records into their respective tables.
--    Update the cost of the second maintenance record to 350.00.
--    Delete the first vehicle from the Vehicles table.
--    Insert one more record into the Trips table with the following details:
--       VehicleID: 2
--        DriverID: 1
--        StartDate: '2024-07-05'
--        EndDate: '2024-07-06'
--        StartLocation: "Boston"
--        EndLocation: "Philadelphia"
--        Distance: 300
--    Update the color of the second vehicle in the Vehicles table to "Red".
--    Insert a new maintenance record into the Maintenance table with the following details:
--        VehicleID: 1
--        MaintenanceDate: '2024-07-10'
--        Description: "Brake inspection"
--        Cost: 100.00
--    Update the phone number of the first driver in the Drivers table to "2223334444".
--    Delete the trip with TripID = 2 from the Trips table.


CREATE TABLE Vehicles(
		LicensePlate VARCHAR(20),
		Make VARCHAR(20),
		Model VARCHAR(20),
		Year INT,
		Color VARCHAR(50),
		VIN VARCHAR(50)
);

INSERT INTO Vehicles
	VALUES('ABC123','Toyota','Corolla',2020,'White','1HGCM82633A004352'),
 		  ('XYZ789','Ford','Fusion',2018,'Blue','2HGCM82633A004353')

SELECT * FROM Vehicles 

CREATE TABLE Drivers(
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		LicenseNumber VARCHAR(20),
		Phone VARCHAR(20),
		Address VARCHAR(50),
		City CHAR(15),
		State CHAR(10),
		Zipcode CHAR(10)
);

INSERT INTO Drivers
 	VALUES('Michael','Smith','D1234567','1234567890','123 Main St','Anytown','CA','12345'),
		   ('Sarah','Connor','D7654321','0987654321','456 Elm St','Otherville','NY','54321')

SELECT * FROM Drivers

CREATE TABLE Trips(
		VehicleID INT,
		DriverID INT,
		StartDate DATE,
		EndDate DATE,
		StartLocation VARCHAR(50),
		EndLocation VARCHAR(50),
		Distance INT
)

INSERT INTO Trips
	VALUES(1, 1,'2024-07-01','2024-07-02','Los Angeles','San Francisco',380),
		  (2, 2,'2024-07-03','2024-07-04','New York','Washington D.C.',225)

SELECT * FROM Trips

CREATE TABLE Maintenance(
		VehicleID INT,
		MaintenanceDate DATE,
		Description VARCHAR(20),
		Cost DECIMAL(5, 2)
)

INSERT INTO Maintenance
	VALUES(1,'2024-06-15','Oil change',50.00),
          (2,'2024-06-20','Tire replacement',300.00)

SELECT * FROM Maintenance

UPDATE Maintenance
SET Cost = 350.00
WHERE VehicleID = 2

DELETE FROM Vehicles
WHERE LicensePlate = 'ABC123'

INSERT INTO Trips
	VALUES(2, 1,'2024-07-05','2024-07-06','Boston','Philadelphia',300)

UPDATE Vehicles
SET Color = 'Red'
WHERE Make = 'ford'

INSERT INTO Maintenance
   VALUES(1,'2024-07-10','Brake inspection',100.00)

UPDATE Drivers
SET Phone = '2223334444'
WHERE FirstName = 'Michael'

--There is non TripID in the table Trips