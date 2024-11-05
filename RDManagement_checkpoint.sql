 --What You're Aiming For:
--In this checkpoint, we will practice the acquired skills through a new example.

-- Consider the following entity-relationship(conceptual) diagram: https://i.imgur.com/Jbjp9Ur.png

CREATE DATABASE RDM_Checkpoint
USE RDM_Checkpoint



CREATE TABLE Producer (
    producer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Wine (
    wine_id INT PRIMARY KEY,
    wine_type VARCHAR(50),
    year INT,
    degree DECIMAL(4, 2),
    producer_id INT,
    FOREIGN KEY (producer_id) REFERENCES Producer(producer_id)
);

-- Inserting data into Producer table
INSERT INTO Producer (producer_id, first_name, last_name, location)
VALUES  (1, 'John', 'Smith', 'Sousse'),
		(2, 'Emma', 'Johnson', 'Tunis'),
		(3, 'Michael', 'Williams', 'Sfax'),
		(4, 'Emily', 'Brown', 'Sousse'),
		(5, 'James', 'Jones', 'Sousse'),
		(6, 'Sarah', 'Davis', 'Tunis'),
		(7, 'David', 'Miller', 'Sfax'),
		(8, 'Olivia', 'Wilson', 'Monastir'),
		(9, 'Daniel', 'Moore', 'Sousse'),
		(10, 'Sophia', 'Taylor', 'Tunis'),
		(11, 'Matthew', 'Anderson', 'Sfax'),
		(12, 'Amelia', 'Thomas', 'Sousse');

-- Inserting data into Wine table
INSERT INTO Wine (wine_id, wine_type, year, degree, producer_id)
VALUES	(1, 'Red', 2019, 13.5, 1),
		(2, 'White', 2020, 12.0, 2),
		(3, 'Rose', 2018, 11.5, 3),
		(4, 'Red', 2021, 14.0, 4),
		(5, 'Sparkling', 2017, 10.5, 5),
		(6, 'White', 2019, 12.5, 6),
		(7, 'Red', 2022, 13.0, 7),
		(8, 'Rose', 2020, 11.0, 8),
		(9, 'Red', 2018, 12.0, 9),
		(10, 'Sparkling', 2019, 10.0, 10),
		(11, 'White', 2021, 11.5, 11),
		(12, 'Red', 2022, 15.0, 12);

-- Inserting data into Region table (if applicable)
-- If there's a Region table
CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(100)
);
INSERT INTO Region (region_id, region_name)
VALUES	(1, 'Sousse'),
		(2, 'Tunis'),
		(3, 'Sfax'),
		(4, 'Monastir');

SELECT * FROM Producer
SELECT * FROM Producer ORDER BY first_name, last_name;
SELECT * FROM Producer WHERE location = 'Sousse';
SELECT SUM(degree) as total_quantity FROM Wine WHERE wine_id = 12;
SELECT wine_type, SUM(degree) as total_quantity FROM Wine GROUP BY wine_type;

-- Assuming we have a quantity column (for example, degree * some factor)
SELECT DISTINCT p.first_name, p.last_name
FROM Producer p
JOIN Wine w ON p.producer_id = w.producer_id
WHERE p.location = 'Sousse' AND (w.degree * 100) > 300
ORDER BY p.last_name, p.first_name;

SELECT wine_id FROM Wine WHERE degree > 12 AND producer_id = 24;

SELECT AVG(degree) AS average_degree FROM Wine;

SELECT * FROM Wine
ORDER BY year ASC

--
SELECT 
  MAX(p.first_name) AS first_name, 
  MAX(p.last_name) AS last_name, 
  SUM(w.degree) AS total_quantity
FROM 
  Producer p
  LEFT JOIN Wine w ON p.producer_id = w.producer_id
GROUP BY 
  p.producer_id
ORDER BY 
  total_quantity DESC;


SELECT w.wine_id, w.wine_type, w.year, w.degree,
       p.first_name AS producer_first_name, p.last_name AS producer_last_name, p.location
FROM Wine w
JOIN Producer p ON w.producer_id = p.producer_id;