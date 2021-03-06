USE [master]
GO
/****** Object:  Database [SiliconPowerEcommerceDb]    Script Date: 23/03/2022 16:20:57 ******/
CREATE DATABASE [SiliconPowerEcommerceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SiliconPowerEcommerceDb', FILENAME = N'C:\Users\fredd\SiliconPowerEcommerceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SiliconPowerEcommerceDb_log', FILENAME = N'C:\Users\fredd\SiliconPowerEcommerceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiliconPowerEcommerceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET  MULTI_USER 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET QUERY_STORE = OFF
GO
USE [SiliconPowerEcommerceDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [SiliconPowerEcommerceDb]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](19, 2) NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
	[LocationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityImages]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityImages](
	[Id] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[Base64Image] [varchar](max) NULL,
	[Url] [nchar](10) NULL,
	[ImageTypeEnum] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NULL,
	[TwoFactorEnabled] [bit] NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NULL,
	[AccessFailedCount] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Availabilities]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availabilities](
	[Id] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[Availability] [datetime] NOT NULL,
	[TicketsLeft] [int] NOT NULL,
 CONSTRAINT [PK_Availabilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classification](
	[ActivityId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Classification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [uniqueidentifier] NOT NULL,
	[NormalizedAddress] [nvarchar](100) NULL,
	[AddressLineOne] [nvarchar](50) NOT NULL,
	[AddressLineTwo] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[Coordinates] [geography] NOT NULL,
	[Comments] [nvarchar](200) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ReservationId] [uniqueidentifier] NULL,
	[TransactionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Appointment] [datetime] NOT NULL,
	[StatusEnum] [varchar](50) NOT NULL,
	[IdentificationCode] [nchar](10) NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Rating] [decimal](3, 1) NOT NULL,
	[ReservationId] [uniqueidentifier] NOT NULL,
	[PublicationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [uniqueidentifier] NOT NULL,
	[TransactionTypeEnum] [varchar](50) NOT NULL,
	[ProviderDTO] [varchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[ProviderIdentification] [varchar](max) NULL,
	[Amount] [decimal](19, 2) NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersAdditionalInformation]    Script Date: 23/03/2022 16:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersAdditionalInformation](
	[id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[IdentificationNumber] [nvarchar](50) NULL,
	[PreferredPaymentMethod] [int] NULL,
	[CardId] [nvarchar](max) NULL,
	[LocationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UsersAdditionalInformation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Locations]
GO
ALTER TABLE [dbo].[ActivityImages]  WITH CHECK ADD  CONSTRAINT [FK_ActivityImages_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[ActivityImages] CHECK CONSTRAINT [FK_ActivityImages_Activities]
GO
ALTER TABLE [dbo].[Availabilities]  WITH CHECK ADD  CONSTRAINT [FK_Availabilities_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[Availabilities] CHECK CONSTRAINT [FK_Availabilities_Activities]
GO
ALTER TABLE [dbo].[Classification]  WITH CHECK ADD  CONSTRAINT [FK_Classification_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[Classification] CHECK CONSTRAINT [FK_Classification_Activities]
GO
ALTER TABLE [dbo].[Classification]  WITH CHECK ADD  CONSTRAINT [FK_Classification_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Classification] CHECK CONSTRAINT [FK_Classification_Categories]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHistory_Reservations] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservations] ([Id])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHistory_Reservations]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHistory_Transactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([Id])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHistory_Transactions]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Activities]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_AspNetUsers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Reservations] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservations] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Reservations]
GO
ALTER TABLE [dbo].[UsersAdditionalInformation]  WITH CHECK ADD  CONSTRAINT [FK_UsersAdditionalInformation_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UsersAdditionalInformation] CHECK CONSTRAINT [FK_UsersAdditionalInformation_AspNetUsers]
GO
ALTER TABLE [dbo].[UsersAdditionalInformation]  WITH CHECK ADD  CONSTRAINT [FK_UsersAdditionalInformation_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[UsersAdditionalInformation] CHECK CONSTRAINT [FK_UsersAdditionalInformation_Locations]
GO
USE [master]
GO
ALTER DATABASE [SiliconPowerEcommerceDb] SET  READ_WRITE 
GO
