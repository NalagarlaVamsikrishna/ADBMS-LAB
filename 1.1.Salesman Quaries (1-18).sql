create database vamsi;
use vamsi;
-- create salesman table
create table salesman(salesman_id int primary key,name varchar(30),city varchar(30),commission float);
insert into salesman (salesman_id,name,city,commission)
values(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","Paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"MC Lyon","Paris",0.14),
(5003,"Lauson Hen",null,0.12),
(5007,"Paul Adam","Rome",0.13);

-- create customer table
create table customer(customer_id int,customer_name varchar(30),city varchar(30),grade int,salesman_id int,
primary key (customer_id),foreign key (salesman_id) references salesman (salesman_id));
insert into customer1(customer_id,customer_name,city,grade,salesman_id)
values(3002,"Nick Rimando","New York",100,5001),
(3005,"Graham Zusi","California",200,5002),
(3001,"Brad Guzan","London",null,null),
(3004,"Fabian Johns","Paris",300,5006),
(3007,"Brad Davis","New York",200,5001),
(3009,"Geoff Camero","Berlin",100,null),
(3008,"Julian Green","London",300,5002),
(3003,"Jozy Altidor","Mancow",200,5007);

-- create order1 table
create table order1(order_no int,purch_amt float,order_date date,customer_id int,salesman_id int);
insert into order1(order_no,purch_amt,order_date,customer_id,salesman_id)
values(70001,150.5,"2016-10-05",3005,5002),
(70009,270.5,"2016-09-10",3001,null),
(70002,65.5,"2016-10-05",3002,5001),
(70004,110.5,"2016-08-17",3009,null),
(7007,948.5,"2016-09-10",3005,5002),
(70005,2400.6,"2016-07-27",3007,5001),
(70008,5760,"2016-09-10",3002,5001),
(70010,19830.43,"2016-10-10",3004,5006),
(70003,2480,"2016-10-10",3009,null);


select*from salesman;
select *from customer;
select*from order1;
-- query 1-18
select name,commission from salesman;
select distinct salesman_id from order1;
select name,city from salesman where city="paris";
select * from customer where grade=200;
select order_no,order_date,purch_amt from order1 where salesman_id=5001;
select*from customer where city='New York' or not grade>100;
select*from salesman where (0.12<commission>0.14); 
select*from salesman where(commission between 0.12 and 0.14);
select*from customer where customer_name like '%n';
select*from salesman where name like 'n__l%';
select*from customer where grade is Null;
select sum(purch_amt) from order1;
select count(salesman_id) from customer;
select count(distinct salesman_id) from order1;
select city,max(grade) from customer group by city;
select customer_id,max(purch_amt) from order1 group by customer_id;
select customer_id, order_date, max(purch_amt) from order1
group by customer_id, order_date;
select salesman_id, max(purch_amt) from order1
where order_date = '2012-08-17' group by salesman_id;
select customer_id, order_date, MAX(purch_amt) from order1
group by customer_id, order_date having max(purch_amt) > 2000.00;
select count(*) from order1 where order_date = '2012-08-17';
