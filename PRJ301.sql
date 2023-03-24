USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PRJ301_Project')
BEGIN
	ALTER DATABASE [PRJ301_Project] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PRJ301_Project] SET ONLINE;
	DROP DATABASE [PRJ301_Project];
END

GO

CREATE DATABASE [PRJ301_Project]
GO


USE [PRJ301_Project]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

CREATE TABLE Accounts (
	accountID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[userName] nvarchar(200) NOT NULL UNIQUE,
	[password] nvarchar(200) NOT NULL,
	[amount] money,
	[email] nvarchar(255),
	[role] int,
)
GO

INSERT Accounts (userName, password, amount, email, role) 
VALUES('admin', '123', '123456789', 'duc96989@gmail.com', '1')

CREATE TABLE Profiles (
	accountID INT UNIQUE NOT NULL,
	firstName nvarchar(50) NULL,
	lastName nvarchar(50) NULL,
	avatar nvarchar(200) null,
	country nvarchar(150) null,
	address nvarchar(150) null,
	birthday date null,
	phone nvarchar(15) null,
	gender bit null,
)
GO

ALTER TABLE Profiles
ADD constraint fk_profile_account foreign key (accountID) references Accounts(accountID)
GO

INSERT Profiles (accountID, firstName, lastName, avatar, country, address, birthday, phone, gender) 
VALUES('1', N'Nguyễn', N'Mạnh Đức', 'adminFE/img/admin.jpg', N'Hà Nội', N'Đông Anh', '2002-12-07', '0972307529', '1')

CREATE TABLE Categories (
	categoryID int identity(1, 1) not null,
	categoryName nvarchar(255) not null unique,
	describe nvarchar(255) null,
	primary key(categoryID)
)
GO

INSERT INTO Categories(categoryName,describe)
VALUES(N'Đèn led', N'Sáng hơn, Tiết kiệm điện hơn, Thời gian sử dụng nhiều hơn')
INSERT INTO Categories(categoryName,describe)
VALUES(N'Dây điện', N'Thắp sáng mọi thứ, đảm bảo thiết bị điện')
INSERT INTO Categories(categoryName,describe)
VALUES(N'Quạt', N'mát hơn')
INSERT INTO Categories(categoryName,describe)
VALUES(N'Bảo vệ thiết bị điện', N'Giúp sử dụng thiết bị an toàn')
INSERT INTO Categories(categoryName,describe)
VALUES(N'Ổ cắm', N'Giúp dây điện gọn gàng')
INSERT INTO Categories(categoryName,describe)
VALUES(N'Ổn áp', N'Điện khỏe hơn, bảo vệ thiết bị điện')


CREATE TABLE Producers (
	producerID int identity(1, 1) not null,
	producerName nvarchar(255) not null unique,
	country nvarchar(255),
	primary key(producerID)
)
GO

INSERT INTO Producers(producerName, country)
VALUES(N'Rạng Đông', N'Việt Nam')
INSERT INTO Producers(producerName, country)
VALUES(N'Trần Phú', N'Việt Nam')
INSERT INTO Producers(producerName, country)
VALUES(N'Thống Nhất', N'Việt Nam')
INSERT INTO Producers(producerName, country)
VALUES(N'Philips', N'Trung Quốc')
INSERT INTO Producers(producerName, country)
VALUES(N'Sino', N'Việt Nam')
INSERT INTO Producers(producerName, country)
VALUES(N'Lioa', N'Việt Nam')



CREATE TABLE Products (
	productID int identity(1, 1) not null,
	categoryID int,
	producerID int,
	productName nvarchar(255) not null,
	price money,
	quantity int,
	meters nvarchar(255),
	color nvarchar(255),
	wattage nvarchar(255),
	chip nvarchar(255),
	nguondien nvarchar(255),
	nhietdomau nvarchar(255),
	loiday int,
	kichthuoc nvarchar(255),
	tuoitho nvarchar(255),
	dienap nvarchar(255),
	chiutai nvarchar(255),
	image nvarchar(255),
	baohanh int, /*tinh theo thang*/
	productcreatetime date null default (getdate()),
	primary key (productID),
	constraint fk_product_category foreign key (categoryID) references Categories(categoryID),
	constraint fk_product_producer foreign key (producerID) references Producers(producerID)
)
GO

