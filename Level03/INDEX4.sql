-- MySQL Views 03:11 MINS (Virtual Table)

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


--* Create the virtual table "view1" that contains the information of student includes rollno, name, marks to provide the teacher (Kyunki teacher ko unki city se koi bhi mtlb nahi hai)

COMMAND 01: CREATE VIEW view1 AS SELECT rollno, name, marks FROM student;
Query OK, 0 rows affected (0.5139 sec)

COMMAND 02: SELECT * FROM view1;
+--------+---------+-------+
| rollno | name    | marks |
+--------+---------+-------+
|    101 | anil    |    78 |
|    102 | bhumika |    93 |
|    103 | chetan  |    85 |
|    104 | dhruv   |    96 |
|    105 | emanuel |    12 |
|    106 | farah   |    82 |
+--------+---------+-------+
6 rows in set (0.0419 sec)

COMMAND 03: DROP VIEW view1;
Query OK, 0 rows affected (0.1319 sec)