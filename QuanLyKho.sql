﻿CREATE DATABASE [QuanLyKhoHang]
USE QuanLyKhoHang

-- Tao bang phan loai
CREATE TABLE [PHANLOAI]
(
	MALOAI VARCHAR(5) PRIMARY KEY,
	TENLOAI  VARCHAR(50)
)

--Tao bang Nha cung cap
CREATE TABLE [NHACC]
(
	MANCC CHAR(5) PRIMARY KEY,
	TENNCC VARCHAR(50),
	DIACHI VARCHAR(50),
	DIENTHOAI VARCHAR(20) DEFAULT 'Chua co'
)

--Tao bang Khach hang
CREATE TABLE [KHACHHANG]
(
	MAKH CHAR(5) PRIMARY KEY,
	TENKH VARCHAR(50),
	DIACHI VARCHAR(50),
	DIENTHOAI VARCHAR(20) DEFAULT 'Chua co'
)

--Tao bang Hang hoa
CREATE TABLE [HANGHOA]
(
	MAHH CHAR(5) PRIMARY KEY,
	TENHH VARCHAR(50),
	DVT VARCHAR(10) DEFAULT '',
	MALOAI VARCHAR(5),
)

--Tao bang Bao gia
CREATE TABLE [BAOGIA]
(
	MANCC CHAR(5),
	MAHH CHAR(5),
	GIABAN MONEY,
	CONSTRAINT PRK_BAOGIA PRIMARY KEY(MANCC,MAHH),
	CONSTRAINT CHK_BAOGIA CHECK (GIABAN>0)
)

--Tao bang Cung cap
CREATE TABLE [CUNGCAP]
(
	MANCC CHAR(5),
	MAHH CHAR(5),
	NGAY DATE,
	SOLUONG INT
	CONSTRAINT PRK_CUNGCAP PRIMARY KEY (MANCC,MAHH),
	CONSTRAINT CHK_CUNGCAP CHECK (SOLUONG>0)
)

--Tao bang Hoa don ban
CREATE TABLE [HOADONBAN]
(
	MAHD CHAR(5) PRIMARY KEY,
	MAKH CHAR(5),
	MAHH CHAR(5),
	NGAY DATETIME DEFAULT GETDATE(),
	SOLUONG INT,
	DONGIA MONEY
)

--Nhap du lieu cho cac bang
--Nhap dl bang PHANLOAI
INSERT INTO PHANLOAI VALUES ('DAS','Do an san')
INSERT INTO PHANLOAI VALUES ('BK','Banh Keo')
INSERT INTO PHANLOAI VALUES ('RC','Rau cu')
INSERT INTO PHANLOAI VALUES ('TC','Trai Cay')
INSERT INTO PHANLOAI VALUES ('THST','Thit - Hai san tươi')
INSERT INTO PHANLOAI VALUES ('DDL','Do dong lanh')
INSERT INTO PHANLOAI VALUES ('TPAL','Thuc pham an lien')
INSERT INTO PHANLOAI VALUES ('GV','Gia vi')
INSERT INTO PHANLOAI VALUES ('BB','Banh bao')
INSERT INTO PHANLOAI VALUES ('XXGC','Xuc xich - Gio cha')
INSERT INTO PHANLOAI VALUES ('EGG','Trung')
INSERT INTO PHANLOAI VALUES ('MILK','Sua tươi')
INSERT INTO PHANLOAI VALUES ('SC','Sữa chua')
INSERT INTO PHANLOAI VALUES ('NC','Nuoc')

--Nhap dl bang Nha cung cap
INSERT INTO NHACC VALUES ('CC001','Ofood','Han Quoc','0954214387')
INSERT INTO NHACC VALUES ('CC002','Vinamilk','Viet Nam',default)
INSERT INTO NHACC VALUES ('CC003','TH TRue Milk','Viett Nam','0968120979')
INSERT INTO NHACC VALUES ('CC004','Cosy','Viet Nam','0978154223')
INSERT INTO NHACC VALUES ('CC005', 'Nestlé', 'Thuy Si', '0987654321');
INSERT INTO NHACC VALUES ('CC006', 'Coca-Cola', 'My', '0912345678');
INSERT INTO NHACC VALUES ('CC007', 'Unilever', 'Viet Nam', '0901234567');
INSERT INTO NHACC VALUES ('CC009', 'Viet Farm', 'Viet Nam', '0990654321');
INSERT INTO NHACC VALUES ('CC008', 'PepsiCo', 'My', '0987654321');
INSERT INTO NHACC VALUES ('CC010', 'Thuc Pham Xanh', 'Viet Nam', '0901234567');
INSERT INTO NHACC VALUES ('CC011', 'Banh Keo Ngoc Anh', 'Viet Nam', '0912345678');
INSERT INTO NHACC VALUES ('CC012', 'Che Thai Nguyen', 'Viet Nam', '0923456789');
INSERT INTO NHACC VALUES ('CC013', 'Nong San Bao Loc', 'Viet Nam', '0934567890');
INSERT INTO NHACC VALUES ('CC014', 'Thuy Hai San Dong Lanh', 'Viet Nam', '0945678901');
INSERT INTO NHACC VALUES ('CC015', 'Nuoc Giai Khat Thai Anh', 'Viet Nam', '0956789012');

