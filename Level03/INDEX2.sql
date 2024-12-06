-- SQL UNION Query 02:51 MINS

CREATE DATABASE IF NOT EXISTS college2;
USE college2;

CREATE TABLE IF NOT EXISTS student (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS course (
id INT PRIMARY KEY,
course VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS employee (
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO student (id, name) 
VALUES 
(101, 'adam'),
(102, 'bob'),
(103, 'casey');

INSERT INTO course (id, course) 
VALUES 
(102, 'english'),
(105, 'math'),
(103, 'science'),
(107, 'computer science');

INSERT INTO employee (id, name, manager_id) 
VALUES 
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM employee;

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT TABLE --
+-----+-------+
| id  | name  |
+-----+-------+
| 101 | adam  |
| 102 | bob   |
| 103 | casey |
+-----+-------+

-- COURSE TABLE --
+-----+------------------+
| id  | course           |
+-----+------------------+
| 102 | english          |
| 103 | science          |
| 105 | math             |
| 107 | computer science |
+-----+------------------+

-- EMPLOYEE TABLE --
+-----+--------+------------+
| id  | name   | manager_id |
+-----+--------+------------+
| 101 | adam   |        103 |
| 102 | bob    |        104 |
| 103 | casey  |       NULL |
| 104 | donald |        103 |
+-----+--------+------------+


--! I want to get all unique names from employe table only
COMMAND 01: 
SELECT name FROM employee 
UNION 
SELECT name FROM employee;
+--------+
| name   |
+--------+
| adam   |
| bob    |
| casey  |
| donald |
+--------+
4 rows in set (0.0016 sec)

--! I want to get all names from employe table only
COMMAND 02: 
SELECT name FROM employee 
UNION 
ALL SELECT name FROM employee;
+--------+
| name   |
+--------+
| adam   |
| bob    |
| casey  |
| donald |
| adam   |
| bob    |
| casey  |
| donald |
+--------+
8 rows in set (0.0014 sec)

--! I want to get all unique names from employe and student table
COMMAND 03: 
SELECT name FROM employee 
UNION 
SELECT name FROM student;
+--------+
| name   |
+--------+
| adam   |
| bob    |
| casey  |
| donald |
+--------+
4 rows in set (0.0010 sec)