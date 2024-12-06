-- SQL Joins Query 02:23 MINS

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

-- INNER JOIN (Common Assets) --
COMMAND 01: SELECT * FROM student INNER JOIN course ON student.id = course.id;
+-----+-------+-----+---------+
| id  | name  | id  | course  |
+-----+-------+-----+---------+
| 102 | bob   | 102 | english |
| 103 | casey | 103 | science |
+-----+-------+-----+---------+
2 rows in set (0.0015 sec)


COMMAND 02: SELECT * FROM student AS s INNER JOIN course AS c ON s.id = c.id;
+-----+-------+-----+---------+
| id  | name  | id  | course  |
+-----+-------+-----+---------+
| 102 | bob   | 102 | english |
| 103 | casey | 103 | science |
+-----+-------+-----+---------+
2 rows in set (0.0011 sec)

-- LEFT JOIN (OUTER JOIN 1) -- 
-- Lets left table as student
COMMAND 01: SELECT * FROM student LEFT JOIN course ON student.id = course.id;
+-----+-------+------+---------+
| id  | name  | id   | course  |
+-----+-------+------+---------+
| 101 | adam  | NULL | NULL    |
| 102 | bob   |  102 | english |
| 103 | casey |  103 | science |
+-----+-------+------+---------+
3 rows in set (0.0009 sec)

-- Lets left table as course
COMMAND 02: SELECT * FROM course LEFT JOIN student ON student.id = course.id;
+-----+------------------+------+-------+
| id  | course           | id   | name  |
+-----+------------------+------+-------+
| 102 | english          |  102 | bob   |
| 103 | science          |  103 | casey |
| 105 | math             | NULL | NULL  |
| 107 | computer science | NULL | NULL  |
+-----+------------------+------+-------+
4 rows in set (0.0016 sec)

-- RIGHT JOIN (OUTER JOIN 2) -- 
-- Lets left table as student
SELECT * FROM student RIGHT JOIN course ON student.id = course.id;
+------+-------+-----+------------------+
| id   | name  | id  | course           |
+------+-------+-----+------------------+
|  102 | bob   | 102 | english          |
|  103 | casey | 103 | science          |
| NULL | NULL  | 105 | math             |
| NULL | NULL  | 107 | computer science |
+------+-------+-----+------------------+
4 rows in set (0.0012 sec)

-- Lets left table as course
SELECT * FROM course RIGHT JOIN student ON student.id = course.id;
+------+---------+-----+-------+
| id   | course  | id  | name  |
+------+---------+-----+-------+
| NULL | NULL    | 101 | adam  |
|  102 | english | 102 | bob   |
|  103 | science | 103 | casey |
+------+---------+-----+-------+
3 rows in set (0.0016 sec)

-- FULL JOIN (OUTER JOIN 3) -- 
-- Syntax: LEFT JOIN + union + RIGHT JOIN
COMMAND 01: 
SELECT * FROM student LEFT JOIN course ON student.id = course.id 
UNION 
SELECT * FROM student RIGHT JOIN course ON student.id = course.id;
+------+-------+------+------------------+
| id   | name  | id   | course           |
+------+-------+------+------------------+
|  101 | adam  | NULL | NULL             |
|  102 | bob   |  102 | english          |
|  103 | casey |  103 | science          |
| NULL | NULL  |  105 | math             |
| NULL | NULL  |  107 | computer science |
+------+-------+------+------------------+
5 rows in set (0.0426 sec)

-- TODO: Write SQL commands to display the right, left, full exclusive join --
--! LEFT JOIN (EXCLUSIVE JOIN 1) -- 
--? Lets left table as student (MUJHE WO DATA CHAIYE JO ONLY STUDENT TABLE KE PASS HAI AND WO DATA COURSE TABLE KE PASS NAHI HAI)
COMMAND 01: SELECT * FROM student LEFT JOIN course ON student.id = course.id WHERE course.id IS NULL;
+-----+------+------+--------+
| id  | name | id   | course |
+-----+------+------+--------+
| 101 | adam | NULL | NULL   |
+-----+------+------+--------+
1 row in set (0.0014 sec)

