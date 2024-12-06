PRACTICE QUESTION 4

In the student table:
    a. Change the name of column name to full_name
    b. Delete all the students who scored marks less than 80
    c. Delete the column fro grade
----------------------------------------------------------------------------------------------------------------
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

-- COMMAND a: Change the name of column name to full_name
COMMAND 01: ALTER TABLE student CHANGE name full_name VARCHAR(50);
Query OK, 0 rows affected (0.2472 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM student;
+--------+-----------+-------+-------+--------+
| rollno | full_name | marks | grade | city   |
+--------+-----------+-------+-------+--------+
|    101 | anil      |    78 | C     | Pune   |
|    102 | bhumika   |    93 | A     | Mumbai |
|    103 | chetan    |    85 | B     | Mumbai |
|    104 | dhruv     |    96 | A     | Delhi  |
|    105 | emanuel   |    12 | F     | Delhi  |
|    106 | farah     |    82 | B     | Delhi  |
+--------+-----------+-------+-------+--------+

-- COMMAND b: Delete all the students who scored marks less than 80
COMMAND 02: DELETE FROM student WHERE marks < 80;
Query OK, 2 rows affected (0.1018 sec)

SELECT * FROM student;
+--------+-----------+-------+-------+--------+
| rollno | full_name | marks | grade | city   |
+--------+-----------+-------+-------+--------+
|    102 | bhumika   |    93 | A     | Mumbai |
|    103 | chetan    |    85 | B     | Mumbai |
|    104 | dhruv     |    96 | A     | Delhi  |
|    106 | farah     |    82 | B     | Delhi  |
+--------+-----------+-------+-------+--------+

-- COMMAND c: Delete the column fro grade
COMMAND 03:  ALTER TABLE student DROP COLUMN grade;
Query OK, 0 rows affected (0.4596 sec)
Records: 0  Duplicates: 0  Warnings: 0

SELECT * FROM student;
+--------+-----------+-------+--------+
| rollno | full_name | marks | city   |
+--------+-----------+-------+--------+
|    102 | bhumika   |    93 | Mumbai |
|    103 | chetan    |    85 | Mumbai |
|    104 | dhruv     |    96 | Delhi  |
|    106 | farah     |    82 | Delhi  |
+--------+-----------+-------+--------+