DCSUser@L4097 c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

01) MariaDB [(none)]> create Database DCS_INTERNSHIP;
	Query OK, 1 row affected (0.021 sec)

	MariaDB [(none)]> use DCS_INTERNSHIP;
	Database changed

02) MariaDB [DCS_INTERNSHIP]> create table Student(
    -> RegNo varchar(20) primary key,
    -> Name varchar(50));
	Query OK, 0 rows affected (0.077 sec)

	MariaDB [DCS_INTERNSHIP]> desc Student;
	+-------+-------------+------+-----+---------+-------+
	| Field | Type        | Null | Key | Default | Extra |
	+-------+-------------+------+-----+---------+-------+
	| RegNo | varchar(20) | NO   | PRI | NULL    |       |
	| Name  | varchar(50) | YES  |     | NULL    |       |
	+-------+-------------+------+-----+---------+-------+
	2 rows in set (0.043 sec)

	MariaDB [DCS_INTERNSHIP]> create table Company
		-> \c
	MariaDB [DCS_INTERNSHIP]> create table Company(
		-> CompanyName varchar(50) primary key,
		-> Address varchar(50));
	Query OK, 0 rows affected (0.114 sec)

	MariaDB [DCS_INTERNSHIP]> desc Company;
	+-------------+-------------+------+-----+---------+-------+
	| Field       | Type        | Null | Key | Default | Extra |
	+-------------+-------------+------+-----+---------+-------+
	| CompanyName | varchar(50) | NO   | PRI | NULL    |       |
	| Address     | varchar(50) | YES  |     | NULL    |       |
	+-------------+-------------+------+-----+---------+-------+
	2 rows in set (0.014 sec)

	MariaDB [DCS_INTERNSHIP]> create table Supervisor(
		-> SupervisorName varchar(50) primary key,
		-> Email varchar(50),
		-> CompanyName varchar(50),
		-> foreign key(CompanyName) references Company(CompanyName));
	Query OK, 0 rows affected (0.131 sec)

	MariaDB [DCS_INTERNSHIP]> desc Supervisor;
	+----------------+-------------+------+-----+---------+-------+
	| Field          | Type        | Null | Key | Default | Extra |
	+----------------+-------------+------+-----+---------+-------+
	| SupervisorName | varchar(50) | NO   | PRI | NULL    |       |
	| Email          | varchar(50) | YES  |     | NULL    |       |
	| CompanyName    | varchar(50) | YES  | MUL | NULL    |       |
	+----------------+-------------+------+-----+---------+-------+
	3 rows in set (0.014 sec)

	MariaDB [DCS_INTERNSHIP]> create table Internship(
		-> RegNo varchar(20),
		-> CompanyName varchar(50),
		-> SupervisorName varchar(50),
		-> Startdate date,
		-> Enddate date,
		-> primary key(RegNo),
		-> foreign key(RegNo) references Student(RegNo),
		-> foreign key(CompanyName) references Company(CompanyName),
		-> foreign key(SupervisorName) references Supervisor(SupervisorName));
	Query OK, 0 rows affected (0.165 sec)

	MariaDB [DCS_INTERNSHIP]> desc Intership;
	ERROR 1146 (42S02): Table 'dcs_internship.intership' doesn't exist
	MariaDB [DCS_INTERNSHIP]> desc Internship;
	+----------------+-------------+------+-----+---------+-------+
	| Field          | Type        | Null | Key | Default | Extra |
	+----------------+-------------+------+-----+---------+-------+
	| RegNo          | varchar(20) | NO   | PRI | NULL    |       |
	| CompanyName    | varchar(50) | YES  | MUL | NULL    |       |
	| SupervisorName | varchar(50) | YES  | MUL | NULL    |       |
	| Startdate      | date        | YES  |     | NULL    |       |
	| Enddate        | date        | YES  |     | NULL    |       |
	+----------------+-------------+------+-----+---------+-------+
	5 rows in set (0.014 sec)

	MariaDB [DCS_INTERNSHIP]> create table Skills(
		-> RegNo varchar(20),
		-> Skill varchar(50),
		-> primary key(RegNo, Skill),
		-> foreign key(RegNo) references Student(RegNo));
	Query OK, 0 rows affected (0.098 sec)

	MariaDB [DCS_INTERNSHIP]> desc Skills;
	+-------+-------------+------+-----+---------+-------+
	| Field | Type        | Null | Key | Default | Extra |
	+-------+-------------+------+-----+---------+-------+
	| RegNo | varchar(20) | NO   | PRI | NULL    |       |
	| Skill | varchar(50) | NO   | PRI | NULL    |       |
	+-------+-------------+------+-----+---------+-------+
	2 rows in set (0.014 sec)

