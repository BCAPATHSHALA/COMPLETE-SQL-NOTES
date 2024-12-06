-- SQL Sub/Nested/Inner Query 02:54 MINS

CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city) 
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT * FROM student;

--------------------------------------------------------------------------------------------------------------
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

-- TODO: QUESTION 01 (SUB QUERY WITH WHERE)
--? Get names of all students who scored more than class average.
--* Step 1. Find the avg of class 
--* Step 2. Find the names of students with marks > avg


COMMAND 01: SELECT AVG(marks) FROM student;
+------------+
| AVG(marks) |
+------------+
|    74.3333 |
+------------+
1 row in set (0.0480 sec)

COMMAND 02: SELECT name, marks FROM student WHERE marks > 74.3333;
+---------+-------+
| name    | marks |
+---------+-------+
| anil    |    78 |
| bhumika |    93 |
| chetan  |    85 |
| dhruv   |    96 |
| farah   |    82 |
+---------+-------+
5 rows in set (0.0012 sec)

COMMAND 01 + 02: SELECT name, marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);
+---------+-------+
| name    | marks |
+---------+-------+
| anil    |    78 |
| bhumika |    93 |
| chetan  |    85 |
| dhruv   |    96 |
| farah   |    82 |
+---------+-------+
5 rows in set (0.0022 sec)


-- TODO: QUESTION 02 (SUB QUERY WITH WHERE)
--? Find the names of all students with even roll numbers.
--* Step 1. Find the even roll numbers
--* Step 2. Find the names of students with even roll no


COMMAND 01: SELECT rollno as even_rollno FROM student WHERE rollno % 2 = 0;
+-------------+
| even_rollno |
+-------------+
|         102 |
|         104 |
|         106 |
+-------------+
3 rows in set (0.0010 sec)

COMMAND 02: SELECT name, rollno FROM student WHERE rollno IN (102, 104, 106);
+---------+--------+
| name    | rollno |
+---------+--------+
| bhumika |    102 |
| dhruv   |    104 |
| farah   |    106 |
+---------+--------+
3 rows in set (0.0015 sec)

COMMAND 01 + 02: SELECT name, rollno FROM student WHERE rollno IN (SELECT rollno as even_rollno FROM student WHERE rollno % 2 = 0);
+---------+--------+
| name    | rollno |
+---------+--------+
| bhumika |    102 |
| dhruv   |    104 |
| farah   |    106 |
+---------+--------+
3 rows in set (0.0331 sec)


-- TODO: QUESTION 03 (SUB QUERY WITH FROM)
--? Find the max marks from the students of Delhi
--* Step 1. Find the students of Delhi
--* Step 2. Find their max marks using the sublist in step 1


COMMAND 01: SELECT * FROM student WHERE city = "delhi";
+--------+---------+-------+-------+-------+
| rollno | name    | marks | grade | city  |
+--------+---------+-------+-------+-------+
|    104 | dhruv   |    96 | A     | Delhi |
|    105 | emanuel |    12 | F     | Delhi |
|    106 | farah   |    82 | B     | Delhi |
+--------+---------+-------+-------+-------+
3 rows in set (0.0018 sec)

COMMAND 02: SELECT MAX(marks) FROM student WHERE city = "delhi";
+------------+
| MAX(marks) |
+------------+
|         96 |
+------------+
1 row in set (0.0383 sec)

COMMAND 01 + 02: SELECT MAX(marks) FROM (SELECT * FROM student WHERE city = "delhi") AS temp_table;
+------------+
| MAX(marks) |
+------------+
|         96 |
+------------+
1 row in set (0.0016 sec)

