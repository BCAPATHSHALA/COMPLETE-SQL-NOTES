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
-- COLLEGE DATABASE --
+-------------------+
| Tables_in_college |
+-------------------+
| student           |
+-------------------+

-- STUDENT TABLE --
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

COMMAND 1: SELECT name, marks FROM student;
+---------+-------+
| name    | marks |
+---------+-------+
| anil    |    78 |
| bhumika |    93 |
| chetan  |    85 |
| dhruv   |    96 |
| emanuel |    12 |
| farah   |    82 |
+---------+-------+

COMMAND 2: SELECT * FROM student;
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

COMMAND 3: SELECT DISTINCT city FROM student;
+--------+
| city   |
+--------+
| Pune   |
| Mumbai |
| Delhi  |
+--------+

COMMAND 4: SELECT * FROM student WHERE marks > 80;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 5: SELECT * FROM student WHERE city = 'Mumbai';
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 6: SELECT * FROM student WHERE marks > 90 AND city = 'Mumbai';
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 7: SELECT * FROM student WHERE marks+10 > 100;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 8: SELECT * FROM student WHERE marks = 93;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 9: SELECT * FROM student WHERE marks != 93;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 10: SELECT * FROM student WHERE marks > 90 AND city = 'Mumbai';
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 11: SELECT * FROM student WHERE marks > 90 OR city = 'Mumbai';
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 12: SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

+--------+--------+-------+-------+--------+
| rollno | name   | marks | grade | city   |
+--------+--------+-------+-------+--------+
|    103 | chetan |    85 | B     | Mumbai |
|    106 | farah  |    82 | B     | Delhi  |
+--------+--------+-------+-------+--------+

COMMAND 13: SELECT * FROM student WHERE city IN ('Delhi', 'Mumbai');
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 14: SELECT * FROM student WHERE city NOT IN ('Delhi', 'Mumbai');
+--------+------+-------+-------+------+
| rollno | name | marks | grade | city |
+--------+------+-------+-------+------+
|    101 | anil |    78 | C     | Pune |
+--------+------+-------+-------+------+

COMMAND 15: SELECT * FROM student LIMIT 3;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 16: SELECT * FROM student WHERE marks > 75 LIMIT 3;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 17: SELECT * FROM student ORDER BY city ASC;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    101 | anil    |    78 | C     | Pune   |
+--------+---------+-------+-------+--------+

COMMAND 18: SELECT * FROM student ORDER BY city DESC;
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

COMMAND 19: SELECT * FROM student ORDER BY marks DESC;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    104 | dhruv   |    96 | A     | Delhi  |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    106 | farah   |    82 | B     | Delhi  |
|    101 | anil    |    78 | C     | Pune   |
|    105 | emanuel |    12 | F     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 20: SELECT * FROM student ORDER BY marks DESC LIMIT 3;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    104 | dhruv   |    96 | A     | Delhi  |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
+--------+---------+-------+-------+--------+

COMMAND 21: SELECT marks FROM student;
+-------+
| marks |
+-------+
|    78 |
|    93 |
|    85 |
|    96 |
|    12 |
|    82 |
+-------+

COMMAND 22:  SELECT MAX(marks) FROM student;
+------------+
| MAX(marks) |
+------------+
|         96 |
+------------+

COMMAND 23: SELECT MIN(marks) FROM student;
+------------+
| MIN(marks) |
+------------+
|         12 |
+------------+

COMMAND 24: SELECT AVG(marks) FROM student;
+------------+
| AVG(marks) |
+------------+
|    74.3333 |
+------------+

COMMAND 25: SELECT COUNT(name) FROM student;
+-------------+
| COUNT(name) |
+-------------+
|           6 |
+-------------+

COMMAND 26: SELECT city FROM student;
+--------+
| city   |
+--------+
| Pune   |
| Mumbai |
| Mumbai |
| Delhi  |
| Delhi  |
| Delhi  |
+--------+

COMMAND 27: SELECT city FROM student GROUP BY city;
+--------+
| city   |
+--------+
| Pune   |
| Mumbai |
| Delhi  |
+--------+

COMMAND 28: SELECT city, COUNT(name) FROM student GROUP BY city;

+--------+-------------+
| city   | COUNT(name) |
+--------+-------------+
| Pune   |           1 |
| Mumbai |           2 |
| Delhi  |           3 |
+--------+-------------+

COMMAND 29: SELECT city, name, COUNT(name) FROM student GROUP BY city, name;
+--------+---------+-------------+
| city   | name    | COUNT(name) |
+--------+---------+-------------+
| Pune   | anil    |           1 |
| Mumbai | bhumika |           1 |
| Mumbai | chetan  |           1 |
| Delhi  | dhruv   |           1 |
| Delhi  | emanuel |           1 |
| Delhi  | farah   |           1 |
+--------+---------+-------------+

COMMAND 30: SELECT city, AVG(marks) FROM student GROUP BY city;
+--------+------------+
| city   | AVG(marks) |
+--------+------------+
| Pune   |    78.0000 |
| Mumbai |    89.0000 |
| Delhi  |    63.3333 |
+--------+------------+