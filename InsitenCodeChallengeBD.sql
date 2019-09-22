USE [master]
GO
/****** Object:  Database [InsitenCodeChallenge]    Script Date: 22/09/2019 01:47:54 a. m. ******/
CREATE DATABASE [InsitenCodeChallenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InsitenCodeChallenge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\InsitenCodeChallenge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InsitenCodeChallenge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\InsitenCodeChallenge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [InsitenCodeChallenge] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InsitenCodeChallenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InsitenCodeChallenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsitenCodeChallenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsitenCodeChallenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InsitenCodeChallenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsitenCodeChallenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET RECOVERY FULL 
GO
ALTER DATABASE [InsitenCodeChallenge] SET  MULTI_USER 
GO
ALTER DATABASE [InsitenCodeChallenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsitenCodeChallenge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InsitenCodeChallenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InsitenCodeChallenge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InsitenCodeChallenge] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InsitenCodeChallenge', N'ON'
GO
ALTER DATABASE [InsitenCodeChallenge] SET QUERY_STORE = OFF
GO
USE [InsitenCodeChallenge]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 22/09/2019 01:47:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Country] [nvarchar](100) NULL,
	[City] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[IdStatus] [int] NOT NULL,
	[FinancialPerformance] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyKeyContacts]    Script Date: 22/09/2019 01:47:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyKeyContacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[LastName] [varchar](200) NULL,
	[Position] [varchar](200) NULL,
	[Phone] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyKeyContacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyStatus]    Script Date: 22/09/2019 01:47:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyStatus](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CompanyStatus] ([Id], [Name], [CreatedDate], [UpdatedDate], [Active]) VALUES (1, N'E.G.', CAST(N'2019-09-19T17:09:18.060' AS DateTime), CAST(N'2019-09-19T17:09:18.060' AS DateTime), 1)
GO
INSERT [dbo].[CompanyStatus] ([Id], [Name], [CreatedDate], [UpdatedDate], [Active]) VALUES (2, N'Researching', CAST(N'2019-09-19T17:09:18.060' AS DateTime), CAST(N'2019-09-19T17:09:18.060' AS DateTime), 1)
GO
INSERT [dbo].[CompanyStatus] ([Id], [Name], [CreatedDate], [UpdatedDate], [Active]) VALUES (3, N'Pending Approval', CAST(N'2019-09-19T17:09:18.060' AS DateTime), CAST(N'2019-09-19T17:09:18.060' AS DateTime), 1)
GO
INSERT [dbo].[CompanyStatus] ([Id], [Name], [CreatedDate], [UpdatedDate], [Active]) VALUES (4, N'Approved', CAST(N'2019-09-19T17:09:18.060' AS DateTime), CAST(N'2019-09-19T17:09:18.060' AS DateTime), 1)
GO
INSERT [dbo].[CompanyStatus] ([Id], [Name], [CreatedDate], [UpdatedDate], [Active]) VALUES (5, N'Declined', CAST(N'2019-09-19T17:09:18.060' AS DateTime), CAST(N'2019-09-19T17:09:18.060' AS DateTime), 1)
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[CompanyKeyContacts] ADD  CONSTRAINT [DF_CompanyKeyContacts_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompanyKeyContacts] ADD  CONSTRAINT [DF_CompanyKeyContacts_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CompanyKeyContacts] ADD  CONSTRAINT [DF_CompanyKeyContacts_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[CompanyStatus] ADD  CONSTRAINT [DF_CompanyStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompanyStatus] ADD  CONSTRAINT [DF_CompanyStatus_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CompanyStatus] ADD  CONSTRAINT [DF_CompanyStatus_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([IdStatus])
REFERENCES [dbo].[CompanyStatus] ([Id])
GO
ALTER TABLE [dbo].[CompanyKeyContacts]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
USE [master]
GO
ALTER DATABASE [InsitenCodeChallenge] SET  READ_WRITE 
GO
