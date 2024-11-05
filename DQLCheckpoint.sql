-- DATA QUERY LANGUAGE CHECKPOINT
--  What You're Aiming For :Utilizing the provided tables - Products, Customers, Orders, OrderDetails, and ProductTypes - the objective is to formulate SQL queries to retrieve relevant data using Data Query Language (DQL)
-- Instructions:
--  Retrieve all products.
--  Retrieve all customers.
--  Retrieve all orders.
--  Retrieve all order details.
--  Retrieve all product types.
--  Retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.
--  Retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.
--  Retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.
--  Retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
--  Retrieve the names of customers who have placed an order for at least one widget.
--  Retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer.
--  Retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.
--  Retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.
--  Retrieve the names of the customers who have placed an order every day of the week, along with the total number of orders placed by each customer.
--  Retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.

CREATE TABLE Products(
	   ProductID INT PRIMARY KEY,
	   ProductName VARCHAR(100),
	   ProductType VARCHAR(50),
	   Price DECIMAL(8, 2),
);

INSERT INTO Products(ProductID, ProductName, ProductType, Price)
VALUES (1, 'Widget A', 'Widget', '10.00'),
	   (2, 'Widget B', 'Widget', '15.00'),
	   (3, 'Widget X', 'Gadget', '20.00'),
	   (4, 'Widget Y', 'Gadget', '25.00'),
	   (5, 'Widget Z', 'Doohickey', '30.00');

SELECT * FROM Products

CREATE TABLE Customers(
	   CustomerID INT PRIMARY KEY,
	   CustomerName VARCHAR(100),
	   Email VARCHAR(30),
	   Phone VARCHAR(24) NOT NULL,
);
INSERT INTO Customers(CustomerID, CustomerName, Email, Phone)
VALUES (1, 'John Smith', 'john@aol.com', '123-456-7890'),
	   (2, 'Jane Doe', 'jane@aol.com', '987-654-3210'),
	   (3, 'Alice Brown', 'alice.brown"aol.com', '456-789-0123');

	  SELECT * FROM Customers

CREATE TABLE Orders_1(
	   OOrderID INT PRIMARY KEY,
	   CustomerID INT,
	   OrderDate DATE,
);
INSERT INTO Orders_1(OOrderID, CustomerID, OrderDate)
VALUES ('101', 1, '2024-05-01'),
	   ('102', 2, '2024-05-02'),
	   ('103', 3, '2024-05-01');
SELECT * FROM Orders_1

CREATE TABLE OrderDetails(
		OrderDetailID INT PRIMARY KEY,
		OOrderID INT,
		ProductID INT,
		Quantity INT,

);
INSERT INTO OrderDetails(OrderDetailID, OOrderID, ProductID, Quantity)
VALUES (1, '101', 1, 2),
	   (2, '101', 3, 1),
	   (3, '102', 2, 3),
	   (4, '102', 4, 2),
	   (5, '103', 5, 1);
SELECT * FROM OrderDetails

CREATE TABLE ProductTypes(
		ProductTypeID INT PRIMARY KEY,
		ProductTypeName VARCHAR(100),
);
INSERT INTO ProductTypes(ProductTypeID, ProductTypeName)
VALUES (1, 'Widget'),
	   (2, 'Gadget'),
	   (3, 'Doohickey');
SELECT * FROM ProductTypes

SELECT * FROM Products, Customers, Orders_1, OrderDetails, ProductTypes

--1. Retrieve the names of the products that have been ordered by at least one customer,

SELECT 
P.ProductName,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM 
    Products P
LEFT JOIN 
    OrderDetails OD ON P.ProductID = OD.ProductID
LEFT JOIN 
    Orders_1 O ON OD.OOrderID = O.OOrderID
GROUP BY 
    P.ProductName;
--

SELECT 
    C.CustomerName,
    COUNT(O.OOrderID) AS TotalOrders
FROM 
    Customers C
LEFT JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerName
HAVING 
    COUNT(DISTINCT O.OrderDate) = 7;  
-- Assuming there are orders for every day of the week

--
SELECT 
    C.CustomerName,
    COUNT(O.OOrderID) AS TotalOrders
FROM 
    Customers C
LEFT JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerName
ORDER BY 
    TotalOrders DESC;
-- To get the customer with the most orders


SELECT 
    P.ProductName,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM 
    Products P
JOIN 
    OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY 
    P.ProductName
ORDER BY 
    TotalQuantityOrdered DESC;



SELECT DISTINCT 
    C.CustomerName
FROM 
    Customers C
JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetails OD ON O.OOrderID = OD.OOrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
WHERE 
    P.ProductType = 'Widget';


SELECT 
    C.CustomerName,
    SUM(P.Price * OD.Quantity) AS TotalCost
FROM 
    Customers C
JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetails OD ON O.OOrderID = OD.OOrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
WHERE 
    P.ProductType IN ('Widget', 'Gadget')
GROUP BY 
    C.CustomerName
HAVING 
    SUM(CASE WHEN P.ProductType = 'Widget' THEN OD.Quantity ELSE 0 END) > 0
    AND SUM(CASE WHEN P.ProductType = 'Gadget' THEN OD.Quantity ELSE 0 END) > 0;


SELECT 
    C.CustomerName,
    SUM(P.Price * OD.Quantity) AS TotalCost
FROM 
    Customers C
JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetails OD ON O.OOrderID = OD.OOrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
WHERE 
    P.ProductType = 'Gadget'
GROUP BY 
    C.CustomerName;


SELECT 
    C.CustomerName,
    SUM(P.Price * OD.Quantity) AS TotalCost
FROM 
    Customers C
JOIN 
    Orders_1 O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetails OD ON O.OOrderID = OD.OOrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
WHERE 
    P.ProductType = 'Doohickey'
GROUP BY 
    C.CustomerName;








