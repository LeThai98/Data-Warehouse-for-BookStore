
--CREATE DATABASE [BookStore]
 
USE [BookStore]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[books]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[books_discounts]    Script Date: 12/20/2020 8:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books_discounts](
	[book_id] [varchar](50) NULL,
	[discount_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books_genres]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[customers_discounts]    Script Date: 12/20/2020 8:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers_discounts](
	[customer_id] [varchar](50) NULL,
	[discount_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[orders_details]    Script Date: 12/20/2020 8:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_details](
	[book_id] [varchar](50) NULL,
	[order_id] [varchar](50) NULL,
	[amount] [int] NULL,
	[uintPrice] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[reviews]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Table [dbo].[shippers]    Script Date: 12/20/2020 8:19:25 PM ******/
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
/****** Object:  Index [IX_customers]    Script Date: 12/20/2020 8:19:25 PM ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [IX_customers] UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_genres]    Script Date: 12/20/2020 8:19:25 PM ******/
ALTER TABLE [dbo].[genres] ADD  CONSTRAINT [IX_genres] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_publishers]    Script Date: 12/20/2020 8:19:25 PM ******/
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