CREATE TABLE Orders (
	orderID int identity(1, 1) not null,
	accountID int,
	total money, /* tong so tien don */
	createAt date,
	primary key (orderID),
	constraint fk_account_order foreign key (accountID) references Accounts(accountID)
)
GO

CREATE TABLE OrderLine(
	orderID int,
	productID int,
	quantity int,
	price money, /* price cua san pham */
	primary key (orderID, productID),
	constraint fk_product_orderLine foreign key (productID) references Products(productID),
	constraint fk_orderLine_order foreign key (orderID) references Orders(orderID)
)
GO

Create table Reviews(
	reviewID int identity(1, 1) not null,
	rate int null,
	accountID int,
	productID int, 
	content nvarchar(255),
	reviewtime date
	constraint fk_product_reviews foreign key (productID) references Products(productID),
	constraint fk_account_reviews foreign key (accountID) references Accounts(accountID),
)

--Rạng Đông
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A45N1', 43000, '100', N'Vàng', '3W', 'Samsung', '220V', '6500K', '20000h', N'userFE/images/products/Led tròn-A45N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A55N4', 56000, '100', N'Vàng', '5W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A55N4.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A60N3', 64000, '100', N'Vàng', '7W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A60N3.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A60N1', 73000, '100', N'Vàng', '9W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A60N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A70N1', 92000, '100', N'Vàng', '12W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A70N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn TR70N1', 114000, '100', N'Vàng', '14W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-TR70N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A80N1', 114000, '100', N'Vàng', '15W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A80N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A95N1', 158000, '100', N'Vàng', '20W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A95N1.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, chip, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tròn A120N1', 217800, '100', N'Vàng', '30W', 'Samsung', '220V', '6500K', '15000h', N'userFE/images/products/Led tròn-A120N1.jpg', '12')

INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, kichthuoc, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tuýp T8 N01 600', 106700, '100', N'Trắng', '10W', '220V', '6500K', '26x603', '15000h', N'userFE/images/products/Led tuýp T8 N01 600.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, kichthuoc, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tuýp T8 600', 148000, '100', N'Trắng', '10W', '220V', '6500K', '26x603', '25000h', N'userFE/images/products/Led tuýp T8 600.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, kichthuoc, tuoitho, image, baohanh)
VALUES('1', '1', N'Led tuýp T8 1200', 227000, '100', N'Trắng', '20W', '220V', '6500K', '28x1213', '30000h', N'userFE/images/products/Led tuýp T8 1200.jpg', '12')

INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-14', 297000, '100', N'Vàng', '5W', '220V', '6500K', '15000h', N'userFE/images/products/Led bàn RD-RL-14.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-10E', 376200, '100', N'Vàng', '6W', '220V', '5000K', '15000h', N'userFE/images/products/Led bàn RD-RL-10E.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-21', 663000, '100', N'Vàng', '6W', '220V', '6500K', '25000h', N'userFE/images/products/Led bàn RD-RL-21.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-60', 594000, '100', N'Vàng', '8W', '220V', '6500K', '25000h', N'userFE/images/products/Led bàn RD-RL-60.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-27.V2', 246240, '100', N'Vàng', '5W', '220V', '6500K', '20000h', N'userFE/images/products/Led bàn RD-RL-27.V2.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-24.V2', 246240, '100', N'Vàng', '5W', '220V', '6500K', '20000h', N'userFE/images/products/Led bàn RD-RL-24.V2.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-20V2', 449280, '100', N'Vàng', '6W', '220V', '6500K', '25000h', N'userFE/images/products/Led bàn RD-RL-20V2.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-01.V2', 229000, '100', N'Vàng', '5W', '220V', '6500K', '25000h', N'userFE/images/products/Led bàn RD-RL-01.V2.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-16', 304560, '100', N'Vàng', '5W', '220V', '6500K', '15000h', N'userFE/images/products/Led bàn RD-RL-16.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '1', N'Led bàn RD-RL-39', 1580000, '100', N'Vàng', '7W', '220V', '6500K', '30000h', N'userFE/images/products/Led bàn RD-RL-39.jpg', '12')

