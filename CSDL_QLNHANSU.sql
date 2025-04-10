CREATE DATABASE [QLNHANSU]
USE QLNHANSU
GO
--Tao bang Phong ban
CREATE TABLE [PBAN]
(
	MAPB VARCHAR(5),
	TENPB VARCHAR(50),
	CHUCNANG NVARCHAR(100)
	CONSTRAINT PK_PBAN PRIMARY KEY ([MAPB])
)
--Tạo bảng Thannhan
CREATE TABLE [Thannhan]
(
	ID VARCHAR(5),
	LUONG INT
)
--Tao bang Can bo
CREATE TABLE [CANBO]
(
	MACB VARCHAR(5),
	HOTEN VARCHAR(50),
	NGAYSINH DATE,
	GIOITINH BIT,
	QUEQUAN  VARCHAR(50),
	LUONG INT,
	MAPB VARCHAR(5)
	CONSTRAINT PK_CANBO PRIMARY KEY ([MACB])
)
--Chen du lieu cho bang PBAN
INSERT INTO PBAN VALUES ('HC','Hanh chinh','Phụ trách công việc hành chính')
INSERT INTO PBAN VALUES ('DT','Dao tao','Phụ trách công việc đào tạo')
INSERT INTO PBAN VALUES ('TT','Thanh tra','Thanh kiểm tra CV')
INSERT INTO PBAN VALUES ('TCCB','To chuc can bo','Quản lý hồ sơ')
INSERT INTO PBAN VALUES ('BGH','Ban giam hieu','Lãnh đạo NT')

--Chèn dữ liệu cho bảng CANBO
INSERT INTO CANBO VALUES ('CB001','Nguyen Tuan Anh','19781222',1,'Phu Tho',8000000,'HC')
INSERT INTO CANBO VALUES ('CB002','Hoang Van Tuyen','19790408',1,'Vinh Phuc',7000000,'TT')
INSERT INTO CANBO VALUES ('CB003','Le Thi Yen','19710308',0,'Thai Binh',7500000,'HC')
INSERT INTO CANBO VALUES ('CB004','Tran Thu Ha','19690210',0,'Vinh Phuc',10000000,'TT')
INSERT INTO CANBO VALUES ('CB005','Nguyen Tien Tuc','19701208',1,'Hung Yen',9000000,'DT')
INSERT INTO CANBO VALUES ('CB006','Pham Truon Giang','19820407',1,'Ha Noi',7000000,'HC')
INSERT INTO CANBO VALUES ('CB007','Trinh Xuan Cang','19810201',1,'Vinh Phuc',8000000,'TCCB')
INSERT INTO CANBO VALUES ('CB008','Nong Thi Thoa','19810305',0,'Cao Bang',6000000,'TCCB')
INSERT INTO CANBO VALUES ('CB009','Nguyen Hoa Lien','19821104',0,'Hai Phong',7000000,'DT')
INSERT INTO CANBO VALUES ('CB010','Hoang Thi Cham','19860507',0,'Vinh Phuc',6000000,'TT')
INSERT INTO CANBO VALUES ('CB011','Hoang Phuong Thuy','19820708',0,'Vinh Phuc',7600000,'HC')

--tìm ra mã nv có luogw cb cao nhất 
select Macb 
from CANBO
where luong=(select max(luong) from canbo)

-- lấy ra tuổi của nv có lương cao nhất 
select year(getdate())-year(Ngaysinh) from CANBO
where macb in (select Macb from CANBO 
WHERE luong=(select max(luong) from canbo) ) 

select macb,year(getdate())-year(Ngaysinh) as Tuoi from CANBO
where luong =(select max(luong) from canbo)

-- cách sd biến 
DECLARE @Macb char(5)
select @Macb=macb 
from CANBO where luong = (select max(luong) from canbo) 
	select macb,year(getdate())-year(Ngaysinh) as Tuoi from CANBO
	where macb= @Macb

