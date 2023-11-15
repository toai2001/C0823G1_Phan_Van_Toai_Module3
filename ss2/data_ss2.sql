create database ss2;

use ss2;


create table category(
category_id int key auto_increment,
category_name varchar(45)
);
create table authors(
authors_id int key auto_increment,
authors_name varchar(45)
);


create table books(
books_id int key auto_increment,
books_tile varchar(45),
books_page_size  int,
category_id int,
authors_id int,
foreign key(authors_id) references authors(authors_id),
foreign key (category_id) references category(category_id)
);
create table studens(
studens_id int key auto_increment,
studens_name varchar(45) not null,
studens_birthday date,
studens_class_name varchar(45)
);


create table borrows(
borrows_id int key auto_increment,
studens_id int,
books_id int,
borrows_date date,
borrows_return_date date,
foreign key(studens_id) references studens (studens_id),
foreign key (books_id) references books (books_id)
);

