-- What You're Aiming For
-- Implement a relational database schema based on the provided entities and their attributes
-- Instructions: Based on the provided data types and constraints, implement the relational model using SQL.
-- Note: ALL COLUMNS SHOULD HAVE THE 'NOT NULL' CONSTRAINT


CREATE DATABASE Checkpoints

-- DATA DEFINITION LANGUAGE CHECKPOINT
CREATE TABLE Customers(
		CustomerID INT PRIMARY KEY NOT NULL,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Email VARCHAR(100) NOT NULL,
		Phone VARCHAR(20) NOT NULL,
		Address VARCHAR(100) NOT NULL,
		City VARCHAR(50) NOT NULL,
		State VARCHAR(50) NOT NULL,
		ZipCode VARCHAR NOT NULL
);

SELECT * FROM Customers

CREATE TABLE Products(
		ProductID INT PRIMARY KEY NOT NULL,
		ProductName VARCHAR(100) NOT NULL,
		Description VARCHAR(100) NOT NULL,
		Price DECIMAL(10, 2) NOT NULL,
		StockQuantity INT NOT NULL,
		CategoryID INT NOT NULL,
	FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);

SELECT * FROM Products

CREATE TABLE Categories(
		CategoryID INT PRIMARY KEY,
		CategoryName VARCHAR(100),
		Description VARCHAR(100)
);

SELECT * FROM Categories

CREATE TABLE Orders(
		OrderID INT PRIMARY KEY,
		CustomerID INT NOT NULL,
		OrderDate DATE NOT NULL,
		TotalAmount Decimal(10, 2) NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SELECT * FROM Orders

CREATE TABLE OrderDetails(
		OrderDetailID INT PRIMARY KEY NOT NULL,
		OrderID INT NOT NULL,
		ProductID INT NOT NULL,
		Quantity INT NOT NULL,
		UnitPrice DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

SELECT * FROM OrderDetails