--Trần phú
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 2x1', 9860, '100', '200m', N'Vàng', '220V', '2', '2x1', '300V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 2x1.5', 13550, '100', '200m', N'Vàng', '220V', '2', '2x1.5', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 2x2.5', 22300, '100', '200m', N'Vàng', '220V', '2', '2x2.5', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 2x4', 33500, '100', '200m', N'Vàng', '220V', '2', '2x4', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 3x0.5', 10500, '100', '200m', N'Vàng', '220V', '3', '3x0.5', '300V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 3x0.75', 11400, '100', '200m', N'Vàng', '220V', '3', '3x0.75', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 4x1.5', 24400, '100', '200m', N'Vàng', '220V', '4', '4x1.5', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây điện dân dụng 4x2.5', 30500, '100', '200m', N'Vàng', '220V', '4', '4x2.5', '500V', N'userFE/images/products/Dây điện dân dụng.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây cáp nhôm cánh điện 7x1.7', 50500, '100', '100m', N'Đen', '220V', '7', '7x1.7', '0.6KV', N'userFE/images/products/Dây cáp nhôm cánh điện.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, nguondien, loiday, kichthuoc, dienap, image, baohanh)
VALUES('2', '2', N'Dây cáp đồng cánh điện 3x1', 60500, '100', '100m', N'Đen', '220V', '3', '3x1', '0.6KV', N'userFE/images/products/Dây cáp đồng cánh điện.jpg', '12')

--Thống Nhất
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng QĐ-500', 1340000, '100', N'Đen', '150W', '50', '220V', N'userFE/images/products/Quạt đứng QĐ-500.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng 750-Đ', 1680000, '100', N'Đen', '180W', '75', '220V', N'userFE/images/products/Quạt đứng 750-Đ.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng KM-750S', 2150000, '100', N'Đen', '250W', '75', '220V', N'userFE/images/products/Quạt đứng KM-750S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng 450-ĐM', 470000, '100', N'Đen', '50W', '45', '220V', N'userFE/images/products/Quạt đứng 450-ĐM.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng 400X-MS', 670000, '100', N'Đen', '40W', '40', '220V', N'userFE/images/products/Quạt đứng 400X-MS.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt đứng 400-M', 489000, '100', N'Đen', '460W', '42', '220V', N'userFE/images/products/Quạt đứng 400-M.jpg', '12' )

INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 750-Đ', 1550000, '100', N'Đen', '180W', '75', '220V', N'userFE/images/products/Quạt treo tường 750-Đ.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 650-Đ', 1529000, '100', N'Đen', '180W', '65', '220V', N'userFE/images/products/Quạt treo tường 650-Đ.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 500', 1100000, '100', N'Đen', '150W', '50', '220V', N'userFE/images/products/Quạt treo tường 500.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 400X-PN', 722000, '100', N'Đen', '46W', '40', '220V', N'userFE/images/products/Quạt treo tường 400X-PN.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 400X-HĐ', 599000, '100', N'Đen', '46W', '40', '220V', N'userFE/images/products/Quạt treo tường 400X-HĐ.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 400E-HĐ', 310000, '100', N'Đen', '46W', '40', '220V', N'userFE/images/products/Quạt treo tường 400E-HĐ.png', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt treo tường 450-ĐM', 489000, '100', N'Đen', '46W', '45', '220V', N'userFE/images/products/Quạt treo tường 450-ĐM.jpg', '12' )

INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt trần 1400', 850000, '100', N'Xanh', '75W', '140', '220V', N'userFE/images/products/Quạt trần 1400.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt trần 1500', 2750000, '100', N'Xanh', '75W', '150', '220V', N'userFE/images/products/Quạt trần 1500.png', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt trần KNM1400', 2450000, '100', N'Nâu', '75W', '140', '220V', N'userFE/images/products/Quạt trần KNM1400.png', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, kichthuoc, nguondien, image, baohanh)
VALUES('3', '3', N'Quạt trần GKING1350', 3990000, '100', N'Nâu', '62W', '135', '220V', N'userFE/images/products/Quạt trần GKING1350.png', '12' )

