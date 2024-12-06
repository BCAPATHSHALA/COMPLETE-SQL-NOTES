PRACTICE QUESTION 2: 

Write a Query to find the avg marks in each city in ascending order.

--------------------------------------------------------------------------------------------------------------
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

SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) ASC;

--------------------------------------------------------------------------------------------------------------

+--------+------------+
| city   | AVG(marks) |
+--------+------------+
| Delhi  |    63.3333 |
| Pune   |    78.0000 |
| Mumbai |    89.0000 |
+--------+------------+