-- tính lương trung bình của danh sách 
DECLARE @luongtrungbinh int 
DECLARE @tongsocanbo int 
	select @tongsocanbo = count (macb) from canbo 
	select @luongtrungbinh = sum (luong) / @tongsocanbo from canbo 
	print @luongtrungbinh 

DECLARE @luongtrungbinh int 
select @luongtrungbinh = avg(luong) from canbo 
print @luongtrungbinh 

--- câu lệnh if - then 
-- kiểm tra lương của cb có mã CB001 lớn hơn hay nhỏ hơn lương trung bình 
	DECLARE @luongtrungbinh int 
	select @luongtrungbinh = avg(luong) from canbo 
	print @luongtrungbinh 
		declare @Macb1 char(5) = 'CB001'
		declare @luongcb int =0
		select @luongcb =luong from canbo where macb = @macb1 
		print @luongcb 

		if @luongcb > @luongtrungbinh 
		print N'lon hon'
		else 
		print N'nho hon'
	
-- update giá trị tòan bộ bảng lương = lương nhập vào nếu lương nhập vào > lương trung bình, nếu ko lớn hơn chỉ update lương của cán bộ là nữ 
DECLARE @luongtrungbinh int 
DECLARE @tongsocanbo int 
	select @tongsocanbo = count (macb) from canbo 
	select @luongtrungbinh = sum (luong) / @tongsocanbo from canbo 
	print @luongtrungbinh 
declare @luong int = 7000000
if @luong>@luongtrungbinh 
  Begin 
	update CANBO set luong=@luong 
  End 
else 
  begin 
	update CANBO set luong = @luong 
	where gioitinh ='false'
  end 

-- CÂU LỆNH Case 
-- câu lệnh case có 2 định dạng : 
-- Hàm case đơn giản hay còn gọi là Simple CASE 
CASE bieuthuc-dauvao 
	WHEN bieuthuc_1 THEN ketqua_1
	WHEN bieuthuc_2 THEN ketqua_2
	...
	WHEN bieuthuc_n THEN ketqua_n 
ELSE ketqua_khac
END 

--VD1 Đưa ra ds cán bộ, nếu giơi stisnh là 1 ghi nam, 0 ghi nữ 
select macb, Gtinh = case 
	when gioitinh= 1 then 'Nam' 
	when gioitinh= 0 then 'Nu' 
end 
from canbo 

--VD2 Đưa ra tên đầy đủ với Mr nếu giới tính là 1, Mrs nếu giới tính là 0, và giữ nguyên với giá trị khác 
select macb, fullname = case gioitinh 
	when 1 then'Mr ' + HOTEN
	when 0 then 'Mrs ' + Hoten 
	else HOTEN 
end 
from canbo 

--VD3 Đưa ra cột thuế với các điều kiện tương ứng 
Select macb, Hoten, Luong, Thue=case
	when Luong between 0 and 3600000 then Luong *.24
	when Luong between 3600000 and 4500000 then Luong *.28
	when Luong between 4500000 and 7500000 then Luong *.30
	when Luong between 7500000 and 15000000 then Luong *.32
else Luong*.40 
end 
from canbo 

-- câu lệnhcase trong câu lệnh order by 
select macb, hoten, mapb 
from Canbo 
order by case 
	when mapb ='DT' then 1
	when mapb = 'TT' then 2 
	when mapb = 'TCCB' then 3 
	else 4 
	end 

-- vòng lặp WHILE ( WHILE LOOP) được sử dụng nếu muốn chạy 
-- lặp đi lặp lại một đoạn mã khi điều kiện cho trước 
-- trả về giá trị TRUE 
cú pháp 
WHILE dieukien / * các câu lệnh lặp  * / 
BEGIN 
{ .... câu lệnh thực thi khi điều kiện là TRUE ..... } 
END; 

--VD : CHèn dữ liệu tự động cho bảng Nhanthan ( Id, luong ) 
Declare @i int =0 
declare @n int = 10 
while @i <= @n 
	begin 
	  insert into thannhan values (@i, 1000+@i) 
	  set @i +=1
	  end 

select *from thannhan 