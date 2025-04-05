create database ola_auto_bookings;
use ola_auto_bookings;

create table users
(
user_id int auto_increment primary key,
name varchar(20),
email varchar(40) unique,
phone_no varchar(20),
password varchar(30)
); 

create table drivers
(
drivers_id int auto_increment primary key,
name varchar(20),
license_no varchar(50) unique,
phone_no varchar(20),
status enum('available','on_ride','offline') default 'available'
);

create table autos 
(
auto_id int auto_increment primary key,
drivers_id int,
registration_no varchar(50) unique,
model varchar(50),
capacity int,
foreign key (drivers_id) references drivers(drivers_id)
);

create table bookings 
(
booking_id int auto_increment primary key,
user_id int,
drivers_id int,
pickup_location varchar(200),
drop_location varchar(200),
status enum('booked','ongoing','completed','cancelled') default 'booked',
fare decimal(10,2),
booking_time datetime default current_timestamp,
foreign key (user_id) references users(user_id),
foreign key (drivers_id) references drivers(drivers_id)
);

create table payments 
(
payment_id int auto_increment primary key,
booking_id int,
payment_method enum('cash','UPI','card','wallet'),
amount decimal(10,2),
payment_time datetime default current_timestamp,
foreign key (booking_id) references bookings(booking_id)
);

insert into users(name, email, phone_no, password) values('sujita','solankisujita10@gmail.com','7658345645','solanki321');
insert into drivers(name, license_no, phone_no) values ('punit kumar','55-66-7878-4564563','5666564434');
insert into autos(drivers_id,registration_no,model,capacity) values('1','mh20dv2366','bajaj','3');
insert into bookings(user_id,drivers_id,pickup_location,drop_location,fare) values('1','1','CG road tops technology','motera stadium north plaza','150.00');
insert into payments(booking_id,payment_method,amount) values ('1','UPI','160.00');

select * from drivers where status = 'available';

select sum(amount) as total_income from payments where date(payment_time) = curdate();

select * from bookings where user_id  = 1;














