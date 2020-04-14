select first_name, last_name, order_date, amount from customers
join orders
on customers.id = orders.customer_id;

create table customers(
	id int auto_increment primary key,
	first_name varchar(100),
	last_name varchar(100),
	email varchar(100)
);

create table orders(
	id int auto_increment primary key,
	order_date date,
	amount decimal(8,2),
	customer_id int,
	foreign key(customer_id) references customers(id)
);

drop table customers; /* will not work because orders depends on customers */

/* this will work
drop table orders;
drop table customers;
*/

insert into orders(order_date, amount, customer_id) values
('2017/11/05', 23.45, 45),
(curdate(), 678.90, 109);

-- our first right join
select * from customers
right join orders
on customers.id = orders.customer_id;

-- another right join
select 
	ifnull(first_name, 'MISSING') as first, 
	ifnull(last_name, 'USER') as last, 
	order_date, 
	amount, 
	sum(amount) 
from customers
right join orders
on customers.id = orders.customer_id
group by last_name, first_name;

-- ON DELETE CASCADE

create table customers(
	id int auto_increment primary key,
	first_name varchar(100),
	last_name varchar(100),
	email varchar(100)
);

create table orders(
	id int auto_increment primary key,
	order_date date,
	amount decimal(8,2),
	customer_id int,
	foreign key(customer_id) 
		references customers(id)
		on delete cascade
);

insert into customers(first_name, last_name, email) values
	('Boy', 'George', 'george@gmail.com'),
	('George', 'Michael', 'gm@gmail.com'),
	('David', 'Bowie', 'david@gmail.com'),
	('Blue', 'Steele', 'blue@gmail.com'),
	('Bette', 'Davis', 'bette@aol.com');
	
insert into orders(order_date, amount, customer_id) values
	('2016/02/10', 99.99, 1),
	('2017/11/11', 35.50, 1),
	('2014/12/12', 800.67, 2),
	('2015/01/03', 12.50, 2),
	('1999/04/11', 450.25, 5);

-- left join
select * from customers
left join orders
on customers.id = orders.customer_id;

select * from orders
right join customers
on customers.id = orders.customer_id;

select * from orders
left join customers
on customers.id = orders.customer_id;

select * from customers
right join orders
on customers.id = orders.customer_id;


























