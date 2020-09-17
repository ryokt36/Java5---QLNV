Create Database SOF302_QLNV

If OBJECT_ID('TaiKhoan') is not null
	Drop table TaiKhoan
Go
Create table TaiKhoan
(
	TenDangNhap	 Varchar(50)  NOT NULL,
	MatKhau		 Varchar(50)  NULL,
	Quyen		 Nvarchar(50) NULL,
	HoTen		 Nvarchar(50) NULL,
	Constraint PK_TaiKhoan	Primary key(TenDangNhap)
)
Go

If OBJECT_ID('PhongBan') is not null
	Drop table PhongBan
Go
Create table PhongBan
(	
	MaPhongBan	INT IDENTITY, 
	TenPhongBan	 Nvarchar(50) NULL,
	Constraint PK_PhongBan	Primary key(MaPhongBan),
)
Go

If OBJECT_ID('NhanVien') is not null
	Drop table NhanVien
Go
Create table NhanVien
(	
	MaNhanVien	 INT IDENTITY,
	HoTen		 Nvarchar(50)  NULL,
	GioiTinh	 BIT  NULL,
	HinhAnh		 Varchar(50)   NULL,
	NgaySinh	 Date		   NULL,
	Luong		 INT		   NULL,
	CapDo		 INT		   NULL,
	Email		 Varchar(50)   NULL,
	SDT			 Varchar(20)   NOT NULL,
	GhiChu		 Nvarchar(200) NULL,
	MaPhongBan	 INT  NOT NULL,
	Constraint PK_NhanVien	Primary key(MaNhanVien),
	Constraint FK_PhongBan_NhanVien Foreign key(MaPhongBan)
	References PhongBan
)
Go

If OBJECT_ID('GhiNhan') is not null
	Drop table GhiNhan
Go
Create table GhiNhan
(
	MaGhiNhan	 INT IDENTITY,
	Loai		 BIT		   NULL,
	LyDo		 Nvarchar(200) NULL,
	NgayGhiNhan	 Date		   NULL,
	MaNhanVien	 INT,
	Constraint PK_GhiNhan	Primary key(MaGhiNhan),
	Constraint FK_NhanVien_GhiNhan Foreign key(MaNhanVien)
	References NhanVien
)
Go

insert into TaiKhoan values('def','abc','abcd')
DBCC CHECKIDENT ('PhongBan', RESEED, 0) --Reset Identity
select * from TaiKhoan
select * from PhongBan
select * from NhanVien
select * from GhiNhan
--Phòng ban
DBCC CHECKIDENT ('PhongBan', RESEED, 0) --Reset Identity
delete from PhongBan
Insert into PhongBan values(N'IT')
Insert into PhongBan values(N'Marketing')
Insert into PhongBan values(N'Tài chính')
Insert into PhongBan values(N'Lễ tân')

--Nhân viên
delete from NhanVien
DBCC CHECKIDENT ('NhanVien', RESEED, 0) --Reset Identity
Insert into NhanVien values(N'Nguyễn Phi Long', 1, '', '08-10-1989', 20000000, 7, 'longnp@gmail.com', '0352362540','','1')
Insert into NhanVien values(N'Lưu Hoàng Long', 1, '', '08-14-2002', 20000000, 7, 'longlh@gmail.com', '0351234567','','1')
Insert into NhanVien values(N'Phạm Khắc Thanh', 1, '', '01-11-1978', 20000000, 7, 'thanhpk@gmail.com', '0357894561','','1')
Insert into NhanVien values(N'Doãn Ngọc Toản', 1, '', '02-03-1995', 5000000, 1, 'toandn@gmail.com', '0351234578','','2')
Insert into NhanVien values(N'Đinh Thu Phương', 0, '', '08-01-1992', 9000000, 4, 'phuongdt@gmail.com', '0354122365','','2')
Insert into NhanVien values(N'Nguyễn Ngọc Minh', 1, '', '09-11-1992', 20000000, 7, 'minhnn@gmail.com', '0355698745','','2')
Insert into NhanVien values(N'Dương Minh Anh', 0, '', '01-11-1984', 15000000, 6, 'anhdm@gmail.com', '0356548975','','3')
Insert into NhanVien values(N'Trần Tiến Minh', 1, '', '11-20-1991', 17000000, 6, 'minhtt@gmail.com', '0356814598','','3')
Insert into NhanVien values(N'Nguyễn Quốc Khánh', 1, '', '12-23-2001', 6000000, 1, 'khanhnq@gmail.com', '0353216549','','4')
Insert into NhanVien values(N'Phạm Đức Thuận', 1, '', '08-03-1965', 9000000, 4, 'thuanpt@gmail.com', '0354587965','','4')
Insert into NhanVien values(N'Trần Mỹ Hạnh', 0, '', '10-19-1973', 12000000, 5, 'hanhtm@gmail.com', '0357896542','','4')