03) MariaDB [DCS_INTERNSHIP]> Insert into Student values
    -> ('2019/CSC/001','Kumar'),
    -> ('2019/CSC/002','Nimal'),
    -> ('2019/CSC/003','Silva'),
    -> ('2019/CSC/004','Ravi'),
    -> ('2019/CSC/005','Bandara'),
    -> ('2019/CSC/006','John'),
    -> ('2019/CSC/007','Angel'),
    -> ('2019/CSC/008','Priya'),
    -> ('2019/CSC/009','Kajan'),
    -> ('2019/CSC/010','Maya');
	Query OK, 10 rows affected (0.241 sec)
	Records: 10  Duplicates: 0  Warnings: 0

	MariaDB [DCS_INTERNSHIP]> select * from Student;
	+--------------+---------+
	| RegNo        | Name    |
	+--------------+---------+
	| 2019/CSC/001 | Kumar   |
	| 2019/CSC/002 | Nimal   |
	| 2019/CSC/003 | Silva   |
	| 2019/CSC/004 | Ravi    |
	| 2019/CSC/005 | Bandara |
	| 2019/CSC/006 | John    |
	| 2019/CSC/007 | Angel   |
	| 2019/CSC/008 | Priya   |
	| 2019/CSC/009 | Kajan   |
	| 2019/CSC/010 | Maya    |
	+--------------+---------+
	10 rows in set (0.000 sec)

	MariaDB [DCS_INTERNSHIP]> Insert into Company values
		-> ('Virtusa','Colombo'),
		-> ('WSO2','Colombo'),
		-> ('IFS','Kandy'),
		-> ('Willey','Colombo'),
		-> ('David Pieris','Jaffna');
	Query OK, 5 rows affected (0.062 sec)
	Records: 5  Duplicates: 0  Warnings: 0

	MariaDB [DCS_INTERNSHIP]> select * from Company;
	+--------------+---------+
	| CompanyName  | Address |
	+--------------+---------+
	| David Pieris | Jaffna  |
	| IFS          | Kandy   |
	| Virtusa      | Colombo |
	| Willey       | Colombo |
	| WSO2         | Colombo |
	+--------------+---------+
	5 rows in set (0.000 sec)

	MariaDB [DCS_INTERNSHIP]> Insert into Supervisor values
		-> ('Ramesh','ramesh@virtusa.com','Virtusa'),
		-> ('Sanduni','sanduni@wso2.com','WSO2'),
		-> ('Kamal','kamal@ifs.com','IFS'),
		-> ('Nirosha','nirosha@willey.com','Willey'),
		-> ('Rajeev','rajeev@dp.com','David Pieris'),
		-> ('Fernando','fernando@wso2.com','WSO2'),
		-> ('Perera','perera@virtusa.com','Virtusa'),
		-> ('Jayasuriya','jayasuriya@ifs.com','IFS');
	Query OK, 8 rows affected (0.045 sec)
	Records: 8  Duplicates: 0  Warnings: 0

	MariaDB [DCS_INTERNSHIP]> select * from Supervisor;
	+----------------+--------------------+--------------+
	| SupervisorName | Email              | CompanyName  |
	+----------------+--------------------+--------------+
	| Fernando       | fernando@wso2.com  | WSO2         |
	| Jayasuriya     | jayasuriya@ifs.com | IFS          |
	| Kamal          | kamal@ifs.com      | IFS          |
	| Nirosha        | nirosha@willey.com | Willey       |
	| Perera         | perera@virtusa.com | Virtusa      |
	| Rajeev         | rajeev@dp.com      | David Pieris |
	| Ramesh         | ramesh@virtusa.com | Virtusa      |
	| Sanduni        | sanduni@wso2.com   | WSO2         |
	+----------------+--------------------+--------------+
	8 rows in set (0.000 sec)

	MariaDB [DCS_INTERNSHIP]> Insert into Internship values
		-> ('2019/CSC/001','Virtusa','Ramesh','2025-01-01','2025-06-30'),
		-> ('2019/CSC/002','WSO2','Sanduni','2025-02-01','2025-07-31'),
		-> ('2019/CSC/003','IFS','Kamal','2025-04-01','2025-09-30'),
		-> ('2019/CSC/004','Virtusa','Ramesh','2025-01-15','2025-06-15'),
		-> ('2019/CSC/005','IFS','Kamal','2025-05-01','2025-10-31'),
		-> ('2019/CSC/006','Willey','Nirosha','2025-03-01','2025-08-31'),
		-> ('2019/CSC/007','David Pieris','Rajeev','2025-02-01','2025-07-31'),
		-> ('2019/CSC/008','WSO2','Fernando','2025-01-20','2025-06-20'),
		-> ('2019/CSC/009','Virtusa','Perera','2024-10-10','2025-03-10'),
		-> ('2019/CSC/010','IFS','Jayasuriya','2025-03-15','2025-09-15');
	Query OK, 10 rows affected (0.045 sec)
	Records: 10  Duplicates: 0  Warnings: 0

	MariaDB [DCS_INTERNSHIP]> select * from Internship;
	+--------------+--------------+----------------+------------+------------+
	| RegNo        | CompanyName  | SupervisorName | Startdate  | Enddate    |
	+--------------+--------------+----------------+------------+------------+
	| 2019/CSC/001 | Virtusa      | Ramesh         | 2025-01-01 | 2025-06-30 |
	| 2019/CSC/002 | WSO2         | Sanduni        | 2025-02-01 | 2025-07-31 |
	| 2019/CSC/003 | IFS          | Kamal          | 2025-04-01 | 2025-09-30 |
	| 2019/CSC/004 | Virtusa      | Ramesh         | 2025-01-15 | 2025-06-15 |
	| 2019/CSC/005 | IFS          | Kamal          | 2025-05-01 | 2025-10-31 |
	| 2019/CSC/006 | Willey       | Nirosha        | 2025-03-01 | 2025-08-31 |
	| 2019/CSC/007 | David Pieris | Rajeev         | 2025-02-01 | 2025-07-31 |
	| 2019/CSC/008 | WSO2         | Fernando       | 2025-01-20 | 2025-06-20 |
	| 2019/CSC/009 | Virtusa      | Perera         | 2024-10-10 | 2025-03-10 |
	| 2019/CSC/010 | IFS          | Jayasuriya     | 2025-03-15 | 2025-09-15 |
	+--------------+--------------+----------------+------------+------------+
	10 rows in set (0.000 sec)

	MariaDB [DCS_INTERNSHIP]> Insert into Skills values
		-> ('2019/CSC/001','Java'),
		-> ('2019/CSC/001','SQL'),
		-> ('2019/CSC/002','Python'),
		-> ('2019/CSC/002','Docker'),
		-> ('2019/CSC/003','React'),
		-> ('2019/CSC/003','Node.js'),
		-> ('2019/CSC/004','SQL'),
		-> ('2019/CSC/004','Spring Boot'),
		-> ('2019/CSC/005','DevOps'),
		-> ('2019/CSC/005','AWS'),
		-> ('2019/CSC/006','PHP'),
		-> ('2019/CSC/006','Laravel'),
		-> ('2019/CSC/007','Android'),
		-> ('2019/CSC/007','Kotlin'),
		-> ('2019/CSC/008','Machine Learning'),
		-> ('2019/CSC/008','Python'),
		-> ('2019/CSC/009','JavaScript'),
		-> ('2019/CSC/009','Angular'),
		-> ('2019/CSC/010','Data Science'),
		-> ('2019/CSC/010','SQL');
	Query OK, 20 rows affected (0.050 sec)
	Records: 20  Duplicates: 0  Warnings: 0

	MariaDB [DCS_INTERNSHIP]> desc Skills;
	+-------+-------------+------+-----+---------+-------+
	| Field | Type        | Null | Key | Default | Extra |
	+-------+-------------+------+-----+---------+-------+
	| RegNo | varchar(20) | NO   | PRI | NULL    |       |
	| Skill | varchar(50) | NO   | PRI | NULL    |       |
	+-------+-------------+------+-----+---------+-------+
	2 rows in set (0.016 sec)

	MariaDB [DCS_INTERNSHIP]> select * from Skills;
	+--------------+------------------+
	| RegNo        | Skill            |
	+--------------+------------------+
	| 2019/CSC/001 | Java             |
	| 2019/CSC/001 | SQL              |
	| 2019/CSC/002 | Docker           |
	| 2019/CSC/002 | Python           |
	| 2019/CSC/003 | Node.js          |
	| 2019/CSC/003 | React            |
	| 2019/CSC/004 | Spring Boot      |
	| 2019/CSC/004 | SQL              |
	| 2019/CSC/005 | AWS              |
	| 2019/CSC/005 | DevOps           |
	| 2019/CSC/006 | Laravel          |
	| 2019/CSC/006 | PHP              |
	| 2019/CSC/007 | Android          |
	| 2019/CSC/007 | Kotlin           |
	| 2019/CSC/008 | Machine Learning |
	| 2019/CSC/008 | Python           |
	| 2019/CSC/009 | Angular          |
	| 2019/CSC/009 | JavaScript       |
	| 2019/CSC/010 | Data Science     |
	| 2019/CSC/010 | SQL              |
	+--------------+------------------+
	20 rows in set (0.000 sec)

