USE Website_Lamborghini
GO
INSERT INTO [dbo].[roles]
           ([roles]
           ,[actions])
     VALUES
           ('admin','admin'),('user','views'),('staff_edit','edit')
GO
-----------------------------------------------------------------------------
INSERT INTO dbo.users
(user_names
           ,first_names
           ,last_names
           ,email
           ,pass_words
           ,images
           ,phones
           ,address
           ,roles_id
           ,create_date
           ,update_date
,is_active)
     VALUES
	 (N'huynhkhang',N'Khang',N'Huỳnh','Khanghbpc04012@fpt.edu.vn','123',N'hình ảnh','0123456789','Cà Mau',1,'2023-5-27','2023-5-28',1)
	 ,(N'nguyenphi',N'Phi',N'Nguyễn','phi0000@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Trà Vinh',2,'2023-5-27','2023-5-28',1)           
	 ,(N'trantham',N'Thắm',N'Trần','tham0000@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Hậu Giang',2,'2023-5-27','2023-5-28',1)           
	 
GO
-----------------------------------------------------------------------------------------
INSERT INTO [dbo].[orders]
           ([notes]
           ,[status]
           ,[sum_money]
           ,[users_id]
           ,[create_date]
           ,[update_date]
           ,[money_received])
     VALUES
         (N'sản phẩm tốt',N'Đang vẩn chuyển',14000000,1,'2023-05-27','2023-05-28',38000000),
		  (N'sản phẩm tốt',N'Đã hoàn thành',500000,2,'2023-05-27','2023-05-28',500000)	,
		  (N'sản phẩm tốt',N'Đang chờ sử lý',600000,3,'2023-05-27','2023-05-28',600000)		
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',4000000,2,'2023-05-27','2023-05-28',500000),
		  (N'sản phẩm tốt',N'Đã hoàn thành',6000000,2,'2023-05-27','2023-05-28',10000000)		
		  go
------------------

INSERT INTO [dbo].[categories]
           ([names])
     VALUES
           (N'Đèn Bi Led'),(N'Sạc không dây thông minh'),
		   (N'Sáp Thơm Ô Tô AREON - Khử Mùi Xe Hơi Cao Cấp'),
		   (N'Camera 360 ô tô GOTECH GP6 Mới nhất – Panda Auto'),
		   (N'Cảm biến áp suất lốp ô tô GOTECH GL509N - Màn hình rời cao cấp')
GO

------------------------------------------------------------------------------------
INSERT INTO [dbo].[suppliers]
           ([user_names]
           ,[emails]
           ,[images]
           ,[phones]
           ,[address]
           ,[status]
           ,[create_date]
           ,[update_date]
           ,[is_active])
     VALUES
          
		  (N'Phạm Văn Vương',N'Vươngpvpc04000@fpt.edu.vn',N'Hình ảnh','0123456789',N'Phú Quốc',1,'2023-05-27','2023-05-28',1),
		   (N'Trần Thị Hồng Thắm',N'Thắmthpc04000@fpt.edu.vn',N'Hình ảnh',
		   '0123456789',N'Hậu Giang',1,'2023-05-27','2023-05-28',1)
GO
------------------------------------------------------------------------------
INSERT INTO [dbo].[discounts]
           ([titles]
           ,[descriptions]
           ,[price_discounts]
           ,[start_day]
           ,[end_day])
     VALUES
           (N'Đèn xe ô tô',N'Đèn xe tốt',20,'2023-05-27','2023-05-28'),
		   (N'Sạc không dây thông minh xe ô tô Smart Sensor R1 – Bạc',N'Sạc chính hãng',40,'2023-05-27','2023-05-28'),
		   (N'Màn Hình Ô Tô Android Zestech S100J – Phiên Bản Tiết Kiệm',N'Màn hình chính hãng',0,'2023-05-27','2023-05-28')
