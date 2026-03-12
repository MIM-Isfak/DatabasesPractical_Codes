DCSUser@L4074 c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database StudentManagementSystem;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use StudentManagementSystem;
Database changed
MariaDB [StudentManagementSystem]> create table Student(
    -> Student_Id int not null primary key,
    -> Student_Name varchar(50) not null);
Query OK, 0 rows affected (0.090 sec)

MariaDB [StudentManagementSystem]> desc Student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Student_Id   | int(11)     | NO   | PRI | NULL    |       |
| Student_Name | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.096 sec)

MariaDB [StudentManagementSystem]> create table Teacher(
    -> Teacher varchar(20) not null primary key,
    -> Teacher_Email varchar(20) not null);
Query OK, 0 rows affected (0.091 sec)

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Teacher       | varchar(20) | NO   | PRI | NULL    |       |
| Teacher_Email | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> create table Course(
    -> Course_Id int not null primary key,
    -> Course_Name varchar(20) not null,
    -> foreign key(Teacher) references Teacher(Teacher));
ERROR 1072 (42000): Key column 'Teacher' doesn't exist in table
MariaDB [StudentManagementSystem]> alter table Teacher change column Teacher Teacher_name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [StudentManagementSystem]> alter table Teacher change column Teacher Teacher_name varchar(20) not null primary key;
ERROR 1068 (42000): Multiple primary key defined
MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Teacher       | varchar(20) | NO   | PRI | NULL    |       |
| Teacher_Email | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.016 sec)

MariaDB [StudentManagementSystem]> alter table Teacher change column Teacher Teacher_name varchar(20) not null;
Query OK, 0 rows affected (0.154 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Teacher_name  | varchar(20) | NO   | PRI | NULL    |       |
| Teacher_Email | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> create table Course(
    -> Course_Id int not null primary key,
    -> Course_Name varchar(20) not null,
    -> foreign key(Teacher_name) references Teacher(Teacher_name));
ERROR 1072 (42000): Key column 'Teacher_name' doesn't exist in table
MariaDB [StudentManagementSystem]> create table Course(
    -> Course_Id int not null primary key,
    -> Course_Name varchar(20) not null,
    -> foreign key (Teacher_name) references Teacher (Teacher_name));
ERROR 1072 (42000): Key column 'Teacher_name' doesn't exist in table
MariaDB [StudentManagementSystem]> create table Course(
    -> Course_Id int not null primary key,
    -> Course_Name varchar(20) not null,
    -> Teacher_name varchar(20) not null,
    -> foreign key(Teacher_name) references Teacher(Teacher_name));
Query OK, 0 rows affected (0.117 sec)

MariaDB [StudentManagementSystem]> desc Course;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Course_Id    | int(11)     | NO   | PRI | NULL    |       |
| Course_Name  | varchar(20) | NO   |     | NULL    |       |
| Teacher_name | varchar(20) | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> create table Grade(
    -> Student_Id int not null,
    -> Course_Id int not null,
    -> foreign key(Student_Id) references Student(Student_Id),
    -> foreign key(Course_Id) references Student(Course_Id),
    -> Grade varchar(20) not null);
ERROR 1005 (HY000): Can't create table `studentmanagementsystem`.`grade` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [StudentManagementSystem]> create table Grade(
    -> Student_Id int not null,
    -> Course_Id int not null,
    -> foreign key(Student_Id) references Student(Student_Id),
    -> foreign key(Course_Id) references Course(Course_Id),
    -> Grade varchar(20) not null);
Query OK, 0 rows affected (0.253 sec)

MariaDB [StudentManagementSystem]> desc Grade;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Student_Id | int(11)     | NO   | MUL | NULL    |       |
| Course_Id  | int(11)     | NO   | MUL | NULL    |       |
| Grade      | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.010 sec)
    
MariaDB [StudentManagementSystem]> alter table Grade rename Enrollment;
Query OK, 0 rows affected (0.198 sec)

MariaDB [StudentManagementSystem]> desc Enrollment;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Student_Id | int(11)     | NO   | MUL | NULL    |       |
| Course_Id  | int(11)     | NO   | MUL | NULL    |       |
| Grade      | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Teacher_name  | varchar(20) | NO   | PRI | NULL    |       |
| Teacher_Email | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.028 sec)