--? Lets left table as course 
COMMAND 02: SELECT * FROM course RIGHT JOIN student ON student.id = course.id WHERE course.id IS NULL;
+-----+------+------+--------+
| id  | name | id   | course |
+-----+------+------+--------+
| 101 | adam | NULL | NULL   |
+-----+------+------+--------+
1 row in set (0.0014 sec)


--! RIGHT JOIN (EXCLUSIVE JOIN 2) -- 
--? Lets left table as course (MUJHE WO DATA CHAIYE JO ONLY COURSE TABLE KE PASS HAI AND WO DATA STUDENT TABLE KE PASS NAHI HAI)
COMMAND 02: SELECT * FROM course LEFT JOIN student ON student.id = course.id WHERE student.id IS NULL;
+-----+------------------+------+------+
| id  | course           | id   | name |
+-----+------------------+------+------+
| 105 | math             | NULL | NULL |
| 107 | computer science | NULL | NULL |
+-----+------------------+------+------+
2 rows in set (0.0019 sec)

--? Lets left table as student
COMMAND 02:  SELECT * FROM student RIGHT JOIN course ON student.id = course.id WHERE student.id IS NULL;
+-----+------------------+------+------+
| id  | course           | id   | name |
+-----+------------------+------+------+
| 105 | math             | NULL | NULL |
| 107 | computer science | NULL | NULL |
+-----+------------------+------+------+
2 rows in set (0.0019 sec)


--! FULL JOIN (EXCLUSIVE JOIN 3) -- 
-- Syntax: LEFT EXCLUSIVE JOIN + union + RIGHT EXCLUSIVE JOIN
COMMAND 01: 
--? Lets left table as student
SELECT * FROM student LEFT JOIN course ON student.id = course.id WHERE course.id IS NULL 
UNION 
SELECT * FROM student RIGHT JOIN course ON student.id = course.id WHERE student.id IS NULL;
+------+------+------+------------------+
| id   | name | id   | course           |
+------+------+------+------------------+
|  101 | adam | NULL | NULL             |
| NULL | NULL |  105 | math             |
| NULL | NULL |  107 | computer science |
+------+------+------+------------------+
3 rows in set (0.0015 sec)


COMMAND 02:
--? Lets left table as course
SELECT * FROM course RIGHT JOIN student ON student.id = course.id WHERE course.id IS NULL 
UNION 
SELECT * FROM course LEFT JOIN student ON student.id = course.id WHERE student.id IS NULL;
+------+------------------+------+------+
| id   | course           | id   | name |
+------+------------------+------+------+
| NULL | NULL             |  101 | adam |
|  105 | math             | NULL | NULL |
|  107 | computer science | NULL | NULL |
+------+------------------+------+------+
3 rows in set (0.0023 sec)

--! SELF JOIN (INNER JOIN 1) -- 
COMMAND 00: SELECT * FROM employee;
+-----+--------+------------+
| id  | name   | manager_id |
+-----+--------+------------+
| 101 | adam   |        103 |
| 102 | bob    |        104 |
| 103 | casey  |       NULL |
| 104 | donald |        103 |
+-----+--------+------------+

--? I want all data from a and b table
COMMAND 01: SELECT * FROM employee AS a JOIN employee AS b ON a.id = b.manager_id;
+-----+--------+------------+-----+--------+------------+
| id  | name   | manager_id | id  | name   | manager_id |
+-----+--------+------------+-----+--------+------------+
| 103 | casey  |       NULL | 101 | adam   |        103 |
| 104 | donald |        103 | 102 | bob    |        104 |
| 103 | casey  |       NULL | 104 | donald |        103 |
+-----+--------+------------+-----+--------+------------+
3 rows in set (0.0016 sec)

--? I want only names from a and b table
COMMAND 02: SELECT a.name as manager_name, b.name FROM employee AS a JOIN employee AS b ON a.id = b.manager_id;
+--------------+--------+
| manager_name | name   |
+--------------+--------+
| casey        | adam   |
| donald       | bob    |
| casey        | donald |
+--------------+--------+
3 rows in set (0.0010 sec)