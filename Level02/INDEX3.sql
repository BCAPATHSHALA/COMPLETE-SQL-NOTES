-- TBALE RELATED QUERY 02:12 MINS

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

COMMAND 01: ALTER TABLE student ADD COLUMN age INT;
Query OK, 0 rows affected (0.3802 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+------+
| rollno | name    | marks | grade | city   | age  |
+--------+---------+-------+-------+--------+------+
|    101 | anil    |    78 | C     | Pune   | NULL |
|    102 | bhumika |    93 | A     | Mumbai | NULL |
|    103 | chetan  |    85 | B     | Mumbai | NULL |
|    104 | dhruv   |    96 | A     | Delhi  | NULL |
|    105 | emanuel |    12 | F     | Delhi  | NULL |
|    106 | farah   |    82 | B     | Delhi  | NULL |
+--------+---------+-------+-------+--------+------+

COMMAND 02: ALTER TABLE student DROP COLUMN age;
Query OK, 0 rows affected (0.3221 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM STUDENT;
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

-- ALTER (To change the schema: change in column) --
-- COMMAND 01: Add new column age in the student table
COMMAND 01: ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;
Query OK, 0 rows affected (0.2593 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+-----+
| rollno | name    | marks | grade | city   | age |
+--------+---------+-------+-------+--------+-----+
|    101 | anil    |    78 | C     | Pune   |  19 |
|    102 | bhumika |    93 | A     | Mumbai |  19 |
|    103 | chetan  |    85 | B     | Mumbai |  19 |
|    104 | dhruv   |    96 | A     | Delhi  |  19 |
|    105 | emanuel |    12 | F     | Delhi  |  19 |
|    106 | farah   |    82 | B     | Delhi  |  19 |
+--------+---------+-------+-------+--------+-----+


-- COMMAND 02: Modify the existing column age constraints in the student table
COMMAND 02: ALTER TABLE student MODIFY COLUMN age VARCHAR(2);
Query OK, 6 rows affected (0.8437 sec)
Records: 6  Duplicates: 0  Warnings: 0

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+-----+
| rollno | name    | marks | grade | city   | age |
+--------+---------+-------+-------+--------+-----+
|    101 | anil    |    78 | C     | Pune   | 19  |
|    102 | bhumika |    93 | A     | Mumbai | 19  |
|    103 | chetan  |    85 | B     | Mumbai | 19  |
|    104 | dhruv   |    96 | A     | Delhi  | 19  |
|    105 | emanuel |    12 | F     | Delhi  | 19  |
|    106 | farah   |    82 | B     | Delhi  | 19  |
+--------+---------+-------+-------+--------+-----+

INSERT INTO student (rollno, name, marks, grade, city, age) VALUES (107, "manoj", 92, "A", "tundla", 25);
Query OK, 1 row affected (0.0911 sec)

INSERT INTO student (rollno, name, marks, grade, city, age) VALUES (107, "manoj", 92, "A", "tundla", 204);
ERROR: 1406 (22001): Data too long for column 'age' at row 1

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+-----+
| rollno | name    | marks | grade | city   | age |
+--------+---------+-------+-------+--------+-----+
|    101 | anil    |    78 | C     | Pune   | 19  |
|    102 | bhumika |    93 | A     | Mumbai | 19  |
|    103 | chetan  |    85 | B     | Mumbai | 19  |
|    104 | dhruv   |    96 | A     | Delhi  | 19  |
|    105 | emanuel |    12 | F     | Delhi  | 19  |
|    106 | farah   |    82 | B     | Delhi  | 19  |
|    107 | manoj   |    92 | A     | tundla | 25  |
+--------+---------+-------+-------+--------+-----+


-- COMMAND 03: Rename the existing column age to stu_age with constraints INT in the student table
COMMAND 03: ALTER TABLE student CHANGE age stu_age INT;
Query OK, 7 rows affected (0.7299 sec)
Records: 7  Duplicates: 0  Warnings: 0

INSERT INTO student (rollno, name, marks, grade, city, age) VALUES (107, "manoj", 92, "A", "tundla", 204);
ERROR: 1054 (42S22): Unknown column 'age' in 'field list'

INSERT INTO student (rollno, name, marks, grade, city, stu_age) VALUES (108, "sanoj", 90, "A", "tundla", 204);
Query OK, 1 row affected (0.0813 sec)

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+---------+
| rollno | name    | marks | grade | city   | stu_age |
+--------+---------+-------+-------+--------+---------+
|    101 | anil    |    78 | C     | Pune   |      19 |
|    102 | bhumika |    93 | A     | Mumbai |      19 |
|    103 | chetan  |    85 | B     | Mumbai |      19 |
|    104 | dhruv   |    96 | A     | Delhi  |      19 |
|    105 | emanuel |    12 | F     | Delhi  |      19 |
|    106 | farah   |    82 | B     | Delhi  |      19 |
|    107 | manoj   |    92 | A     | tundla |      25 |
|    108 | sanoj   |    90 | A     | tundla |     204 |
+--------+---------+-------+-------+--------+---------+


-- COMMAND 04: DROP the existing column stu_age from the student table
COMMAND 04: ALTER TABLE student DROP COLUMN stu_age;
Query OK, 0 rows affected (0.2510 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
|    107 | manoj   |    92 | A     | tundla |
|    108 | sanoj   |    90 | A     | tundla |
+--------+---------+-------+-------+--------+


-- COMMAND 05: Rename the existing table student to stu in college database
COMMAND 05: ALTER TABLE student RENAME TO stu;
Query OK, 0 rows affected (0.3339 sec)

SELECT * FROM STUDENT;
-- ERROR: 1146 (42S02): Table 'college.student' doesn't exist

SELECT * FROM stu;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
|    107 | manoj   |    92 | A     | tundla |
|    108 | sanoj   |    90 | A     | tundla |
+--------+---------+-------+-------+--------+

COMMAND ALTER TABLE stu RENAME TO student;
Query OK, 0 rows affected (0.3351 sec)

SELECT * FROM STUDENT;
+--------+---------+-------+-------+--------+
| rollno | name    | marks | grade | city   |
+--------+---------+-------+-------+--------+
|    101 | anil    |    78 | C     | Pune   |
|    102 | bhumika |    93 | A     | Mumbai |
|    103 | chetan  |    85 | B     | Mumbai |
|    104 | dhruv   |    96 | A     | Delhi  |
|    105 | emanuel |    12 | F     | Delhi  |
|    106 | farah   |    82 | B     | Delhi  |
|    107 | manoj   |    92 | A     | tundla |
|    108 | sanoj   |    90 | A     | tundla |
+--------+---------+-------+-------+--------+
8 rows in set (0.0029 sec)


-- COMMAND 06: Delete the all existing data from the table student
COMMAND 06: TRUNCATE TABLE student;
Query OK, 0 rows affected (0.6270 sec)

SELECT * FROM STUDENT;
Empty set (0.0024 sec)

