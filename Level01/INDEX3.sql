PRACTICE QUESTION 1

Create a database for your company XYZ.

STEP 1: Create a table inside this DB to store employee info (id, name, salary)
STEP 2: Add following information in the DB:
        1, "adam", 25000
        2, "bob", 30000
        3, "casey", 40000
STEP 3: Select & view all your table data 

--------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS companyxyz;
USE companyxyz;

CREATE TABLE IF NOT EXISTS employee(
id INT PRIMARY KEY,
name VARCHAR(20),
salary DOUBLE
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000);

SELECT * FROM employee;

-------------------------------------------------------------------------------------
OUTPUT: employee table
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  25000 |
|  2 | bob   |  30000 |
|  3 | casey |  40000 |
+----+-------+--------+