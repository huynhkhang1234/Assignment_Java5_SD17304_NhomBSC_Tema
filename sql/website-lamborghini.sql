
use master
go

create database Website_Lamborghini
go
use Website_Lamborghini
go


CREATE TABLE [roles] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [roles] nvarchar(50),
  [actions] nvarchar(50)
)
GO

CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_names] nvarchar(50) NOT NULL,
  [first_names] nvarchar(50) NOT NULL,
  [last_names] nvarchar(50) NOT NULL,
  [email] nvarchar(50) UNIQUE NOT NULL,
  [pass_words] varchar(20),
  [images] nvarchar(255),
  [phones] nvarchar(20),
  [address] nvarchar(255),
  [roles_id] int NOT NULL,
  [create_date] datetime,
  [update_date] datetime,
  [is_active] int
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [names] nvarchar(255)
)
GO

CREATE TABLE [galleries] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [products_id] int NOT NULL,
  [images] nvarchar(255)
)
GO

CREATE TABLE [products] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [titles] nvarchar(100) NOT NULL,
  [price] int NOT NULL,
  [images] nvarchar(255),
  [description] nvarchar(255),
  [create_date] datetime,
  [update_date] datetime,
  [is_active] int,
  [categories_id] int NOT NULL,
  [suppliers_id] int,
  [original_price] int,
  [discounts_id] int
)
GO

CREATE TABLE [orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [notes] nvarchar(50),
  [status] nvarchar(50),
  [sum_money] float,
  [users_id] int NOT NULL,
  [create_date] datetime,
  [update_date] datetime,
  [money_received] int
)
GO

CREATE TABLE [order_details] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [orders_id] int NOT NULL,
  [products_id] int NOT NULL,
  [price] int,
  [quanlity] int NOT NULL,
  [sum_money] float,
  [create_date] datetime,
  [update_date] datetime
)
GO

CREATE TABLE [news] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [titles] nvarchar(100),
  [contents] nvarchar(255),
  [video_href] nvarchar(255),
  [images] nvarchar(255),
  [create_date] datetime,
  [update_date] datetime,
  [is_active] int,
  [categories_id] int NOT NULL,
  [users_id] int NOT NULL
)
GO

CREATE TABLE [histories] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [orders_id] int NOT NULL,
  [users_id] int NOT NULL,
  [create_date] datetime,
  [update_date] datetime,
  [is_active] int
)
GO

CREATE TABLE [suppliers] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_names] nvarchar(30),
  [emails] nvarchar(50),
  [images] nvarchar(255),
  [phones] nvarchar(20),
  [address] nvarchar(255),
  [status] int,
  [create_date] datetime,
  [update_date] datetime,
  [is_active] int
)
GO

CREATE TABLE [likes] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [users_id] int NOT NULL,
  [products_id] int,
  [is_likes] int,
  [create_like] datetime
)
GO

CREATE TABLE [discounts] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [titles] nvarchar(100),
  [descriptions] nvarchar(255),
  [price_discounts] int,
  [start_day] datetime,
  [end_day] datetime
)
GO

CREATE TABLE [categories_news] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [titles] nvarchar(200)
)
GO

CREATE TABLE [products_reviews] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [stars_number] int,
  [users_id] int NOT NULL,
  [orders_id] int NOT NULL
)
GO

CREATE TABLE [feedBack] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [users_id] int,
  [product_id] int,
  [title] nvarchar(255),
  [content] nvarchar(255),
  [rating] int
)
GO

ALTER TABLE [users] ADD FOREIGN KEY ([roles_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [histories] ADD FOREIGN KEY ([orders_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [histories] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [order_details] ADD FOREIGN KEY ([orders_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [order_details] ADD FOREIGN KEY ([products_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([categories_id]) REFERENCES [categories] ([id])
GO

ALTER TABLE [galleries] ADD FOREIGN KEY ([products_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [news] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([suppliers_id]) REFERENCES [suppliers] ([id])
GO

ALTER TABLE [likes] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [likes] ADD FOREIGN KEY ([products_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([discounts_id]) REFERENCES [discounts] ([id])
GO

ALTER TABLE [news] ADD FOREIGN KEY ([categories_id]) REFERENCES [categories_news] ([id])
GO

ALTER TABLE [products_reviews] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [products_reviews] ADD FOREIGN KEY ([orders_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [feedBack] ADD FOREIGN KEY ([users_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [feedBack] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO
