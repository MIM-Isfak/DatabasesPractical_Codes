
Setting environment for using XAMPP for Windows.
DCSUser@L4097 c:\xampp
# mysql -u root -h local host
ERROR 2005 (HY000): Unknown MySQL server host 'local' (11001)

DCSUser@L4097 c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| 26_02_2026         |
| exams              |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| pscompany          |
| sample             |
| test               |
| world              |
+--------------------+
10 rows in set (0.077 sec)

MariaDB [(none)]> create database DetailofPerson;
Query OK, 1 row affected (0.008 sec)

MariaDB [(none)]> use DetailofPerson;
Database changed
MariaDB [DetailofPerson]> create table Person
    -> (p_id varchar(20) not null primary key,
    -> name varchar(20) not null,
    -> Address varchar(50) not null,
    -> Email varchar(50) not null,
    -> Age int not null);
Query OK, 0 rows affected (0.096 sec)

MariaDB [DetailofPerson]> desc Person;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| p_id    | varchar(20) | NO   | PRI | NULL    |       |
| name    | varchar(20) | NO   |     | NULL    |       |
| Address | varchar(50) | NO   |     | NULL    |       |
| Email   | varchar(50) | NO   |     | NULL    |       |
| Age     | int(11)     | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.014 sec)

MariaDB [DetailofPerson]> alter table Person change column name Name varchar(20) not null;
Query OK, 0 rows affected (0.027 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> desc Person;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| p_id    | varchar(20) | NO   | PRI | NULL    |       |
| Name    | varchar(20) | NO   |     | NULL    |       |
| Address | varchar(50) | NO   |     | NULL    |       |
| Email   | varchar(50) | NO   |     | NULL    |       |
| Age     | int(11)     | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.027 sec)

MariaDB [DetailofPerson]> insert into Person values
    -> ("P001","Faisan","Kalpitiya_Puttalam",faisan@gmail.com,30),
    -> ("P001","Faisan","Kalpitiya_Puttalam",faisan@gmail.com,25),/c
    -> /c
    -> \c
MariaDB [DetailofPerson]> alter table Person change p_id P_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [DetailofPerson]> alter table Person change column p_id P_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [DetailofPerson]> alter table Person change column p_id P_id varchar(20) not null;
Query OK, 0 rows affected (0.046 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> desc Person;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| P_id    | varchar(20) | NO   | PRI | NULL    |       |
| Name    | varchar(20) | NO   |     | NULL    |       |
| Address | varchar(50) | NO   |     | NULL    |       |
| Email   | varchar(50) | NO   |     | NULL    |       |
| Age     | int(11)     | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.017 sec)

MariaDB [DetailofPerson]> insert into Person (P_id,Name,Address,Email,Age) values
    -> ("P001","Faisan","Kalpitiya","faisan@gmail.com",30),
    -> ("P002","Althaf","Katankudy","althaf@gmail.com",25),
    -> ("P003","Nirus","Maruthamunai","nirus@gmail.com",32),
    -> ("P004","Rikas","Valaichenai","rikas@gmail.com",20),
    -> ("P005","Pratheep","Jaffna","pratheep@gmail.com",30);
