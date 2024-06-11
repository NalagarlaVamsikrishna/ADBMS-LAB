create database procedures;
create table employees(emp_no integer primary key,e_name varchar(20),e_address varchar(20),e_ph_no varchar(20));
-- Insert table values
insert into employees values(101,'ram','11-ut',2894833793);
insert into employees values(102,'vamsi','43-c',6788299204);
insert into employees values(103,'surya','41-or',7890489200);
insert into employees values(104,'mitra','21-e',9899204782);
-- Create procedures without parameters
DELIMITER $$
create   procedure get_employees ()
begin
select*from employees;
end $$
DELIMITER ;
-- Call procedure
call get_employees();
-- create procedures with parameters
DELIMITER $$
create   procedure finds_employees (in id int)
begin
select*from employees ;
end $$
DELIMITER ;
call finds_employees(101);
call finds_employees(104);
call finds_employees(102);