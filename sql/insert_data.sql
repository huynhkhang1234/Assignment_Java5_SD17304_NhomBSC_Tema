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
	 ,(N'nguyenphi',N'Phi',N'Nguyễn','Phinvhpc04124@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Trà Vinh',2,'2023-5-27','2023-5-28',1)           
	 ,(N'trantham',N'Thắm',N'Trần','Thamtthpc03916@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Hậu Giang',2,'2023-5-27','2023-5-28',1)           
	 ,(N'phamvan',N'Vương',N'Phạm','Vuongpvpc04124@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Phú Quốc',2,'2023-5-27','2023-5-28',1)           
	 ,(N'nguyenhong',N'Ngoan',N'Nguyễn','Ngoannpc04172@fpt.edu.vn','123',N'hình ảnh','0123456789',N'Cần Thơ',2,'2023-5-27','2023-5-28',1)           
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
          (N'sản phẩm tốt',N'Đang vẩn chuyển',14000000,1,'2023-05-27','2023-05-28',38000000)
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',500000,2,'2023-05-27','2023-05-28',500000)
		  ,(N'sản phẩm tốt',N'Đang chờ sử lý',600000,3,'2023-05-27','2023-05-28',600000)		
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',4000000,5,'2023-05-27','2023-05-28',500000)
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',6000000,4,'2023-05-27','2023-05-28',10000000)
		  ,(N'sản phẩm tốt',N'Đang vẩn chuyển',14000000,1,'2023-05-27','2023-05-28',38000000)
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',500000,4,'2023-05-27','2023-05-28',500000)
		  ,(N'sản phẩm tốt',N'Đang chờ sử lý',600000,3,'2023-05-27','2023-05-28',600000)		
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',4000000,5,'2023-05-27','2023-05-28',500000)
		  ,(N'sản phẩm tốt',N'Đã hoàn thành',6000000,2,'2023-05-27','2023-05-28',10000000)	
		  go
------------------

INSERT INTO [dbo].[categories]
           ([names])
     VALUES
           (N'Màn Hình Android Ô Tô')
		   ,(N'Android Box')
		   ,(N'Đèn Ô Tô')
		   ,(N'Phim Cách Nhiệt')
		   ,(N'Camera')
		   ,(N'Âm Thanh Ô Tô')
		   ,(N'Thảm')
		   ,(N'Tiện ích xe')
		   ,(N'Phụ kiện Ô tô')
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
          
		  (N'Phạm Văn Vương',N'Vuongpvpc04000@fpt.edu.vn',N'Hình ảnh','0123456789',N'Phú Quốc',1,'2023-05-27','2023-05-28',1),
		  (N'Trần Thị Hồng Thắm',N'Thamthpc04000@fpt.edu.vn',N'Hình ảnh','0123456789',N'Hậu Giang',1,'2023-05-27','2023-05-28',1),
		  (N'Nguyễn Hồng Ngoan',N'Ngoannhpc04172@fpt.edu.vn',N'Hình ảnh','0123456789',N'Cần Thơ',1,'2023-05-27','2023-05-28',1)
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
           ,[original_price])
VALUES
       (N'Màn hình Android ô tô thông minh GOTECH GT8 MAX - Best Seller 2022','12900000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,1,1,6000000)
	   ,(N'Màn hình NaviPlay N600 chính hãng – Thiết bị giải trí giá rẻ cho ô tô','6900000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,1,2,6000000)
	   ,(N'Màn hình android OledPro A5','7800000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,1,2,6000000)
	   ,(N'Android Box Safeview SA-6125','6900000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,2,1,6000000)
	   ,(N'Android Box Zestech DX300','9500000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,2,2,6000000)
	   ,(N'Carplay Box GB8 - Android Box Ô Tô Gotech','8900000',N'Hình Ảnh',N'CPU: 8 nhân – 1.8GHz','2023-05-27','2023-05-28',1,2,1,6000000)
	   ,(N'Đèn Bi Led X-Light V20 New 2022','7500000',N'Hình Ảnh',N'Công suất: Cos 55W/Pha 70W','2023-05-27','2023-05-28',1,3,2,6000000)
	   ,(N'Bi Gầm Led Aozoom Eagle Light','5050000',N'Hình Ảnh',N'Công suất: Cos 32W/Pha 38W','2023-05-27','2023-05-28',1,3,1,6000000)
	   ,(N'Đèn Bi Laser TiTan Platinum Plus 9+3','16900000',N'Hình Ảnh',N'Công suất: Cos 80W/Pha 90W','2023-05-27','2023-05-28',1,3,2,6000000)
	   ,(N'Camera 360 ô tô GOTECH GP6 Mới nhất – Panda Auto','12500000',N'Hình Ảnh',N'Mắt Camera: Sony A225','2023-05-27','2023-05-28',1,5,1,6000000)
	   ,(N'Camera 360 OledPro AHD','10500000',N'Hình Ảnh',N'Mắt Camera: Sony A225','2023-05-27','2023-05-28',1,5,2,6000000)
	   ,(N'Camera 360 Safeview LD980H','18900000',N'Hình Ảnh',N'Mắt Camera: Sony','2023-05-27','2023-05-28',1,5,1,6000000)

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
		   (1,2,5000000,2,10000000,'2023-05-27','2023-05-28'),
		    (2,3,6000000,2,12000000,'2023-05-27','2023-05-28'),
			(2,2,5000000,3,12000000,'2023-05-27','2023-05-28'),
			(3,2,2000000,2,4000000,'2023-05-27','2023-05-28'),
		   (3,3,3000000,2,6000000,'2023-05-27','2023-05-28'),
		   (4,1,7000000,2,14000000,'2023-05-27','2023-05-28'),
		   (4,1,5000000,2,10000000,'2023-05-27','2023-05-28'),
		    (5,3,6000000,2,12000000,'2023-05-27','2023-05-28'),
			(5,2,5000000,3,12000000,'2023-05-27','2023-05-28'),
			(2,2,2000000,2,4000000,'2023-05-27','2023-05-28'),
		   (1,3,3000000,2,6000000,'2023-05-27','2023-05-28')
GO
---------------------------------------
INSERT INTO [dbo].[likes]
           ([users_id]
           ,[products_id]
           ,[is_likes])
     VALUES
            (1,1,1)
		   ,(1,2,1)
		   ,(1,3,1)
		   ,(2,4,1)
		   ,(2,5,1)
		   ,(2,6,1)
		   ,(3,3,1)
		   ,(3,4,1)
		   ,(3,6,1)
		   ,(4,7,1)
		   ,(4,1,1)
		   ,(4,2,1)
		   ,(5,3,1)
		   ,(5,2,1)
		   ,(5,1,1)
		   go
---------------------------------------------------------
INSERT INTO [dbo].[products_reviews]
           ([stars_number]
           ,[content]
           ,[users_id]
           ,[orders_id])
     VALUES
           (4,N'Sản phẩm hợp giá tiền, dễ sử dụng cực kì luôn á nha. Tuy nhiên, mình lỡ mua size k vừa, hơi nhỏ quá.',1,1),
		   (4,N'Sản phẩm hợp giá tiền, dễ sử dụng cực kì luôn á nha',1,2),
		   (5,N'Sản phẩm hợp giá tiền, dễ sử dụng cực kì luôn á nha',2,2),
		   (5,N'Sản phẩm hợp giá tiền, dễ sử dụng cực kì luôn á nha',2,1)
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















