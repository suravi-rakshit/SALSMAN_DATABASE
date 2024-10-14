create database salesman;
use salesman;
create table salesman(
salesman_id int primary key,
name varchar(50),
city varchar(50),
commisiion float);
select*from salesman;
insert into salesman (salesman_id,name,city,commisiion) values(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Paris",0.14),
(5003,"Lauson Hen","",0.12),
(5007,"Paul Adam","Rome",0.13);
create table  customer(
customer_id int primary key,
customer_name varchar(50),
city varchar(50),
grade int,
salesman_id int,
foreign key(salesman_id) references salesman(salesman_id));
insert into customer (customer_id,customer_name,city,grade,salesman_id) values(3002,"Nick Rimando","New York",100,5001),
(3005,"Graham Jusi","California",200,5002),
(3001,"Brad Guzan","London",null,null),
(3004,"Fabian Jhons","Paris",300,5006),
(3007,"Brad Devis","New York",200,5001),
(3009,"Geoff camero","barlin",100,null),
(3008,"Julian Green","London",300,5002),
(3003,"Jozy alteder","Moncow",200,5007);
select * from customer;

create table oder(
order_no int primary key,
purch_amt decimal(10,2),
order_date date,
customer_id int,
salesman_id int,
foreign key(customer_id) references customer(customer_id),
foreign key(salesman_id) references salesman(salesman_id));
insert into  oder (order_no,purch_amt,order_date,customer_id,salesman_id) values
(70001,150.5,"2016-10-05",3005,5002),
(70009,270.65,"2016-09-10",3001,null),
(70002,65.26,"2016-10-05",3002,5001),
(70004,110.5,"2016-08-25",3009,null),
(70007,948.5,"2016-09-10",3005,5002),
(70005,2400.6,"2016-07-27",3007,5001),
(70008,5760,"2016-09-10",3002,5001),
(70010,1983.43,"2016-10-10",3004,5006),
(70003,2480.4,"2016-10-10",3009,null),
(70012,250.45,"2016-07-27",3008,5002),
(70011,75.29,"2016-08-17",3003,5007);
select*from oder;
select name,commisiion from salesman;
select distinct salesman_id  from oder;
select name,city from salesman
where city="paris";
select *from customer
where grade=200;
select order_no,order_date,purch_amt  from oder
where salesman_id=5001;
select*from customer
where city="New York" or not grade>100;
select salesman_id,name,city,commisiion from salesman
where commisiion between 0.12 and 0.14;
select * from customer
where customer_name like "%n";
select*from salesman
where name like"N__l%";
select *from customer
where grade is null;
select sum(purch_amt)from oder;
select count(salesman_id)from oder;
select count(distinct salesman_id)from oder;
select city,max(grade)from customer
group by city;
select customer_id,max(purch_amt)from oder
group by customer_id;
select customer_id,order_date,max(purch_amt)
from oder
group by customer_id,order_date;
select salesman_id,max(purch_amt)
from oder
where order_date="2016-10-5"
group by salesman_id;
select customer_id,order_date,max(purch_amt)
from oder
group by customer_id,order_date
having max(purch_amt)>2000;
select count(*)
from oder
where order_date="2016-09-10";
select C.customer_name, S.name, S.city
from salesman as S,customer as C
where S.city=C.city;
select customer_name,salesman.name
from customer,salesman
where customer.salesman_id=salesman.salesman_id;
select order_no,customer_name,oder.customer_id,oder.salesman_id
from salesman,customer,oder
where customer.city<>salesman.city
and oder.customer_id=customer.customer_id
and oder.salesman_id=salesman.salesman_id;
select * from oder
where salesman_id=
(select salesman_id from salesman
where name="Paul adam");
select*from oder
where purch_amt>
(select avg(purch_amt)from oder
where order_date="2016-10-10");
select*from oder
where salesman_id=(select salesman_id from salesman
where city="Paris" );

select *from oder
where salesman_id in(select salesman_id from salesman
where commisiion=(select max(commisiion) from salesman));

select salesman_id,name from salesman as a
where 1<(select count(*)from customer as c
where c.salesman_id=a.salesman_id);
select C.salesman_id,S.name,S.city,S.commisiion
from customer as C ,salesman as S
where C.salesman_id=S.salesman_id
group by C.salesman_id,S.name
having count(C.salesman_id)=1;
select*from oder
where purch_amt>ANY(select purch_amt from oder
where order_date="2016-09-10");
select*from customer
where grade>ALL(select grade from customer
where city="New York");

create table Nobel(
year int ,
subject varchar(50),
winner varchar(50),
country varchar(50),
category varchar(50)
);
drop table Nobel;
insert into Nobel (year,subject,winner,country,category) values 
(1994,"Literature","Kenzaburo Oe","Japan","Linguist"),
(1994,"Economics","Reinhard Selten","Germany","Economist"),
(1987,"Chemistry","Donald J.carm","USA","Scientist"),
(1987,"Literature","Jean Lehn","Russia","Linguist"),
(1987,"Economist","Robert Solow","USA","Economist"),
(1970,"Chemistry","Luis Federico","France","Scientist");
select*from Nobel;
select*from Nobel
where subject Not like"P%"
order by year desc;
select*from Nobel
where year=1970
and subject not in ("physiology","Economics");






