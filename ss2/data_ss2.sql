create database ss2;

use ss2;


CREATE TABLE category (
    category_id INT KEY AUTO_INCREMENT,
    category_name VARCHAR(45)
);
CREATE TABLE authors (
    authors_id INT KEY AUTO_INCREMENT,
    authors_name VARCHAR(45)
);


CREATE TABLE books (
    books_id INT KEY AUTO_INCREMENT,
    books_tile VARCHAR(45),
    books_page_size INT,
    category_id INT unique,
    authors_id INT unique,
    FOREIGN KEY (authors_id)
        REFERENCES authors (authors_id),
    FOREIGN KEY (category_id)
        REFERENCES category (category_id)
);
CREATE TABLE studens (
    studens_id INT KEY AUTO_INCREMENT,
    studens_name VARCHAR(45) NOT NULL,
    studens_birthday DATE,
    studens_class_name VARCHAR(45)
);


CREATE TABLE borrows (
    borrows_id INT KEY AUTO_INCREMENT,
    studens_id INT unique,
    books_id INT unique,
    borrows_date DATE,
    borrows_return_date DATE,
    FOREIGN KEY (studens_id)
        REFERENCES studens (studens_id),
    FOREIGN KEY (books_id)
        REFERENCES books (books_id)
);

INSERT INTO category(category_name)
VALUES ('Tự nhiên'),
('Xã Hội'),
('Truyện'),
('Tiểu Thuyết'),
('Khác');


INSERT INTO authors(authors_name)
VALUES ('Nguyễn Thái Học'),
('Trần Mình Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn Minh');

INSERT INTO books(category_id,authors_id,books_tile,books_page_size)
VALUES (1,1,'Toán',45),
(2,2,'Văn',34),
(2,3,'Sử',56),
(2,4,'Địa',76),
(1,5,'Hóa',32);

INSERT INTO studens(studens_name, studens_birthday, studens_class_name)
VALUES ('Nguyễn Văn A', '1999-12-12', 'C0822G1'),
        ('Nguyễn Văn B', '1999-12-13', 'C0822G1'),
        ('Nguyễn Văn C', '1999-12-14', 'C0822G1'),
        ('Nguyễn Văn D', '1999-12-15', 'C0922G1'),
        ('Nguyễn Văn E', '1999-12-16', 'C1022G1');
INSERT INTO borrows(books_id,studens_id,borrows_date,borrows_return_date)
VALUES (1,1,'2022-12-12','2022-12-13'),
(2,2,'2022-12-12','2022-12-15'),
(3,3,'2022-12-12','2022-12-15'),
(4,4,'2022-12-15','2022-12-12'),
(5,1,'2022-12-13','2022-12-15'),
(5,1,'2022-12-14','2022-12-14'),
(4,3,'2022-12-15','2022-12-29'),
(3,3,'2022-12-8','2022-12-14'),
(2,1,'2022-12-6','2022-12-30');

-- + Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả

select b.books_id, b.books_tile, c.category_name,a.authors_name
from books b
join  category c on c.category_id = b.category_id
join authors a on a.authors_id = b.authors_id;



-- + Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z
select s.studens_name, books_tile
from studens s 
join borrows b on b.studens_id = s.studens_id
join books on books.books_id = b.books_id
order by s.studens_name;


-- + Lấy ra  2 quyển sách được mượn nhiều nhất
select books_tile,count(b.books_id) so_luong
from books 
join borrows b on books.books_id = b.books_id
group by b.books_id
order by so_luong desc
limit 2;


-- - Thông kê các đầu sách được mượn nhiều nhất
SELECT 
    b.books_tile, COUNT(b.books_id) AS max
FROM
    books b
        JOIN
    borrows br ON b.books_id = br.books_id
GROUP BY b.books_id
HAVING max IN (SELECT 
        MAX(max)
    FROM
        (SELECT 
            COUNT(b.books_id) AS max, b.books_tile
        FROM
            books b
        JOIN borrows br ON b.books_id = br.books_id
        GROUP BY b.books_id) AS so_luong);

-- - Thông kê các đầu sách chưa được mượn

SELECT books_id,books_tile
FROM books
WHERE books_id NOT IN (SELECT books.books_id
FROM books
JOIN borrows br ON books.books_id = br.books_id);

-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ
SELECT s.studens_name,COUNT(s.studens_id) AS so_luong 
FROM studens s
JOIN borrows b ON s.studens_id = b.studens_id
GROUP BY s.studens_id
ORDER BY so_luong DESC;

--  Lấy ra các học viên mượn sách nhiều nhất của thư viện
SELECT s.studens_name,COUNT(s.studens_id) AS so_luong 
FROM studens s
JOIN borrows b ON s.studens_id = b.studens_id
GROUP BY s.studens_id
HAVING so_luong IN (
SELECT MAX(so_luong) 
FROM (SELECT s.studens_name,COUNT(s.studens_id) AS so_luong 
FROM studens s
JOIN borrows b ON s.studens_id = b.studens_id
GROUP BY s.studens_id) bt
);

-- - Tao index cho cột  title của bảng books
create index books_title on books(books_tile);

--  Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn
CREATE VIEW books_view AS
SELECT b.books_tile,COUNT(b.books_id) AS so_luong
FROM books b
JOIN borrows br ON b.books_id = br.books_id;

-- - Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN
delimiter //
create procedure books_procedure( titlebooks_procedure varchar(50), page_size int, authors_id int, category_id int)
   begin 
   insert into books (books_tile, books_page_size, authors_id, category_id)
   values(books_tile, books_page_size, authors_id, category_id);
   end // 
  delimiter ;
  
call books_procedure ('sinh', 50, 2,1);

