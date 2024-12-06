PRACTICE QUESTION 3: 

For the given table, find the total payment according to each payment method.

+------------+----------+-------------+--------+
| customerId | customer | mode        | city   |
+------------+----------+-------------+--------+
|        101 | anil     | Netbanking  | Pune   |
|        102 | bhumika  | Credit Card | Mumbai |
|        103 | chetan   | Credit Card | Mumbai |
|        104 | dhruv    | Netbanking  | Delhi  |
|        105 | emanuel  | Debit Card  | Delhi  |
|        106 | farah    | Credit Card | Delhi  |
+------------+----------+-------------+--------+

--------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS customer (
  customerId INT PRIMARY KEY,
  customer VARCHAR(50),
  mode VARCHAR(50),
  city VARCHAR(50)
);

INSERT INTO customer
(customerId, customer, mode, city) 
VALUES
(101, "anil", "Netbanking", "Pune"),
(102, "bhumika", "Credit Card", "Mumbai"),
(103, "chetan", "Credit Card", "Mumbai"),
(104, "dhruv", "Netbanking", "Delhi"),
(105, "emanuel", "Debit Card", "Delhi"),
(106, "farah", "Credit Card", "Delhi");

--------------------------------------------------------------------------------------------------------------

-- Find total payments count from the customer table --
COMMAND 1: SELECT COUNT(customerId) FROM customer;
+-------------------+
| COUNT(customerId) |
+-------------------+
|                 6 |
+-------------------+

-- find the total payment according to each payment method --
COMMAND 2: SELECT mode, COUNT(customerId) FROM customer GROUP BY mode;
+-------------+-------------------+
| mode        | COUNT(customerId) |
+-------------+-------------------+
| Netbanking  |                 2 |
| Credit Card |                 3 |
| Debit Card  |                 1 |
+-------------+-------------------+