--Philips
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL200 EC RD', 183040, '100', N'Trắng', '6W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần CL200 EC RD.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần 33369 Moire', 202605, '100', N'Trắng', '10W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần 33369 Moire.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL200 EC RD', 202605, '100', N'Trắng', '10W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần CL200 EC RD.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần DN027C', 227695, '100', N'Trắng', '11W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần DN027C.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần DN027C', 284115, '100', N'Trắng', '15W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần DN027C.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL254 EC RD', 327470, '100', N'Trắng', '12W', '220V', '6500K', '15000h', N'userFE/images/products/Led ốp trần CL254 EC RD.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL200 EC RD', 331760, '100', N'Trắng', '17W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần CL200 EC RD.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần 1824 Twirly', 376025, '100', N'Trắng', '12W', '220V', '6500K', '15000h', N'userFE/images/products/Led ốp trần 1824 Twirly.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL200 EC RD', 469040, '100', N'Trắng', '20W', '220V', '6500K', '15000h', N'userFE/images/products/Led Ốp Trần CL200 EC RD.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led ốp trần CL254 EC RD', 551265, '100', N'Trắng', '20W', '220V', '6500K', '15000h', N'userFE/images/products/Led ốp trần CL254 EC RD.jpg', '12')

INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray SLS', 340000, '100', N'Đen', '11W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray SLS.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray SLS', 476000, '100', N'Đen', '22W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray SLS.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray SLS', 533000, '100', N'Đen', '33W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray SLS.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray ST030T', 699000, '100', N'Đen', '8W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray ST030T.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray ST030T', 969000, '100', N'Đen', '14W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray ST030T.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray ST030T', 1189000, '100', N'Đen', '23W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray ST030T.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led rọi ray ST030T', 1339000, '100', N'Đen', '35W', '220V', '6500K', '15000h', N'userFE/images/products/Led rọi ray ST030T.jpg', '12')

INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây LS150S', 980000, '100', '5m', N'Vàng', '3.6W','220V', '6500K', '15000h', N'userFE/images/products/Led dây LS052S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây LS151S', 1141000, '100', '5m', N'Vàng', '7.5W','220V', '6500K', '15000h', N'userFE/images/products/Led dây LS052S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây LS051S', 1150000, '100', '5m', N'Vàng', '8W','220V', '6500K', '15000h', N'userFE/images/products/Led dây LS052S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây LS052S', 1300000, '100', '5m', N'Vàng', '9W','220V', '6500K', '15000h', N'userFE/images/products/Led dây LS052S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây LS152S', 1500000, '100', '5m', N'Vàng', '10W','220V', '6500K', '15000h', N'userFE/images/products/Led dây LS052S.jpg', '12' )
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, wattage, nguondien, nhietdomau, tuoitho, image, baohanh)
VALUES('1', '4', N'Led dây Hue Lightstrip', 1995000, '100', '5m', N'Vàng', '10W','220V', '6500K', '15000h', N'userFE/images/products/Led dây Hue Lightstrip.jpg', '12' )


