
Setting environment for using XAMPP for Windows.
DCSUser@L4097 c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
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
10 rows in set (0.035 sec)

MariaDB [(none)]> use 26_02_2026;
Database changed
MariaDB [26_02_2026]> select * drom Department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'drom Department' at line 1
MariaDB [26_02_2026]> select * from Department;
+---------+-----------+
| Dept_id | Dept_name |
+---------+-----------+
|      10 | HR        |
|      20 | IT        |
|      30 | Sales     |
+---------+-----------+
3 rows in set (0.001 sec)

MariaDB [26_02_2026]> select * from Employee;
+--------+----------+---------+
| Emp_id | Emp_name | Dept_id |
+--------+----------+---------+
|      1 | Arun     |      10 |
|      2 | Meena    |      20 |
|      3 | Ravi     |      10 |
+--------+----------+---------+
3 rows in set (0.000 sec)

MariaDB [26_02_2026]> insert into Employee (Emp_name,Dept_id) values
    -> ('Sita', NULL);
Query OK, 1 row affected (0.194 sec)

MariaDB [26_02_2026]> select * from Employee;
+--------+----------+---------+
| Emp_id | Emp_name | Dept_id |
+--------+----------+---------+
|      1 | Arun     |      10 |
|      2 | Meena    |      20 |
|      3 | Ravi     |      10 |
|      4 | Sita     |    NULL |
+--------+----------+---------+
4 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Employee.Emp_name, Department.Dept_name from Employee inner join Department on Employee.Dept_id = Department.Dept_id;
+----------+-----------+
| Emp_name | Dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Ravi     | HR        |
+----------+-----------+
3 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Employee.Emp_name, Department.Dept_name from Employee left join Department on Employee.Dept_id = Department.Dept_id;
+----------+-----------+
| Emp_name | Dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Ravi     | HR        |
| Sita     | NULL      |
+----------+-----------+
4 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Employee.Emp_name, Department.Dept_name from Employee right join Department on Employee.Dept_id = Department.Dept_id;
+----------+-----------+
| Emp_name | Dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Ravi     | HR        |
| NULL     | Sales     |
+----------+-----------+
4 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Employee.Emp_name, Department.Dept_name from Employee right cross Department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'cross Department' at line 1
MariaDB [26_02_2026]> select Employee.Emp_name, Department.Dept_name from Employee cross join Department;
+----------+-----------+
| Emp_name | Dept_name |
+----------+-----------+
| Arun     | HR        |
| Arun     | IT        |
| Arun     | Sales     |
| Meena    | HR        |
| Meena    | IT        |
| Meena    | Sales     |
| Ravi     | HR        |
| Ravi     | IT        |
| Ravi     | Sales     |
| Sita     | HR        |
| Sita     | IT        |
| Sita     | Sales     |
+----------+-----------+
12 rows in set (0.001 sec)

MariaDB [26_02_2026]> create table Student
    -> (student_id int not null auto_increment primary key,
    -> student_name varchar(20) not null,
    -> city varchar(20) not null);
Query OK, 0 rows affected (0.315 sec)

MariaDB [26_02_2026]> desc Student;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| student_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
| student_name | varchar(20) | NO   |     | NULL    |                |
| city         | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
3 rows in set (0.242 sec)

MariaDB [26_02_2026]> create table Course
    -> (course_id int not null primary key,
    -> course_name varchar(20) not null,
    -> fee int not null);
Query OK, 0 rows affected (0.165 sec)

MariaDB [26_02_2026]> desc Course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | int(11)     | NO   | PRI | NULL    |       |
| course_name | varchar(20) | NO   |     | NULL    |       |
| fee         | int(11)     | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.051 sec)

MariaDB [26_02_2026]> create table Enrolment
    -> (enroll_id int not null auto_increment primary key,
    -> student_id int not null,
    -> course_id int not null,
    -> foreign key(student_id) references Student(student_id),
    -> foreign key(course_id) references Course(course_id));
Query OK, 0 rows affected (0.550 sec)

