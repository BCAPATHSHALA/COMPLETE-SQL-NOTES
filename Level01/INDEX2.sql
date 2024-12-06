CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS class(
id INT PRIMARY KEY,
className VARCHAR(20),
totalStudents INT
);

CREATE TABLE IF NOT EXISTS student(
rollNo INT PRIMARY KEY,
studentName VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO student
(rollNo, studentName)
VALUES
(101, "KARAN"),
(102, "ARJUN");

-------------------------------------------------------------------------------------
OUTPUT: student table
+--------+-------------+
| rollNo | studentName |
+--------+-------------+
|    101 | KARAN       |
|    102 | ARJUN       |
+--------+-------------+