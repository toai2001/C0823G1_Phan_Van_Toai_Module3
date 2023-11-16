create database ss1;
use ss1;


CREATE TABLE book_management (
    id INT KEY AUTO_INCREMENT,
    name VARCHAR(45),
    page_size INT,
    author VARCHAR(45)
);

insert into book_management(name,page_size,author) value('Toán',45,'Nguyễn Thái Học'),
													('Văn',34,'Trần Mình Hoàng'),
                                                    ('Sử',56,'Dương Trung Quốc'),
                                                    ('Địa',76,'Lê Văn Hiến'),
                                                    ('Hoá',32,'Hà Văn Minh');
update book_management
set  page_size = 50
where name = 'Sử';

delete from book_management
where id = 5;
drop table book_management;
drop database ss1;

                                                    
                                                    
