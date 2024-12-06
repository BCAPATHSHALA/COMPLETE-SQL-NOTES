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

COMMAND 1: SELECT city, COUNT(name) FROM student GROUP BY city;
+--------+-------------+
| city   | COUNT(name) |
+--------+-------------+
| Pune   |           1 |
| Mumbai |           2 |
| Delhi  |           3 |
+--------+-------------+

COMMAND 2:  SELECT city, COUNT(name) FROM student GROUP BY city HAVING MAX(marks) > 90;
+--------+-------------+
| city   | COUNT(name) |
+--------+-------------+
| Mumbai |           2 |
| Delhi  |           3 |
+--------+-------------+

---------- GENERAL ORDER SEQUENCE TO WRITE THE QUERY ---------- 
SELECT column(s) 
FROM table_name
WHERE condition(applied on the table raw)
GROUP BY column(s) 
HAVING condition(applied on the group of table raw)
ORDER BY column(s) ASC
LIMIT number_of_rows;

COMMAND 3: SELECT city FROM student WHERE grade = "A";
+--------+
| city   |
+--------+
| Mumbai |
| Delhi  |
+--------+

COMMAND 4: SELECT city, COUNT(grade) FROM student WHERE grade = "A" GROUP BY city;
+--------+--------------+
| city   | COUNT(grade) |
+--------+--------------+
| Mumbai |            1 |
| Delhi  |            1 |
+--------+--------------+

COMMAND 5: SELECT city, COUNT(grade) FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 93;
+-------+--------------+
| city  | COUNT(grade) |
+-------+--------------+
| Delhi |            1 |
+-------+--------------+

COMMAND 6: SELECT city, COUNT(grade) FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 10 ORDER BY city ASC;
+--------+--------------+
| city   | COUNT(grade) |
+--------+--------------+
| Delhi  |            1 |
| Mumbai |            1 |
+--------+--------------+

COMMAND 7: SELECT city, COUNT(grade) FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 10 ORDER BY city ASC LIMIT 1;
+--------+--------------+
| city   | COUNT(grade) |
+--------+--------------+
| Delhi  |            1 |
+--------+--------------+


