-- create database internal1;
-- use internal1;
-- 1
create table employee(emp_no integer primary key,e_name varchar(20),e_address varchar(20),e_ph_no varchar(20),dept_no int,dept_name varchar(20),job_id int,salary int);
-- 2
alter table employee add column (hiredate date);
select*from employee;
-- 3
alter table employee modify column job_id varchar(30);
-- 4
alter table employee rename column emp_no to e_no;
-- 5
alter table employee modify column job_id varchar(40);
-- 6
insert into employee values(1,'Ramu','hyd',674892021,10,'math',1001,28000,'81-5-1'),
(2,'Vamsi','chennei',9702892021,23,'science',1003,37000,'81-12-3'),
(3,'Ajay','vizag',8923919442,20,'physics',1004,39000,'80-1-19'),
(4,'Saikumar','hyd',9013532892,11,'analyst',1002,43000,'80-8-30'),
(5,'Krishna','pondy',493729043,21,'stat',1007,49000,'81-12-17');
-- 7
select*from employee;
-- 8
update employee set salary=salary*0.25 where dept_name='math';
select *from employee;
-- 9
select e_name,dept_name,salary from employee;
-- 10
select * from employee where dept_name not in ('clerk', 'analyst');
-- 11
select e_name,hiredate from employee where hiredate in ('81-5-1' , '81-12-3' ,' 81-12-17 ',' 80-1-19');
-- 12
select*from employee where dept_no = 10 or dept_no=20;
-- 13
select * from employee where e_name like 's%';
-- 14
savepoint employee;
-- 15
rollback;
-- 16
commit;
-- 17
create table sailors(sid int primary key,sname varchar(20),rating int,age int);
create table boats(bid int,bname varchar(20),color varchar(20));
create table reserves(sid int,bid int, day date);
insert into sailors values(1001,'vijay',8,29);
insert into sailors values(1003,'varun',9,32);
insert into sailors values(1004,'krishna',8,36);
select*from sailors;
insert into boats values(101,'air','red');
insert into boats values(102,'could','pink');
insert into boats values(103,'bob','green');
select*from boats;
insert into reserves values(1003,101,'81-3-2');
insert into reserves values(1004,102,'80-12-9');
insert into reserves values(1001,103,'81-10-11');
select*from reserves;
-- 18
select*from sailors where sid in(select sid from reserves where bid=101);
-- 19
select sname as sailors_name from sailors s join reserves r on s.sid=r.sid;
-- 20
select s .sname from sailors s join reserves r on s.sid=r.sid join boats b on r.bid where b.color='red' order by s.age;
