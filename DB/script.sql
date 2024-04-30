USE [master]
GO
/****** Object:  Database [InsuranceDB]    Script Date: 30-04-2024 23:07:11 ******/
CREATE DATABASE [InsuranceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InsuranceDB', FILENAME = N'F:\SQL(ILINK)\MSSQL16.MSSQLSERVER\MSSQL\DATA\InsuranceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InsuranceDB_log', FILENAME = N'F:\SQL(ILINK)\MSSQL16.MSSQLSERVER\MSSQL\DATA\InsuranceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InsuranceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InsuranceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InsuranceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InsuranceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsuranceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsuranceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsuranceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsuranceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsuranceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsuranceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsuranceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsuranceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsuranceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsuranceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsuranceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsuranceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsuranceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InsuranceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsuranceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsuranceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsuranceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsuranceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsuranceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsuranceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsuranceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InsuranceDB] SET  MULTI_USER 
GO
ALTER DATABASE [InsuranceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsuranceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InsuranceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InsuranceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InsuranceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InsuranceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InsuranceDB', N'ON'
GO
ALTER DATABASE [InsuranceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [InsuranceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InsuranceDB]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 30-04-2024 23:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserID] [int] NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 30-04-2024 23:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[PaymentDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CardOwnerName] [nvarchar](100) NOT NULL,
	[CardNumber] [nvarchar](16) NOT NULL,
	[ExpirationDate] [nvarchar](5) NOT NULL,
	[SecurityCode] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 30-04-2024 23:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyID] [int] NOT NULL,
	[PolicyNumber] [varchar](50) NOT NULL,
	[PolicyType] [varchar](100) NOT NULL,
	[InsuranceCompany] [varchar](255) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[PremiumAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PolicyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 30-04-2024 23:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[PolicyID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policy] ([PolicyID])
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Login] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [InsuranceDB] SET  READ_WRITE 
GO
