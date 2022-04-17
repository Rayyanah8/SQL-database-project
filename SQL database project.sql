create database store;
use store;
create table users(
id int primary key,
full_name varchar(20),
email varchar(20) unique,
gender char(10) check (gender='m' or gender='f'),
date_of_birth varchar(15),
country_code int );
create table countries(
code int primary key,
name varchar (20) not null unique,
countinent_name varchar(20) unique,
foreign key(code)references users(country_code)
);
create table orders(
id int primary key,
user_id int foreign key,
status varchar (6) check (status='start' or status='finish'),
foreign key(user_id)references users(id));
Create table order_products (
order_id int,
product_id int,
quantity int default 0,
PRIMARY KEY (order_id, product_id),
foreign key (order_id) references orders (id),
foreign key (product_id) references products (id)
);
create table products(
id int primary key,
name varchar (10) not null,
prince int default 0,
status varchar (10) check (status='expired' or status='valid'),
foreign key (prouduct_id) references order_products(product_id));
insert into countries values(1,'rayyanah','riyadh');
select * from countries;
insert into users values(2,'Rayyanahalaqil','rialaqil8@gmail.com','f','24-05-1999',17-03-2022,1234);
select * from users;
insert into orders values (3,33,'start',17-04-2022);
select * from orders;
insert into products values(4,'rihanna',100,'valid');
select * from products;
insert into order_products values(5,55,555);
select *from order_products;
use store;
update countries set name='rayyanaalaqil' where id='1';
select *from countries;
delete from products where id ='4';
select * from products;
ALTER TABLE products MODIFY COLUMN created_at datetime DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users MODIFY COLUMN created_at datetime DEFAULT CURRENT_TIMESTAMP;