--Sino
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 1 Cực 16A', 52000, '100', '230V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 1 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 1 Cực 20A', 55000, '100', '230V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 1 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 1 Cực 25A', 70000, '100', '230V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 1 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 1 Cực 32A', 100000, '100', '230V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 1 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 2 Cực 16A', 105000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 2 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 2 Cực 20A', 115000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 2 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 2 Cực 25A', 124000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 2 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 2 Cực 32A', 130000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 2 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 3 Cực 16A', 150000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 3 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 3 Cực 20A', 161000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 3 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 3 Cực 25A', 180000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 3 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, nguondien, chiutai, image, baohanh)
VALUES('4', '5', N'Cầu dao PS45N 3 Cực 32A', 194000, '100', '400V', '4.5kA', N'userFE/images/products/Cầu dao PS45N 3 Cực.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Công tắc 2 Chiều S18HM/2', 97500, '100', N'Trắng', N'userFE/images/products/Công tắc 2 Chiều S18HM.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Công tắc 2 Chiều S18HM/S', 57500, '100', N'Trắng', N'userFE/images/products/Công tắc 2 Chiều S18HM-S.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Công tắc 2 Chiều S18HMI', 70000, '100', N'Trắng', N'userFE/images/products/Công tắc 2 Chiều S18HMI.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Ổ cắm S18CCU', 70000, '100', N'Trắng', N'userFE/images/products/Ổ cắm S18CCU.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Ổ cắm S18CCUE2', 70000, '100', N'Trắng', N'userFE/images/products/Ổ cắm S18CCUE2.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color ,image, baohanh)
VALUES('5', '5', N'Công tắc Chuông S18HMBP2S', 70000, '100', N'Trắng', N'userFE/images/products/Công tắc Chuông S18HMBP2S.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, kichthuoc, image, baohanh)
VALUES('4', '5', N'Ống Đàn Hồi SP9016CM', 190000, '100', '50m', N'Trắng', '16x11.5', N'userFE/images/products/Ống Đàn Hồi.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, kichthuoc, image, baohanh)
VALUES('4', '5', N'Ống Đàn Hồi SP9020CM', 232000, '100', '50m', N'Trắng', '20x14.5', N'userFE/images/products/Ống Đàn Hồi.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, kichthuoc, image, baohanh)
VALUES('4', '5', N'Ống Đàn Hồi SP9025CM', 261000, '100', '50m', N'Trắng', '25x19', N'userFE/images/products/Ống Đàn Hồi.png', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, meters, color, kichthuoc, image, baohanh)
VALUES('4', '5', N'Ống Đàn Hồi SP9032CM', 356000, '100', '50m', N'Trắng', '32x25', N'userFE/images/products/Ống Đàn Hồi.png', '12')

--Lioa
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 3KVA-SH3000', 1700000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 3KVA-SH3000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 3KVA-DRI3000', 1750000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 3KVA-DRI3000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 3KVA-DRII3000', 1900000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 3KVA-DRII3000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 5KVA-SH5000', 2100000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 5KVA-SH5000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 5KVA-DRI5000', 2200000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 5KVA-DRI5000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 5KVA-DRII5000', 2400000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 5KVA-DRII5000.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 7.5KVA-SH7500', 3100000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 7.5KVA-SH7500.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 7.5KVA-DRI7500', 3450000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 7.5KVA-DRI7500.jpg', '12')
INSERT INTO Products(categoryID, producerID, productName, price, quantity, color, nguondien, image, baohanh)
VALUES('6', '6', N'Ổn áp 7.5KVA-DRII7500', 4000000, '100', N'Nâu', '220V', N'userFE/images/products/Ổn áp 7.5KVA-DRII7500.jpg', '12')

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 706000, '2022/01/01')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (1, 1, 1, 43000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (1, 15, 1, 663000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 241700, '2022/01/02')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (2, 1, 1, 43000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (2, 5, 1, 92000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (2, 10, 1, 106700)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 3097000, '2022/01/03')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (3, 16, 2, 1188000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (3, 20, 1, 229000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (3, 34, 1, 1680000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 4770000, '2022/01/10')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (4, 35, 5, 4300000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (4, 36, 1, 470000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 4168000, '2022/02/5')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (5, 1, 10, 430000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (5, 3, 10, 640000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (5, 5, 10, 920000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (5, 9, 10, 2178000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 32400000, '2022/02/15')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (6, 101, 4, 12400000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (6, 103, 5, 20000000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 470000, '2022/02/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (7, 81, 1, 150000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (7, 82, 2, 322000)


INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 435000, '2022/03/05')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 85, 1, 97500)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 86, 1, 57500)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 87, 1, 70000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 88, 1, 70000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 89, 1, 70000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (8, 90, 1, 700000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 28660000, '2022/03/14')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (9, 63, 10, 6990000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (9, 64, 10, 9690000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (9, 65, 10, 11980000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 6329050, '2022/04/14')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (10, 51, 10, 2026050)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (10, 52, 10, 2026050)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (10, 53, 10, 2276950)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 23945000, '2022/04/27')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (11, 49, 5, 19950000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (11, 45, 5, 2445000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (11, 44, 5, 1550000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 16500000, '2022/05/12')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (12, 41, 15, 16500000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 10830000, '2022/05/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (12, 42, 15, 10830000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 22935000, '2022/06/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (13, 40, 15, 22935000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 22935000, '2022/07/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (14, 40, 15, 22935000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 23950000, '2022/08/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (15, 33, 10, 13400000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (15, 34, 5, 8400000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (15, 35, 1, 2150000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 24700000, '2022/09/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (16, 46, 10, 8500000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (16, 47, 5, 13750000)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (16, 48, 1, 2450000)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 7236150, '2022/10/25')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (17, 51, 10, 2026500)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (17, 52, 5, 1013250)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (17, 53, 5, 1138475)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (17, 54, 5, 1420575)
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (17, 55, 5, 1637350)

INSERT INTO [dbo].[Orders] ([accountID] ,[total] ,[createAt]) 
VALUES (1, 17000000, '2022/10/30')
GO
INSERT INTO [dbo].[OrderLine] ([orderID], [productID], [quantity], [price])
VALUES (18, 95, 10, 17000000)


