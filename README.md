[C:\xampp\mysql\bin>mysql -u root -h localhost]

SELECT - extracts data from a database

UPDATE - updates data in a database

DELETE - deletes data from a database

INSERT INTO - inserts new data into a database

CREATE DATABASE - creates a new database

ALTER DATABASE - modifies a database

CREATE TABLE - creates a new table

ALTER TABLE - modifies a table

DROP TABLE - deletes a table

CREATE INDEX - creates an index (search key)

DROP INDEX - deletes an index

-------------------------------------------------------------------------------------------
              1.Database Commands
 
1.Create database: CREATE DATABASE school;
 
2.Use database : USE school;
 
3.Show databases : SHOW DATABASES;

4.Drop database : DROP DATABASE school;

 
							2.Table Commands (DDL)

1.Create table:
	CREATE TABLE students (
		id INT AUTO_INCREMENT PRIMARY KEY,
		name VARCHAR(50),
		age INT,
		marks INT
);


2.Show tables : SHOW TABLES;

3.Describe table : DESCRIBE students;

4.Alter table (add column) : ALTER TABLE students ADD city VARCHAR(50);

5.Drop table : DROP TABLE students;

6.Truncate table : TRUNCATE TABLE students;

							3.Data Commands (DML)
							
1.Insert data :
	INSERT INTO students (name, age, marks)
	VALUES ('Rahul', 20, 85);

2.Insert multiple rows :
	INSERT INTO students (name, age, marks)
	VALUES 
	('Asha', 19, 90),
	('Kiran', 21, 78);

3.Update data:
	UPDATE students
	SET marks = 95
	WHERE name = 'Rahul';

4.Delete data :
	DELETE FROM students
	WHERE name = 'Kiran';

							
							4.Query Commands (SELECT)

1.Select all :
	SELECT * FROM students;

2.Select specific columns :
	SELECT name, marks FROM students;

3.Where condition :
	SELECT * FROM students WHERE marks > 80;

4.Order by :
	SELECT * FROM students ORDER BY marks DESC;

5.Limit :
	SELECT * FROM students LIMIT 2;

							5.Aggregate Functions
							
1.Count :
	SELECT COUNT(*) FROM students;

2.Average :
	SELECT AVG(marks) FROM students;

3.Group by :
	SELECT age, AVG(marks)
	FROM students
	GROUP BY age;

							6.Joins
							
1.Create another table:
	CREATE TABLE courses (
		course_id INT PRIMARY KEY,
		course_name VARCHAR(50)
	);

2.Join :
	SELECT students.name, courses.course_name
	FROM students
	INNER JOIN courses
	ON students.id = courses.course_id;

7.Constraints Example:						
	CREATE TABLE users (
		id INT PRIMARY KEY,
		email VARCHAR(100) UNIQUE NOT NULL
	);

8.Index Example:
	CREATE INDEX idx_name ON students(name);

9.View Example :
	CREATE VIEW top_students AS
	SELECT name, marks FROM students WHERE marks > 90;

	SELECT * FROM top_students;

10.Transaction Example :
	START TRANSACTION;

	UPDATE students SET marks = 70 WHERE id = 1;

	ROLLBACK;   -- or COMMIT

11.User & Permission Example :
	CREATE USER 'test'@'localhost' IDENTIFIED BY '1234';
	GRANT SELECT ON school.* TO 'test'@'localhost';
