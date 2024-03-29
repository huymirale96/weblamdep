﻿create table tblBinhLuan
(
imabinhluan int IDENTITY(1,1) NOT NULL PRIMARY KEY,
imabaiviet int not null,
shoten nvarchar(50),
semail nvarchar(50),
snoidung nvarchar(200),
dthoigian datetime

)

alter table tblBinhLuan add constraint fk_binhlaun
Foreign key (imabaiviet) references tblBaiViet (imabaiviet)

s
alter proc sp_thembinhluan  --ok
@hoten nvarchar(50),
@noidung nvarchar(200),
@email nvarchar(150),
@thoigian datetime,
@mabaiviet int
as
insert into tblbinhluan (shoten, semail, snoidung, dthoigian, imabaiviet)
values(@hoten, @email, @noidung, @thoigian,@mabaiviet);
  
create proc sp_xembinhluan
@id int
as
select * from tblbinhluan where imabaiviet = @id
  



USE [master]
GO
/****** Object:  Database [webTinTuc1]    Script Date: 15/10/2020 8:18:53 PM ******/
CREATE DATABASE [webTinTuc1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webTinTuc1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\webTinTuc1.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webTinTuc1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\webTinTuc1_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [webTinTuc1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webTinTuc1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webTinTuc1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webTinTuc1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webTinTuc1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webTinTuc1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webTinTuc1] SET ARITHABORT OFF 
GO
ALTER DATABASE [webTinTuc1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [webTinTuc1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [webTinTuc1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webTinTuc1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webTinTuc1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webTinTuc1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webTinTuc1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webTinTuc1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webTinTuc1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webTinTuc1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webTinTuc1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [webTinTuc1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webTinTuc1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webTinTuc1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webTinTuc1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webTinTuc1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webTinTuc1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webTinTuc1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webTinTuc1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webTinTuc1] SET  MULTI_USER 
GO
ALTER DATABASE [webTinTuc1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webTinTuc1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webTinTuc1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webTinTuc1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [webTinTuc1]
GO
/****** Object:  StoredProcedure [dbo].[checkAcccount]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[checkAcccount]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	select * from tblNguoiDung where spass = @matkhau and susername = @TaiKhoan;
GO
/****** Object:  StoredProcedure [dbo].[get_thongtintaikhoan]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thongtintaikhoan]
	@Taikhoan nvarchar(255),
	@Matkhau nvarchar(255)
as
	begin
		select * from tblNguoiDung
		where susername like @Taikhoan and spass = @Matkhau
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_BaiViet]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_BaiViet]
@tieude nvarchar(150),
@noidung nvarchar(800),
@mota nvarchar(150),
@ngaydang datetime,
@manguoidang int,
@maLoaiBai int,
@urlanh varchar(100)
as
insert into tblBaiViet (stieude,snoidung,smota,dngaydang,imanguoidang, iMaLoaiBai,surlanh)
values(@tieude,@noidung,@mota,@ngaydang,@manguoidang,@maLoaiBai,@urlanh);
GO
/****** Object:  StoredProcedure [dbo].[select_Baibao_daduyet]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_Baibao_daduyet]
 as
 select * from tblBaiViet,tblLoaiBai where tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai
 and bduyet = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoSoLanXem]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[sp_baoCaoSoLanXem]
  as
  select * from tblbaiviet order by ilanxem DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoSoLuongBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_baoCaoSoLuongBai]
  as
  select tblNguoiDung.shoten, isnull(count(tblBaiViet.iMaBaiViet),0) as soBai from tblBaiViet right join tblNguoiDung on tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung
  group by tblNguoiDung.shoten
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatTenLoaiBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[sp_capNhatTenLoaiBai]
  @ten nvarchar(20),
  @id int
  as
 update tblLoaiBai set stenloaibai = @ten where iMaLoaiBai = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_capnhattk]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_capnhattk]
@id int,
@ten nvarchar(35),
@gt bit,
@maquyen int,
@dt varchar(20),
@mail varchar(20)
as
update tblNguoiDung set shoten = @ten,bGioiTinh = @gt,iMaQuyen = @maquyen,sSDT = @dt,sEmail= @mail
where iMaNguoiDung = @id

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSach4BaiVietMoiNhat]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[sp_danhSach4BaiVietMoiNhat]
  as
  select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 order by dngaydang DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachBaiVietTheoID]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_danhSachBaiVietTheoID]
  @id int
  as
  select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblLoaiBai.iMaLoaiBai = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachBaiVietTimKiem]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_danhSachBaiVietTimKiem]
   @tutimkiem nvarchar(40)
   as
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.stieude like '%' + @tutimkiem + '%'
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachBaiVietTop4]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhSachBaiVietTop4]
  as
  select top 4 * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 order by tblBaiViet.ilanxem DESC

GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachLoaiBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_danhSachLoaiBai]
  as
  select * from tblLoaiBai
GO
/****** Object:  StoredProcedure [dbo].[sp_DuyetBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DuyetBai]
	@idBai int,
	@idNguoiDung int,
	@thoigian datetime
	as
	declare @tt bit
	set @tt = (select bduyet from tblBaiViet  where iMaBaiViet = @idBai)
	print(@tt)
	if(@tt = 1)
	begin
	update tblBaiViet set imanguoiDuyet = @idNguoiDung, bduyet = 0,dngayduyet = @thoigian where iMaBaiViet = @idBai
	end 

	else 
	begin
	update tblBaiViet set imanguoiDuyet = @idNguoiDung, bduyet = 1,dngayduyet = @thoigian where iMaBaiViet = @idBai
	end 

GO
/****** Object:  StoredProcedure [dbo].[sp_themBaiViet]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[sp_themBaiViet]
  @smota nvarchar(150),
  @stieude nvarchar(150),
  @snoidung nvarchar(max),
  @imanguoidang int,
  @imaloaibai int,
  @surlanh varchar(30),
  @dngaydang datetime
  as
  insert into tblBaiViet (smota,snoidung, stieude, surlanh, iMaLoaiBai, iMaNguoiDang, dngaydang) values
  (@smota,@snoidung,@stieude,@surlanh,@imaloaibai,@imanguoidang,@dngaydang)
GO
/****** Object:  StoredProcedure [dbo].[sp_themLoaiBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_themLoaiBai]
  @loaiBai nvarchar(20)
  as
  insert into tblLoaiBai (stenloaibai) values (@loaiBai)
GO
/****** Object:  StoredProcedure [dbo].[sp_themtk]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themtk]
@user nvarchar(30),
@pass nvarchar(100),
@ten nvarchar(35),
@gt bit,
@maquyen int,
@dt varchar(20),
@mail varchar(20)
as
insert into tblNguoiDung (susername,spass,shoten,bGioiTinh,iMaQuyen,sSDT,sEmail) values
(@user,@pass,@ten,@gt,@maquyen,@dt,@mail)
GO
/****** Object:  StoredProcedure [dbo].[sp_xemBaiVietCungLoai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     create proc [dbo].[sp_xemBaiVietCungLoai]
   @id int
   as
   declare @maLoai int
   set @maLoai = (select iMaLoaiBai from tblBaiViet where iMaBaiViet = @id)

   select  top 5 * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.iMaLoaiBai = @maLoai
GO
/****** Object:  StoredProcedure [dbo].[sp_xemBaiVietID]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_xemBaiVietID]
   @id int
   as
   update tblBaiViet set ilanxem = ilanxem + 1 where iMaBaiViet = @id
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
   tblBaiViet.bduyet = 1 and tblBaiViet.iMaBaiViet = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xemdanhsachbaidang]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[sp_xemdanhsachbaidang]
  as
  select * from tblBaiViet, tblLoaiBai, tblNguoiDung where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai 
  order by dngaydang DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_xemdanhsachbaidangbyidnguoidung]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_xemdanhsachbaidangbyidnguoidung]
	@idnguoidung int
  as
  select * from tblBaiViet, tblLoaiBai, tblNguoiDung where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and tblBaiViet.iMaNguoiDang = @idnguoidung

GO
/****** Object:  StoredProcedure [dbo].[sp_xemtheoloai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE proc [dbo].[sp_xemtheoloai]
   @id int
   as
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
 tblLoaiBai.iMaLoaiBai =  @id order by iThuTuUuTienTheoLoaiBai asc
GO
/****** Object:  StoredProcedure [dbo].[sp_xemtheotentimkiem]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_xemtheotentimkiem]
   @ten nvarchar(30)
   as
   select * from tblBaiViet, tblNguoiDung, tblLoaiBai 
  where tblBaiViet.iMaNguoiDang = tblNguoiDung.iMaNguoiDung and tblBaiViet.iMaLoaiBai = tblLoaiBai.iMaLoaiBai and
 tblBaiViet.stieude like '%' +  @ten +'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaBaiDang]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_XoaBaiDang]
  @id int
  as
  delete from tblLoaiBai where iMaLoaiBai = @id
GO
/****** Object:  StoredProcedure [dbo].[update_BaiViet]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_BaiViet]
@maBai int,
@stieude nvarchar(150),
@snoidung nvarchar(max),
@smota nvarchar(150),
@imaLoaiBai int,
@surlanh varchar(150)
as
update tblBaiViet set stieude = @stieude, snoidung = @snoidung , smota = @smota,
 iMaLoaiBai = @imaLoaiBai, surlanh = @surlanh
where iMaBaiViet = @maBai
GO
/****** Object:  StoredProcedure [dbo].[update_BaiViet_khongAnh]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_BaiViet_khongAnh]
@maBai int,
@stieude nvarchar(150),
@snoidung nvarchar(max),
@smota nvarchar(150),
@imaloaibai int
as
update tblBaiViet set stieude = @stieude, snoidung = @snoidung , smota = @smota,
 iMaLoaiBai = @imaloaibai where iMaBaiViet = @maBai
GO
/****** Object:  StoredProcedure [dbo].[updatePassWord]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create proc [dbo].[updatePassWord]
	@matkhau nvarchar(255),
	@TaiKhoan nvarchar(255)
	as
	update tblNguoiDung set spass = @matkhau where susername = @TaiKhoan;
GO
/****** Object:  Table [dbo].[tblBaiViet]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBaiViet](
	[iMaBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[stieude] [nvarchar](150) NULL,
	[bduyet] [bit] NULL,
	[ilanxem] [int] NULL,
	[dngaydang] [datetime] NULL,
	[iMaNguoiDang] [int] NULL,
	[dngayduyet] [datetime] NULL,
	[imanguoiDuyet] [int] NULL,
	[btrangthai] [bit] NULL,
	[iMaLoaiBai] [int] NOT NULL,
	[smota] [nvarchar](150) NULL,
	[snoidung] [nvarchar](max) NULL,
	[surlanh] [varchar](150) NULL,
	[iThuTuUuTienTheoLoaiBai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLoaiBai]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiBai](
	[iMaLoaiBai] [int] IDENTITY(1,1) NOT NULL,
	[stenloaibai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiBai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNguoiDung]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNguoiDung](
	[iMaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[susername] [nvarchar](35) NULL,
	[spass] [nvarchar](100) NULL,
	[shoten] [nvarchar](35) NULL,
	[bGioiTinh] [bit] NULL,
	[iMaQuyen] [int] NOT NULL,
	[sSDT] [varchar](20) NULL,
	[sEmail] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblquyen]    Script Date: 15/10/2020 8:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblquyen](
	[iMaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[stenQuyen] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblBaiViet] ON 

INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (1, N'Cách Trị Nám Bằng Khoai  Tây', 1, 9, CAST(0x0000AC4D01439BF6 AS DateTime), 1, CAST(0x0000AC4D014BCA9F AS DateTime), 3, 1, 1, N'Trong thời gian gần đây, nhiều chị em lo ngại việc sử dụng các phương pháp trị nám công nghệ cao có thể khiến cho da bị tổn thương để lại nhiều di chứ', N'<h2><strong>C&aacute;ch trị n&aacute;m t&agrave;n nhang bằng khoai t&acirc;y</strong></h2>

<p><em><strong>Nguy&ecirc;n liệu cần chuẩn bị :</strong></em></p>

<p>&ndash; 1 củ khoai t&acirc;y</p>

<p>&ndash; 3 th&igrave;a c&agrave; ph&ecirc; nước cốt chanh</p>

<p>&ndash; Khay đ&aacute; sạch</p>

<p><em><strong>C&aacute;ch l&agrave;m:</strong></em></p>

<p>&ndash; Khoai t&acirc;y chọn củ tươi, kh&ocirc;ng mọc mầm rồi rửa sạch, gọt vỏ v&agrave; th&aacute;i th&agrave;nh c&aacute;c miếng nhỏ.</p>

<p>&ndash; Cho khoai t&acirc;y v&agrave;o m&aacute;y xay sinh tố để xay nhuyễn.</p>

<p>&ndash; Cho nước cốt chanh v&agrave;o v&agrave; xay nhuyễn c&ugrave;ng khoai t&acirc;y tạo th&agrave;nh hỗn hợp mịn.</p>

<p>&ndash; Đổ hỗn hợp khoai t&acirc;y v&agrave;o khay nhựa rồi cho v&agrave;o ngăn đ&aacute;</p>

<p>&ndash; Sử dụng sau 5 giờ</p>

<p><em><strong>C&aacute;ch sử dụng:</strong></em></p>

<p>&ndash; Buổi tối trước khi đi ngủ bạn rửa mặt sạch với nước m&aacute;t v&agrave; sữa rửa mặt.</p>

<p>&ndash; Lấy một vi&ecirc;n khoai t&acirc;y đ&ocirc;ng đ&aacute; thoa đều l&ecirc;n mặt, massage kĩ ở những v&ugrave;ng da c&oacute; nhiều đốm n&acirc;u.</p>

<p>&ndash; Ch&agrave; li&ecirc;n tục đến khi vi&ecirc;n đ&aacute; tan hết th&igrave; lưu hỗn hợp tr&ecirc;n da khoảng 10 ph&uacute;t rồi rửa lại mặt với nước m&aacute;t.</p>

<p><em><strong>C&ocirc;ng dụng trị n&aacute;m của khoai t&acirc;y:</strong></em></p>

<p>Khoai t&acirc;y rất gi&agrave;u h&agrave;m lượng vitamin B6, C, kali, chất xơ c&ugrave;ng chất chống oxy h&oacute;a mạnh. Do đ&oacute;, sử dụng khoai t&acirc;y sẽ gi&uacute;p sản sinh collagen nu&ocirc;i dưỡng l&agrave;n da trắng mịn, tăng độ đ&agrave;n hồi đồng thời x&oacute;a mờ c&aacute;c dấu hiệu của l&atilde;o h&oacute;a như n&aacute;m, t&agrave;n nhang.</p>

<p>B&ecirc;n cạnh đ&oacute;, dưới t&aacute;c động của nhiệt độ thấp của đ&aacute; sẽ k&iacute;ch th&iacute;ch tuần ho&agrave;n m&aacute;u, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.</p>

<p>Trị n&aacute;m t&agrave;n nhang bằng c&aacute;ch n&agrave;y sẽ mang đến cho bạn hiệu quả r&otilde; rệt sau khoảng thời gian v&agrave;i tuần &aacute;p dụng.</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4783" src="../Content/images/tri-nam-bang-nguyen-lieu-tu-nhien-2.jpg" style="height:400px; width:600px" /></p>

<h2><strong>C&aacute;ch trị n&aacute;m t&agrave;n nhang bằng c&agrave; chua </strong></h2>

<p>Nghi&ecirc;n cứu khoa học đ&atilde; chỉ ra trong c&agrave; chua c&oacute; chứa rất nhiều c&aacute;c loại vitamin A, vitamin C, vitamin B6&hellip;c&ugrave;ng với c&aacute;c nguy&ecirc;n tố vi lượng như: sắt, kẽm, canxi. Những chất n&agrave;y c&oacute; t&aacute;c dụng t&iacute;ch cực trong việc l&agrave;m đẹp da v&agrave; tăng cường sức đề kh&aacute;ng cho cơ thể.</p>

<p>Nguy&ecirc;n liệu cần chuẩn bị:</p>

<p>&ndash; 1 quả c&agrave; chua</p>

<p>&ndash; 2 th&igrave;a sữa tươi kh&ocirc;ng đường</p>

<p><em><strong>C&aacute;ch l&agrave;m:</strong></em></p>

<p>&ndash; C&agrave; chua rửa sạch rồi cho v&agrave;o m&aacute;y xay sinh tố xay nhuyễn.</p>

<p>&ndash; Lấy nước &eacute;p c&agrave; chua trộn chung với sữa tươi theo tỷ lệ bằng nhau.</p>

<p><em><strong>C&aacute;ch sử dụng:</strong></em></p>

<p>&ndash; Rửa sạch mặt, d&ugrave;ng b&ocirc;ng g&ograve;n thấm dung dịch thoa đều khắp mặt v&agrave; nhẹ nh&agrave;ng massage, để y&ecirc;n để trong v&ograve;ng 20 -30 ph&uacute;t, sau đ&oacute; rửa mặt sạch bằng nước ấm.</p>

<p>&ndash; Thực hiện li&ecirc;n tục 2-3 lần/tuần.</p>

<p>Sau 2 tuần sử dụng bạn sẽ thấy da mềm mại, đều m&agrave;u v&agrave; trắng s&aacute;ng hơn. C&aacute;c vết n&aacute;m cũng mờ dần tr&ecirc;n da.</p>
', N'post-img-3.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (2, N'Căng da mặt níu giữ tuổi thanh xuân hiện đang là phương pháp thẩm mỹ nhiều chị em lựa chọn', 1, 20, CAST(0x0000AC370188657B AS DateTime), 1, NULL, 1, 1, 4, N'Căng da mặt níu giữ tuổi thanh xuân hiện đang là phương pháp thẩm mỹ nhiều chị em lựa chọn. Mặc dù vậy các chuyên gia vẫn khuyến cáo các chị em cần câ', N'<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4683" src="../Content/images/cang-da-mat-bang-chi-1.jpg" style="height:624px; width:800px" /></p>

<p><strong>Ưu nhược điểm của phương ph&aacute;p căng da mặt bằng chỉ </strong></p>

<p>Căng da mặt bằng chỉ l&agrave; phương ph&aacute;p sử dụng chỉ sinh học để tạo mối li&ecirc;n kết giữa da mặt v&agrave; cơ b&aacute;m da mặt gi&uacute;p n&acirc;ng phần da mặt bị chảy xệ từ đ&oacute; gi&uacute;p cho da mặt săn chắc hơn.</p>

<p>So với c&aacute;c phương ph&aacute;p phẫu thuật thẩm mỹ căng da mặt truyền thống. Th&igrave; phương ph&aacute;p căng da mặt bằng chỉ c&oacute; ưu đểm l&agrave; nhẹ nh&agrave;ng v&agrave; hiệu quả cao. Phương ph&aacute;p n&agrave;y kh&ocirc;ng động dao k&eacute;o v&agrave;o người chỉ g&acirc;y t&ecirc; tại chỗ. Kh&ocirc;ng để lại vết sẹo mổ lớn như phương ph&aacute;p phẫu thuật. Thời gian nghỉ dưỡng v&agrave; phục hồi cũng &iacute;t hơn về chăm s&oacute;c cũng đơn giản hơn.</p>

<p>Phương ph&aacute;p n&agrave;y n&ecirc;n &aacute;p dụng với đối tượng trung ni&ecirc;n trở xuống. Nh&oacute;m đối tượng n&agrave;y c&oacute; da l&atilde;o h&oacute;a ở mức độ nhẹ v&agrave; trung b&igrave;nh.&nbsp; Sau khi tiến h&agrave;nh căng da mặt xong, c&aacute;c chị em sẽ thấy hiệu ngay. N&oacute; sẽ c&oacute; t&aacute;c dụng trong v&ograve;ng từ 3-6 th&aacute;ng. Sau khoảng thời gian n&agrave;y c&aacute;c bạn tiếp tục đi căng da mặt để gi&uacute;p cho da mặt đẹp hơn.</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4684" src="../Content/images/cang-da-mat-bang-chi-2.jpg" style="height:363px; width:770px" /></p>

<p><strong>Căng da mặt bằng chỉ kh&ocirc;ng an to&agrave;n như bạn nghĩ</strong></p>

<p>Theo c&aacute;c chuy&ecirc;n gia thẩm mỹ th&igrave; căng da mặt bằng chỉ d&ugrave; kh&aacute; nhẹ nh&agrave;ng nhưng vẫn c&oacute; thể để lại biến chứng. Người tiến h&agrave;nh căng da mặt sẽ bị những biến chứng nhẹ như nhiễm tr&ugrave;ng da, dị ứng, k&iacute;ch ứng v&agrave; nặng hơn c&oacute; thể bị chảy m&aacute;u, liệt mặt, &aacute;p xe v&agrave; hoại tử phần da đ&oacute;.</p>

<p>Để đảm bảo an to&agrave;n, c&aacute;c chuy&ecirc;n gia chia sẻ c&aacute;c bạn sẽ c&acirc;n nhắc giữa được v&agrave; mất. Sau đ&oacute;, mọi người cần lựa chọn cơ sở l&agrave;m phẫu thuật, thủ thuật, nếu c&oacute; thể h&atilde;y lựa chọn b&aacute;c sĩ tiến h&agrave;nh l&agrave;m cho m&igrave;nh. Khi tiến h&agrave;nh cần tu&acirc;n thủ đầy đủ quy tr&igrave;nh điều trị theo hướng dẫn của b&aacute;c sĩ. Kịp thời th&ocirc;ng b&aacute;o với b&aacute;c sĩ những bất thường xảy ra để c&oacute; thể kịp thời xử l&yacute;.</p>
', N'post-img-4.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (3, N'Nắng nóng đang xảy ra trên cả nước và có nguy cơ kéo dài trong nhiều ngày', 1, 11, CAST(0x0000AC3701886862 AS DateTime), 1, NULL, 1, 1, 4, N'Nắng nóng đang xảy ra trên cả nước và có nguy cơ kéo dài trong nhiều ngày. Để chống được sự độc hại từ ánh nắng mặt trời các bạn cần sử dụng các loại ', N'<p>&nbsp;</p>

<p>M&ugrave;a h&egrave; thực sự đ&atilde; đến với những tia nắng ch&oacute;i chang l&agrave;m cho c&aacute;c chị em ngao ng&aacute;n. Khi ra đường kem chống nắng ch&iacute;nh l&agrave; vật bất ly th&acirc;n. Tuy nhi&ecirc;n, bạn đ&atilde; biết c&aacute;ch d&ugrave;ng kem chống nắng vật l&yacute; chưa?</p>

<p><img alt="" class="aligncenter alignnone wp-image-4572" src="../Content/images/dung-kem-chong-nang-vat-ly-1.jpg" style="height:515px; width:1000px" /></p>

<h2><strong>Kem chống nắng vật l&yacute; l&agrave; g&igrave;?</strong></h2>

<p>Kem chống nắng vật l&yacute; c&oacute; th&agrave;nh phần ch&iacute;nh bao gồm c&aacute;c chất như titanium dioxide, zinc oxide. N&oacute; c&oacute; khả năng tạo th&agrave;nh lớp m&agrave;ng chắn bảo vệ tr&ecirc;n bề mặt của da gi&uacute;p ngăn chặn, ph&aacute;t t&aacute;n v&agrave; phản xạ c&aacute;c tia UV để ch&uacute;ng kh&ocirc;ng thể xuy&ecirc;n qua da được.</p>

<p>Kem chống nắng vật l&yacute; gi&uacute;p bảo vệ cho da hiệu quả bởi c&aacute;c tia UVA, UVB. N&oacute; lưu được l&acirc;u tr&ecirc;n da nhưng lại an to&agrave;n l&agrave;nh t&iacute;nh kh&ocirc;ng g&acirc;y mụn hay k&iacute;ch ứng da. Kem th&iacute;ch hợp sử dụng cho cả những người c&oacute; l&agrave;n da nhạy cảm, da đang l&ecirc;n mụn.</p>

<p><img alt="" class="aligncenter alignnone wp-image-4573" src="../Content/images/dung-kem-chong-nang-vat-ly-2.jpg" style="height:405px; width:780px" /></p>

<h2><strong>Hướng dẫn d&ugrave;ng kem chống nắng vật l&yacute; đ&uacute;ng c&aacute;ch </strong></h2>

<p>Thứ tự sử dụng y&ecirc;u cầu: kem chống nắng được xem l&agrave; bước cuối c&ugrave;ng trong skincare v&agrave; trước bước trang điểm. N&ecirc;n b&ocirc;i sau khi dưỡng ẩm v&agrave; chờ 15p sau mới b&ocirc;i kem chống nắng để tr&aacute;nh c&aacute;c dưỡng chất sẽ l&agrave;m giảm t&aacute;c dụng của kem chống nắng. Kh&ocirc;ng được mix kem chống nắng với dưỡng ẩm sẽ g&acirc;y biến chất v&agrave; giảm khả năng chống nắng.</p>

<p>Nếu b&ocirc;i kem chống nắng h&oacute;a học c&aacute;c bạn n&ecirc;n b&ocirc;i trước 20-30 ph&uacute;t khi ra ngo&agrave;i nắng. Kem cần c&oacute; thời gian thẩm thấu v&agrave;o da để tạo n&ecirc;n lớp m&agrave;ng bảo vệ. Liều lượng sử dụng cỡ 1 đồng xu kem chống nắng l&agrave; đủ che phủ hết cho cả khu&ocirc;n mặt.</p>

<p><img alt="" class="aligncenter alignnone wp-image-4574" src="../Content/images/dung-kem-chong-nang-2.jpg" style="height:360px; width:500px" /></p>

<p>C&aacute;ch khoảng 2-4 tiếng c&aacute;ch bạn cần dặm lại 1 lần để kem chống nắng c&oacute; thể ph&aacute;t huy tốt được t&aacute;c dụng của m&igrave;nh.</p>

<p>Buổi tối khi đi l&agrave;m về c&aacute;c bạn cần phải tẩy trang sạch sẽ v&agrave; bắt đầu một chu tr&igrave;nh dưỡng da mới. Như vậy mới đảm bảo cho bạn c&oacute; 1 l&agrave;n da khỏe mạnh.</p>

<p>Cuối c&ugrave;ng, mặc d&ugrave;&nbsp; đ&atilde; d&ugrave;ng kem chống nắng nhưng c&aacute;c bạn vẫn n&ecirc;n kết hợp th&ecirc;m những biện ph&aacute;p chống nắng kh&aacute;c như che chắn bằng quần &aacute;o, &ocirc;, mũ, k&iacute;nh, khẩu trang&hellip;C&oacute; thể sử dụng th&ecirc;m c&aacute;c loại vi&ecirc;n uống chống nắng v&agrave; sữa tắm trắng da để gi&uacute;p duy tr&igrave; l&agrave;n da trắng s&aacute;ng , mịn m&agrave;ng.</p>

<div class="box-comment">
<div class="share-send">&nbsp;</div>
</div>
', N'post-img-5.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (4, N'aaaa', 1, 9, CAST(0x0000AC4900EAF0F5 AS DateTime), 3, CAST(0x0000AC55014B7ABF AS DateTime), 3, 1, 3, N'Bạn rửa mặt hằng ngày 2 lần nhưng da mặt vẫn thường xuyên nổi mụn? Rửa mặt chỉ đơn giản là thoa sữa rửa mặt lên trên da rồi sau đó massage vài vòng rồ', N'<ol>
	<li>
	<h2><strong>Sử dụng nước qu&aacute; n&oacute;ng</strong></h2>
	</li>
</ol>

<p>C&oacute; thể sử dụng nước n&oacute;ng khi rửa mặt l&agrave; một điều tuyệt vời với một số bạn (đặc biệt l&agrave; v&agrave;o m&ugrave;a đ&ocirc;ng), tuy nhi&ecirc;n h&atilde;y cố gắng sử dụng nước ấm vừa đủ thay v&igrave; nước qu&aacute; n&oacute;ng nh&eacute;. Một số chuy&ecirc;n gia da liệu đ&atilde; nhận định rằng nước n&oacute;ng sẽ l&agrave;m da của bạn bị kh&ocirc; đi v&igrave; ch&uacute;ng l&agrave;m bong c&aacute;c lớp dầu tự nhi&ecirc;n c&oacute; tr&ecirc;n da.</p>

<p>Nếu bạn thực sự cần một cảm gi&aacute;c &ldquo;n&oacute;ng&rdquo;, h&atilde;y thử x&ocirc;ng mặt với c&aacute;c l&aacute; thảo mộc như t&iacute;a t&ocirc;, kinh giới&hellip; vừa c&oacute; thể thư gi&atilde;n, vừa sạch lỗ ch&acirc;n l&ocirc;ng nữa nh&eacute;.</p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4847" src="../Content/images/47.jpg" style="height:450px; width:600px" /></p>

<ol start="2">
	<li>
	<h2><strong>Cọ x&aacute;t qu&aacute; nhiều tr&ecirc;n da mặt</strong></h2>
	</li>
</ol>

<p>Nhiều bạn cho rằng khi rửa mặt, cứ việc ch&agrave; mạnh v&agrave; nhiều lần th&igrave; sẽ loại bỏ hết lớp bụi bẩn. Một số bạn thậm ch&iacute; c&ograve;n sử dụng qu&aacute; đ&agrave; c&aacute;c sản phẩm tẩy tế b&agrave;o chết với hy vọng sẽ c&oacute; được l&agrave;n da rạng rỡ. Tuy nhi&ecirc;n việc cọ x&aacute;t qu&aacute; đ&agrave; như vậy sẽ chỉ l&agrave;m cho da bạn mỏng đi, nhạy cảm hơn khi m&agrave; c&aacute;c lớp biểu b&igrave; bảo vệ da đang dần bị b&agrave;o m&ograve;n.</p>

<p>Da mặt cần được n&acirc;ng niu v&agrave; bạn chỉ cần massage nhẹ nh&agrave;ng vừa đủ v&agrave; rửa sạch lại với nước l&agrave; được. Nếu kh&ocirc;ng tin tưởng v&agrave;o lực ở b&agrave;n tay, bạn c&oacute; thể c&acirc;n nhắc đến những dụng cụ rửa mặt như bọt biển, b&ocirc;ng m&uacute;t hay l&agrave; một chiếc m&aacute;y rửa mặt chẳng hạn, ch&uacute;ng sẽ gi&uacute;p &iacute;ch nhiều trong việc l&agrave;m sạch l&agrave;n da của bạn đấy.</p>

<ol start="3">
	<li>
	<h2><strong>Bạn chưa thực sự loại bỏ lớp make-up trước khi rửa mặt</strong></h2>
	</li>
</ol>

<p>Nhiều bạn cho rằng tẩy trang kh&ocirc;ng qu&aacute; quan trọng v&igrave; d&ugrave; g&igrave; cũng sẽ c&ograve;n một lớp sữa rửa mặt nữa. &Ocirc;i kh&ocirc;ng, h&atilde;y nhớ rằng sữa rửa mặt gi&uacute;p loại bỏ c&aacute;c lớp bụi bẩn tr&ecirc;n da chứ kh&ocirc;ng c&oacute; chức năng x&oacute;a lớp make-up bạn nh&eacute; (kể cả những sản phẩm rửa mặt 2-in-1 m&agrave; nh&agrave; sản xuất cam kết l&agrave; vừa tẩy trang, vừa rửa mặt th&igrave; ch&uacute;ng cũng chỉ c&oacute; t&aacute;c dụng với những bạn make-up nhẹ nh&agrave;ng &iacute;t layers).</p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4848" src="../Content/images/48.jpg" style="height:288px; width:512px" /></p>

<p>Vậy n&ecirc;n h&atilde;y chắc chắn rằng bạn đ&atilde; x&oacute;a sạch lớp make-up ở bước l&agrave;m sạch đầu ti&ecirc;n (bằng c&aacute;c sản phẩm như nước tẩy trang, gel/s&aacute;p/dầu tẩy trang) trước khi đến với bước l&agrave;m sạch tiếp theo l&agrave; rửa mặt nh&eacute;.</p>

<ol start="4">
	<li>
	<h2><strong>Bạn rửa mặt qu&aacute; nhiều</strong></h2>
	</li>
</ol>

<p>C&oacute; nhiều bạn bị &ldquo;&aacute;m ảnh&rdquo; với một l&agrave;n da sạch, c&aacute;c bạn nghĩ rằng da chỉ sạch khi được rửa mặt v&agrave; c&aacute;c bạn rửa mặt mỗi khi cảm thấy da bị bẩn. Nhưng thực tế rằng rửa mặt nhiều sẽ g&acirc;y hại cho da. N&oacute; ảnh hưởng trực tiếp đến độ nhạy cảm của da với m&ocirc;i trường (v&igrave; rửa mặt nhiều da sẽ dễ bị mỏng đi), hiệu quả dưỡng ẩm cũng như l&agrave; đẩy nhanh qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a của da.</p>

<p>H&atilde;y chỉ rửa mặt 2 lần một ng&agrave;y (s&aacute;ng v&agrave; tối). Nếu bạn thực sự cảm thấy da bạn cần l&agrave;m sạch th&ecirc;m v&agrave;o buổi trưa, h&atilde;y c&acirc;n nhắc đến những sản phẩm dịu nhẹ như Micellar water thay v&igrave; c&aacute;c loại sữa rửa mặt th&ocirc;ng thường.</p>

<ol start="5">
	<li>
	<h2><strong>Bạn c&oacute; đang sử dụng sai sữa rửa mặt?</strong></h2>
	</li>
</ol>

<p>Sữa rửa mặt cũng giống như toner hay serum, cũng ph&acirc;n ra c&aacute;c d&ograve;ng kh&aacute;c nhau d&agrave;nh ri&ecirc;ng cho c&aacute;c loại da kh&aacute;c nhau.</p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4849" src="../Content/images/49.jpg" style="height:400px; width:640px" /></p>

<p>V&iacute; dụ sữa rửa mặt d&agrave;nh cho da thường sẽ c&oacute; nhiều c&aacute;c hoạt chất hoạt động tr&ecirc;n da mạnh mẽ hơn l&agrave; c&aacute;c sản phẩm của d&ograve;ng chống l&atilde;o h&oacute;a, sữa rửa mặt d&agrave;nh cho da dầu nhờn, nhiều mụn thường c&oacute; th&agrave;nh phần kh&aacute;ng vi&ecirc;m, hoặc kiềm dầu căn bản trong khi c&aacute;c sản phẩm c&oacute; th&agrave;nh phần cấp ẩm sẽ l&agrave; d&agrave;nh cho da kh&ocirc;. H&atilde;y đảm bảo bạn hiểu được l&agrave;n da của m&igrave;nh để chọn đ&uacute;ng sản phẩm nh&eacute;.</p>
', N'category-bg-3.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (5, N'Mùa Hè Nóng Bức', 1, 4, CAST(0x0000AC4D01463BEF AS DateTime), 3, NULL, 3, 1, 1, N'Mùa hè nóng bức khiến cho lượng mồ hôi và dầu thừa trên da mặt. Điều này sẽ khiến cho các bạn gái trang điểm dễ bị nhòe nhoẹt kém thẩm mỹ. Dưới đây là', N'<p>&nbsp;</p>

<p>Nhiệt độ cao ch&iacute;nh l&agrave; thủ phạm khiến cho lớp makeup của chị em bị nh&ograve;e v&agrave; tr&ocirc;i đi nhanh ch&oacute;ng. Bạn sẽ từ 1 n&agrave;ng c&ocirc;ng ch&uacute;a bị biến th&agrave;nh lọ lem trong v&ograve;ng 1-2 tiếng đồng hồ. Để hạn chế được t&igrave;nh trạng n&agrave;y, c&aacute;c bạn c&oacute; thể &aacute;p dụng những c&aacute;ch dưới đ&acirc;y:</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4534" src="../Content/images/bi-quyet-trang-diem-hoan-hao-5.png" style="height:578px; width:640px" /></p>

<h2><strong>Dưỡng ẩm </strong></h2>

<p>Dưỡng ẩm được xem l&agrave; bước quan trọng nhất khi kh&ocirc;ng kh&iacute; n&oacute;ng nực v&agrave; kh&ocirc;. Nếu bạn thường xuy&ecirc;n trang điểm th&igrave; đừng bỏ qua bước dưỡng ẩm n&agrave;y. L&agrave;n da cần được dưỡng &acirc;m bổ sung lượng nước đ&atilde; mất đi v&igrave; mồ h&ocirc;i v&agrave; dầu thừa. Nếu da được cấp ẩm đầy đủ sẽ hạn chế được tiết dầu v&agrave; chả mồ h&ocirc;i tr&ecirc;n da.</p>

<h2><strong>Toner</strong></h2>

<p>Sử dụng toner được xem l&agrave; một trong những bước&nbsp;chăm s&oacute;c da cơ bản v&agrave; quan trọng&nbsp;trong quy tr&igrave;nh chăm s&oacute;c da trước makeup.&nbsp;Toner c&oacute; t&aacute;c dụng lấy đi bụi bẩn, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, trả lại cho bạn l&agrave;n da mịn đẹp và th&ocirc;ng tho&aacute;ng.</p>

<p>Theo đ&oacute;, l&agrave;n da của bạn sẽ dễ hấp thụ dưỡng chất từ những bước dưỡng sau, đồng thời hạn chế t&igrave;nh trạng da kh&ocirc;&nbsp;v&agrave; đổ dầu xảy ra trong m&ugrave;a H&egrave;.</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4535" src="../Content/images/bi-quyet-trang-diem-hoan-hao-4.jpg" style="height:490px; width:735px" /></p>

<h2><strong>Kem nền mỏng nhẹ</strong></h2>

<p>V&agrave;o m&ugrave;a h&egrave;, c&aacute;c bạn cần chọn kem nền mỏng nhẹ sẽ tốt hơn. V&igrave;&nbsp;trong những ng&agrave;y nắng n&oacute;ng, da mặt&nbsp;cần được giữ&nbsp;th&ocirc;ng tho&aacute;ng hơn bao giờ hết. C&aacute;c loại kem nền c&oacute; kết cấu mỏng, nhẹ&nbsp;ch&iacute;nh l&agrave; sự lựa chọn ho&agrave;n hảo của ph&aacute;i đẹp. Ngo&agrave;i ra, để tr&aacute;nh lớp makeup bị tr&ocirc;i, bạn cũng n&ecirc;n ch&uacute; trọng v&agrave;o việc dặm kem, phấn thật kỹ để ch&uacute;ng c&oacute; độ b&aacute;m cao hơn</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4536" src="../Content/images/bi-quyet-trang-diem-hoan-hao-2.jpg" style="height:400px; width:600px" /></p>

<h2><strong>Sử dụng phấn trang điểm kiềm dầu</strong></h2>

<p>Một trong những b&iacute; quyết trang điểm tốt nhất m&agrave;u h&egrave; đ&oacute; l&agrave; sử dụng đến phấn kiềm dầu. Sản phẩm phấn nền kiềm dầu thường c&oacute; cấu tr&uacute;c si&ecirc;u mỏng nhẹ. Kh&ocirc;ng chỉ gi&uacute;p che phủ lỗ ch&acirc;n l&ocirc;ng m&agrave; &ldquo;vũ kh&iacute;&rdquo;&nbsp;được c&aacute;c chuy&ecirc;n gia trang điểm tin d&ugrave;ng hơn cả n&agrave;y c&ograve;n c&oacute; t&aacute;c dụng dưỡng ẩm cho da.</p>

<p>Bạn chỉ cần dặm nhẹ một lớp phấn mỏng sau bước thoa kem chống nắng hoặc phủ đều tr&ecirc;n lớp makeup l&agrave; bạn&nbsp;c&oacute; thể giữ cho lớp makeup bền m&agrave;u suốt nhiều giờ đồng hồ m&agrave; kh&ocirc;ng lo da bị đổ dầu hay lớp nền xuống t&ocirc;ng.</p>

<p><img alt="" class="aligncenter alignnone size-full wp-image-4537" src="../Content/images/bi-quyet-trang-diem-hoan-hao-3.png" style="height:661px; width:547px" /></p>

<h2><strong>Xịt kho&aacute;ng/ Xịt Setting Spray&nbsp;</strong></h2>

<p>Xịt kho&aacute;ng l&agrave; &ldquo;vũ kh&iacute;&rdquo; lợi hại cho c&ocirc;ng cuộc&nbsp;<a href="https://eva.vn/lam-dep-c58.html">l&agrave;m đẹp</a>&nbsp;của chị em. B&ecirc;n cạnh khả năng cấp ẩm th&igrave; n&oacute; c&ograve;n gi&uacute;p cho lớp makeup bền hơn v&agrave; kh&ocirc;ng bị &ldquo;tan chảy&rdquo; do thời tiết nắng n&oacute;ng. Nếu như trước đay bạn đ&atilde; quen với việc sử dụng bước xịt kho&aacute;ng nằm ở cuối c&ugrave;ng của chu tr&igrave;nh makeup để lớp trang điểm tiệp l&ecirc;n da hơn. &nbsp;Th&igrave; hiện nay c&aacute;c bạn c&oacute; thể d&ugrave;ng xịt kho&aacute;ng ngay từ bước đầu sẽ c&oacute; chức nhiệm vụ tạo lớp m&agrave;ng kh&ocirc; tho&aacute;ng, gi&uacute;p lớp kem ở c&aacute;c bước sau b&aacute;m chặt v&agrave;o da.</p>

<p>&nbsp;</p>

<p>Tr&ecirc;n đ&acirc;y l&agrave; một số b&iacute; quyết cho c&aacute;c bạn duy tr&igrave; được gương mặt trang điểm ho&agrave;n hảo trong ng&agrave;y h&egrave;.</p>
', N'post-img-5.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (6, N'Làm đẹp là nhu cầu thiết yếu của chị em phụ nữ, ông cha ta có câu...', 1, 3, CAST(0x0000AC4D01493FAC AS DateTime), 3, CAST(0x0000AC4D014BC7C0 AS DateTime), 3, 1, 1, N'Làm đẹp là nhu cầu thiết yếu của chị em phụ nữ, ông cha ta có câu “cái răng cái tóc là góc con người” chính vì vậy bên cạnh việc chú ý đến chăm sóc ră', N'<h1>&nbsp;</h1>

<div class="post-content">
<div class="entry-content">
<p><span style="color:#000000">L&agrave;m đẹp l&agrave; nhu cầu thiết yếu của chị em phụ nữ, &ocirc;ng cha ta c&oacute; c&acirc;u &ldquo;c&aacute;i răng c&aacute;i t&oacute;c l&agrave; g&oacute;c con người&rdquo; ch&iacute;nh v&igrave; vậy b&ecirc;n cạnh việc ch&uacute; &yacute; đến chăm s&oacute;c răng miệng th&igrave; chăm s&oacute;c t&oacute;c cũng rất quan trọng bởi những t&aacute;c động l&ecirc;n t&oacute;c như tẩy, uốn, nhuộm khiến n&oacute; dần yếu hơn, kh&ocirc; xơ, dễ g&atilde;y rụng. Với b&agrave;i viết kinh nghiệm chăm t&oacute;c dưới đ&acirc;y hy vọng c&oacute; thể gi&uacute;p bạn phần n&agrave;o đ&oacute; lấy lại l&agrave;n t&oacute;c b&oacute;ng khỏe nh&eacute;.</span></p>

<p><span style="color:#000000"><strong>Chăm s&oacute;c t&oacute;c uốn</strong></span></p>

<p><span style="color:#000000">Đ&acirc;y l&agrave; kiểu t&oacute;c được rất nhiều bạn lựa chọn, uốn s&oacute;ng lơi, s&oacute;ng H&agrave;n Quốc, uốn cụp,&hellip;gi&uacute;p mang lại vẻ tự nhi&ecirc;n cho m&aacute;i t&oacute;c gi&uacute;p bạn tự tin hơn trong cuộc sống.</span></p>

<p><span style="color:#000000">Việc đầu ti&ecirc;n bạn cần l&agrave;m đ&oacute; ch&iacute;nh l&agrave; lựa chọn thợ l&agrave;m t&oacute;c giỏi, c&oacute; hiểu biết về t&oacute;c v&agrave; sử dụng h&oacute;a chất uy t&iacute;n, đảm bảo an to&agrave;n. Thứ&nbsp; hai l&agrave; phải nghe kĩ thợ hướng dẫn chăm s&oacute;c. Đừng nghĩ rằng l&agrave;m h&oacute;a chất xong kh&ocirc;ng chăm vẫn đẹp.</span></p>

<p><span style="color:#000000">Một số tip chăm s&oacute;c t&oacute;c uốn:</span></p>

<p><span style="color:#000000">&ndash; Kh&ocirc;ng gội đầu bằng nước n&oacute;ng, cực nhanh duỗi s&oacute;ng v&agrave; kh&ocirc; t&oacute;c nhất l&agrave; c&aacute;i thời tiết chuyển m&ugrave;a ẩm ương n&agrave;y của H&agrave; Nội.</span></p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4797" src="../Content/images/27.jpg" style="height:402px; width:600px" /></p>

<p><span style="color:#000000">&ndash; N&ecirc;n xả hoặc ủ n&ecirc;n chịu kh&oacute; xả ủ l&acirc;u một ch&uacute;t.</span></p>

<p><span style="color:#000000">&ndash; Gội xong d&ugrave;ng khăn b&oacute;p nhẹ nh&agrave;ng cho thấm hết nước. B&oacute;p nhẹ nh&agrave;ng đừng xoa ngược xoa xu&ocirc;i như v&ograve; quần &aacute;o. Nếu biết sấy th&igrave; sấy xoắn tay như ngo&agrave;i salon kh&ocirc;ng th&igrave; sấy kh&ocirc; b&igrave;nh thường khoảng 80% rồi kẹp c&agrave;ng cua hoặc b&uacute;i natra.</span></p>

<p><span style="color:#000000">&ndash; Sử dụng dưỡng t&oacute;c hoặc tinh dầu</span></p>

<p><span style="color:#000000"><strong>Chăm s&oacute;c t&oacute;c tẩy nhuộm</strong></span></p>

<p><span style="color:#000000">T&oacute;c tẩy muốn m&agrave;u đẹp chỉ d&ugrave;ng gội&nbsp; xả dầu gội t&iacute;m. . Lưu &yacute; rửa mặt d&ugrave;ng sữa rửa mặt tr&aacute;nh ra c&oacute; &yacute; 1 ch&uacute;t ko viền t&oacute;c quanh mặt sẽ bị v&agrave;ng do d&iacute;nh sữa rửa mặt.&nbsp;</span></p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4798" src="../Content/images/28.jpg" style="height:400px; width:600px" /></p>

<p><span style="color:#000000">Mọi người n&ecirc;n t&igrave;m hiểu c&aacute;c d&ograve;ng ủ hợp với t&oacute;c , ủ n&agrave;o cũng được miễn l&agrave; mn phải ủ l&acirc;u tr&ecirc;n t&oacute;c ch&uacute;t sẽ cải thiện rất nhiều. Với d&ograve;ng ủ n&agrave;o th&igrave; mn cũng n&ecirc;n pha với nước n&oacute;ng hoặc gội th&igrave; kh&ocirc;ng n&ecirc;n gội nước n&oacute;ng nhưng l&uacute;c xả t&oacute;c sạch để ủ, bạn n&ecirc;n tr&aacute;ng qua t&oacute;c nước ấm ấm biểu b&igrave; t&oacute;c sẽ được mở ra xả ủ hiệu quả hơn rất nhiều.</span></p>

<p><span style="color:#000000">N&ecirc;n mua những loại lược về chải kh&ocirc;ng bị đau đầu để hạn chế tối đa rụng t&oacute;c.</span></p>

<p><span style="color:#000000">Chốt lại: Nguy&ecirc;n tắc l&agrave; đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; t&oacute;c nguy&ecirc;n thủy đụng v&agrave;o h&oacute;a chất l&agrave; phải chăm. Chăm đơn giản 3,4 bước th&ocirc;i l&agrave; t&oacute;c cải thiện rất nhiều rồi. B&ecirc;n cạnh đ&oacute;, đừng đ&aacute;nh v&agrave;o sản phẩm cao cấp m&agrave; quan trọng l&agrave; t&igrave;m được thứ hợp với m&igrave;nh.</span></p>
</div>
</div>
', N'category-bg-2.jpg', NULL)
INSERT [dbo].[tblBaiViet] ([iMaBaiViet], [stieude], [bduyet], [ilanxem], [dngaydang], [iMaNguoiDang], [dngayduyet], [imanguoiDuyet], [btrangthai], [iMaLoaiBai], [smota], [snoidung], [surlanh], [iThuTuUuTienTheoLoaiBai]) VALUES (7, N'Chăm Sóc Tóc - Giữ Sắc Đẹp', 1, 2, CAST(0x0000AC4D01493FFA AS DateTime), 3, CAST(0x0000AC4D014BC52E AS DateTime), 3, 1, 1, N'Làm đẹp là nhu cầu thiết yếu của chị em phụ nữ, ông cha ta có câu “cái răng cái tóc là góc con người” chính vì vậy bên cạnh việc chú ý đến chăm sóc ră', N'<h1>&nbsp;</h1>

<div class="post-content">
<div class="entry-content">
<p><span style="color:#000000">L&agrave;m đẹp l&agrave; nhu cầu thiết yếu của chị em phụ nữ, &ocirc;ng cha ta c&oacute; c&acirc;u &ldquo;c&aacute;i răng c&aacute;i t&oacute;c l&agrave; g&oacute;c con người&rdquo; ch&iacute;nh v&igrave; vậy b&ecirc;n cạnh việc ch&uacute; &yacute; đến chăm s&oacute;c răng miệng th&igrave; chăm s&oacute;c t&oacute;c cũng rất quan trọng bởi những t&aacute;c động l&ecirc;n t&oacute;c như tẩy, uốn, nhuộm khiến n&oacute; dần yếu hơn, kh&ocirc; xơ, dễ g&atilde;y rụng. Với b&agrave;i viết kinh nghiệm chăm t&oacute;c dưới đ&acirc;y hy vọng c&oacute; thể gi&uacute;p bạn phần n&agrave;o đ&oacute; lấy lại l&agrave;n t&oacute;c b&oacute;ng khỏe nh&eacute;.</span></p>

<p><span style="color:#000000"><strong>Chăm s&oacute;c t&oacute;c uốn</strong></span></p>

<p><span style="color:#000000">Đ&acirc;y l&agrave; kiểu t&oacute;c được rất nhiều bạn lựa chọn, uốn s&oacute;ng lơi, s&oacute;ng H&agrave;n Quốc, uốn cụp,&hellip;gi&uacute;p mang lại vẻ tự nhi&ecirc;n cho m&aacute;i t&oacute;c gi&uacute;p bạn tự tin hơn trong cuộc sống.</span></p>

<p><span style="color:#000000">Việc đầu ti&ecirc;n bạn cần l&agrave;m đ&oacute; ch&iacute;nh l&agrave; lựa chọn thợ l&agrave;m t&oacute;c giỏi, c&oacute; hiểu biết về t&oacute;c v&agrave; sử dụng h&oacute;a chất uy t&iacute;n, đảm bảo an to&agrave;n. Thứ&nbsp; hai l&agrave; phải nghe kĩ thợ hướng dẫn chăm s&oacute;c. Đừng nghĩ rằng l&agrave;m h&oacute;a chất xong kh&ocirc;ng chăm vẫn đẹp.</span></p>

<p><span style="color:#000000">Một số tip chăm s&oacute;c t&oacute;c uốn:</span></p>

<p><span style="color:#000000">&ndash; Kh&ocirc;ng gội đầu bằng nước n&oacute;ng, cực nhanh duỗi s&oacute;ng v&agrave; kh&ocirc; t&oacute;c nhất l&agrave; c&aacute;i thời tiết chuyển m&ugrave;a ẩm ương n&agrave;y của H&agrave; Nội.</span></p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4797" src="../Content/images/27.jpg" style="height:402px; width:600px" /></p>

<p><span style="color:#000000">&ndash; N&ecirc;n xả hoặc ủ n&ecirc;n chịu kh&oacute; xả ủ l&acirc;u một ch&uacute;t.</span></p>

<p><span style="color:#000000">&ndash; Gội xong d&ugrave;ng khăn b&oacute;p nhẹ nh&agrave;ng cho thấm hết nước. B&oacute;p nhẹ nh&agrave;ng đừng xoa ngược xoa xu&ocirc;i như v&ograve; quần &aacute;o. Nếu biết sấy th&igrave; sấy xoắn tay như ngo&agrave;i salon kh&ocirc;ng th&igrave; sấy kh&ocirc; b&igrave;nh thường khoảng 80% rồi kẹp c&agrave;ng cua hoặc b&uacute;i natra.</span></p>

<p><span style="color:#000000">&ndash; Sử dụng dưỡng t&oacute;c hoặc tinh dầu</span></p>

<p><span style="color:#000000"><strong>Chăm s&oacute;c t&oacute;c tẩy nhuộm</strong></span></p>

<p><span style="color:#000000">T&oacute;c tẩy muốn m&agrave;u đẹp chỉ d&ugrave;ng gội&nbsp; xả dầu gội t&iacute;m. . Lưu &yacute; rửa mặt d&ugrave;ng sữa rửa mặt tr&aacute;nh ra c&oacute; &yacute; 1 ch&uacute;t ko viền t&oacute;c quanh mặt sẽ bị v&agrave;ng do d&iacute;nh sữa rửa mặt.&nbsp;</span></p>

<p style="text-align:center"><img alt="" class="alignnone size-full wp-image-4798" src="../Content/images/28.jpg" style="height:400px; width:600px" /></p>

<p><span style="color:#000000">Mọi người n&ecirc;n t&igrave;m hiểu c&aacute;c d&ograve;ng ủ hợp với t&oacute;c , ủ n&agrave;o cũng được miễn l&agrave; mn phải ủ l&acirc;u tr&ecirc;n t&oacute;c ch&uacute;t sẽ cải thiện rất nhiều. Với d&ograve;ng ủ n&agrave;o th&igrave; mn cũng n&ecirc;n pha với nước n&oacute;ng hoặc gội th&igrave; kh&ocirc;ng n&ecirc;n gội nước n&oacute;ng nhưng l&uacute;c xả t&oacute;c sạch để ủ, bạn n&ecirc;n tr&aacute;ng qua t&oacute;c nước ấm ấm biểu b&igrave; t&oacute;c sẽ được mở ra xả ủ hiệu quả hơn rất nhiều.</span></p>

<p><span style="color:#000000">N&ecirc;n mua những loại lược về chải kh&ocirc;ng bị đau đầu để hạn chế tối đa rụng t&oacute;c.</span></p>

<p><span style="color:#000000">Chốt lại: Nguy&ecirc;n tắc l&agrave; đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; t&oacute;c nguy&ecirc;n thủy đụng v&agrave;o h&oacute;a chất l&agrave; phải chăm. Chăm đơn giản 3,4 bước th&ocirc;i l&agrave; t&oacute;c cải thiện rất nhiều rồi. B&ecirc;n cạnh đ&oacute;, đừng đ&aacute;nh v&agrave;o sản phẩm cao cấp m&agrave; quan trọng l&agrave; t&igrave;m được thứ hợp với m&igrave;nh.</span></p>
</div>
</div>
', N'category-bg-2.jpg', NULL)
SET IDENTITY_INSERT [dbo].[tblBaiViet] OFF
SET IDENTITY_INSERT [dbo].[tblLoaiBai] ON 

INSERT [dbo].[tblLoaiBai] ([iMaLoaiBai], [stenloaibai]) VALUES (1, N'LÀM ĐẸP')
INSERT [dbo].[tblLoaiBai] ([iMaLoaiBai], [stenloaibai]) VALUES (3, N'MAKEUP')
INSERT [dbo].[tblLoaiBai] ([iMaLoaiBai], [stenloaibai]) VALUES (4, N'BODY & HAIR')
SET IDENTITY_INSERT [dbo].[tblLoaiBai] OFF
SET IDENTITY_INSERT [dbo].[tblNguoiDung] ON 

INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (1, N'admin', N'123', N'admin', 1, 3, NULL, NULL)
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (2, N'admin1', N'123', N'admin12', 0, 1, N'HUY555', N'huy@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (3, N'admin2', N'CC0D45BC2F499FC4666D09691485A0F9', N'admin2', 1, 2, N'32324234', N'23423@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (4, N'admin3', N'huyhuy', N'admin3', 1, 2, N'5435', N'534535@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (5, N'admin4', N'CC0D45BC2F', N'admin4', 1, 2, N'06585595', N'admin2@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (6, N'admin4', N'CC0D45BC2F', N'admin4', 1, 2, N'08564565', N'abc@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (7, N'admin5', N'CC0D45BC2F', N'admin5', 1, 2, N'08564565', N'abc@gmail.com')
INSERT [dbo].[tblNguoiDung] ([iMaNguoiDung], [susername], [spass], [shoten], [bGioiTinh], [iMaQuyen], [sSDT], [sEmail]) VALUES (8, N'admin6', N'CC0D45BC2F499FC4666D09691485A0F9', N'admin6', 1, 2, N'08564565', N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[tblNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[tblquyen] ON 

INSERT [dbo].[tblquyen] ([iMaQuyen], [stenQuyen]) VALUES (1, N'Member')
INSERT [dbo].[tblquyen] ([iMaQuyen], [stenQuyen]) VALUES (2, N'Admin')
INSERT [dbo].[tblquyen] ([iMaQuyen], [stenQuyen]) VALUES (3, N'Adminn')
SET IDENTITY_INSERT [dbo].[tblquyen] OFF
ALTER TABLE [dbo].[tblBaiViet] ADD  DEFAULT ((0)) FOR [bduyet]
GO
ALTER TABLE [dbo].[tblBaiViet] ADD  DEFAULT ((0)) FOR [ilanxem]
GO
ALTER TABLE [dbo].[tblBaiViet] ADD  DEFAULT ((1)) FOR [btrangthai]
GO
ALTER TABLE [dbo].[tblBaiViet]  WITH CHECK ADD  CONSTRAINT [fk_theloai] FOREIGN KEY([iMaLoaiBai])
REFERENCES [dbo].[tblLoaiBai] ([iMaLoaiBai])
GO
ALTER TABLE [dbo].[tblBaiViet] CHECK CONSTRAINT [fk_theloai]
GO
ALTER TABLE [dbo].[tblBaiViet]  WITH CHECK ADD  CONSTRAINT [fk_thelưaoai] FOREIGN KEY([iMaNguoiDang])
REFERENCES [dbo].[tblNguoiDung] ([iMaNguoiDung])
GO
ALTER TABLE [dbo].[tblBaiViet] CHECK CONSTRAINT [fk_thelưaoai]
GO
ALTER TABLE [dbo].[tblNguoiDung]  WITH CHECK ADD  CONSTRAINT [asdasdfk] FOREIGN KEY([iMaQuyen])
REFERENCES [dbo].[tblquyen] ([iMaQuyen])
GO
ALTER TABLE [dbo].[tblNguoiDung] CHECK CONSTRAINT [asdasdfk]
GO
USE [master]
GO
ALTER DATABASE [webTinTuc1] SET  READ_WRITE 
GO
