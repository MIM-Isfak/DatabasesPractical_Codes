MariaDB [pscompany]> CREATE DATABASE Student_Marks
    -> ;
Query OK, 1 row affected (0.002 sec)

MariaDB [pscompany]> CREATE TABLE Marks(
    -> Student_ID VARCHAR(50) PRIMARY KEY,
    -> First_Name VARCHAR(50),
    -> Last_Name VARCHAR(50),
    -> Marks DECIMAL(5,2));
Query OK, 0 rows affected (0.283 sec)

MariaDB [pscompany]> DROP TABLE Marks;
Query OK, 0 rows affected (0.104 sec)

MariaDB [pscompany]> USE Student_Marks;
Database changed
MariaDB [Student_Marks]> CREATE TABLE Marks(
    -> Student_ID VARCHAR(50) PRIMARY KEY,
    -> First_Name VARCHAR(50),
    -> Last_Name VARCHAR(50),
    -> Marks DECIMAL(5,2));
Query OK, 0 rows affected (0.154 sec)

MariaDB [Student_Marks]> INSERT INTO Marks
    -> VALUES("1","Fred","Jones",78)
    -> ,("2","Bill","James",67),
    -> ("3","Carol","Smith",82),
    -> ("4","Bob","Duncan",60),
    -> ("5","Joan","Davis",86);
Query OK, 5 rows affected (0.046 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Student_Marks]> SELECT * FROM Marks;
+------------+------------+-----------+-------+
| Student_ID | First_Name | Last_Name | Marks |
+------------+------------+-----------+-------+
| 1          | Fred       | Jones     | 78.00 |
| 2          | Bill       | James     | 67.00 |
| 3          | Carol      | Smith     | 82.00 |
| 4          | Bob        | Duncan    | 60.00 |
| 5          | Joan       | Davis     | 86.00 |
+------------+------------+-----------+-------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT CONCAT_WS(First_Name,Last_Name)AS FullName FROM Marks;
+----------+
| FullName |
+----------+
| Jones    |
| James    |
| Smith    |
| Duncan   |
| Davis    |
+----------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT CONCAT(First_Name,Last_Name)AS FullName FROM Marks;
+------------+
| FullName   |
+------------+
| FredJones  |
| BillJames  |
| CarolSmith |
| BobDuncan  |
| JoanDavis  |
+------------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT CONCAT(First_Name,' ',Last_Name)AS FullName FROM Marks;
+-------------+
| FullName    |
+-------------+
| Fred Jones  |
| Bill James  |
| Carol Smith |
| Bob Duncan  |
| Joan Davis  |
+-------------+
5 rows in set (0.000 sec)

MariaDB [Student_Marks]> SELECT
    -> Student_ID,Student_ID,Last_Name,CONCAT(First_Name,' ',Last_Name) AS FullName,Marks FROM Marks;
+------------+------------+-----------+-------------+-------+
| Student_ID | Student_ID | Last_Name | FullName    | Marks |
+------------+------------+-----------+-------------+-------+
| 1          | 1          | Jones     | Fred Jones  | 78.00 |
| 2          | 2          | James     | Bill James  | 67.00 |
| 3          | 3          | Smith     | Carol Smith | 82.00 |
| 4          | 4          | Duncan    | Bob Duncan  | 60.00 |
| 5          | 5          | Davis     | Joan Davis  | 86.00 |
+------------+------------+-----------+-------------+-------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT Student_ID,Last_Name,CONCAT(First_Name,' ',Last_Name) AS FullName,Marks FROM Marks;
+------------+-----------+-------------+-------+
| Student_ID | Last_Name | FullName    | Marks |
+------------+-----------+-------------+-------+
| 1          | Jones     | Fred Jones  | 78.00 |
| 2          | James     | Bill James  | 67.00 |
| 3          | Smith     | Carol Smith | 82.00 |
| 4          | Duncan    | Bob Duncan  | 60.00 |
| 5          | Davis     | Joan Davis  | 86.00 |
+------------+-----------+-------------+-------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> CREATE TABLE Department(
    -> Dept_ID INT PRIMARY KEY,
    -> Dept_Name VARCHAR(50),
    -> Building VARCHAR(20));
Query OK, 0 rows affected (0.112 sec)

MariaDB [Student_Marks]> DROP TABLE Department;
Query OK, 0 rows affected (0.074 sec)

MariaDB [Student_Marks]> CREATE DATABASE University;
Query OK, 1 row affected (0.002 sec)

MariaDB [Student_Marks]> use University ;
Database changed
    
MariaDB [Student_Marks]> CREATE TABLE Department(
    -> Dept_ID INT PRIMARY KEY,
    -> Dept_Name VARCHAR(50),
    -> Building VARCHAR(20));
Query OK, 0 rows affected (0.109 sec)

