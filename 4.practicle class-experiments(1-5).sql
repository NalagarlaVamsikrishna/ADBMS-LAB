create database lab;
use lab;
create table instructor(Id int primary key,name varchar(20),dept_name varchar(20),salary integer);
insert into instructor values('10101','Srinivasan','Comp.Sci.','65000'),
('12121','Wu','Finance','90000'),
('15151','Mozart','Music','40000'),
('22222','Einstein','Physics','95000'),
('32343','El Said','History','60000'),
('33456','Gold','Physics','87000'),
('45565','Katz','Comp.Sci.','75000'),
('58583','Califieri','History','62000'),
('76543','Singh','Finance','80000'),
('76766','Crick','Biology','72000'),
('83821','Brandt','Comp.Sci.','92000'),
('98345','Kim','Elec.Eng.','80000');
select*from instructor;

create table teaches(Id integer,Course_id varchar(20),sec_id integer,semester varchar(20),year integer);
insert into teaches values('10101','CS-101','1','Fall','2017'),
('10101','CS-315','1','Spring','2018'),
('10101','CS-347','1','Fall','2017'),
('12121','FIN-201','1','Spring','2018'),
('15151','MU-199','1','Spring','2018'),
('22222','PHY-101','1','Fall','2017'),
('32343','HIS-351','1','Spring','2018'),
('45565','CS-101','1','Spring','2018'),
('45565','CS-319','1','Spring','2018'),
('76766','BIO-319','1','Summer','2017'),
('76766','BIO-101','1','Summer','2018'),
('83821','CS-190','1','Spring','2017'),
('83821','CS-190','2','Spring','2017'),
('83821','CS-319','2','Spring','2018'),
('98345','EE-181','1','Spring','2017');
select*from teaches;

-- ex1
insert into instructor value('10211','Smith','Biology','66000');
delete from instructor where Id=10211;
select*from instructor where dept_name='History';
select*from instructor cross join teaches;
select *from instructor ,teaches;
select name, course_id from instructor, teaches where instructor.ID = teaches.ID; 
select*from instructor where name like'%dar%';
select name from instructor where (salary>=90000 and salary<=100000);

-- ex2
select*from instructor order by salary; 
(select course_id from teaches where semester = 'Fall' and year = 2017)
union
(select course_id from teaches where semester = 'Spring' and year = 2018);
select course_id from teaches where (semester = 'Fall' and year = 2017) and (semester = 'Spring' and year = 2018);
select course_id from teaches where (semester = 'Fall' and year = 2017) and not (semester = 'Spring' and year = 2018);
insert into instructor values('10211','Smith','Biology','66000'),
('10212','Tom','Biology',null);
select *from instructor where salary is null;
select avg(salary) from instructor where dept_name = 'Comp.Sci.';

-- ex3
select count(distinct ID) from teaches where semester = 'Spring' and year = 2018;
select count(*) from teaches;
select dept_name, avg(salary) as avg_salary from instructor group by dept_name;
select dept_name, avg(salary) as avg_salary from instructor group by dept_name having avg(salary) > 42000;
select distinct name from instructor where name not in ('Mozart', 'Einstein');
select name from instructor where salary > some (select salary from instructor where dept_name = 'Biology');
select name from instructor where salary > all (select max(salary) from instructor where dept_name = 'Biology');
select dept_name, avg_salary from (select dept_name, avg(salary) from instructor group by dept_name) as dept_avg(dept_name, avg_salary) where avg_salary > 42000;

-- ex4

select Dept_name from instructor group by Dept_name having sum(Salary) > (select avg(Salary) from instructor);
select instructor.name ,teaches.course_id from instructor join teaches on instructor.Id=teaches.Id;
select instructor.name ,teaches.course_id from instructor left join teaches on instructor.Id=teaches.Id;
create view faculty as select Id, name, dept_name from instructor;
select*from  faculty;
create user vamsi@localhost identified by 'vamsi3434';
show grants for vamsi@localhost;
grant select on faculty to vamsi@localhost;

-- ex5

create view faculty as select Id, name, dept_name from instructor;
select*from faculty;
create view department_salary_totals as select Dept_name, sum(Salary) as TotalSalary from instructor group BY Dept_name;
select*from department_salary_totals;
create role 'student';
grant select on faculty to student;
revoke select on faculty from 'vamsi'@'localhost';
show grants;
drop role 'student';
create user krishna@localhost identified by 'krishna3434';
GRANT student TO krishna@localhost;
show grants for krishna@localhost;
grant select on faculty to krishna@localhost;

GRANT ALL PRIVILEGES ON student.* TO vamsi@localhost;
SELECT * FROM faculty WHERE dept_name = 'Biology';
GRANT SELECT ON faculty TO vamsi@localhost; 
SELECT * FROM faculty WHERE dept_name = 'Finance';

CREATE TABLE teaches2 (
ID INT NOT NULL,
course_id VARCHAR(255) NOT NULL,
sec_id INT NOT NULL,
semester VARCHAR(255) NOT NULL CHECK (semester IN ('Fall', 'Winter', 'Spring', 'Summer')),
year INT NOT NULL,
FOREIGN KEY (ID) REFERENCES instructor(ID)
);

CREATE INDEX idx_ID ON teaches (ID);
DROP INDEX idx_ID ON teaches;

-- ex6

-- ex7

SELECT * FROM instructor ORDER BY salary;
SELECT DISTINCT course_id FROM teaches WHERE (semester='Fall'and year=2017)OR (semester='Spring' and year=2018);
SELECT DISTINCT course_id FROM teaches WHERE (semester='Fall'and year=2017) AND (semester='Spring' and year=2018);
SELECT DISTINCT course_id FROM teaches t1 WHERE (t1.semester='Fall'and t1.year=2017) AND NOT EXISTS (SELECT 1 FROM teaches t2 WHERE t2.course_id= t1.course_id AND t2.semester='Spring' AND t2.year=2018);
INSERT INTO instructor VALUES ('10211', 'Smith', 'Biology', 66000), ('10212','Tom', 'Biology', NULL );
SELECT name FROM instructor WHERE salary IS NULL;
select avg(salary) from instructor where dept_name = 'Comp.Sci.';
SELECT COUNT(DISTINCT ID) AS total_instructors FROM teaches WHERE semester='Spring' AND year=2018;
SELECT COUNT(*) AS num_tuples FROM teaches;
SELECT dept_name, AVG(salary) as avg_salary FROM instructor GROUP BY dept_name;
SELECT dept_name, AVG(salary) as avg_salary FROM instructor GROUP BY dept_name HAVING AVG(salary)>42000;
SELECT name FROM instructor WHERE name NOT IN ("Mozart","Einstein");
SELECT l.name FROM instructor l WHERE l.salary > (SELECT salary FROM instructor WHERE dept_name='Biology' AND name="Crick");
SELECT l.name FROM instructor l WHERE l.salary > (SELECT max(salary) FROM instructor WHERE dept_name='Biology');
SELECT dept_name, AVG(salary) as average_salary FROM instructor GROUP BY dept_name HAVING AVG(salary)>42000;
SELECT dept_name FROM (SELECT dept_name, SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS department_total_salary
WHERE total_salary > (SELECT AVG(total_salary) FROM (SELECT SUM(salary) AS total_salary 
FROM instructor GROUP BY dept_name) AS avg_total_salary);
SELECT instructor.name, teaches.course_id
FROM instructor JOIN teaches ON instructor.ID = teaches.ID;
SELECT instructor.name, teaches.course_id
FROM instructor LEFT JOIN teaches ON instructor.ID = teaches.ID;