--Nhap dl bang Khach hang
INSERT INTO KHACHHANG VALUES ('KH001','Tran Tuan Anh','Ha Noi','0978154223')
INSERT INTO KHACHHANG VALUES ('KH002','Hoang Van The','Vinh Phuc','0978154223')
INSERT INTO KHACHHANG VALUES ('KH003','Nguyen Thi Huong','Vinh Phuc','0978154223')
INSERT INTO KHACHHANG VALUES ('KH004','Doan Tien Dat','Ha Noi','0978154223')
INSERT INTO KHACHHANG VALUES ('KH005','Le Hai Yen','Thai Binh','0978154223')
INSERT INTO KHACHHANG VALUES ('KH006','Tran Duc Thu','Thai Binh','0978154223')
INSERT INTO KHACHHANG VALUES ('KH007','Ma Vu Binh','Tuyen Quang','0978154223')
INSERT INTO KHACHHANG VALUES ('KH008','Do Duy Tung','Nam Dinh','0978154223')
INSERT INTO KHACHHANG VALUES ('KH009', 'Nguyen Van A', 'Da Nang', '0912345678');
INSERT INTO KHACHHANG VALUES ('KH010', 'Tran Thi B', 'Bac Ninh', '0923456789');
INSERT INTO KHACHHANG VALUES ('KH011', 'Nguyen Van B', 'Ha Noi', '0834567890');
INSERT INTO KHACHHANG VALUES ('KH012', 'Tran Thai C', 'Đa Nang', '0912345678');
INSERT INTO KHACHHANG VALUES ('KH013', 'Le Van D', 'TP.HCM', '0945678910');

--Nhap dl bang Hang hoa
INSERT INTO HANGHOA VALUES ('M0001','Sua Vinamilk 100% khong duong 1L','Hop','MILK')
INSERT INTO HANGHOA VALUES ('BK001','Banh que Cosy vi socola','Hop','BK')
INSERT INTO HANGHOA VALUES ('SC001','Sua chua vi nha dam ','Hop','SC')
INSERT INTO HANGHOA VALUES ('TPAL1','Kim tri Han Quoc','Goi','TPAL')
INSERT INTO HANGHOA VALUES ('BK002', 'Bánh quy Oreo', 'Gói', 'BK');
INSERT INTO HANGHOA VALUES ('NC001', 'Nuoc ngot Coca Cola', 'Lon', 'NC');
INSERT INTO HANGHOA VALUES ('M0002','Sua TH TRue Milk vi socola','Loc','MILK')
INSERT INTO HANGHOA VALUES ('M0003', 'Bánh mì', 'Bánh', 'DAS');
INSERT INTO HANGHOA VALUES ('M0004', 'Kem Vinamilk', 'Hộp', 'DAB');
INSERT INTO HANGHOA VALUES ('MC001', 'Dua leo baby 500g', 'Hop', 'RC');
INSERT INTO HANGHOA VALUES ('M0009', 'Banh Keo Ngoc Anh', 'Goi', 'BK');
INSERT INTO HANGHOA VALUES ('M0013', 'Che Thai Nguyen', 'Goi', 'TC');
INSERT INTO HANGHOA VALUES ('M0011', 'Nong San Bao Loc', 'Hop', 'RC');
INSERT INTO HANGHOA VALUES ('M0012', 'Nuoc Tra Xanh', 'Lon', 'NC');
--Nhap dl bang Bao gia
INSERT INTO BAOGIA VALUES ('CC001','TPAL1',40000)
INSERT INTO BAOGIA VALUES ('CC002','M0001',35000)
INSERT INTO BAOGIA VALUES ('CC003','MILK1',39000)
INSERT INTO BAOGIA VALUES ('CC004','BK001',10900)
INSERT INTO BAOGIA VALUES ('CC002','SC001',30000)
INSERT INTO BAOGIA VALUES ('CC005', 'BK002', 25000);
INSERT INTO BAOGIA VALUES ('CC006', 'NC001', 15000);
INSERT INTO BAOGIA VALUES ('CC007', 'M0003', 15000);
INSERT INTO BAOGIA VALUES ('CC008', 'M0004', 20000);
INSERT INTO BAOGIA VALUES ('CC009', 'SC001', 30000);
INSERT INTO BAOGIA VALUES ('CC011', 'M0009', 25000);  
INSERT INTO BAOGIA VALUES ('CC012', 'M0013', 30000);  
INSERT INTO BAOGIA VALUES ('CC013', 'M0011', 35000);  
INSERT INTO BAOGIA VALUES ('CC015', 'M0012', 20000);  

