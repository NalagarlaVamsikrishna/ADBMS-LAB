
-- create
CREATE TABLE EMPLOYEE (
  Id INTEGER PRIMARY KEY,
  Name TEXT NOT NULL,
  Dept_name TEXT NOT NULL,
  Salary INT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (10101, 'Srinivasan', 'Comp.Sci','65000');
INSERT INTO EMPLOYEE VALUES (12121, 'Wu', 'Finance','90000');
INSERT INTO EMPLOYEE VALUES (15151, 'Mozart', 'Music','40000');
INSERT INTO EMPLOYEE VALUES (22222, 'Einstein', 'physics','95000');
INSERT INTO EMPLOYEE VALUES (32343, 'El said', 'History','60000');
INSERT INTO EMPLOYEE VALUES (33456, 'Gold', 'physics','87000');
INSERT INTO EMPLOYEE VALUES (45565, 'Katz', 'comp.Sci','75000');
INSERT INTO EMPLOYEE VALUES (58583, 'califieri', 'History','62000');
INSERT INTO EMPLOYEE VALUES (76543, 'Singh', 'Finance','80000');
INSERT INTO EMPLOYEE VALUES (76766, 'Crick', 'Biology','72000');
INSERT INTO EMPLOYEE VALUES (83821, 'Brandt', 'Comp.Sci','92000');
INSERT INTO EMPLOYEE VALUES (98345, 'Kim', 'Elec.Eng','80000');
-- fetch 
SELECT * FROM EMPLOYEE; 

CREATE TABLE Teaches (
  Id INTEGER ,
  course_id varchar(10) NOT NULL,
  section_id int  NOT NULL,
  Semester text NOT NULL,
  year int NOT NULL
);

-- insert
INSERT INTO Teaches VALUES (10101, 'CS-101', '1','FALL','2017');
INSERT INTO Teaches VALUES (10101, 'CS-315', '1','SPRING','2018');
INSERT INTO Teaches VALUES (10101, 'CS-347', '1','FALL','2017');
INSERT INTO Teaches VALUES (12121, 'Fin-201', '1','SPRING','2018');
INSERT INTO Teaches VALUES (15151, 'MU-199', '1','SPRING','2018');
INSERT INTO Teaches VALUES (22222, 'PHY-101', '1','FALL','2017');
INSERT INTO Teaches VALUES (32343, 'HIS-351', '1','SPRING','2018');
INSERT INTO Teaches VALUES (45565, 'CS-101', '1','SPRING','2018');
INSERT INTO Teaches VALUES (45565, 'CS-319', '1','SPRING','2018');
INSERT INTO Teaches VALUES (76766, 'BIO-101', '1','SUMMER','2017');
INSERT INTO Teaches VALUES (76766, 'BIO-301', '1','SUMMER','2018');
INSERT INTO Teaches VALUES (83821, 'CS-190', '1','SPRING','2017');
INSERT INTO Teaches VALUES (83821, 'CS-190', '2','SPRING','2017');
INSERT INTO Teaches VALUES (83821, 'CS-319', '2','SPRING','2018');
INSERT INTO Teaches VALUES (98345, 'EE-181', '1','SPRING','2017');
SELECT * FROM Teaches; 

INSERT INTO EMPLOYEE VALUES (10211, 'SMITH', 'BIOLOGY', '66000');
SELECT * FROM EMPLOYEE;  

DELETE FROM EMPLOYEE WHERE Id = '10211' AND NAME = 'SMITH' AND Dept_name = 'BIOLOGY' AND Salary='66000';
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE Id IN (SELECT Id FROM EMPLOYEE WHERE Dept_name = 'History');

SELECT * FROM Teaches, EMPLOYEE;

SELECT DISTINCT EMPLOYEE.Name, Teaches.course_id 
FROM EMPLOYEE 
INNER JOIN Teaches ON EMPLOYEE.Id = Teaches.Id;

SELECT Name FROM EMPLOYEE WHERE Name LIKE '%dar%';

SELECT Name FROM EMPLOYEE WHERE Salary BETWEEN 90000 AND 100000;





SELECT * FROM EMPLOYEE ORDER BY Salary;

SELECT * FROM Teaches WHERE Semester = 'FALL' AND year = 2017 
UNION 
SELECT * FROM Teaches WHERE Semester = 'SPRING' AND year = 2018;

SELECT course_id FROM Teaches 
WHERE (Semester = 'FALL' AND year = 2017) 
AND course_id IN (SELECT course_id FROM Teaches WHERE Semester = 'SPRING' AND year = 2018);

SELECT course_id FROM Teaches 
WHERE Semester = 'FALL' AND year = 2017 
AND course_id NOT IN (SELECT course_id FROM Teaches WHERE Semester = 'SPRING' AND year = 2018);

INSERT INTO EMPLOYEE VALUES ('10211', 'Smith', 'Biology', 66000);
INSERT INTO EMPLOYEE VALUES ('10212', 'Tom', 'Biology', NULL);
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE Salary IS NULL;

SELECT AVG(Salary) AS AvgSalary 
FROM EMPLOYEE 
WHERE Dept_name = 'Comp.Sci';





SELECT COUNT(DISTINCT Id) AS TotalEMPLOYEE
FROM Teaches
WHERE Semester = 'SPRING' AND year = 2018;

SELECT COUNT(*) AS TotalTuples
FROM Teaches;

SELECT Dept_name, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Dept_name;

SELECT Dept_name, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Dept_name
HAVING AVG(Salary) > 42000;

SELECT Name
FROM EMPLOYEE
WHERE Name NOT IN ('Mozart', 'Einstein');

SELECT Name
FROM EMPLOYEE
WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE WHERE Dept_name = 'Biology');

