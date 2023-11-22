
create database quan_li_furuma;
use quan_li_furuma;
CREATE TABLE vi_tri (
    ma_vi_tri INT KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45) NOT NULL
);
CREATE TABLE trinh_do (
    ma_trinh_do INT KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45) NOT NULL
);
CREATE TABLE bo_phan (
    ma_bo_phan INT KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45) NOT NULL
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT KEY AUTO_INCREMENT,
    ho_va_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE,
    luong DOUBLE CHECK (luong > 0),
    so_dien_thoai VARCHAR(45) UNIQUE NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45) NOT NULL
);
CREATE TABLE khach_hang (
    ma_khach_hang INT KEY AUTO_INCREMENT,
    ma_loai_khach INT NOT NULL,
    ho_va_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE NOT NULL,
    so_dien_thoai VARCHAR(45) UNIQUE NOT NULL,
    email VARCHAR(45) UNIQUE NOT NULL,
    dia_chi VARCHAR(45),
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45) NOT NULL
);
CREATE TABLE dich_vu (
    ma_dich_vu INT KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue INT NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45) NOT NULL
);
CREATE TABLE hop_dong (
    ma_hop_dong INT KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT KEY AUTO_INCREMENT,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);
INSERT INTO vi_tri (ten_vi_tri)
VALUES
('Quản Lý'),
('Nhân Viên');

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

