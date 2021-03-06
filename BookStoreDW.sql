USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 12/9/2020 9:44:39 AM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LETHAISERVER\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LETHAISERVER\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[company_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[isbn] [varchar](50) NOT NULL,
	[title] [varchar](100) NULL,
	[publication_date] [date] NULL,
	[edition] [int] NULL,
	[available_quantity] [int] NULL,
	[price] [numeric](6, 2) NULL,
	[author] [varchar](50) NULL,
	[publisher] [varchar](50) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books_discounts]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books_discounts](
	[book_id] [varchar](50) NULL,
	[discount_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books_genres]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books_genres](
	[book_id] [varchar](50) NOT NULL,
	[genre_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_books_genres] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[passwordHash] [varchar](50) NULL,
	[postal_code] [varchar](6) NULL,
	[street] [varchar](50) NULL,
	[building_no] [varchar](5) NULL,
	[flat_no] [varchar](5) NULL,
	[city] [varchar](50) NULL,
	[nip] [varchar](10) NULL,
	[phone_number] [varchar](10) NULL,
	[age] [int] NULL,
	[sex] [varchar](10) NULL,
	[job] [varchar](50) NULL,
	[country] [varchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers_discounts]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers_discounts](
	[customer_id] [varchar](50) NULL,
	[discount_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[value] [numeric](2, 2) NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [varchar](50) NOT NULL,
	[customer_id] [varchar](50) NULL,
	[date] [date] NULL,
	[discount_id] [varchar](50) NULL,
	[shipper] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[ShipAddress] [varchar](50) NULL,
	[ShipCity] [varchar](50) NULL,
	[ShipRegion] [varchar](50) NULL,
	[ShipCountry] [varchar](50) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders_details]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_details](
	[book_id] [varchar](50) NULL,
	[order_id] [varchar](50) NULL,
	[amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[id] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_publishers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [varchar](50) NOT NULL,
	[book_id] [varchar](50) NULL,
	[customer_id] [varchar](50) NULL,
	[review] [int] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippers]    Script Date: 12/9/2020 9:44:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippers](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[phone] [varchar](10) NULL,
 CONSTRAINT [PK_shippers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_customers]    Script Date: 12/9/2020 9:44:39 AM ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [IX_customers] UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_genres]    Script Date: 12/9/2020 9:44:39 AM ******/
ALTER TABLE [dbo].[genres] ADD  CONSTRAINT [IX_genres] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_publishers]    Script Date: 12/9/2020 9:44:39 AM ******/
ALTER TABLE [dbo].[publishers] ADD  CONSTRAINT [IX_publishers] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_authors] FOREIGN KEY([author])
REFERENCES [dbo].[authors] ([id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_authors]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_publishers] FOREIGN KEY([publisher])
REFERENCES [dbo].[publishers] ([id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_publishers]
GO
ALTER TABLE [dbo].[books_discounts]  WITH CHECK ADD  CONSTRAINT [FK_books_discounts_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([isbn])
GO
ALTER TABLE [dbo].[books_discounts] CHECK CONSTRAINT [FK_books_discounts_books]
GO
ALTER TABLE [dbo].[books_discounts]  WITH CHECK ADD  CONSTRAINT [FK_books_discounts_discounts] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[books_discounts] CHECK CONSTRAINT [FK_books_discounts_discounts]
GO
ALTER TABLE [dbo].[books_genres]  WITH CHECK ADD  CONSTRAINT [FK_books_genres_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([isbn])
GO
ALTER TABLE [dbo].[books_genres] CHECK CONSTRAINT [FK_books_genres_books]
GO
ALTER TABLE [dbo].[books_genres]  WITH CHECK ADD  CONSTRAINT [FK_books_genres_genres] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([id])
GO
ALTER TABLE [dbo].[books_genres] CHECK CONSTRAINT [FK_books_genres_genres]
GO
ALTER TABLE [dbo].[customers_discounts]  WITH CHECK ADD  CONSTRAINT [FK_customers_discounts_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[customers_discounts] CHECK CONSTRAINT [FK_customers_discounts_customers]
GO
ALTER TABLE [dbo].[customers_discounts]  WITH CHECK ADD  CONSTRAINT [FK_customers_discounts_discounts] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[customers_discounts] CHECK CONSTRAINT [FK_customers_discounts_discounts]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_discounts] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_discounts]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_shippers] FOREIGN KEY([shipper])
REFERENCES [dbo].[shippers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_shippers]
GO
ALTER TABLE [dbo].[orders_details]  WITH CHECK ADD  CONSTRAINT [FK_orders_details_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([isbn])
GO
ALTER TABLE [dbo].[orders_details] CHECK CONSTRAINT [FK_orders_details_books]
GO
ALTER TABLE [dbo].[orders_details]  WITH CHECK ADD  CONSTRAINT [FK_orders_details_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orders_details] CHECK CONSTRAINT [FK_orders_details_orders]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([isbn])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_books]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_customers]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