MariaDB [Student_Marks]> insert into Department
    -> values(1,"Computer Science","Block A"),
    -> (2,"Mathematics","Block B"),
    -> (3,"Physics","Block C");
Query OK, 3 rows affected (0.037 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [Student_Marks]> CREATE TABLE Student(
    -> Student_ID INT PRIMARY KEY,
    -> StudentName VARCHAR(20),
    -> Age INT ,
    -> Marks decimal(4,2),
    -> Dept_ID INT,
    -> FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID));
Query OK, 0 rows affected (0.144 sec)

MariaDB [Student_Marks]> insert into Student
    -> values(101,"Alice",20,85,1),
    -> (102,"Bob",22,78,1),
    -> (103,"Charlie",21,92,2)
    -> ,(104,"David",23,65,2),
    -> (105,"Eva",20,88,3);
Query OK, 5 rows affected (0.218 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Student_Marks]> Select * from Student;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        101 | Alice       |   20 | 85.00 |       1 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        103 | Charlie     |   21 | 92.00 |       2 |
|        104 | David       |   23 | 65.00 |       2 |
|        105 | Eva         |   20 | 88.00 |       3 |
+------------+-------------+------+-------+---------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> select *from Student
    -> where StudentName like "A%";
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        101 | Alice       |   20 | 85.00 |       1 |
+------------+-------------+------+-------+---------+
1 row in set (0.001 sec)

MariaDB [Student_Marks]> select StudentName from student where Age>20 and Marks>80;
+-------------+
| StudentName |
+-------------+
| Charlie     |
+-------------+
1 row in set (0.001 sec)

MariaDB [Student_Marks]> select * from Department where Dept_Name="Computer Science" or "Mathematics";
+---------+------------------+----------+
| Dept_ID | Dept_Name        | Building |
+---------+------------------+----------+
|       1 | Computer Science | Block A  |
+---------+------------------+----------+
1 row in set, 5 warnings (0.000 sec)


MariaDB [Student_Marks]> select * from Student where Dept_ID=1 or 2;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        101 | Alice       |   20 | 85.00 |       1 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        103 | Charlie     |   21 | 92.00 |       2 |
|        104 | David       |   23 | 65.00 |       2 |
|        105 | Eva         |   20 | 88.00 |       3 |
+------------+-------------+------+-------+---------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> select * from Student where Dept_ID=1 or Dept_ID=2;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        101 | Alice       |   20 | 85.00 |       1 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        103 | Charlie     |   21 | 92.00 |       2 |
|        104 | David       |   23 | 65.00 |       2 |
+------------+-------------+------+-------+---------+
4 rows in set (0.001 sec)

MariaDB [Student_Marks]> select * from Student where Marks between 70 and 90;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        101 | Alice       |   20 | 85.00 |       1 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        105 | Eva         |   20 | 88.00 |       3 |
+------------+-------------+------+-------+---------+
3 rows in set (0.001 sec)

MariaDB [Student_Marks]> select * from Student order by Marks desc;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        103 | Charlie     |   21 | 92.00 |       2 |
|        105 | Eva         |   20 | 88.00 |       3 |
|        101 | Alice       |   20 | 85.00 |       1 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        104 | David       |   23 | 65.00 |       2 |
+------------+-------------+------+-------+---------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> select * from Student order by Marks asc;
+------------+-------------+------+-------+---------+
| Student_ID | StudentName | Age  | Marks | Dept_ID |
+------------+-------------+------+-------+---------+
|        104 | David       |   23 | 65.00 |       2 |
|        102 | Bob         |   22 | 78.00 |       1 |
|        101 | Alice       |   20 | 85.00 |       1 |
|        105 | Eva         |   20 | 88.00 |       3 |
|        103 | Charlie     |   21 | 92.00 |       2 |
+------------+-------------+------+-------+---------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> select AVG(Marks) AS Average_Marks FROM Student;  --Avg
+---------------+
| Average_Marks |
+---------------+
|     81.600000 |
+---------------+
1 row in set (0.001 sec)

MariaDB [Student_Marks]> select SUM(Marks) AS Total FROM Student;  --Sum
+--------+
| Total  |
+--------+
| 408.00 |
+--------+
1 row in set (0.001 sec)

MariaDB [Student_Marks]> select Dept_ID,count(*) as TotalStudent FROM Student group by Dept_ID order by TotalStudent desc; --count
+---------+--------------+
| Dept_ID | TotalStudent |
+---------+--------------+
|       1 |            2 |
|       2 |            2 |
|       3 |            1 |
+---------+--------------+
3 rows in set (0.001 sec)

MariaDB [Student_Marks]> select MIN(Marks) AS Min_Marks,MAX(Marks) AS Max_Marks FROM Student;
+-----------+-----------+
| Min_Marks | Max_Marks |
+-----------+-----------+
|     65.00 |     92.00 |
+-----------+-----------+
1 row in set (0.001 sec)

MariaDB [Student_Marks]>
