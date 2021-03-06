USE [master]
GO

/****** Object:  Database [Iblelaxman]    Script Date: 21-02-2022 18:13:56 ******/
CREATE DATABASE [Iblelaxman]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Iblelaxman', FILENAME = N'C:\Users\Laxman\Iblelaxman.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Iblelaxman_log', FILENAME = N'C:\Users\Laxman\Iblelaxman_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Iblelaxman].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Iblelaxman] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Iblelaxman] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Iblelaxman] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Iblelaxman] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Iblelaxman] SET ARITHABORT OFF 
GO

ALTER DATABASE [Iblelaxman] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [Iblelaxman] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Iblelaxman] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Iblelaxman] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Iblelaxman] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Iblelaxman] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Iblelaxman] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Iblelaxman] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Iblelaxman] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Iblelaxman] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Iblelaxman] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Iblelaxman] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Iblelaxman] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Iblelaxman] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Iblelaxman] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Iblelaxman] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Iblelaxman] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Iblelaxman] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Iblelaxman] SET  MULTI_USER 
GO

ALTER DATABASE [Iblelaxman] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Iblelaxman] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Iblelaxman] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Iblelaxman] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Iblelaxman] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Iblelaxman] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Iblelaxman] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Iblelaxman] SET  READ_WRITE 
GO

CREATE TABLE [dbo].[City] (
    [Ctyid]   INT          IDENTITY (1, 1) NOT NULL,
    [Ctyname] VARCHAR (50) NOT NULL,
    [Sid]     INT          NULL,
    PRIMARY KEY CLUSTERED ([Ctyid] ASC),
    FOREIGN KEY ([Sid]) REFERENCES [dbo].[State] ([Sid])
);

CREATE TABLE [dbo].[Country] (
    [Cid]   INT          IDENTITY (1, 1) NOT NULL,
    [Cname] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Cid] ASC)
);

CREATE TABLE [dbo].[Location] (
    [Locid]   INT          IDENTITY (1, 1) NOT NULL,
    [Locname] VARCHAR (50) NOT NULL,
    [Ctyid]   INT          NULL,
    PRIMARY KEY CLUSTERED ([Locid] ASC),
    FOREIGN KEY ([Ctyid]) REFERENCES [dbo].[City] ([Ctyid])
);

CREATE TABLE [dbo].[State] (
    [Sid]   INT          IDENTITY (1, 1) NOT NULL,
    [Sname] VARCHAR (50) NOT NULL,
    [Cid]   INT          NULL,
    PRIMARY KEY CLUSTERED ([Sid] ASC),
    FOREIGN KEY ([Cid]) REFERENCES [dbo].[Country] ([Cid])
);


