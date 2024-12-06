CREATE DATABASE IF NOT EXISTS college1;
USE college1;

CREATE TABLE IF NOT EXISTS dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
deptId INT,
FOREIGN KEY (deptId) REFERENCES dept(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO dept (id, name) 
VALUES 
(1, 'Mathematics'),
(2, 'Science'),
(3, 'English');

INSERT INTO teacher (id, name, deptId) 
VALUES 
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Bob Johnson', 3),
(4, 'Alice Brown', 1),
(5, 'Mike Davis', 2);

SELECT * FROM dept;
SELECT * FROM teacher;

--------------------------------------------------------------------------------------------------------------
-- INPUT/PARENT TABLE: DEPT TABLE (This is a parent table for Teacher table because it contains the primary key id of DEPT table) --
+----+-------------+
| id | name        |
+----+-------------+
|  1 | Mathematics |
|  2 | Science     |
|  3 | English     |
+----+-------------+

-- FOREIGEN/CHILD TABLE: TEACHER TABLE (This is a child table for Dept Table because Teacher table contains it's primary key id) --
+----+-------------+--------+
| id | name        | deptId |
+----+-------------+--------+
|  1 | John Doe    |      1 |
|  2 | Jane Smith  |      2 |
|  3 | Bob Johnson |      3 |
|  4 | Alice Brown |      1 |
|  5 | Mike Davis  |      2 |
+----+-------------+--------+

----------------------- CASCADING FOR FOREIGEN KEY -----------------------
Cascading mtlb: agar ek table me change hoga to usse related other table me bhi change hona chaiye

ON DELETE CASCADE
When we create a foreign key using this option, it deletes the referencing rows in the child table when the referenced row is deleted in the parent table which has a primary key.

ON UPDATE CASCADE
When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the childtable when the referenced row is updated in the parent table which has a primary key.

CREATE TABLE IF NOT EXISTS student(
    id INT PRIMARY KEY,
    courseID INT,
    FOREIGN KEY (courseID) REFERENCES course(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
---------------------------------------------------------------------------------------------------------------------------------
COMMAND 1: UPDATE dept SET id = 102 WHERE id = 1;
Query OK, 1 row affected (0.0978 sec)

Rows matched: 1  Changed: 1  Warnings: 0

SELECT * FROM dept;
+-----+-------------+
| id  | name        |
+-----+-------------+
|   2 | Science     |
|   3 | English     |
| 102 | Mathematics |
+-----+-------------+

SELECT * FROM teacher;
+----+-------------+--------+
| id | name        | deptId |
+----+-------------+--------+
|  1 | John Doe    |    102 |
|  2 | Jane Smith  |      2 |
|  3 | Bob Johnson |      3 |
|  4 | Alice Brown |    102 |
|  5 | Mike Davis  |      2 |
+----+-------------+--------+