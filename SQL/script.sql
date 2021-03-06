USE [master]
GO
/****** Object:  Database [Book_Store]    Script Date: 26-08-2021 20:28:37 ******/
CREATE DATABASE [Book_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Book_Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Book_Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Book_Store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Book_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Book_Store] SET  MULTI_USER 
GO
ALTER DATABASE [Book_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book_Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Book_Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Book_Store', N'ON'
GO
ALTER DATABASE [Book_Store] SET QUERY_STORE = OFF
GO
USE [Book_Store]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 26-08-2021 20:28:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_Id] [int] IDENTITY(1,1) NOT NULL,
	[Inventory_Id] [int] NOT NULL,
	[BookDetail_Id] [int] NOT NULL,
	[Publication_Id] [int] NOT NULL,
	[CustomerReview_Id] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Detail]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Detail](
	[Book_Details_Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Book_Name] [varchar](200) NOT NULL,
	[Book_Author] [varchar](150) NOT NULL,
	[Book_Price] [int] NOT NULL,
	[Book_Description] [varchar](1000) NOT NULL,
	[ISBN_10] [varchar](10) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[Total_Pages] [int] NOT NULL,
	[Book_Image] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Book_Detail] PRIMARY KEY CLUSTERED 
(
	[Book_Details_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Cart_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Review]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Review](
	[Customer_Review_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[Comment] [varchar](1000) NOT NULL,
	[Book_Id] [int] NOT NULL,
 CONSTRAINT [PK_Customer_Review] PRIMARY KEY CLUSTERED 
(
	[Customer_Review_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Store_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Inventory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Location_Id] [int] IDENTITY(1,1) NOT NULL,
	[Location_Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetails_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Total_Price] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Order_Details_Id] [int] IDENTITY(1,1) NOT NULL,
	[Store_Id] [int] NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total_Price] [int] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[Order_Details_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publication]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication](
	[Publication_Id] [int] IDENTITY(1,1) NOT NULL,
	[Publisher_Name] [varchar](100) NOT NULL,
	[Publication_Date] [date] NOT NULL,
 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
(
	[Publication_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Store_Id] [int] IDENTITY(1,1) NOT NULL,
	[Location_Id] [int] NOT NULL,
	[Store_Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26-08-2021 20:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Role_Id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Book_Detail] FOREIGN KEY([BookDetail_Id])
REFERENCES [dbo].[Book_Detail] ([Book_Details_Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Book_Detail]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Customer_Review] FOREIGN KEY([CustomerReview_Id])
REFERENCES [dbo].[Customer_Review] ([Customer_Review_Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Customer_Review]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Inventory] FOREIGN KEY([Inventory_Id])
REFERENCES [dbo].[Inventory] ([Inventory_Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Inventory]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publication] FOREIGN KEY([Publication_Id])
REFERENCES [dbo].[Publication] ([Publication_Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publication]
GO
ALTER TABLE [dbo].[Book_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Book_Detail_Book] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
GO
ALTER TABLE [dbo].[Book_Detail] CHECK CONSTRAINT [FK_Book_Detail_Book]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Book] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Book]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Customer_Review]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Review_Book] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
GO
ALTER TABLE [dbo].[Customer_Review] CHECK CONSTRAINT [FK_Customer_Review_Book]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order_Details] FOREIGN KEY([OrderDetails_Id])
REFERENCES [dbo].[Order_Details] ([Order_Details_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_Details]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Book] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Book]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Store] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[Store] ([Store_Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Store]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Location] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Location] ([Location_Id])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Location]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Book_Store] SET  READ_WRITE 
GO
