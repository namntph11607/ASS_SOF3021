/*USE master
DROP DATABASE ASS_SOF3021
GO*/
CREATE DATABASE ASS_SOF3021
GO

USE ASS_SOF3021
GO

IF OBJECT_ID('OrderDetails') IS NOT NULL
DROP TABLE OrderDetails
GO

IF OBJECT_ID('Orders') IS NOT NULL
DROP TABLE Orders
GO

IF OBJECT_ID('Products') IS NOT NULL
DROP TABLE Products
GO

IF OBJECT_ID('Categories') IS NOT NULL
DROP TABLE Categories
GO

IF OBJECT_ID('Accounts') IS NOT NULL
DROP TABLE Accounts
GO

CREATE TABLE Accounts(
	Username nvarchar(50) NOT NULL primary key,
	Password nvarchar(50) NOT NULL,
	Fullname nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Photo nvarchar(255) NULL,
	Activated bit,
	Role bit
)

GO
CREATE TABLE Categories(
	ID int IDENTITY primary key,
	Name nvarchar(50) NOT NULL,
)

GO
CREATE TABLE Products(
	ID int IDENTITY primary key,
	Name nvarchar(50) NOT NULL,
	Image nvarchar(255) NULL,
	Price float,
	CreateDate date DEFAULT getdate(),
	Available bit,
	CategoryID int,

	FOREIGN KEY (CategoryID) REFERENCES Categories(ID),
)

GO
CREATE TABLE Orders(
	ID bigint IDENTITY primary key,
	Username nvarchar(50) NOT NULL,
	Phone char(10) NOT NULL,
	CreateDate datetime DEFAULT getdate(),
	Address nvarchar(100) NOT NULL,
	Note nvarchar(200) NULL,
	Status Integer default 0

	FOREIGN KEY (Username) REFERENCES Accounts(Username),
)

GO
CREATE TABLE OrderDetails(
	ID bigint IDENTITY primary key,
	OrderID bigint,
	ProductID int,
	Price float,
	Quantity int,

	FOREIGN KEY (OrderID) REFERENCES Orders(ID),
	FOREIGN KEY (ProductID) REFERENCES Products(ID),
)

--them thong tin cho bang Accounts
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'Admin', N'admin', N'ADMIN', N'admin@email.com', N'admin.png', 1, 1);
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'user', N'123', N'USER', N'user@email.com', N'user.png', 1, 0);
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'userFake', N'321', N'userFake', N'userFake@email.com', N'userFake.png', 0, 0);
--them thong tin cho bang Categories
INSERT INTO Categories VALUES (N'Áo');
INSERT INTO Categories VALUES (N'Giày');
INSERT INTO Categories VALUES (N'Quần');
--them thong tin cho bang Products
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Áo Thun', N'aa.jpg', 99000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Quần Đùi Hoa', N'bb.jpg', 49000, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Giày Bata', N'cc.jpg', 69000, 1, 2);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Áo Ba Lỗ', N'dd.jpg', 98000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Áo Dài', N'ee.jpg', 199000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Quần Bò', N'ff.jpg', 149000, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Dép Tổ Ong', N'zzz.jpg', 99999, 0, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Áo Croptop', N'xxx.jpg', 99001, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Đây không phải Áo', N'notao.jpg', 10001, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Đây không phải Quần', N'notquan.jpg', 20002, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Đây không phải Giày', N'notquan.jpg', 11111, 1, 2);
			
--them thong tin cho bang Orders
INSERT INTO Orders(Username, Phone, Address, Status)
			VALUES (N'user', '0123456789', N'Address User 111', 2);
INSERT INTO Orders(Username, Phone,Address, Status)
			VALUES (N'userFake', '0987654321', N'Address NamNT', 1);
--them thong tin cho bang OrderDetails
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 1, 99000, 2);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 2, 49000, 2);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 8, 99001, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 3, 69000, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 9, 10001, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 10, 20002, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 11, 11111, 1);

SELECT * FROM Accounts
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails


Select o.ID, o.Username, p.Name, od.Price, od.Quantity, SUM(od.price * od.Quantity) as ThanhTien
from Orders o join OrderDetails od 
on o.ID = od.OrderID join Products p
on od.ProductID = p.ID
where OrderID = '1'
Group by o.ID, o.Username, p.Name, od.Price, od.Quantity

Select o.ID, o.Username, o.Address, SUM(od.Price) as Tong_Tien
From Orders o join OrderDetails od 
on o.ID = od.OrderID
group by o.ID, o.Username, o.Address

SELECT TOP 3 p.* , sum(od.Quantity)
FROM Products p JOIN OrderDetails od
ON p.ID = od.ProductID
GROUP BY p.ID, p.Name, p.Price, p.Image, p.CreateDate, p.Available, p.CategoryID
ORDER BY sum(od.Quantity) DESC