MariaDB [26_02_2026]> desc Enrolment;
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| enroll_id  | int(11) | NO   | PRI | NULL    | auto_increment |
| student_id | int(11) | NO   | MUL | NULL    |                |
| course_id  | int(11) | NO   | MUL | NULL    |                |
+------------+---------+------+-----+---------+----------------+
3 rows in set (0.324 sec)

MariaDB [26_02_2026]> insert into Student (student_name,city) values
    -> ('Rahul','Delhi'),
    -> ('Anita','Mumbai'),
    -> ('John','Pune'),
    -> ('Sara','Delhi');
Query OK, 4 rows affected (0.148 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [26_02_2026]> select * from Student;
+------------+--------------+--------+
| student_id | student_name | city   |
+------------+--------------+--------+
|          1 | Rahul        | Delhi  |
|          2 | Anita        | Mumbai |
|          3 | John         | Pune   |
|          4 | Sara         | Delhi  |
+------------+--------------+--------+
4 rows in set (0.001 sec)

MariaDB [26_02_2026]> insert into Course (course_id,course_name,fee) values
    -> (101,'Math',3000),
    -> (102,'Science',3500),
    -> (103,'English',2500),
    -> (104,'Computer',4000);
Query OK, 4 rows affected (0.074 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [26_02_2026]> select * from Course;
+-----------+-------------+------+
| course_id | course_name | fee  |
+-----------+-------------+------+
|       101 | Math        | 3000 |
|       102 | Science     | 3500 |
|       103 | English     | 2500 |
|       104 | Computer    | 4000 |
+-----------+-------------+------+
4 rows in set (0.000 sec)

MariaDB [26_02_2026]> insert into Enrolment (enroll_id,student_id,course_id) values
    -> (1,101),
    -> (1,104),
    -> (2,102),
    -> (3,101),
    -> (3,103);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [26_02_2026]> insert into Enrolment (student_id,course_id) values
    -> (1,101),
    -> (1,104),
    -> (2,102),
    -> (3,101),
    -> (3,103);
Query OK, 5 rows affected (0.042 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [26_02_2026]> select * from Enrolment;
+-----------+------------+-----------+
| enroll_id | student_id | course_id |
+-----------+------------+-----------+
|         1 |          1 |       101 |
|         2 |          1 |       104 |
|         3 |          2 |       102 |
|         4 |          3 |       101 |
|         5 |          3 |       103 |
+-----------+------------+-----------+
5 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Student.student_id,Student.student_name,Course.course_name from Student inner join Enrollment on Student.student_id = Enrollment.student_id inner join Course on Enrollment.course_id = Course.course_id;
ERROR 1146 (42S02): Table '26_02_2026.enrollment' doesn't exist
MariaDB [26_02_2026]> select Student.student_id,Student.student_name,Course.course_name from Student inner join Enrolment on Student.student_id = Enrolment.student_id inner join Course on Enrolment.course_id = Course.course_id;
+------------+--------------+-------------+
| student_id | student_name | course_name |
+------------+--------------+-------------+
|          1 | Rahul        | Math        |
|          1 | Rahul        | Computer    |
|          2 | Anita        | Science     |
|          3 | John         | Math        |
|          3 | John         | English     |
+------------+--------------+-------------+
5 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Student.student_name,Course.course_name from Student inner join Enrolment on Student.student_id = Enrolment.student_id inner join Course on Enrolment.course_id = Course.course_id;
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | Math        |
| Rahul        | Computer    |
| Anita        | Science     |
| John         | Math        |
| John         | English     |
+--------------+-------------+
5 rows in set (0.002 sec)

MariaDB [26_02_2026]> select Student.student_name,Course.course_name from Student inner join Enrolment on Student.student_id = Enrolment.student_id inner join Course on Enrolment.course_id = Course.course_id where Student.city = "Delhi";
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | Math        |
| Rahul        | Computer    |
+--------------+-------------+
2 rows in set (0.009 sec)

MariaDB [26_02_2026]> select Course.course_name,Student.student_name from Course left join Enrolment on Course.course_id = Enrolment.course_id left join Student on Enrolment.student_id = Student.student_id;
+-------------+--------------+
| course_name | student_name |
+-------------+--------------+
| Math        | Rahul        |
| Computer    | Rahul        |
| Science     | Anita        |
| Math        | John         |
| English     | John         |
+-------------+--------------+
5 rows in set (0.002 sec)

MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]> MariaDB [26_02_2026]> create table Student
    ->     -> (student_id int not null auto_increment primary key,
    ->     -> student_name varchar(20) not null,
    ->     -> city varchar(20) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'MariaDB [26_02_2026]> create table Student
    -> (student_id int not null au...' at line 1
MariaDB [26_02_2026]> Query OK, 0 rows affected (0.315 sec)
    ->
    -> MariaDB [26_02_2026]> desc Student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 0 rows affected (0.315 sec)

MariaDB [26_02_2026]> desc Student' at line 1
MariaDB [26_02_2026]> +--------------+-------------+------+-----+---------+----------------+
    -> | Field        | Type        | Null | Key | Default | Extra          |
    -> +--------------+-------------+------+-----+---------+----------------+
    -> | student_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
    -> | student_name | varchar(20) | NO   |     | NULL    |                |
    -> | city         | varchar(20) | NO   |     | NULL    |                |
    -> +--------------+-------------+------+-----+---------+----------------+
    -> 3 rows in set (0.242 sec)
    ->
    -> MariaDB [26_02_2026]> create table Course
    ->     -> (course_id int not null primary key,
    ->     -> course_name varchar(20) not null,
    ->     -> fee int not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '+--------------+-------------+------+-----+---------+----------------+
| Fiel...' at line 1
MariaDB [26_02_2026]> Query OK, 0 rows affected (0.165 sec)
    ->
    -> MariaDB [26_02_2026]> desc Course;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 0 rows affected (0.165 sec)

MariaDB [26_02_2026]> desc Course' at line 1
MariaDB [26_02_2026]> +-------------+-------------+------+-----+---------+-------+
    -> | Field       | Type        | Null | Key | Default | Extra |
    -> +-------------+-------------+------+-----+---------+-------+
    -> | course_id   | int(11)     | NO   | PRI | NULL    |       |
    -> | course_name | varchar(20) | NO   |     | NULL    |       |
    -> | fee         | int(11)     | NO   |     | NULL    |       |
    -> +-------------+-------------+------+-----+---------+-------+
    -> 3 rows in set (0.051 sec)
    ->
    -> MariaDB [26_02_2026]> create table Enrolment
    ->     -> (enroll_id int not null auto_increment primary key,
    ->     -> student_id int not null,
    ->     -> course_id int not null,
    ->     -> foreign key(student_id) references Student(student_id),
    ->     -> foreign key(course_id) references Course(course_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '+-------------+-------------+------+-----+---------+-------+
| Field       | ...' at line 1
MariaDB [26_02_2026]> Query OK, 0 rows affected (0.550 sec)
    ->
    -> MariaDB [26_02_2026]> desc Enrolment;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 0 rows affected (0.550 sec)

MariaDB [26_02_2026]> desc Enrolment' at line 1
MariaDB [26_02_2026]> +------------+---------+------+-----+---------+----------------+
    -> | Field      | Type    | Null | Key | Default | Extra          |
    -> +------------+---------+------+-----+---------+----------------+
    -> | enroll_id  | int(11) | NO   | PRI | NULL    | auto_increment |
    -> | student_id | int(11) | NO   | MUL | NULL    |                |
    -> | course_id  | int(11) | NO   | MUL | NULL    |                |
    -> +------------+---------+------+-----+---------+----------------+
    -> 3 rows in set (0.324 sec)
    ->
    -> MariaDB [26_02_2026]> insert into Student (student_name,city) values
    ->     -> ('Rahul','Delhi'),
    ->     -> ('Anita','Mumbai'),
    ->     -> ('John','Pune'),
    ->     -> ('Sara','Delhi');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '+------------+---------+------+-----+---------+----------------+
| Field     ...' at line 1
MariaDB [26_02_2026]> Query OK, 4 rows affected (0.148 sec)
    -> Records: 4  Duplicates: 0  Warnings: 0
    ->
    -> MariaDB [26_02_2026]> select * from Student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 4 rows affected (0.148 sec)
Records: 4  Duplicates: 0  Warnings: 0
...' at line 1
MariaDB [26_02_2026]> +------------+--------------+--------+
    -> | student_id | student_name | city   |
    -> +------------+--------------+--------+
    -> |          1 | Rahul        | Delhi  |
    -> |          2 | Anita        | Mumbai |
    -> |          3 | John         | Pune   |
    -> |          4 | Sara         | Delhi  |
    -> +------------+--------------+--------+
    -> 4 rows in set (0.001 sec)
    ->
    -> MariaDB [26_02_2026]> insert into Course (course_id,course_name,fee) values
    ->     -> (101,'Math',3000),
    ->     -> (102,'Science',3500),
    ->     -> (103,'English',2500),
    ->     -> (104,'Computer',4000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '+------------+--------------+--------+
| student_id | student_name | city   |...' at line 1
MariaDB [26_02_2026]> Query OK, 4 rows affected (0.074 sec)
    -> Records: 4  Duplicates: 0  Warnings: 0
    ->
    -> MariaDB [26_02_2026]> select * from Course;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 4 rows affected (0.074 sec)
Records: 4  Duplicates: 0  Warnings: 0
...' at line 1
MariaDB [26_02_2026]> +-----------+-------------+------+
    -> | course_id | course_name | fee  |
    -> +-----------+-------------+------+
    -> |       101 | Math        | 3000 |
    -> |       102 | Science     | 3500 |
    -> |       103 | English     | 2500 |
    -> |       104 | Computer    | 4000 |
    -> +-----------+-------------+------+
    -> 4 rows in set (0.000 sec)
    ->
    -> MariaDB [26_02_2026]> insert into Enrolment (enroll_id,student_id,course_id) values
    ->     -> (1,101),
    ->     -> (1,104),
    ->     -> (2,102),
    ->     -> (3,101),
    ->     -> (3,103);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '+-----------+-------------+------+
| course_id | course_name | fee  |
+------...' at line 1
MariaDB [26_02_2026]> ERROR 1136 (21S01): Column count doesn't match value count at row 1
    '> MariaDB [26_02_2026]> insert into Enrolment (student_id,course_id) values
    '>     -> (1,101),
    '>     -> (1,104),
    '>     -> (2,102),
    '>     -> (3,101),
    '>     -> (3,103);
    '> Query OK, 5 rows affected (0.042 sec)
    '> Records: 5  Duplicates: 0  Warnings: 0
    '>
    '> MariaDB [26_02_2026]> select * from Enrolment;
    '> +-----------+------------+-----------+
    '> | enroll_id | student_id | course_id |
    '> +-----------+------------+-----------+
    '> |         1 |          1 |       101 |
    '> |         2 |          1 |       104 |
    '> |         3 |          2 |       102 |
    '> |         4 |          3 |       101 |
    '> |         5 |          3 |       103 |
    '> +-----------+------------+-----------+
    '> 5 rows in set (0.001 sec)
    '>
    '> MariaDB [26_02_2026]>
    '>
    '> give sql CMD commands for following questions
    '>
    '> 1) Display all students with the courses they are enrolled in?
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '>
    '> '
    ->
    -> \c
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]>
MariaDB [26_02_2026]> select Student.student_name,Course.course_name from Student inner join Enrolment on Student.student_id = Enrolment.student_id inner join Course on Enrolment.student_id = Course.course_id;
Empty set (0.001 sec)

MariaDB [26_02_2026]> select distinct Student.student_name from Student inner join Enrolment on Student.student_id = Enrolment.Student_id;
+--------------+
| student_name |
+--------------+
| Rahul        |
| Anita        |
| John         |
+--------------+
3 rows in set (0.001 sec)

MariaDB [26_02_2026]> select Student.student_name,Course.course_name from Student left join Enrolment on Student.student_id = Enrolment.student_id left join Course on Enrolment.course_id = Course.course_id;
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | Math        |
| Rahul        | Computer    |
| Anita        | Science     |
| John         | Math        |
| John         | English     |
| Sara         | NULL        |
+--------------+-------------+
6 rows in set (0.001 sec)

MariaDB [26_02_2026]>    
