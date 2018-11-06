Create database SportsStore

CREATE TABLE Products (
    [ProductID] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,
	[Description] NVARCHAR(500) NOT NULL,    
	[Category] NVARCHAR(50) NOT NULL,    
	[Price] DECIMAL(16, 2) NOT NULL 
	) 

-- use this script to generate the INSERT INTO syntax as below 
USE [SportsStore]
GO
SELECT 'INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(' + CONVERT(varchar(50), [ProductID]) 
+ ',''' + [Name] + ''', ''' + [Description] + ''', ''' + [Category] + ''', ' + CONVERT(varchar(50), [Price]) + ') '
FROM [dbo].[Products]

--INSERT INTO syntax
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(1,'Kayak', 'A boat for one person', 'Watersports', 275.00) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(2,'Lifejacket', 'Protective and fashionable', 'Watersports', 48.95) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(3,'Soccer Bal', 'FIFA-approved size and weight', 'Soccer', 19.50) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(4,'Corner Flags', 'Give your playing field a professional touch', 'Soccer', 34.95) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(5,'Stadium', 'Flat-packed, 35,000-seat stadium', 'Soccer', 79500.00) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(6,'Thinking Cap', 'Improve your brain efficiency by 75%', 'Chess', 16.00) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(7,'Unsteady Chair', 'Secretly give your opponent a disadvantage', 'Chess', 29.95) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(8,'Human Chess Board', 'A fun game for the family', 'Chess', 75.00) 
INSERT INTO [dbo].[Products]([ProductID], [Name], [Description], [Category], [Price]) VALUES(9,'Bling-Bling King', 'Gold-plated, diamond-studded King', 'Chess', 1200.00) 

-- Select all data
USE [SportsStore]
SELECT * FROM [dbo].[Products]

-- Edit Product table
ALTER TABLE [dbo].[Products]    
ADD [ImageData]     VARBINARY (MAX) NULL,        
[ImageMimeType] VARCHAR (50)    NULL;  