USE [master]
GO
/****** Object:  Database [NewsDb]    Script Date: 8/6/2020 5:26:58 PM ******/
CREATE DATABASE [NewsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NewsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NewsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NewsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NewsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NewsDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NewsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NewsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NewsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NewsDb] SET  MULTI_USER 
GO
ALTER DATABASE [NewsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewsDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NewsDb] SET QUERY_STORE = OFF
GO
USE [NewsDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/6/2020 5:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 8/6/2020 5:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Like] [int] NOT NULL,
	[Dislike] [int] NOT NULL,
	[View] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200805104700_initial', N'3.1.6')
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (10, N'News 1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue ex, fringilla in blandit sit amet, rhoncus quis augue. Sed faucibus mauris vel interdum vulputate. Nulla facilisis dolor in est maximus, in convallis nulla suscipit. Morbi vitae tincidunt erat. Maecenas leo metus, congue ut diam quis, dignissim eleifend ex. Aenean eget elit consectetur, sollicitudin libero quis, efficitur lorem. In hac habitasse platea dictumst. Mauris vehicula libero felis, vel bibendum mauris pulvinar eget. Phasellus id est tortor. Nam eget libero lacus. Quisque urna tortor, euismod sit amet eleifend at, mattis a nulla.', N'69cafdcecb54035904ae45c89ea2c746-08-06-2020-12-14-55.jpg', CAST(N'2020-08-03T12:14:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (11, N'News2', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue ex, fringilla in blandit sit amet, rhoncus quis augue. Sed faucibus mauris vel interdum vulputate. Nulla facilisis dolor in est maximus, in convallis nulla suscipit. Morbi vitae tincidunt erat. Maecenas leo metus, congue ut diam quis, dignissim eleifend ex. Aenean eget elit consectetur, sollicitudin libero quis, efficitur lorem. In hac habitasse platea dictumst. Mauris vehicula libero felis, vel bibendum mauris pulvinar eget. Phasellus id est tortor. Nam eget libero lacus. Quisque urna tortor, euismod sit amet eleifend at, mattis a nulla.', N'9359-370x250-08-06-2020-16-03-14.jpg', CAST(N'2020-08-04T12:16:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (12, N'News3', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue ex, fringilla in blandit sit amet, rhoncus quis augue. Sed faucibus mauris vel interdum vulputate. Nulla facilisis dolor in est maximus, in convallis nulla suscipit. Morbi vitae tincidunt erat. Maecenas leo metus, congue ut diam quis, dignissim eleifend ex. Aenean eget elit consectetur, sollicitudin libero quis, efficitur lorem. In hac habitasse platea dictumst. Mauris vehicula libero felis, vel bibendum mauris pulvinar eget. Phasellus id est tortor. Nam eget libero lacus. Quisque urna tortor, euismod sit amet eleifend at, mattis a nulla.', N'3668503_XL-08-06-2020-12-16-52.jpg', CAST(N'2020-08-05T12:16:00.0000000' AS DateTime2), 3, 1, 2)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (13, N'news4', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue ex, fringilla in blandit sit amet, rhoncus quis augue. Sed faucibus mauris vel interdum vulputate. Nulla facilisis dolor in est maximus, in convallis nulla suscipit. Morbi vitae tincidunt erat. Maecenas leo metus, congue ut diam quis, dignissim eleifend ex. Aenean eget elit consectetur, sollicitudin libero quis, efficitur lorem. In hac habitasse platea dictumst. Mauris vehicula libero felis, vel bibendum mauris pulvinar eget. Phasellus id est tortor. Nam eget libero lacus. Quisque urna tortor, euismod sit amet eleifend at, mattis a nulla.', N'about-us-img1-08-06-2020-13-56-41.jpg', CAST(N'2020-08-06T12:18:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (14, N'News5', N'lorem ipsum dolor', N'footer-img2-08-06-2020-15-59-54.jpg', CAST(N'2020-08-05T12:38:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (15, N'News7', N'conten test', N'19201-08-06-2020-15-50-21.jpg', CAST(N'2020-08-06T12:50:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (16, N'News of day', N'test again', N'appointment-1-08-06-2020-15-45-52.jpg', CAST(N'2020-08-06T15:45:00.0000000' AS DateTime2), 0, 0, 0)
INSERT [dbo].[News] ([Id], [Name], [Content], [ImageName], [CreationDate], [Like], [Dislike], [View]) VALUES (17, N'Enjoy', N'Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Maecenas nec odio et ante tincidunt tempus
', N'footer-img1-08-06-2020-16-12-01.jpg', CAST(N'2020-08-06T16:11:00.0000000' AS DateTime2), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
USE [master]
GO
ALTER DATABASE [NewsDb] SET  READ_WRITE 
GO