SELECT Name
FROM EMPLOYEE
WHERE Salary > ALL (SELECT Salary FROM EMPLOYEE WHERE Dept_name = 'Biology');

SELECT Dept_name, AVG(Salary) AS AvgSalary
FROM EMPLOYEE
GROUP BY Dept_name
HAVING AVG(Salary) > 42000;


SELECT Dept_name
FROM EMPLOYEE
GROUP BY Dept_name
HAVING SUM(Salary) > (SELECT AVG(Salary) FROM EMPLOYEE);

SELECT EMPLOYEE.Name, Teaches.course_id
FROM EMPLOYEE
LEFT JOIN Teaches ON EMPLOYEE.Id = Teaches.Id;

SELECT EMPLOYEE.Name, Teaches.course_id
FROM EMPLOYEE
LEFT JOIN Teaches ON EMPLOYEE.Id = Teaches.Id;

CREATE VIEW faculty AS
SELECT Id, Name, Dept_name
FROM EMPLOYEE;

GRANT SELECT ON faculty TO <new_user>;




CREATE VIEW faculty AS
SELECT Id, Name, Dept_name
FROM EMPLOYEE;

CREATE VIEW department_salary_totals AS
SELECT Dept_name, SUM(Salary) AS TotalSalary
FROM EMPLOYEE
GROUP BY Dept_name;

CREATE ROLE student;

GRANT SELECT ON faculty TO student;

CREATE USER new_user WITH PASSWORD 'password';
GRANT student TO new_user;

-- Assuming you've logged in as 'new_user'
SELECT * FROM faculty WHERE Dept_name = 'Biology';

REVOKE student FROM new_user;

DROP ROLE student;

GRANT SELECT ON faculty TO new_user;

-- Assuming you've logged in as 'new_user'
SELECT * FROM faculty WHERE Dept_name = 'Finance';

-- Assuming you're using the root user


CREATE TABLE teaches2 (
  Id INTEGER ,
  course_id varchar(10) NOT NULL,
  section_id int  NOT NULL,
  Semester text CHECK (Semester IN ('fall', 'winter', 'spring', 'summer')) NOT NULL,
  year int NOT NULL
);


-- Create index
CREATE INDEX idx_teaches_id ON Teaches(Id);

-- Compare query time with and without index
-- This would depend on the specific queries you are running and the size of your dataset
-- You can use EXPLAIN ANALYZE to analyze query execution plans and timings.


DROP INDEX idx_teaches_id;