Query OK, 5 rows affected (0.180 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> select * from Person;
+------+----------+--------------+--------------------+-----+
| P_id | Name     | Address      | Email              | Age |
+------+----------+--------------+--------------------+-----+
| P001 | Faisan   | Kalpitiya    | faisan@gmail.com   |  30 |
| P002 | Althaf   | Katankudy    | althaf@gmail.com   |  25 |
| P003 | Nirus    | Maruthamunai | nirus@gmail.com    |  32 |
| P004 | Rikas    | Valaichenai  | rikas@gmail.com    |  20 |
| P005 | Pratheep | Jaffna       | pratheep@gmail.com |  30 |
+------+----------+--------------+--------------------+-----+
5 rows in set (0.000 sec)

MariaDB [DetailofPerson]> cretae table Student
    -> (Roll_no int not null primary key,
    -> \c
MariaDB [DetailofPerson]> cretae table Student
    -> cretae table Student\c
MariaDB [DetailofPerson]> create table Student
    -> (Roll_no int not null auto_increment primary key,
    -> City varchar(20) NOT NULL,
    -> Street_no varchar(20) not null,
    -> House_no varchar(20) not null);
Query OK, 0 rows affected (0.124 sec)

MariaDB [DetailofPerson]> alter table Student add column F_name varchar(20) not null after Roll_no;
Query OK, 0 rows affected (0.102 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> alter table Student add column L_name varchar(20) not null after F_name;
Query OK, 0 rows affected (0.062 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> desc Student;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| Roll_no   | int(11)     | NO   | PRI | NULL    | auto_increment |
| F_name    | varchar(20) | NO   |     | NULL    |                |
| L_name    | varchar(20) | NO   |     | NULL    |                |
| City      | varchar(20) | NO   |     | NULL    |                |
| Street_no | varchar(20) | NO   |     | NULL    |                |
| House_no  | varchar(20) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
6 rows in set (0.017 sec)

MariaDB [DetailofPerson]> https://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractical_Codes/blob/main/practical%20day3.sqlhttps://github.com/MIM-Isfak/DatabasesPractic\c
MariaDB [DetailofPerson]> inser into Student (Rool_no,F_name,L_name,City,Street_no,House_no) values
    -> \c
MariaDB [DetailofPerson]> inser into Student (Roll_no,F_name,L_name,City,Street_no,House_no) values
    -> \c
MariaDB [DetailofPerson]> inser into Student (F_name,L_name,City,Street_no,House_no) values
    -> ("Leo","Messi","Argentina","A_10","157_main"),
    -> ("Cristiano","Ronaldo","Portugal","CR_7","saint_luis"),
    -> ("Poul","Drogba","Costarica","Dr_7","drg_lane"),
    -> (\c
MariaDB [DetailofPerson]> inser into Student (F_name,L_name,City,Street_no,House_no) values
    -> ("Poulo","Maldini","Italy","Maldini_3","floranciya_lane"),
    -> ("Alexandro","Nesta","Italy","Nesta_13","floranciya_lane"),
    -> ("Leo","Messi","Argentina","A_10","157_main"),
    -> ("Cristiano","Ronaldo","Portugal","CR_7","saint_luis"),
    -> ("Poul","Drogba","Costarica","Dr_7","drg_lane");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'inser into Student (F_name,L_name,City,Street_no,House_no) values
("Poulo","M...' at line 1
MariaDB [DetailofPerson]> insert into Student (F_name,L_name,City,Street_no,House_no) values
    -> ("Poulo","Maldini","Italy","Maldini_3","floranciya_lane"),
    -> ("Alexandro","Nesta","Italy","Nesta_13","floranciya_lane"),
    -> ("Leo","Messi","Argentina","A_10","157_main"),
    -> ("Cristiano","Ronaldo","Portugal","CR_7","saint_luis"),
    -> ("Poul","Drogba","Costarica","Dr_7","drg_lane");
Query OK, 5 rows affected (0.046 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [DetailofPerson]> select * from Student;
+---------+-----------+---------+-----------+-----------+-----------------+
| Roll_no | F_name    | L_name  | City      | Street_no | House_no        |
+---------+-----------+---------+-----------+-----------+-----------------+
|       1 | Poulo     | Maldini | Italy     | Maldini_3 | floranciya_lane |
|       2 | Alexandro | Nesta   | Italy     | Nesta_13  | floranciya_lane |
|       3 | Leo       | Messi   | Argentina | A_10      | 157_main        |
|       4 | Cristiano | Ronaldo | Portugal  | CR_7      | saint_luis      |
|       5 | Poul      | Drogba  | Costarica | Dr_7      | drg_lane        |
+---------+-----------+---------+-----------+-----------+-----------------+
5 rows in set (0.000 sec)

MariaDB [DetailofPerson]> create table Customer
    -> (Roll_no int not null primary key,
    -> name varchar(20) not null,
    -> age int not null);
Query OK, 0 rows affected (0.087 sec)

MariaDB [DetailofPerson]> desc Customer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Roll_no | int(11)     | NO   | PRI | NULL    |       |
| name    | varchar(20) | NO   |     | NULL    |       |
| age     | int(11)     | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

MariaDB [DetailofPerson]> create table Customer_number
    -> (Roll_no int not null,
    -> Mobile_no int not null,
    -> foreign key (Roll_no) references Customer(Roll_no));
Query OK, 0 rows affected (0.282 sec)

MariaDB [DetailofPerson]> desc Customer_number;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| Roll_no   | int(11) | NO   | MUL | NULL    |       |
| Mobile_no | int(11) | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
2 rows in set (0.017 sec)

MariaDB [DetailofPerson]> create database ER_diagram;
Query OK, 1 row affected (0.001 sec)

MariaDB [DetailofPerson]> use ER_diagram;
Database changed
MariaDB [ER_diagram]> create table Employee
    -> (E
    -> \c
MariaDB [ER_diagram]> create table Employee
    -> (Emp_no int not null pimary key,
    -> Emp_name varchar(20) not null,
    -> Salary int not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'key,
Emp_name varchar(20) not null,
Salary int not null)' at line 2
MariaDB [ER_diagram]> create table Employee
    -> (Emp_no int not null primary key,
    -> Emp_name varchar(20) not null,
    -> Salary int not null);
Query OK, 0 rows affected (0.445 sec)

MariaDB [ER_diagram]> desc Employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Emp_no   | int(11)     | NO   | PRI | NULL    |       |
| Emp_name | varchar(20) | NO   |     | NULL    |       |
| Salary   | int(11)     | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

MariaDB [ER_diagram]> create table Department
    -> (Depat_id int not null primary key,
    -> Dep_name varchar(20) not null,
    -> \c
MariaDB [ER_diagram]> create table Department
    -> (Depat_id int not null primary key,
    -> Depat_name varchar(20) not null);
Query OK, 0 rows affected (5.515 sec)

MariaDB [ER_diagram]> desc Department;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Depat_id   | int(11)     | NO   | PRI | NULL    |       |
| Depat_name | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.013 sec)

MariaDB [ER_diagram]> create table Works_on
    -> (Emp_no int not null,
    -> Depat_id int not null,
    -> foreign key (Emp_no) references Employee (Emp_no),
    -> foreign key (Depat_id) references Department (Depat_id));
Query OK, 0 rows affected (0.257 sec)

MariaDB [ER_diagram]> desc Works_on;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| Emp_no   | int(11) | NO   | MUL | NULL    |       |
| Depat_id | int(11) | NO   | MUL | NULL    |       |
+----------+---------+------+-----+---------+-------+
2 rows in set (0.014 sec)

MariaDB [ER_diagram]> alter table Works_on add column Since year not null;
Query OK, 0 rows affected (0.078 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ER_diagram]> desc Works_on;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| Emp_no   | int(11) | NO   | MUL | NULL    |       |
| Depat_id | int(11) | NO   | MUL | NULL    |       |
| Since    | year(4) | NO   |     | NULL    |       |
+----------+---------+------+-----+---------+-------+
3 rows in set (0.024 sec)

MariaDB [ER_diagram]> insert into Employee (Emp_no,Emp_name,Salary
    -> desc Works_on;\c
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'desc Works_on' at line 2
MariaDB [ER_diagram]> insert into Employee (Emp_no,Emp_name,Salary)
    -> values
    -> (1001,"Isfak",25000),
    -> (1002,"Faisan",25000),
    -> (1003,"Nirus",30000),
    -> (1004,"Nirus",30000),
    -> 1
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '1' at line 7
MariaDB [ER_diagram]> insert into Employee (Emp_no,Emp_name,Salary)
    -> values
    -> (1001,"Isfak",25000),
    -> (1002,"Faisan",25000),
    -> (1003,"Nirus",30000),
    -> (1004,"Nirus",30000),
    -> (1005,"pratheep",35000);
Query OK, 5 rows affected (0.082 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ER_diagram]> update Employee set Emp_name = "Rikas" where Emp_no = 1004;
Query OK, 1 row affected (0.075 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [ER_diagram]> select * from Employee;
+--------+----------+--------+
| Emp_no | Emp_name | Salary |
+--------+----------+--------+
|   1001 | Isfak    |  25000 |
|   1002 | Faisan   |  25000 |
|   1003 | Nirus    |  30000 |
|   1004 | Rikas    |  30000 |
|   1005 | pratheep |  35000 |
+--------+----------+--------+
5 rows in set (0.000 sec)

MariaDB [ER_diagram]> insert into Department(Depat_id,Depat_name)
    -> values
    -> (2001,"Computer_Science"),
    -> (2002,"Mathematics"),
    -> (2003,"Physics"),
    -> (2004,"Chemistry"),
    -> (2005,"Botany");
Query OK, 5 rows affected (0.057 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ER_diagram]> select * from department;
+----------+------------------+
| Depat_id | Depat_name       |
+----------+------------------+
|     2001 | Computer_Science |
|     2002 | Mathematics      |
|     2003 | Physics          |
|     2004 | Chemistry        |
|     2005 | Botany           |
+----------+------------------+
5 rows in set (0.000 sec)

MariaDB [ER_diagram]> insert into Work_on(Emp_no,Depat_id,Since) values
    -> (1001,2001,1998),
    -> (1002,2002,1997),
    -> (1003,2003,1965);
ERROR 1146 (42S02): Table 'er_diagram.work_on' doesn't exist
 ariaDB [ER_diagram]> insert into Works_on(Emp_no,Depat_id,Since) values
    -> (1001,2001,1998),
    -> (1002,2002,1997),
    -> (1003,2003,1965);
Query OK, 3 rows affected (0.046 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [ER_diagram]> select * from works_on;
+--------+----------+-------+
| Emp_no | Depat_id | Since |
+--------+----------+-------+
|   1001 |     2001 |  1998 |
|   1002 |     2002 |  1997 |
|   1003 |     2003 |  1965 |
+--------+----------+-------+
3 rows in set (0.000 sec)

MariaDB [ER_diagram]> create
    -> \c
MariaDB [ER_diagram]> create database Exercise_
    -> 2026-03-05;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '2026-03-05' at line 2
MariaDB [ER_diagram]> create database Exercise_2026_03_05;
Query OK, 1 row affected (0.002 sec)

MariaDB [ER_diagram]> use  Exercise_2026_03_05;
Database changed
MariaDB [Exercise_2026_03_05]> create table Car
    -> (Car_id varchar(20) not null primary key,
    -> Serial_no int not null,
    -> \c
MariaDB [Exercise_2026_03_05]> create table Customer(
    -> Cus_id varchar(20) not null primary key,
    -> Name varchar(20) not null,
    -> Phone_no int not null,
    -> Address varchar(20) not null,
    -> Country varchar(20) not null,
    -> City varchar(20) not null);
Query OK, 0 rows affected (0.080 sec)

MariaDB [Exercise_2026_03_05]> desc Customer;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Cus_id   | varchar(20) | NO   | PRI | NULL    |       |
| Name     | varchar(20) | NO   |     | NULL    |       |
| Phone_no | int(11)     | NO   |     | NULL    |       |
| Address  | varchar(20) | NO   |     | NULL    |       |
| Country  | varchar(20) | NO   |     | NULL    |       |
| City     | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
6 rows in set (0.014 sec)

MariaDB [Exercise_2026_03_05]> create table Employee(
    -> Emp_id varchar(20) not null primary key,
    -> Emp_name varchar(30) not null,
    -> Address varchar(20) not null);
Query OK, 0 rows affected (0.129 sec)

MariaDB [Exercise_2026_03_05]> desc Employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Emp_id   | varchar(20) | NO   | PRI | NULL    |       |
| Emp_name | varchar(30) | NO   |     | NULL    |       |
| Address  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.024 sec)

MariaDB [Exercise_2026_03_05]> create table Employee_qualification(
    -> foreign key(Emp_id) references Employee(Emp_id),
    -> Qualification varchar(20) not null);
ERROR 1072 (42000): Key column 'Emp_id' doesn't exist in table
MariaDB [Exercise_2026_03_05]> create table Employee_qualification(
    -> Emp_id int not nill,
    -> \c
MariaDB [Exercise_2026_03_05]> create table Employee_qualification(
    -> Emp_id int not null,
    -> Qualification varchar(20) not null,
    -> foreign key(Emp_id) references Employee(Emp_id));
ERROR 1005 (HY000): Can't create table `exercise_2026_03_05`.`employee_qualification` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [Exercise_2026_03_05]> create table Employee_qualification(
    -> Emp_id varchar(20) not null,
    -> Qualification varchar(20) not null,
    -> foreign key(Emp_id) references Employee(Emp_id));
Query OK, 0 rows affected (0.119 sec)

MariaDB [Exercise_2026_03_05]> desc  Employee_qualification;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Emp_id        | varchar(20) | NO   | MUL | NULL    |       |
| Qualification | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.015 sec)

MariaDB [Exercise_2026_03_05]> create table Car(
    -> Car_id varchar(20) not null primary key,
    -> Seriol_no int not null,
    -> Model_no varchar(20) not null,
    -> Color varchar(20) not null,
    -> Year int(4) not null,
    -> foreign key(Cus_id) references Customer(Cus_id),
    -> foreign key(Emp_id) references Employee(Emp_id),
    -> Cus_id varchar(20) not null,
    -> Emp_id varchar(20) not null);
Query OK, 0 rows affected (0.213 sec)

MariaDB [Exercise_2026_03_05]> desc Car;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Car_id    | varchar(20) | NO   | PRI | NULL    |       |
| Seriol_no | int(11)     | NO   |     | NULL    |       |
| Model_no  | varchar(20) | NO   |     | NULL    |       |
| Color     | varchar(20) | NO   |     | NULL    |       |
| Year      | int(4)      | NO   |     | NULL    |       |
| Cus_id    | varchar(20) | NO   | MUL | NULL    |       |
| Emp_id    | varchar(20) | NO   | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.029 sec)

MariaDB [Exercise_2026_03_05]> Create table Employee(
    -> Invoice_no varchar(20) not null primary key\c
MariaDB [Exercise_2026_03_05]> Create table Invoice(
    -> Invoice_no varchar(20) not null primary key,
    -> Date date not null,
    -> foreign key(Cus_id) references Customer(Cus_id),
    -> foreign key(Emp_id) references Employee(Emp_id),
    -> Cus_id varchar(20) not null,
    -> Emp_id varchar(20) not null);
Query OK, 0 rows affected (0.145 sec)

MariaDB [Exercise_2026_03_05]> desc Invoice;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Invoice_no | varchar(20) | NO   | PRI | NULL    |       |
| Date       | date        | NO   |     | NULL    |       |
| Cus_id     | varchar(20) | NO   | MUL | NULL    |       |
| Emp_id     | varchar(20) | NO   | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.012 sec)

MariaDB [Exercise_2026_03_05]>
