USE [master]
GO
/****** Object:  Database [ShopLaptop]    Script Date: 10/25/2022 9:18:20 AM ******/
CREATE DATABASE [ShopLaptop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopLaptop', FILENAME = N'E:\DBI\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopLaptop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopLaptop_log', FILENAME = N'E:\DBI\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopLaptop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopLaptop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopLaptop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopLaptop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopLaptop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopLaptop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopLaptop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopLaptop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopLaptop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopLaptop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopLaptop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopLaptop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopLaptop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopLaptop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopLaptop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopLaptop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopLaptop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopLaptop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopLaptop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopLaptop] SET  MULTI_USER 
GO
ALTER DATABASE [ShopLaptop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopLaptop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopLaptop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopLaptop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopLaptop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopLaptop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopLaptop] SET QUERY_STORE = OFF
GO
USE [ShopLaptop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 10/25/2022 9:18:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [bit] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/25/2022 9:18:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/25/2022 9:18:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[ID] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[img] [text] NULL,
	[price] [nvarchar](20) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[categoryID] [int] NULL,
	[CPU] [nvarchar](50) NOT NULL,
	[GPU] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[Screen] [nvarchar](50) NOT NULL,
	[Disk] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([ID], [username], [password], [role], [name]) VALUES (1, N'thang', N'123456', 0, N'thang')
INSERT [dbo].[account] ([ID], [username], [password], [role], [name]) VALUES (2, N'admin', N'123456', 1, N'ToanThang')
INSERT [dbo].[account] ([ID], [username], [password], [role], [name]) VALUES (4, N'trung', N'123456', 0, N'trung')
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[category] ([categoryID], [name]) VALUES (1, N'Acer')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (2, N'ASUS')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (3, N'MSI')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (4, N'Dell')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (5, N'HP')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (6, N'Lenovo')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (7, N'Gigabyte')
INSERT [dbo].[category] ([categoryID], [name]) VALUES (8, N'Apple')
GO
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (1, N'Acer Nitro Eagle', N'https://bizweb.dktcdn.net/100/408/235/products/gaming-acer-nitro-5-eagle.jpg?v=1636346818687', N'20.999.000', N'Laptop gaming Acer Nitro 5 Eagle AN515 57 54MV', N'Cấu hình mạnh mẽ, vượt trội. Thiết kế mạnh mẽ. Màn hình FullHD với kích thước 15.6 inch. Khả năng tản nhiệt nhanh', 1, N'i5-11400H', N'RTX 3050', N'8GB', N'15.6"FHD 144Hz', N'521GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (2, N'Asus TUF Dash', N'https://product.hstatic.net/1000026716/product/2022_asus_tuf_dash_f15_fx517_3d_rendering_photos_1d_off_black_light_02_89465b2c781c45b6b8f208c201aa9893.png', N'23.790.000', N'Laptop gaming Asus TUF Dash F15 FX517ZC HN077W', N'Hiệu năng tuyệt vời. Màn hình 15.6 inch FHD IPS sắc nét. Bàn phím cho độ chính xác tuyệt hảo. Wi-Fi 6 siêu tốc độ. Sạc Type-C da dạng. Thunderbolt 4 cho tốc độ kết nối nhanh. Ðộ bền đạt chuẩn quân đội', 2, N'i5-12450H', N'RTX 3050', N'8GB', N'15.6"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (3, N'MSI Katana', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-msi-katana-gf66-11uc-224vn-7_8b3041c21ea1487e8030c26abdb37570.png', N'22.490.000', N'Laptop gaming MSI Katana GF66 11UC 224VN', N'Thiết kế mạnh mẽ đậm chất gaming. Bàn phím dễ thao tác. Cấu hình vượt trội chơi game thả ga. Màn hình Full HD sắc nét', 3, N'i7-11800H', N'RTX 3050', N'8GB', N'15.6"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (4, N'Lenovo IdeaPad', N'https://product.hstatic.net/1000026716/product/g-3-15arh7-82sb007hvn-r7-6800h_c9f00b6c92bb4b45922b7704abf72a05_master_21d009d6b15f49c2876daf6509376cf4.png', N'27.990.000', N'Laptop gaming Lenovo IdeaPad Gaming 3 15IAH7 82S90087VN', N'Thiết kế đặc biệt. Cấu hình mạnh mẽ dành cho gaming. Khung hình 15.6 inch đẹp mắt. Ðầy đủ khả năng kết nối', 6, N'i7-12700H', N'RTX 3050Ti', N'16GB', N'15.6"FHD 120Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (5, N'HP Victus', N'https://product.hstatic.net/1000026716/product/s-16-d0293tx-5z9r4pa-i5-11400h_4d5ce18a4355481fa4e0bbbfdad04ff2_master_f14add7c91084ea1acf713bd1c714b5e.png', N'27.890.000', N'Laptop Gaming HP VICTUS 16 d0292TX 5Z9R4PA', N'Thiết kế đơn giản từ VICTUS. Hiệu năng mạnh mẽ. Màn hình sắc nét, tối ưu khả năng gaming. Layout bàn phím dễ dàng thao tác. Ða dạng cổng kết nối', 5, N'i5-11400H', N'RTX 3050Ti', N'8GB', N'16.1"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (6, N'MSI Crosshair', N'https://product.hstatic.net/1000026716/product/65634262398969ec2a65948b5ab4dd5cf6b28_2dbbc2ca2a54429ca3702e56fc188fcb_e53497078f124cbf950b255a15a8a25d.png', N'36.990.000', N'Laptop gaming MSI Crosshair 17 B12UEZ 272VN', N'GeForce RTX 30 Series mạnh mẽ. Tính năng Resizable BAR. Hình ảnh chân thực, sắc nét. Tản nhiệt Cooler Boost 5. Chất lượng âm thanh vòm NAHIMIC 3 cực chân thật. Hỗ trợ WiFi 6', 3, N'i7-12700H', N'RTX 3060', N'16GB', N'17.3"FHD 360Hz', N'1TB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (7, N'Asus ROG Strix', N'https://product.hstatic.net/1000026716/product/2_fac324e3749d429abe57e25addf597f1.png', N'18.990.000', N'Laptop Gaming Asus ROG Strix G15 G513IH HN015W', N'Thiết kế mạnh mẽ đầy cá tính. Cấu hình vượt trội cho trải nghiệm tối đa. Tản nhiệt hiệu quả cao. Hỗ trợ LED RGB rực rỡ trên laptop. Trải nghiệm màn hình Full HD tràn viền', 2, N'R7-4800H', N'GTX 1650', N'8GB', N'15.6"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (8, N'Acer Aspire', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-acer-aspire-7-a715-43g-r8ga-1_fec51f0a2e794e59b71e0d6d56a86655.jpg', N'19.990.000', N'Laptop gaming Acer Aspire 7 A715 43G R8GA
', N'Laptop gaming tốt nhất phân khúc. Thiết kế tối ưu trải nghiệm chơi game. Dịch vụ bảo hành 3S1', 1, N'R5-5625U', N'RTX 3050', N'8GB', N'15.6"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (9, N'Gigabyte G5 ME', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-gigabyte-g5-me-52vn263sh-3_1936f276fd084137adf61305ef94d587.png', N'24.990.000', N'Laptop gaming GIGABYTE G5 ME 52VN263SH
', N'Hiệu năng xử lý mạnh mẽ. Sức mạnh xử lý đồ họa đỉnh cao từ RTX. Tản nhiệt mang đến hiệu suất cao. Những khung hình đỉnh nhất cho game thủ. Hệ thống cổng kết nối đa dạng', 7, N'i5-12500H', N'RTX 3050Ti', N'8GB', N'15.6"FHD 144Hz', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (10, N'Dell Inspiron', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-dell-inspiron-16-5620-p1wkn-3_c2818e10ecf6478aa8a9060284868ccf.png', N'20.490.000', N'Laptop Dell Inspiron 16 5620 P1WKN
', N'Cấu hình giải quyết mọi tác vụ văn phòng được trơn tru nhất. Thiết kế tinh tế, giản dị. Màn hình góc rộng, độ sắc nét cao. Cổng giao tiếp đa dạng', 4, N'i5-1235U', N'Intel Iris Xe Graphics', N'8GB', N'16"FHD 60Hz', N'256GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (11, N'Macbook Air M2', N'https://product.hstatic.net/1000026716/product/macbook_air_m2_2022_2_bd81ec31f67e45bb9cca5db4414a7dfa_master_c2289daec9b340a9a3e65a2430ee3a7e.jpg', N'42.590.000', N'Macbook Air M2 10GPU 16GB 512GB - Midnight
', N'Đột phá về thiết kế. Hiệu năng mạnh mẽ từ con chip M2. Tăng tốc cho tất cả ứng dụng. Màn hình Retina siêu nét. .Bàn phím và touchpad tiện dụng. Dung lượng pin lớn và tản nhiệt hiệu quả. Cổng kết nối hiện đại', 8, N'M2', N'M2', N'16GB', N'13.6"2K Retina', N'512GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (12, N'MSI Modern', N'https://product.hstatic.net/1000026716/product/laptop-msi-modern-14-b11mou-1028vn-2_664af602f3ab47e7b3a8bbee06c88c43.jpg', N'10.990.000', N'Laptop MSI Modern 14 B11MOU 1028VN
', N'Vượt trội tuyệt vời. Tăng tốc cho laptop của bạn với đồ họa chuyên dụng. Vẻ đẹp thanh lịch. Màn hình viền mỏng. Cổng kết nối đa dạng. Màn hình đa nhiệm, trải nghiệm hoàn hảo. Ðộ bền chuẩn quân đội', 3, N'i3-1115G4', N'Intel UHD Graphics', N'8GB', N'14"FHD 60Hz', N'256GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (13, N'HP Pavilion', N'https://product.hstatic.net/1000026716/product/c08114716_bf381a6f5a154e94933e105fcfede988.png', N'13.990.000', N'Laptop HP Pavilion 15 EG2063TU 6K791PA
', N'Thiết kế trang nhã. Hiệu năng bền bỉ và muượt mà. Bản lề nâng đỡ hỗ trợ tiện lợi. Màn hình sắc nét. Công nghệ sạc nhanh tiên tiến. Trải nghiệm giải trí đỉnh cao. Ða dạng cổng kết nối', 5, N'i3-1215U', N'Intel UHD Graphics', N'8GB', N'15.6"FHD 60Hz', N'256GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (14, N'MacBook Pro', N'https://product.hstatic.net/1000026716/product/gearvn-macbook-pro-13-m2-10gpu-16gb-256gb-silver-3_5ed83811afe64f1da1ee66117031137c.png', N'38.590.000', N'MacBook Pro 13 M2 10GPU 16GB 256GB Silver
', N'Hoạt động mạnh mẽ. Màn hình tai thỏ ấn tuợng. Thiết kế mỏng nhẹ. Uy tín về bảo mật. Cổng kết nối đa dụng trên MacBook Pro 13 M2', 8, N'M2', N'M2', N'16GB', N'13.3"2K Retina', N'256GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (15, N'Dell Latitude', N'https://product.hstatic.net/1000026716/product/laptop-dell-latitude-3520-p108f001-70280536-4_a3b5d20b86bf420289f1af7828596a9b.jpg', N'12.090.000', N'Laptop Dell Latitude 3520 P108F001 70280536', N'Sở hữu thiết kế đơn giản, sang trọng. Màn hình FullHD chân thật, sắc nét. Bàn phím, touchpad hỗ trợ soạn thảo văn bản hiệu quả. Đa dạng cổng kết nối. Hiệu năng mạnh mẽ', 4, N'i3-1115G4', N'Intel UHD Graphics', N'8GB', N'15.6"FHD 60Hz', N'256GB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (16, N'Dell XPS', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-dell-xps-17-9700-xps7i7001w1-silver-4_6bf6b69313b446e7a0926a20827fc727.png', N'75.000.000', N'Laptop Dell XPS 17 9700 XPS7I7001W1 Silver', N'Kiểu dàng thời thượng. Hiệu năng vượt trội. Màn hình UHD siêu sắc nét. Làm việc trong mọi điều kiện ánh sáng', 4, N' i7-11800H', N'RTX 3050', N'16GB', N'17"4K 60Hz', N'1TB')
INSERT [dbo].[product] ([ID], [name], [img], [price], [title], [description], [categoryID], [CPU], [GPU], [RAM], [Screen], [Disk]) VALUES (17, N'Lenovo Yoga Slim 7 Carbon', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-lenovo-yoga-slim-7-carbon-14acn6-82l0005bvn-3_134c4426323f44a5a8dade249571eb72.png', N'33.390.000', N'Laptop Lenovo Yoga Slim 7 Carbon 14ACN6 82L0005BVN', N'Thiết kế mỏng nhẹ đến khó tin. Hiệu năng vượt trội. Màn hình OLED cực đẹp. Bàn phím chắc chắn, độ nảy tốt. Cổng kết nối đặc biệt so với các dòng máy khác. Loa ngoài hấp dẫn', 6, N'R7-5800U', N'MX450', N'16GB', N'14"2.8K 90Hz', N'1TB')
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
USE [master]
GO
ALTER DATABASE [ShopLaptop] SET  READ_WRITE 
GO
