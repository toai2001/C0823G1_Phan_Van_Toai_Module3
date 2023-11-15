create database case_study;
use case_study;


create table detail(
detail_id int key auto_increment,
url_trailer varchar(50),
url_dowload varchar(50)
);



create table games(
game_id int key auto_increment,
game_name varchar(45) not null,
price double,
detail_id int,
foreign key(detail_id) references detail(detail_id)
);


create table users(
users_id int key auto_increment,
username varchar(45) not null unique,
pass varchar(45) not null,
fullname varchar(45),
birthday date,
email varchar(45),
users_role varchar(45)
    CHECK (`role`= "admin" OR `role`= "user")
);

create table order_game(
order_id int key auto_increment,
time_order datetime,
users_id int,
game_id int,
status_oder varchar(50),
foreign key(users_id) references users(users_id),
foreign key(game_id) references games(game_id)
);

