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

COMMAND 1: UPDATE student SET grade = "O" WHERE grade = "A";
Query OK, 2 rows affected (0.1437 sec)

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | O     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | O     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 2: SET SQL_SAFE_UPDATES = 0;
Query OK, 0 rows affected (0.0007 sec)
(Hamne SQL ka safe mode OFF kar diya hai)

COMMAND 3: SET SQL_SAFE_UPDATES = 1;
Query OK, 0 rows affected (0.0008 sec)
(Hamne SQL ka safe mode ON kar diya hai)

COMMAND 4: UPDATE student SET grade = "A" WHERE grade = "O";
ERROR: 1175 (HY000): You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.
(Yeh error SQL ke safe mode ON hone par aata hai for the security purpose)

Yadi hame apne data ko update karna hai to isse OFF karna padega

COMMAND 5: UPDATE student SET grade = "A" WHERE grade = "O";
Query OK, 2 rows affected (0.1065 sec)

SELECT * FROM student;
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

COMMAND 6: UPDATE student SET marks = 82 WHERE rollno = 105;
Query OK, 1 row affected (0.1246 sec)

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    82 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 7: UPDATE student SET grade = "B" WHERE marks > 80;
Query OK, 3 rows affected (0.1194 sec)
Rows matched: 5  Changed: 3  Warnings: 0

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | B     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | B     | Delhi  |
|    105 | emanuel |    82 | B     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 8: UPDATE student SET grade = "B" WHERE marks BETWEEN 80 AND 90;
Query OK, 0 rows affected (0.0012 sec)
Rows matched: 3  Changed: 0  Warnings: 0

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | B     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | B     | Delhi  |
|    105 | emanuel |    82 | B     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 9: UPDATE student SET grade = "A" WHERE marks > 90;
Query OK, 1 row affected (0.0883 sec)
Rows matched: 2  Changed: 2  Warnings: 0

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    82 | B     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 10: DELETE FROM student WHERE marks < 80;
Query OK, 1 row affected (0.0560 sec)

SELECT * FROM student;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    82 | B     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
+--------+---------+-------+-------+--------+

COMMAND 11: DELETE FROM student;
Query OK, 5 rows affected (0.0901 sec)

SELECT * FROM student;
Empty set (0.0009 sec) ===> Hamne apni table ko hi delete kar diya hai