--Nhap dl bang Cung cap
INSERT INTO CUNGCAP VALUES ('CC002','M0001','20190211',30)
INSERT INTO CUNGCAP VALUES ('CC004','BK001','20199228',60)
INSERT INTO CUNGCAP VALUES ('CC001','TPAL1','20200211',20)
INSERT INTO CUNGCAP VALUES ('CC003','MILK1','20190201',35)
INSERT INTO CUNGCAP VALUES ('CC005', 'BK002', '2024-09-01', 50);
INSERT INTO CUNGCAP VALUES ('CC006', 'NC001', '2024-09-02', 100);
INSERT INTO CUNGCAP VALUES ('CC007', 'M0003', '2024-09-11', 100);
INSERT INTO CUNGCAP VALUES ('CC008', 'M0004', '2024-09-13', 150);
INSERT INTO CUNGCAP VALUES ('CC009', 'SC001', '2024-07-13', 130);
INSERT INTO CUNGCAP VALUES ('CC011', 'M0009', '2024-09-01', 100);  
INSERT INTO CUNGCAP VALUES ('CC012', 'M0013', '2024-09-02', 150);  
INSERT INTO CUNGCAP VALUES ('CC013', 'M0011', '2024-09-03', 200);  
INSERT INTO CUNGCAP VALUES ('CC015', 'M0012', '2024-09-04', 80);   
--Nhap bang Hoa don ban
INSERT INTO HOADONBAN VALUES ('HD001','KH001','M0001','2020-02-11',2,35000)
INSERT INTO HOADONBAN VALUES ('HD002','KH002','BK001','2020-02-11',3,32700)
INSERT INTO HOADONBAN VALUES ('HD003','KH003','MILK1','2019-02-11',7,39000)
INSERT INTO HOADONBAN VALUES ('HD004','KH004','BK001','2019-02-11',4,10900)
INSERT INTO HOADONBAN VALUES ('HD005', 'KH009', 'BK002', '2024-09-11', 5, 25000);
INSERT INTO HOADONBAN VALUES ('HD006', 'KH010', 'NC001', '2024-09-12', 10, 15000);
INSERT INTO HOADONBAN VALUES ('HD007', 'KH007', 'M0003', '2024-09-04', 3, 15000);
INSERT INTO HOADONBAN VALUES ('HD008', 'KH008', 'M0004', '2024-09-12', 5, 20000);
INSERT INTO HOADONBAN VALUES ('HD009', 'KH005', 'TPAL1', '2023-10-15', 12, 40000);
INSERT INTO HOADONBAN VALUES ('HD010', 'KH005', 'SC001', '2023-11-17', 8, 30000);

INSERT INTO HOADONBAN VALUES ('HD015', 'KH011', 'M0009', '2024-09-05', 5, 25000);  
INSERT INTO HOADONBAN VALUES ('HD012', 'KH012', 'M0013', '2024-09-06', 3, 30000);  
INSERT INTO HOADONBAN VALUES ('HD013', 'KH013', 'M0011', '2024-09-07', 2, 35000);  
INSERT INTO HOADONBAN VALUES ('HD014', 'KH011', 'M0012', '2024-09-08', 4, 20000);  

INSERT INTO HOADONBAN VALUES ('HD016', 'KH001', 'M0001', '2020-02-11', 3, 35000);  
INSERT INTO HOADONBAN VALUES ('HD017', 'KH002', 'BK001', '2020-02-11', 5, 32700);  
INSERT INTO HOADONBAN VALUES ('HD018', 'KH003', 'M0002', '2020-02-11', 4, 39000);  
INSERT INTO HOADONBAN VALUES ('HD019', 'KH004', 'BK002', '2020-02-11', 2, 25000);  
INSERT INTO HOADONBAN VALUES ('HD020', 'KH005', 'NC001', '2020-02-11', 6, 15000);  
-----------------------------------------------------------------------------------------------
UPDATE HANGHOA
SET TENHH = 'Sua Vinamilk 100%'
WHERE MAHH = 'M0010';








