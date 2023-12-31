USE [master]
GO
/****** Object:  Database [SportStore]    Script Date: 26.10.2023 23:10:24 ******/
CREATE DATABASE [SportStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportStore', FILENAME = N'C:\Users\Денис\SportStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportStore_log', FILENAME = N'C:\Users\Денис\SportStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportStore] SET  MULTI_USER 
GO
ALTER DATABASE [SportStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportStore] SET QUERY_STORE = OFF
GO
USE [SportStore]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderList] [nvarchar](max) NOT NULL,
	[OrderDate] [nvarchar](max) NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[PickupPoint] [int] NOT NULL,
	[Client] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberPoint] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[NumberStreet] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleNumber] [nvarchar](100) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[MaxDiscount] [tinyint] NULL,
	[Manufacturer] [nvarchar](max) NOT NULL,
	[Supplier] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[DiscountAmount] [tinyint] NULL,
	[QuantityInStock] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.10.2023 23:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (2, N'А112Т4, 2, G598Y6, 2', N'15.05.2022', CAST(N'2022-05-21' AS Date), 18, N'Поляков Степан Егорович', N'401', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (3, N'F746E6, 3, D830R5, 3', N'16.05.2022', CAST(N'2022-05-22' AS Date), 20, N'Леонова Алиса Кирилловна', N'402', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (4, N'D648N7, 10, F735B6, 10', N'17.05.2022', CAST(N'2022-05-23' AS Date), 20, N'Яковлев Платон Константинович', N'403', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (5, N'F937G4, 1, E324U7, 1', N'18.05.2022', CAST(N'2022-05-24' AS Date), 22, N'Ковалева Ева Яковлевна', N'404', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (6, N'N483G5, 10, D038G6, 10', N'19.05.2022', CAST(N'2022-05-25' AS Date), 22, N'', N'405', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (7, N'G480F5, 2, C324S5, 2', N'19.05.2022', CAST(N'2022-05-25' AS Date), 16, N'', N'406', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (8, N'V312R4, 1, J4DF5E, 1', N'21.05.2022', CAST(N'2022-05-27' AS Date), 16, N'', N'407', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (9, N'G522B5, 3, K432G6, 3', N'22.05.2022', CAST(N'2022-05-28' AS Date), 18, N'', N'408', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (10, N'F047J7, 1, S374B5, 1', N'23.05.2022', CAST(N'2022-05-29' AS Date), 24, N'', N'409', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPoint], [Client], [Code], [Status]) VALUES (11, N'N836R5, 5, D927K3, 5', N'24.05.2022', CAST(N'2022-05-30' AS Date), 24, N'', N'410', N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (1, N'344288', N' г. Дубна', N' ул. Чехова', N'1')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (2, N'614164', N' г.Дубна', N'  ул. Степная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (3, N'394242', N' г. Дубна', N' ул. Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (4, N'660540', N' г. Дубна', N' ул. Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (5, N'125837', N' г. Дубна', N' ул. Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (6, N'125703', N' г. Дубна', N' ул. Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (7, N'625283', N' г. Дубна', N' ул. Победы', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (8, N'614611', N' г. Дубна', N' ул. Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (9, N'454311', N' г.Дубна', N' ул. Новая', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (10, N'660007', N' г.Дубна', N' ул. Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (11, N'603036', N' г. Дубна', N' ул. Садовая', N'4')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (12, N'450983', N' г.Дубна', N' ул. Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (13, N'394782', N' г. Дубна', N' ул. Чехова', N'3')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (14, N'603002', N' г. Дубна', N' ул. Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (15, N'450558', N' г. Дубна', N' ул. Набережная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (16, N'394060', N' г.Дубна', N' ул. Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (17, N'410661', N' г. Дубна', N' ул. Школьная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (18, N'625590', N' г. Дубна', N' ул. Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (19, N'625683', N' г. Дубна', N' ул. 8 Марта', N'')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (20, N'400562', N' г. Дубна', N' ул. Зеленая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (21, N'614510', N' г. Дубна', N' ул. Маяковского', N'47')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (22, N'410542', N' г. Дубна', N' ул. Светлая', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (23, N'620839', N' г. Дубна', N' ул. Цветочная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (24, N'443890', N' г. Дубна', N' ул. Коммунистическая', N'1')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (25, N'603379', N' г. Дубна', N' ул. Спортивная', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (26, N'603721', N' г. Дубна', N' ул. Гоголя', N'41')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (27, N'410172', N' г. Дубна', N' ул. Северная', N'13')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (28, N'420151', N' г. Дубна', N' ул. Вишневая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (29, N'125061', N' г. Дубна', N' ул. Подгорная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (30, N'630370', N' г. Дубна', N' ул. Шоссейная', N'24')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (31, N'614753', N' г. Дубна', N' ул. Полевая', N'35')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (32, N'426030', N' г. Дубна', N' ул. Маяковского', N'44')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (33, N'450375', N' г. Дубна ', N'ул. Клубная', N'44')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (34, N'625560', N' г. Дубна', N' ул. Некрасова', N'12')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (35, N'630201', N' г. Дубна', N' ул. Комсомольская', N'17')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (36, N'190949', N' г. Дубна', N' ул. Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (1, N'А112Т4', N'Боксерская груша', N'шт.', CAST(778.0000 AS Decimal(19, 4)), 30, N'X-Match', N'Спортмастер', N'Спортивный инвентарь', 5, 6, N'Боксерская груша X-Match черная', N'?112?4.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (2, N'G598Y6', N'Спортивный мат', N'шт.', CAST(2390.0000 AS Decimal(19, 4)), 15, N'Perfetto Sport', N'Декатлон', N'Спортивный инвентарь', 2, 16, N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'G598Y6.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (3, N'F746E6', N'Шведская стенка', N'шт.', CAST(9900.0000 AS Decimal(19, 4)), 10, N'ROMANA Next', N'Декатлон', N'Спортивный инвентарь', 3, 5, N'Шведская стенка ROMANA Next, pastel', N'F746E6.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (4, N'D830R5', N'Тренажер прыжков', N'шт.', CAST(1120.0000 AS Decimal(19, 4)), 15, N'Moby Kids', N'Спортмастер', N'Спортивный инвентарь', 4, 8, N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'D830R5.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (5, N'B538G6', N'Спортивный костюм', N'шт.', CAST(839.0000 AS Decimal(19, 4)), 5, N'playToday', N'Спортмастер', N'Одежда', 3, 17, N'Спортивный костюм playToday (футболка + шорты)', N'B538G6.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (6, N'D648N7', N'Набор для хоккея', N'шт.', CAST(350.0000 AS Decimal(19, 4)), 10, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 4, 7, N'Набор для хоккея Совтехстром', N'D648N7.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (7, N'F735B6', N'Игровой набор', N'шт.', CAST(320.0000 AS Decimal(19, 4)), 15, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 2, 9, N'Игровой набор Совтехстром Кегли и шары', N'F735B6.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (8, N'F937G4', N'Игровой набор', N'шт.', CAST(480.0000 AS Decimal(19, 4)), 10, N'Abtoys', N'Спортмастер', N'Спортивный инвентарь', 4, 12, N'Набор Abtoys Бадминтон и теннис ', N'F937G4.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (9, N'E324U7', N'Велотренажер', N'шт.', CAST(6480.0000 AS Decimal(19, 4)), 25, N'DFC', N'Спортмастер', N'Спортивный инвентарь', 5, 5, N'Велотренажер двойной DFC B804 dual bike', N'E324U7.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (10, N'G403T5', N'Тюбинг', N'шт.', CAST(1450.0000 AS Decimal(19, 4)), 15, N'Nordway', N'Спортмастер', N'Спортивный инвентарь', 4, 13, N'Тюбинг Nordway, 73 см', N'G403T5.jpg', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (11, N'N483G5', N'Клюшка', N'шт.', CAST(1299.0000 AS Decimal(19, 4)), 10, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 3, 4, N'Клюшка Nordway NDW300 (2019/2020) SR лев. 19 150см', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (12, N'D038G6', N'Лыжный комплект', N'шт.', CAST(3000.0000 AS Decimal(19, 4)), 30, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 4, 23, N'Лыжный комплект беговые NORDWAY XC Classic, 45-45-45мм, 160см', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (13, N'G480F5', N'Ролики', N'шт.', CAST(1600.0000 AS Decimal(19, 4)), 15, N'Ridex', N'Спортмастер', N'Спортивный инвентарь', 4, 7, N'Коньки роликовые Ridex Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (14, N'C324S5', N'Шлем', N'шт.', CAST(4000.0000 AS Decimal(19, 4)), 10, N'Salomon', N'Декатлон', N'Спортивный инвентарь', 5, 16, N'Шлем г.л./сноуб. Salomon Grom р.:KS черный (L40836800)', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (15, N'V312R4', N'Мяч', N'шт.', CAST(4150.0000 AS Decimal(19, 4)), 20, N'Mikasa', N'Декатлон', N'Спортивный инвентарь', 2, 5, N'Мяч волейбольный MIKASA VT370W, для зала, 5-й размер, желтый/синий', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (16, N'J4DF5E', N'Насос', N'шт.', CAST(300.0000 AS Decimal(19, 4)), 5, N'Molten', N'Спортмастер', N'Спортивный инвентарь', 4, 12, N'Насос Molten HP-18-B для мячей мультиколор', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (17, N'G522B5', N'Ласты', N'шт.', CAST(1980.0000 AS Decimal(19, 4)), 15, N'Colton', N'Декатлон', N'Спортивный инвентарь', 3, 6, N'Ласты Colton CF-02 для плавания р.:33-34 серый/голубой', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (18, N'K432G6', N'Шапочка для плавания', N'шт.', CAST(440.0000 AS Decimal(19, 4)), 25, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 17, N'Шапочка для плавания Atemi PU 140 ткань с покрытием желтый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (19, N'J532D4', N'Перчатки для карате', N'шт.', CAST(1050.0000 AS Decimal(19, 4)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 3, 5, N'Перчатки для каратэ Green Hill KMС-6083 L красный', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (20, N'G873H4', N'Велосипед', N'шт.', CAST(14930.0000 AS Decimal(19, 4)), 5, N'SKIF', N'Спортмастер', N'Спортивный инвентарь', 4, 6, N'Велосипед SKIF 29 Disc (2021), горный (взрослый), рама: 17", колеса: 29", темно-серый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (21, N'V423D4', N'Штанга', N'шт.', CAST(5600.0000 AS Decimal(19, 4)), 10, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 3, 8, N'Штанга Starfit BB-401 30кг пласт. черный ', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (22, N'K937A5', N'Гиря', N'шт.', CAST(890.0000 AS Decimal(19, 4)), 5, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 10, N'Гиря Starfit ГМБ4 мягкое 4кг синий/оранжевый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (23, N'F047J7', N'Коврик', N'шт.', CAST(720.0000 AS Decimal(19, 4)), 15, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 5, 11, N'Коврик Bradex для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (24, N'S374B5', N'Ролик для йоги', N'шт.', CAST(700.0000 AS Decimal(19, 4)), 10, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 3, 12, N'Ролик для йоги Bradex Туба d=14см ш.:33см оранжевый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (25, N'F687G5', N'Защита голени', N'шт.', CAST(1900.0000 AS Decimal(19, 4)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 4, 6, N'Защита голени GREEN HILL Panther, L, синий/черный', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (26, N'N892G6', N'Очки для плавания', N'шт.', CAST(500.0000 AS Decimal(19, 4)), 5, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 14, N'Очки для плавания Atemi N8401 синий', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (27, N'D893W4', N'Мяч', N'шт.', CAST(900.0000 AS Decimal(19, 4)), 5, N'Demix', N'Спортмастер', N'Спортивный инвентарь', 2, 5, N'Мяч футбольный DEMIX 1STLS1JWWW, универсальный, 4-й размер, белый/зеленый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (28, N'N836R5', N'Коньки', N'шт.', CAST(2000.0000 AS Decimal(19, 4)), 10, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 3, 16, N'Коньки ATEMI AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (29, N'D927K3', N'Перчатки ', N'шт.', CAST(660.0000 AS Decimal(19, 4)), 15, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 3, N'Перчатки Starfit SU-125 атлетические S черный', N'picture.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo], [Status]) VALUES (30, N'V392H7', N'Степ-платформа', N'шт.', CAST(4790.0000 AS Decimal(19, 4)), 10, N'Starfit', N'Спортмастер', N'Спортивный инвентарь', 3, 15, N'Степ-платформа Starfit SP-204 серый/черный', N'picture.png', N'готов')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (34, N'Пахомова', N'Аиша', N'Анатольевна', N'm4ic8j5qgstw@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (35, N'Жуков', N'Роман', N'Богданович', N'd43zfg9tlsyv@gmail.com', N'uzWC67', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (36, N'Киселева', N'Анастасия', N'Максимовна', N'8ohgisf6k45w@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (37, N'Григорьева', N'Арина', N'Арсентьевна', N'hi1brwj46czx@mail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (38, N'Иванов', N'Лев', N'Михайлович', N'fvkbcamhlj52@gmail.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (39, N'Григорьев', N'Лев', N'Давидович', N'9qxnce8jwruv@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (40, N'Поляков', N'Степан', N'Егорович', N'dotiex942p1r@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (41, N'Леонова', N'Алиса', N'Кирилловна', N'n0bmi2h1xral@tutanota.com', N'gynQMT', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (42, N'Яковлев', N'Платон', N'Константинович', N'sfm3t278kdvz@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (43, N'Ковалева', N'Ева', N'Яковлевна', N'ilb8rdut0v7e@mail.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tmp_ms_x__3C991142B63AC31C]    Script Date: 26.10.2023 23:10:24 ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([PickupPoint])
REFERENCES [dbo].[PickupPoint] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SportStore] SET  READ_WRITE 
GO