MariaDB [StudentManagementSystem]> desc Student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Student_Id   | int(11)     | NO   | PRI | NULL    |       |
| Student_Name | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.031 sec)

MariaDB [StudentManagementSystem]> desc Course;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Course_Id    | int(11)     | NO   | PRI | NULL    |       |
| Course_Name  | varchar(20) | NO   |     | NULL    |       |
| Teacher_name | varchar(20) | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)
MariaDB [StudentManagementSystem]> alter table Teacher change column Teacher_name Teacher_id int not null primary key;
ERROR 1068 (42000): Multiple primary key defined
MariaDB [StudentManagementSystem]> show create table course;
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                                                                                |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| course | CREATE TABLE `course` (
  `Course_Id` int(11) NOT NULL,
  `Course_Name` varchar(20) NOT NULL,
  `Teacher_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Course_Id`),
  KEY `Teacher_name` (`Teacher_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Teacher_name`) REFERENCES `teacher` (`Teacher_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.001 sec)

MariaDB [StudentManagementSystem]> alter table Course drop foreign key course_ibfk_1;
Query OK, 0 rows affected (0.110 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> alter table Teacher change Teacher_name Teacher_id int not null auto_increment;
Query OK, 0 rows affected (0.278 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> alter table Course change Teacher_name Teacher_id int not null auto_increment;
Query OK, 0 rows affected (0.368 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> alter table Course add foreign key(Teacher_id) references Teacher(Teacher_id);
Query OK, 0 rows affected (0.343 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Teacher_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Teacher_Email | varchar(20) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
2 rows in set (0.017 sec)

MariaDB [StudentManagementSystem]> alter table Teacher add column Teache_name varchar(20) not null;
Query OK, 0 rows affected (0.048 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Techer;
ERROR 1146 (42S02): Table 'studentmanagementsystem.techer' doesn't exist
MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Teacher_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Teacher_Email | varchar(20) | NO   |     | NULL    |                |
| Teache_name   | varchar(20) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.021 sec)

MariaDB [StudentManagementSystem]> alter table Teacher modify column Teache_name varchar(20) not null first;
Query OK, 0 rows affected (0.088 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Teache_name   | varchar(20) | NO   |     | NULL    |                |
| Teacher_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Teacher_Email | varchar(20) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.015 sec)

MariaDB [StudentManagementSystem]> alter table Teacher modify column Teache_name varchar(20) not null after Teacher_id;
Query OK, 0 rows affected (0.095 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Teacher_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Teache_name   | varchar(20) | NO   |     | NULL    |                |
| Teacher_Email | varchar(20) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> desc Student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Student_Id   | int(11)     | NO   | PRI | NULL    |       |
| Student_Name | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.032 sec)

MariaDB [StudentManagementSystem]> desc Course;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| Course_Id   | int(11)     | NO   | PRI | NULL    |                |
| Course_Name | varchar(20) | NO   |     | NULL    |                |
| Teacher_id  | int(11)     | NO   | MUL | NULL    | auto_increment |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> desc Enrollment;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Student_Id | int(11)     | NO   | MUL | NULL    |       |
| Course_Id  | int(11)     | NO   | MUL | NULL    |       |
| Grade      | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.012 sec)

MariaDB [StudentManagementSystem]> insert into Student values
    -> (100,"Jhon"),
    -> (200,"Jane"),
    -> (300,"Ron"),
    -> (400,"Paul");
Query OK, 4 rows affected (0.053 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> select * from Student;
+------------+--------------+
| Student_Id | Student_Name |
+------------+--------------+
|        100 | Jhon         |
|        200 | Jane         |
|        300 | Ron          |
|        400 | Paul         |
+------------+--------------+
4 rows in set (0.000 sec)

MariaDB [StudentManagementSystem]> insert into Course values
    -> (\c
MariaDB [StudentManagementSystem]> insert into Teacher values
    -> (\c
MariaDB [StudentManagementSystem]> insert into Teacher (Teacher_name,Teacher_Email) values
    -> ("Roger","Roger@teacher123.edu"),
    -> ("Rafa","Rafa@teacher123.edu");
ERROR 1054 (42S22): Unknown column 'Teacher_name' in 'field list'
MariaDB [StudentManagementSystem]> alter table Teacher modify column Teacher_Name varchar(20) not null after Teacher_id;
ERROR 1054 (42S22): Unknown column 'Teacher_Name' in 'teacher'
MariaDB [StudentManagementSystem]> alter table Teacher modify column Teache_Name Teacher_name varchar(20) not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'varchar(20) not null' at line 1
MariaDB [StudentManagementSystem]> alter table Teacher change column Teache_Name Teacher_name varchar(20) not null;
Query OK, 0 rows affected (0.099 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> desc Teacher;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Teacher_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Teacher_name  | varchar(20) | NO   |     | NULL    |                |
| Teacher_Email | varchar(20) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.014 sec)

MariaDB [StudentManagementSystem]> insert into Teacher (Teacher_name,Teacher_Email) values
    -> ("Roger","Roger@teacher123.edu"),
    -> ("Rafa","Rafa@teacher123.edu");
Query OK, 2 rows affected (0.038 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> select*from Teacher;
+------------+--------------+----------------------+
| Teacher_id | Teacher_name | Teacher_Email        |
+------------+--------------+----------------------+
|          1 | Roger        | Roger@teacher123.edu |
|          2 | Rafa         | Rafa@teacher123.edu  |
+------------+--------------+----------------------+
2 rows in set (0.001 sec)

MariaDB [StudentManagementSystem]> insert into Course (Course_Id,Course_name,Teacher_id) values;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [StudentManagementSystem]> insert into Course (Course_Id,Course_name,Teacher_id) values
    -> (10,"SQL","Roger"),
    -> (20,"Python","Rafa");
Query OK, 2 rows affected, 2 warnings (0.048 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [StudentManagementSystem]> select*from Course;
+-----------+-------------+------------+
| Course_Id | Course_Name | Teacher_id |
+-----------+-------------+------------+
|        10 | SQL         |          1 |
|        20 | Python      |          2 |
+-----------+-------------+------------+
2 rows in set (0.000 sec)

MariaDB [StudentManagementSystem]> insert into Enrollment (Student_Id,Course_Id,Grade) values;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [StudentManagementSystem]> insert into Enrollment (Student_Id,Course_Id,Grade) values
    -> (100,10,"A"),
    -> (200,10,"B"),
    -> (100,20,"A"),
    -> (200,20,"A"),
    -> (300,10,"C"),
    -> (400,10,"C"),
    -> (400,20,"C");
Query OK, 7 rows affected (0.043 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [StudentManagementSystem]> select*from Enrollment;
+------------+-----------+-------+
| Student_Id | Course_Id | Grade |
+------------+-----------+-------+
|        100 |        10 | A     |
|        200 |        10 | B     |
|        100 |        20 | A     |
|        200 |        20 | A     |
|        300 |        10 | C     |
|        400 |        10 | C     |
|        400 |        20 | C     |
+------------+-----------+-------+
7 rows in set (0.000 sec)

MariaDB [StudentManagementSystem]> create datbase CustomerOrderSystem;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'datbase CustomerOrderSystem' at line 1
MariaDB [StudentManagementSystem]> create database CustomerOrderSystem;
Query OK, 1 row affected (0.002 sec)

MariaDB [StudentManagementSystem]> use CustomerOrderSystem;
Database changed
MariaDB [CustomerOrderSystem]> cretae table Order(
    -> order_Id int not null primary key,
    -> Customer_Name varchar(20) not null,
    -> Customer_City varchar(20) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'cretae table Order(
order_Id int not null primary key,
Customer_Name varchar...' at line 1
MariaDB [CustomerOrderSystem]> create table Order(
    -> order_Id int not null primary key,
    -> Customer_Name varchar(20) not null,
    -> Customer_City varchar(20) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Order(
order_Id int not null primary key,
Customer_Name varchar(20) not null...' at line 1
MariaDB [CustomerOrderSystem]> create table Order(
    -> order_Id int not null primary key,
    -> Customer_Name varchar(20) not null,
    -> Customer_City varchar(20) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Order(
order_Id int not null primary key,
Customer_Name varchar(20) not null...' at line 1
MariaDB [CustomerOrderSystem]> create table Order(
    -> order_Id int not null primary key,
    -> Customer_Name varchar(20) not null,
    -> Customer_City varchar(20));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Order(
order_Id int not null primary key,
Customer_Name varchar(20) not null,...' at line 1
MariaDB [CustomerOrderSystem]> create table Orders(
    -> order_Id int not null primary key,
    -> Customer_Name varchar(20) not null,
    -> Customer_City varchar(20) not null);
Query OK, 0 rows affected (0.091 sec)

MariaDB [CustomerOrderSystem]> desc orders;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| order_Id      | int(11)     | NO   | PRI | NULL    |       |
| Customer_Name | varchar(20) | NO   |     | NULL    |       |
| Customer_City | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.017 sec)

MariaDB [CustomerOrderSystem]> create table Suppliers
    -> (Supplier_Id varchar(20) not null primary key,
    -> Supplier_Phone int not null,
    -> Supplier_Name varcjar(20) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(20) not null)' at line 4
MariaDB [CustomerOrderSystem]> create table Suppliers(
    -> Supplier_Id varchar(20) not null primary key,
    -> Supplier_Name varchar(20) not null,
    -> Supplier_Phone int not null);
Query OK, 0 rows affected (0.102 sec)

MariaDB [CustomerOrderSystem]> desc Suppliers;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Supplier_Id    | varchar(20) | NO   | PRI | NULL    |       |
| Supplier_Name  | varchar(20) | NO   |     | NULL    |       |
| Supplier_Phone | int(11)     | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.013 sec)

MariaDB [CustomerOrderSystem]> create table Products(
    -> Product_Id varchar\c
MariaDB [CustomerOrderSystem]> alter table Suppliers change Supplier_Id Supplier_Id int not null auto_increment;
Query OK, 0 rows affected (0.293 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CustomerOrderSystem]> desc Suppliers;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| Supplier_Id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Supplier_Name  | varchar(20) | NO   |     | NULL    |                |
| Supplier_Phone | int(11)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
3 rows in set (0.025 sec)

MariaDB [CustomerOrderSystem]> create table Products(
    -> Product_Id varchar(20) not null primary key,
    -> Product_Name varchar(20) not null,
    -> Supplier_Id int not null,
    -> foreign key(Supplier_Id) references Suppliers(Supplier_Id));
Query OK, 0 rows affected (0.110 sec)

MariaDB [CustomerOrderSystem]> desc Products;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Product_Id   | varchar(20) | NO   | PRI | NULL    |       |
| Product_Name | varchar(20) | NO   |     | NULL    |       |
| Supplier_Id  | int(11)     | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.011 sec)

MariaDB [CustomerOrderSystem]> create table Order_Details(
    -> order_Id int not null primary key,
    -> Product_Id varchar(20) not null primary key;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 3
MariaDB [CustomerOrderSystem]> create table Order_Details(
    -> order_Id int not null primary key,
    -> Product_Id varchar(20) not null primary key;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 3
MariaDB [CustomerOrderSystem]> create table Order_Details(
    -> order_Id int not null primary key,
    -> Product_Id varchar(20) not null primary key,
    -> foreign key(order_Id) Orders(order_Id),
    -> foreign key(Product_Id) Orders(order_Id),\c
MariaDB [CustomerOrderSystem]> create table Order_Details(
    -> order_Id int not null primary key,
    -> Product_Id varchar(20) not null primary key,
    -> foreign key(order_Id) references Orders(order_Id),
    -> foreign key(Product_Id) references Products(Product_Id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 5
MariaDB [CustomerOrderSystem]> create table Order_Details(
    -> order_Id int not null primary key,
    -> Product_Id varchar(20) not null primary key,
    -> foreign key(order_Id) references Orders(order_Id),
    -> foreign key(Product_Id) references Products(Product_Id));
ERROR 1068 (42000): Multiple primary key defined
MariaDB [CustomerOrderSystem]>
