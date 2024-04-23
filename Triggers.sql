create database trigger1;
create table student(student_id integer null,name varchar(20),Address varchar(20),Marks integer(10));
desc student;
create trigger student_trigger before insert on student for each row set  new.Marks=new.Marks+100;
insert into student(student_id,name,Address,Marks) values('2','krishna','landon','90');
select*from student;
insert into student(student_id,name,Address,Marks) values('3','Ramu','India','70');
show triggers;
