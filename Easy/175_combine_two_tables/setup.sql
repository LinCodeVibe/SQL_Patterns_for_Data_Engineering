DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Address;

-- Create tables
CREATE TABLE Person (
    personId INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50)
);

CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Insert data
INSERT INTO Person VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

INSERT INTO Address VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');
