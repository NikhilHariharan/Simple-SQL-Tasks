CREATE DATABASE WorkerDB;
SHOW DATABASES;
USE WorkerDB;
CREATE TABLE worker (
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(50),
dept varchar(20),
salary int,
join_date date
);
INSERT INTO worker
(first_name, last_name, email, dept, salary, join_date) VALUES 
('Nikhil','Hariharan','Nikhil.Hariharan@xyz.com','AI/ML',1000000,'2021-08-01');
INSERT INTO worker
(first_name, last_name, email, dept, salary, join_date) VALUES 
('Subash','Venkat','Subash.Venkat@xyz.com','HR',800000,'2019-04-01'),
('Arjun','Singh','Arjun.Singh@xyz.com','Database',900000,'2020-05-01'),
('Ankit','Sharma','Ankit.Sharma@xyz.com','AI/ML',1200000,'2021-01-01'),
('Sean','Johnson','Sean.Johnson@xyz.com','BI',1200000,'2021-01-01'),
('Aditi','Kapoor','Aditi.Kapoor@xyz.com','Finance',1000000,'2019-09-01'),
('Ajay','Rathore','Ajay.Rathore@xyz.com','Marketing',800000,'2020-11-01'),
('Vikram','Kumar','Vikram.Kumar@xyz.com','BI',1000000,'2018-04-01'),
('Anushka','Gera','Anushka.Gera@xyz.com','HR',1000000,'2019-12-01'),
('Amit','Saxena','Amit.Saxena@xyz.com','Marketing',1400000,'2021-08-01'),
('Manoj','Sharma','Manoj.Sharma@xyz.com','Finance',1500000,'2017-02-01'),
('Prakash','Jha','Prakash.Jha@xyz.com','Finance',1100000,'2018-03-01'),
('Atul','Kulkarni','Atul.Kulkarni@xyz.com','Marketing',1200000,'2019-06-01'),
('Amit','Pathak','Amit.Pathak@xyz.com','AI/ML',1500000,'2017-07-01'),
('Anil','Hegde','Anil.Hegde@xyz.com','HR',900000,'2020-12-01'),
('Ashish','Choudhary','Ashish.Choudhary@xyz.com','BI',1500000,'2019-05-01'),
('Ankur','Patil','Ankur.Patil@xyz.com','HR',900000,'2021-01-01'),
('Manish','Pandey','Manish.Pandey@xyz.com','BI',1300000,'2018-06-01'),
('Sanjay','Kapoor','Sanjay.Kapoor@xyz.com','AI/ML',2000000,'2016-12-01'),
('Gokul','Swamy','Gokul.Swamy@xyz.com','Database',1800000,'2016-11-01');

SELECT * FROM worker;
SELECT first_name AS WORKER_NAME FROM worker;
SELECT DISTINCT dept FROM worker;
SELECT SUBSTRING(first_name,1,3) FROM worker;
SELECT POSITION("a" IN first_name) FROM worker;
SELECT dept, first_name, last_name AS Employee_name, salary FROM worker a
WHERE salary = (SELECT MAX(salary) FROM worker WHERE dept = a.dept);
SELECT RTRIM(first_name) FROM worker;
SELECT DISTINCT(LENGTH(dept)) FROM worker;
SELECT salary FROM worker ORDER BY salary DESC LIMIT 0, 3;
SELECT REPLACE(first_name,'a','A') AS "REPLACE NAME" FROM worker;
SELECT * FROM worker e ORDER BY e.first_name ASC, e.dept DESC;
SELECT * FROM worker WHERE first_name NOT IN ('Ramesh','Santosh');
SELECT * FROM worker WHERE first_name like '_____h';
SELECT * FROM worker WHERE email LIKE '%@xyz.com';
SELECT * FROM Worker WHERE year(join_date) = 2021 AND month(join_date) = 8;
SELECT * FROM (SELECT *, @rowNumber := @rowNumber + 1 rn
FROM worker JOIN (SELECT @rowNumber:= 0) r) t 
WHERE rn % 2 = 1;
CREATE TABLE worker_dup LIKE worker;
SELECT * FROM worker_dup;
SELECT * FROM worker LIMIT 15;
SELECT * FROM worker ORDER BY salary DESC LIMIT 11, 1; -- using n-1. For 1st highest use 1-1=0. For 2nd highest use 2-1=1
SELECT * FROM worker e WHERE 8 = (SELECT COUNT(DISTINCT salary) FROM worker p WHERE e.salary <= p.salary);
SELECT * FROM worker WHERE salary IN(
SELECT salary FROM worker e WHERE worker.first_name <> e.first_name) ORDER BY salary;