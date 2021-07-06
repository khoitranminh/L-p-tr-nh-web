Use master
Drop Database DiDongStore
Go
Create Database DiDongStore
Go
Use DiDongStore
Go
------------------------------------------


-- Dữ Liệu Hãng --------------------------

Create Table Company
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên' ,
)
Go


INSERT INTO Company
        ( Name )
VALUES  ( N'Apple' ) -- ID: 1
GO

INSERT INTO Company
        ( Name )
VALUES  ( N'Samsung' ) -- ID: 2
GO

INSERT INTO Company
        ( Name )
VALUES  ( N'Realme' ) -- ID: 3
GO

INSERT INTO Company
        ( Name )
VALUES  ( N'Xiaomi' ) -- ID: 4
GO
-----------------------------------------





---- Dữ liệu Điện thoại -----------------

Create Table Phone
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên' ,
	Price CHAR(100) NOT NULL DEFAULT N'0' ,
	Images CHAR(200) NOT NULL DEFAULT N'Chưa đặt' ,
	Describe CHAR(300) NOT NULL DEFAULT N'Chưa đặt' ,
	CompanyID INT NOT NULL 

	FOREIGN KEY (CompanyID) REFERENCES dbo.Company(ID)
)
Go

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'iPhone 12 Pro Max' ,
          N'27.000.000' , 
          N'iphone-12-pro-max.jpg' ,
		  N'Đây là thông tin' ,
          1
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'iPhone 11' ,
          N'11.000.000' , 
          N'iphone-11.jpg' ,
		  N'Đây là thông tin' ,
          1
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'iPhone XR' ,
          N'9.000.000' , 
          N'iphone-xr.jpg' ,
		  N'Đây là thông tin' ,
          1
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'Realme C12' ,
          N'2.500.000' , 
          N'realme-c21.jpg' ,
		  N'Đây là thông tin' ,
          3
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'Samsung Note20' ,
          N'16.000.000' , 
          N'samsung-galaxy-note-20.jpg' ,
		  N'Đây là thông tin' ,
          2
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'Samsung S21' ,
          N'20.000.000' , 
          N'samsung-galaxy-s21.jpg' ,
		  N'Đây là thông tin' ,
          2
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'iPhone X' ,
          N'9.700.000' , 
          N'iphone_x.jpg' ,
		  N'Đây là thông tin' ,
          1
        )
GO

INSERT INTO Phone
        ( Name ,
          Price ,
          Images ,
		  Describe ,
          CompanyID
        )
VALUES  ( N'Mi 11 Lite 5G' ,
          N'10.500.000' , 
          N'xiaomi-mi-11-lite-5g.jpg' ,
		  N'Đây là thông tin' ,
          4
        )
GO
------------------------------------------



-- Dữ liệu Tài khoản -----------------------

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY ,	
	DisplayName NVARCHAR(1000) NOT NULL ,
	PassWord NVARCHAR(100) NOT NULL DEFAULT 0 ,
	Type INT NOT NULL  DEFAULT 0, -- 1: admin && 0: user
	Email NVARCHAR(1000) NOT NULL
)
GO

INSERT INTO Account
        ( UserName ,
		  DisplayName ,
		  PassWord ,
		  Type ,
		  Email
		)
VALUES  ( N'Danh' ,
		  N'Nguyễn Thành Danh' ,
		  N'12345' ,
		  1 ,
		  N'ntd10297@gmail.com'
		)
GO

INSERT INTO Account
        ( UserName ,
		  DisplayName ,
		  PassWord ,
		  Type ,
		  Email
		)
VALUES  ( N'Trinh' ,
		  N'Nguyễn Ngọc Trinh' ,
		  N'12345' ,
		  0 ,
		  N'trinh123@gmail.com'
		)
GO

INSERT INTO Account
        ( UserName ,
		  DisplayName ,
		  PassWord ,
		  Type ,
		  Email
		)
VALUES  ( N'Trúc' ,
		  N'Nguyễn Thanh Trúc' ,
		  N'12345' ,
		  0 ,
		  N'truc123@gmail.com'
		)
GO
---------------------------------------


-- Dữ liệu Detail Bill ----------------

CREATE TABLE Bill
(
	ID INT IDENTITY PRIMARY KEY ,	
	UserName NVARCHAR(100) ,
	
	FOREIGN KEY (UserName) REFERENCES dbo.Account(UserName) 
	
)
GO
---------------------------------------


-- Dữ liệu Detail Bill -----------------
CREATE TABLE DetailBill
(
	ID INT IDENTITY PRIMARY KEY ,	
	IDBill INT ,
	IDPhone INT ,
	Amount INT 

	FOREIGN KEY (IDBill) REFERENCES dbo.Bill(ID) ,
	FOREIGN KEY (IDPhone) REFERENCES dbo.Phone(ID)
)
GO
---------------------------------------