INSERT INTO nhan_vien (ho_va_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
( 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
( 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
( 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
( 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
( 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
( 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
( 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
( 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
( 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
( 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
INSERT INTO khach_hang (ho_va_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi,ma_loai_khach)
VALUES
( 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng',5),
( 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị',3),
( 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh',1),
( 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng',1),
( 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai',4),
( 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng',4),
( 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh',1),
( 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum',3),
( 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi',1),
( 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng',2);
INSERT INTO kieu_thue (ten_kieu_thue)
VALUES
('year'),
('month'),
('day'),
('hour')
;
INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room')
;
INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)
VALUES
('Villa Beach Front','25000','1000000','10','vip','Có hồ bơi','500','4',null,'3','1'),
('House Princess 01','14000','5000000','7','vip','Có thêm bếp nướng',null,'3',null,'2','2'),
('Room Twin 01','5000','1000000','2','normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp','4','3'),
('Villa No Beach Front','22000','9000000','8','normal','Có hồ bơi','300','3',null,'3','1'),
('House Princess 02','10000','4000000','5','normal','Có thêm bếp nướng',null,'2',null,'3','2'),
('Room Twin 02','3000','900000','2','normal','Có tivi',null,null,'1 Xe máy','4','3')
;
INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
('Karaoke','10000','giờ','tiện nghi , hiện tại'),
('Thuê xe máy','10000','chiếc','hỏng 1 xe'),
('Thuê xe đạp','20000','chiếc','tốt'),
('Buffet buổi sáng','15000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi trưa','90000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi tối','16000','suất','đầy đủ đồ ăn , tráng miệng')
;
INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
('2020-12-08','2020-12-08','0','3','1','3'),
('2020-07-14','2020-07-21','200000','7','3','1'),
('2021-03-15','2021-03-17','50000','3','4','2'),
('2021-01-14','2021-01-18','100000','7','5','5'),
('2021-07-14','2021-07-15','0','7','2','6'),
('2021-06-01','2021-06-03','0','7','7','6'),
('2021-09-02','2021-09-05','100000','7','4','4'),
('2021-06-17','2021-06-18','150000','3','4','1'),
('2020-11-19','2020-11-19','0','3','4','3'),
('2021-04-12','2021-04-14','0','10','3','5'),
('2021-04-25','2021-04-25','0','2','2','1'),
('2021-05-25','2021-05-27','0','7','10','1')
;

INSERT INTO hop_dong_chi_tiet (so_luong, ma_hop_dong, ma_dich_vu_di_kem)
VALUES
('5','2','4'),
('8','2','5'),
('15','2','6'),
('1','3','1'),
('11','3','2'),
('1','1','3'),
('2','1','2'),
('2','12','2')
;


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *from  nhan_vien
WHERE ho_va_ten LIKE 'H%' OR ho_va_ten LIKE 'T%' OR ho_va_ten LIKE 'K%'
and length(ho_va_ten)<=15;



-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *from khach_hang
where  DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), ngay_sinh)),
            '%Y') BETWEEN 18 AND 50
            and dia_chi like '%Đà Nẵng'
            or dia_chi like '%Quảng Trị';
--   - Hàm DATEDIFF sẽ tính số ngày khác nhau giữa ngày hiện tại (NOW) và ngày sinh của khách hàng. 
-- - Hàm FROM_DAYS sẽ tính ra số ngày tương ứng với số ngày khác nhau được tính bằng hàm DATEDIFF ở trên. Ví dụ, nếu số ngày khác nhau là 10000 ngày thì hàm FROM_DAYS sẽ trả về ngày "1973-03-07" 
-- (10000 ngày sau ngày "0000-00-00").
-- - Hàm DATE_FORMAT sẽ định dạng lại giá trị ngày tháng trả về từ hàm FROM_DAYS theo định dạng "%Y" (năm 4 chữ số).

-- Ví dụ, giả sử ngày sinh của một khách hàng là '1990-10-20' và ngày hiện tại là '202	1-09-01', khi đưa vào đoạn mã trên, thì:

-- - Hàm DATEDIFF sẽ tính số ngày khác nhau giữa '2021-09-01' và '1990-10-20' là 11323 ngày.
-- - Hàm FROM_DAYS sẽ trả về ngày "1959-10-23" tương ứng với 11323 ngày.
-- - Hàm DATE_FORMAT sẽ định dạng lại ngày "1959-10-23" theo định dạng "%Y" và trả về giá trị "1959", tức là năm của khách hàng là 1959.


-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.



select 
    khach_hang.ma_khach_hang,
    khach_hang.ho_va_ten,
    loai_khach.ten_loai_khach,
    COUNT(hop_dong.ma_khach_hang) AS count
FROM
    khach_hang
        JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    loai_khach.ten_loai_khach = 'Diamond'
GROUP BY khach_hang.ma_khach_hang
ORDER BY count ASC;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 

SELECT 
    kh.ma_khach_hang,
    kh.ho_va_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (IFNULL(dv.chi_phi_thue, 0) + SUM(IFNULL(hct.so_luong, 0) * IFNULL(dvdk.gia, 0))) AS tong_tien
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hct ON hd.ma_hop_dong = hct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong , kh.ma_khach_hang
ORDER BY kh.ma_khach_hang ASC , hd.ma_hop_dong DESC
;
-- Hiển   thị  ma_dich_vu,   ten_dich_vu,   dien_tich,   chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)

select dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in (
select distinct ma_dich_vu
from hop_dong
where ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');



-- Hiển   thị   thông   tin  ma_dich_vu,   ten_dich_vu,   dien_tich,
-- so_nguoi_toi_da,   chi_phi_thue,   ten_loai_dich_vu  của tất cả các loại
-- dịch vụ đã từng được khách hàng đặt phòng  trong   năm   2020  nhưng
-- chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT DISTINCT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND dv.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2021)
;
-- Hiển thị thông tin  ho_ten  khách hàng  có trong hệ thống, với yêu cầu
-- ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
SELECT DISTINCT ho_va_ten
FROM khach_hang;
SELECT DISTINCT ho_va_ten
FROM khach_hang;

-- Cách 2:

SELECT ho_va_ten
FROM khach_hang
GROUP BY ho_va_ten;

-- Cách 3:

SELECT ho_va_ten
FROM khach_hang
WHERE ma_khach_hang IN (
    SELECT DISTINCT ma_khach_hang
    FROM khach_hang
);
-- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
-- tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt
-- phòng.
SELECT 
    MONTH(ngay_lam_hop_dong) `month`,
    COUNT(ma_hop_dong) so_luong
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = '2021'
GROUP BY month
ORDER BY month;
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
-- dịch   vụ   đi   kèm.   Kết   quả   hiển   thị   bao   gồm  ma_hop_dong,
-- ngay_lam_hop_dong,   ngay_ket_thuc,   tien_dat_coc,
-- so_luong_dich_vu_di_kem  (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(hdct.so_luong)
FROM
    hop_dong hd
         JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong
;
-- Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
-- hàng có ten_loai_khach  là  “Diamond”  và có dia_chi ở “Vinh” hoặc
-- “Quảng Ngãi”.
SELECT 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    kh.ma_khach_hang IN (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
                JOIN
            loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        WHERE
            kh.dia_chi LIKE '%Vinh'
                OR kh.dia_chi LIKE '%Quảng Ngãi'
                AND lk.ten_loai_khach = 'Diamond');
-- Hiển thị thông tin  ma_hop_dong,  ho_ten  (nhân viên),  ho_ten  (khách
-- hàng),  so_dien_thoai  (khách   hàng),  ten_dich_vu,
-- so_luong_dich_vu_di_kem  (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem),  tien_dat_coc  của tất cả các dịch vụ đã từng được
-- khách hàng đặt vào  3   tháng   cuối   năm   2020   nhưng   chưa   từng   được
-- khách hàng đặt vào 6 tháng đầu năm 2021
SELECT 
    hd.ma_hop_dong,
    nv.ho_va_ten,
    kh.ho_va_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    SUM(IFNULL(hdct.so_luong, 0)) AS 'SL'
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE
    MONTH(hd.ngay_lam_hop_dong) BETWEEN 10 AND 12
        AND YEAR(hd.ngay_lam_hop_dong) = 2020
        AND MONTH(hd.ngay_lam_hop_dong) NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 6
                AND YEAR(hd.ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_hop_dong;
-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau)

SELECT 
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS 'SL'
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ten_dich_vu_di_kem
HAVING SUM(hdct.so_luong) IN (SELECT 
        MAX(data.sum)
    FROM
        (SELECT 
            SUM(hdct.so_luong) AS sum
        FROM
            dich_vu_di_kem dvdk
        JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        GROUP BY hdct.ma_dich_vu_di_kem) AS data);


-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
-- lần   duy   nhất.   Thông   tin   hiển   thị   bao   gồm  ma_hop_dong,
-- ten_loai_dich_vu,   ten_dich_vu_di_kem,   so_lan_su_dung  (được tính
-- dựa trên việc count các ma_dich_vu_di_kem)

SET sql_mode = 0;
SELECT 
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS 'So Lan Da Su Dung'
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1
ORDER BY hd.ma_hop_dong;


-- Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được
-- tối đa 3 hợp đồng từ năm 2020 đến 2021.-- 


SELECT 
    nv.ma_nhan_vien,
    nv.ho_va_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.ma_nhan_vien) AS "SL"
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
WHERE
    YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) <= 3
ORDER BY hd.ma_nhan_vien;