GO
-----------------------------------------------------------------------------------
INSERT INTO [dbo].[products]
           ([titles]
           ,[price]
           ,[images]
           ,[description]
           ,[create_date]
           ,[update_date]
           ,[is_active]
           ,[categories_id]
           ,[suppliers_id]
           ,[original_price]
           ,[discounts_id])
     VALUES
       (N'Đèn Bi Led X-Light V20 New 2022','7000000',N'Hình Ảnh',N'Công suất: Cos 55W/Pha 70W','2023-05-27','2023-05-28',1,1,1,6000000,1),
	   (N'Sạc không dây thông minh xe ô tô Smart Sensor R1 – Bạc','8000000',N'Hình Ảnh',N'Công suất: Cos 55W/Pha 70W','2023-05-27','2023-05-28',1,2,2,6000000,2),
	   (N'Đèn Bi Laser Aozoom Light Z22 Pro','8000000',N'Hình Ảnh',N'Mã sản phẩm: Bi LASER LIGHT Z22 PRO','2023-05-27','2023-05-28',1,1,1,5000000,1)

GO
--------------------------------------------------------
INSERT INTO [dbo].[galleries]
           ([products_id]
           ,[images])
     VALUES
           (1,N'Hình ảnh 1'),
		   (1,N'Hình ảnh 2'),
		   (1,N'Hình ảnh 3'),
		   (1,N'Hình ảnh 4'),
		   (2,N'Hình ảnh 2.1'),
		   (2,N'Hình ảnh 2.2'),
		   (2,N'Hình ảnh 2.3'),
		   (2,N'Hình ảnh 2.4')
GO
--------------------------------------------------------------
INSERT INTO [dbo].[order_details]
           ([orders_id]
           ,[products_id]
           ,[price]
           ,[quanlity]
           ,[sum_money]
           ,[create_date]
           ,[update_date])
     VALUES
          (1,1,7000000,2,14000000,'2023-05-27','2023-05-28'),
		   (1,1,5000000,2,10000000,'2023-05-27','2023-05-28'),
		    (1,3,6000000,2,12000000,'2023-05-27','2023-05-28'),
			(1,2,5000000,3,12000000,'2023-05-27','2023-05-28'),
			(2,2,2000000,2,4000000,'2023-05-27','2023-05-28'),
		   (2,3,3000000,2,6000000,'2023-05-27','2023-05-28')
GO
---------------------------------------
INSERT INTO [dbo].[likes]
           ([users_id]
           ,[products_id]
           ,[is_likes]
           ,[create_like])
     VALUES
          ('1',1,1,'2023-05-27'),
		   ('2',2,1,'2023-05-27'),
		   ('1',3,1,'2023-05-27')
		   ,('2',1,1,'2023-05-27')
		   go
---------------------------------------------------------
INSERT INTO [dbo].[products_reviews]
           ([stars_number]
           ,[users_id]
           ,[orders_id])
     VALUES
           (4,1,1),
		   (5,2,2)
GO
-------------------------------------------------------------
INSERT INTO [dbo].[categories_news]
           ([titles])
     VALUES
           ('Tin tức đèn xe'),
		   ('Tin tức dây sạc thông minh')
GO
------------------------------------------------------------------
INSERT INTO [dbo].[news]
           ([titles]
           ,[contents]
           ,[video_href]
           ,[images]
           ,[create_date]
           ,[update_date]
           ,[is_active]
           ,[categories_id]
           ,[users_id])
     VALUES
           (N'Sạc không dây thông minh xe ô tô Smart Sensor R1 – Bạc',
		   N'Sau khi Apple và Samsung trang bị tính năng sạc không dây cho những chiếc điện thoại đầu bảng của họ như iPhone X, iPhone 8/8+ hay Note 8, Galaxy S8/S8+,… thì lập tức các phụ kiện sạc không dây đã trở nên “hot” hơn trên thị trường phụ kiện điện thoại.'
		   ,N'Video ',N'Hình ảnh','2023-05-27','2023-05-28',1,1,1),
		   (N'Đèn xe thông minh Bạc',
		   N'Tiếp nối sự thành công rực rỡ của sản phẩm Bi led oto X-light V20, thương hiệu X-light đã tiếp tục cho ra mắt bản cập nhật 2022 với hoàn thiện cao hơn. Một trong những ưu điểm nổi bật nhất của sản phẩm '
		   ,N'Video ',N'Hình ảnh','2023-05-27','2023-05-28',1,2,2)
GO
-----------------------------------------------------
INSERT INTO [dbo].[feedBack]
           ([users_id]
           ,[product_id]
           ,[title]
           ,[content]
           ,[rating])
     VALUES
          (1,1,N'Đèn chất lượng thế nào ?',
		  N'Mình mua hàng với số lượng lớn muốn xem chất lượng thế nào ?',1)
GO