04) a.	MariaDB [DCS_INTERNSHIP]> Select s.Name, i.CompanyName
		-> From Student s
		-> Join Internship i On s.RegNo = i.RegNo;
	+---------+--------------+
	| Name    | CompanyName  |
	+---------+--------------+
	| Kumar   | Virtusa      |
	| Nimal   | WSO2         |
	| Silva   | IFS          |
	| Ravi    | Virtusa      |
	| Bandara | IFS          |
	| John    | Willey       |
	| Angel   | David Pieris |
	| Priya   | WSO2         |
	| Kajan   | Virtusa      |
	| Maya    | IFS          |
	+---------+--------------+
	10 rows in set (0.001 sec)

	b. MariaDB [DCS_INTERNSHIP]> Select s.Name
		-> From Student s
		-> Join Internship i On s.RegNo = i.RegNo
		-> Where i.CompanyName = 'Virtusa';
	+-------+
	| Name  |
	+-------+
	| Kumar |
	| Ravi  |
	| Kajan |
	+-------+
	3 rows in set (0.006 sec)

	c. MariaDB [DCS_INTERNSHIP]> Select CompanyName
		-> From Company
		-> Where Address = 'Colombo';
	+-------------+
	| CompanyName |
	+-------------+
	| Virtusa     |
	| Willey      |
	| WSO2        |
	+-------------+
	3 rows in set (0.000 sec)

	d. MariaDB [DCS_INTERNSHIP]> Select SupervisorName
		-> From Internship
		-> Group by SupervisorName
		-> Having Count(RegNo) > 1;
	+----------------+
	| SupervisorName |
	+----------------+
	| Kamal          |
	| Ramesh         |
	+----------------+
	2 rows in set (0.000 sec)

	e. MariaDB [DCS_INTERNSHIP]> Select s.Name
		-> From Student s
		-> Join Internship i On s.RegNo = i.RegNo
		-> Where i.EndDate > '2024-06-30';
	+---------+
	| Name    |
	+---------+
	| Kumar   |
	| Nimal   |
	| Silva   |
	| Ravi    |
	| Bandara |
	| John    |
	| Angel   |
	| Priya   |
	| Kajan   |
	| Maya    |
	+---------+
	10 rows in set (0.000 sec)

	f. MariaDB [DCS_INTERNSHIP]> Select s.Name, sk.Skill
		-> From Student s
		-> Join Skills sk On s.RegNo = sk.RegNo
		-> Order by s.Name;
	+---------+------------------+
	| Name    | Skill            |
	+---------+------------------+
	| Angel   | Android          |
	| Angel   | Kotlin           |
	| Bandara | AWS              |
	| Bandara | DevOps           |
	| John    | Laravel          |
	| John    | PHP              |
	| Kajan   | Angular          |
	| Kajan   | JavaScript       |
	| Kumar   | Java             |
	| Kumar   | SQL              |
	| Maya    | Data Science     |
	| Maya    | SQL              |
	| Nimal   | Docker           |
	| Nimal   | Python           |
	| Priya   | Machine Learning |
	| Priya   | Python           |
	| Ravi    | Spring Boot      |
	| Ravi    | SQL              |
	| Silva   | Node.js          |
	| Silva   | React            |
	+---------+------------------+
	20 rows in set (0.001 sec)

	g. MariaDB [DCS_INTERNSHIP]> Select Distinct su.SupervisorName, su.Email
		-> From Supervisor su
		-> Join Internship i On su.SupervisorName = i.SupervisorName
		-> Join Skills sk On i.RegNo = sk.RegNo
		-> Where sk.Skill = 'AWS';
	+----------------+---------------+
	| SupervisorName | Email         |
	+----------------+---------------+
	| Kamal          | kamal@ifs.com |
	+----------------+---------------+
	1 row in set (0.001 sec)

	h. MariaDB [DCS_INTERNSHIP]> Select s.Name
		-> From Student s
		-> Join Skills sk On s.RegNo = sk.RegNo
		-> Where sk.Skill In ('Python','Machine Learning')
		-> Group by s.Name
		-> Having Count(Distinct sk.Skill) = 2;
	+-------+
	| Name  |
	+-------+
	| Priya |
	+-------+
	1 row in set (0.001 sec)

	i. MariaDB [DCS_INTERNSHIP]> Select s.Name
		-> From Student s
		-> Join Internship i On s.RegNo = i.RegNo
		-> Where i.StartDate = (
		->     Select Min(StartDate)
		->     From Internship
		-> );
	+-------+
	| Name  |
	+-------+
	| Kajan |
	+-------+
	1 row in set (0.001 sec)

	j. MariaDB [DCS_INTERNSHIP]> Delete From Student
		-> Where RegNo Not In (
		->     Select Distinct RegNo
		->     From Skills
		-> );
	Query OK, 0 rows affected (0.000 sec)