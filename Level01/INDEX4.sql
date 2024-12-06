Keys
1. Primary Key
It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id) 
There is only 1 PK & it should be NOT null.

2. Foreign Key
A foreign key is a column (or set of columns) in a table that refers to the primary key in another table. 
FKs can have duplicate & null values. There can be multiple FKs.

--------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS onlineShop;
USE onlineShop;

CREATE TABLE IF NOT EXISTS customers (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS orders (
  id INT PRIMARY KEY,
  customerID INT,
  orderDate DATE,
  FOREIGN KEY (customerID) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS primarytable(
  id INT,
  name VARCHAR(50),
  age INT,
  city VARCHAR(50),
  PRIMARY KEY (id, name)
);

INSERT INTO 
customers 
(id, name, address)
VALUES
(1, 'UMESH', 'PUNE'),
(2, 'SAMAR', 'KOLKATA'),
(3, 'RISHABH', 'AGRA');

INSERT INTO 
orders 
(id, customerID, orderDate)
VALUES
  (101, 1, '2022-01-01'),
  (102, 1, '2022-01-15'),
  (103, 2, '2022-02-01'),
  (104, 3, '2022-03-01'),
  (105, 1, '2022-04-01');
  
INSERT INTO 
primarytable 
(id, name, age, city)
VALUES
  (1, 'AMIT', 25, 'New York'),
  (2, 'RAKESH', 30, 'Los Angeles'),
  (1, 'SACHIN', 35, 'Chicago'),
  (2, 'VINOD', 20, 'Houston'),
  (5, 'AMIT', 40, 'Seattle');

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM primarytable;

--------------------------------------------------------------------------------------------------------------
-- ONLINESHOP DATABASE --
+----------------------+
| Tables_in_onlineshop |
+----------------------+
| customers            |
| orders               |
| primarytable         |
+----------------------+
-- CUSTOMERS TABLE --
+----+---------+---------+
| id | name    | address |
+----+---------+---------+
|  1 | UMESH   | PUNE    |
|  2 | SAMAR   | KOLKATA |
|  3 | RISHABH | AGRA    |
+----+---------+---------+

-- ORDERS TABLE --
+-----+------------+------------+
| id  | customerID | orderDate  |
+-----+------------+------------+
| 101 |          1 | 2022-01-01 |
| 102 |          1 | 2022-01-15 |
| 103 |          2 | 2022-02-01 |
| 104 |          3 | 2022-03-01 |
| 105 |          1 | 2022-04-01 |
+-----+------------+------------+

-- PRIMARY TABLE (COMBINARION OF TWO COLUMN FOR MAKING A PRIMARY KEY) --
+----+--------+-----+-------------+
| id | name   | age | city        |
+----+--------+-----+-------------+
|  1 | AMIT   |  25 | New York    |
|  1 | SACHIN |  35 | Chicago     |
|  2 | RAKESH |  30 | Los Angeles |
|  2 | VINOD  |  20 | Houston     |
|  5 | AMIT   |  40 | Seattle     |
+----+--------+-----+-------------+