--Ghi nhận
delete from GhiNhan
DBCC CHECKIDENT ('GhiNhan', RESEED, 0) --Reset Identity
Insert into GhiNhan values(1, N'Hoàn thành tốt dự án', '02-17-2020','1')
Insert into GhiNhan values(1, N'Hoàn thành tốt dự án', '02-17-2020','2')
Insert into GhiNhan values(1, N'Hoàn thành tốt dự án', '02-17-2020','3')
Insert into GhiNhan values(1, N'Chiến lược Marketing thành công', '02-02-2020','4')
Insert into GhiNhan values(1, N'Chiến lược Marketing thành công', '02-02-2020','5')
Insert into GhiNhan values(1, N'Chiến lược Marketing thành công', '02-02-2020','6')
Insert into GhiNhan values(1, N'Thống kê minh bạch thu chi', '02-09-2020','7')
Insert into GhiNhan values(1, N'Tận tâm với khách hàng', '02-09-2020','8')
Insert into GhiNhan values(1, N'Tận tâm với khách hàng', '02-09-2020','9')
Insert into GhiNhan values(1, N'Tận tâm với khách hàng', '02-09-2020','11')
Insert into GhiNhan values(0, N'Tận tâm với khách hàng', '02-09-2020','11')
Insert into GhiNhan values(0, N'Tận tâm với khách hàng', '02-09-2020','11')
Insert into GhiNhan values(1, N'Tận tâm với khách hàng', '02-09-2020','1')

--Tài khoản
delete from TaiKhoan
Insert into TaiKhoan values('admin','admin','admin',N'Lưu Hoàng Long')
Insert into TaiKhoan values('nv1','123','user',N'Phạm Khắc Thanh')
select TOP 10 Nhanvien.MaNhanVien, HoTen, HinhAnh, TenPhongBan, (SUM(case Loai when 1 then 1 else 0 end) - SUM(case Loai when 0 then 1 else 0 end)) as 'Diem'
from NhanVien left outer join GhiNhan on GhiNhan.MaNhanVien = NhanVien.MaNhanVien left outer join PhongBan on NhanVien.MaPhongBan = PhongBan.MaPhongBan
Group by Nhanvien.MaNhanVien,HoTen, HinhAnh,TenPhongBan
order by Diem DESC

select TOP(10) Nhanvien.MaNhanVien,NhanVien.HoTen,NhanVien.GioiTinh,NhanVien.HinhAnh,NhanVien.NgaySinh,NhanVien.Luong,NhanVien.CapDo,NhanVien.Email,NhanVien.SDT,NhanVien.GhiChu,NhanVien.MaPhongBan
from NhanVien left outer join GhiNhan on GhiNhan.MaNhanVien = NhanVien.MaNhanVien left outer join PhongBan on NhanVien.MaPhongBan = PhongBan.MaPhongBan
Group by Nhanvien.MaNhanVien,NhanVien.HoTen,NhanVien.GioiTinh,NhanVien.HinhAnh,NhanVien.NgaySinh,NhanVien.Luong,NhanVien.CapDo,NhanVien.Email,NhanVien.SDT,NhanVien.GhiChu,NhanVien.MaPhongBan
order by (SUM(case Loai when 1 then 1 else 0 end) - SUM(case Loai when 0 then 1 else 0 end)) DESC

Select * from TaiKhoan
Select * from NhanVien
Select * from PhongBan
Select * from GhiNhan

select hoten from taikhoan where tendangnhap like 'admin'