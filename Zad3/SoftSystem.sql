USE [master]
GO
/****** Object:  Database [LibrarySoftSystem]    Script Date: 07.03.2021 21:35:26 ******/
CREATE DATABASE [LibrarySoftSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibrarySoftSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLCOURSE2017\MSSQL\DATA\LibrarySoftSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibrarySoftSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLCOURSE2017\MSSQL\DATA\LibrarySoftSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibrarySoftSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibrarySoftSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibrarySoftSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibrarySoftSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibrarySoftSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibrarySoftSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibrarySoftSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [LibrarySoftSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LibrarySoftSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibrarySoftSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibrarySoftSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibrarySoftSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibrarySoftSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibrarySoftSystem', N'ON'
GO
ALTER DATABASE [LibrarySoftSystem] SET QUERY_STORE = OFF
GO
USE [LibrarySoftSystem]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nchar](10) NULL,
	[middle_name] [nchar](10) NULL,
	[last_name] [nchar](10) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_authors]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_authors](
	[book_id] [int] NOT NULL,
	[author_id] [int] NOT NULL,
 CONSTRAINT [PK_book_authors] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_genres]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_genres](
	[book_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [PK_book_genres] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nchar](10) NULL,
	[total_pages] [int] NULL,
	[rating] [int] NULL,
	[isbn] [nchar](10) NULL,
	[publisher_date] [date] NULL,
	[publisher_id] [int] NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre] [nchar](10) NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[publisher_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_publishers] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([author_id], [first_name], [middle_name], [last_name]) VALUES (1, N'alek      ', N'marek     ', N'kazek     ')
INSERT [dbo].[authors] ([author_id], [first_name], [middle_name], [last_name]) VALUES (2, N'alek2     ', N'marek2    ', N'kazek2    ')
INSERT [dbo].[authors] ([author_id], [first_name], [middle_name], [last_name]) VALUES (3, N'alek3     ', N'marek3    ', N'kazek3    ')
INSERT [dbo].[authors] ([author_id], [first_name], [middle_name], [last_name]) VALUES (4, N'alek4     ', N'marek4    ', N'kazek4    ')
SET IDENTITY_INSERT [dbo].[authors] OFF
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (7, 1)
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (7, 2)
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (8, 3)
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (9, 4)
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (10, 4)
INSERT [dbo].[book_authors] ([book_id], [author_id]) VALUES (11, 4)
INSERT [dbo].[book_genres] ([book_id], [genre_id]) VALUES (7, 8)
INSERT [dbo].[book_genres] ([book_id], [genre_id]) VALUES (8, 9)
INSERT [dbo].[book_genres] ([book_id], [genre_id]) VALUES (9, 12)
INSERT [dbo].[book_genres] ([book_id], [genre_id]) VALUES (10, 12)
INSERT [dbo].[book_genres] ([book_id], [genre_id]) VALUES (11, 12)
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([book_id], [title], [total_pages], [rating], [isbn], [publisher_date], [publisher_id]) VALUES (7, N'sylmary   ', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[books] ([book_id], [title], [total_pages], [rating], [isbn], [publisher_date], [publisher_id]) VALUES (8, N'PanTade   ', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[books] ([book_id], [title], [total_pages], [rating], [isbn], [publisher_date], [publisher_id]) VALUES (9, N'C#        ', NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[books] ([book_id], [title], [total_pages], [rating], [isbn], [publisher_date], [publisher_id]) VALUES (10, N'java      ', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[books] ([book_id], [title], [total_pages], [rating], [isbn], [publisher_date], [publisher_id]) VALUES (11, N'json      ', NULL, NULL, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[books] OFF
SET IDENTITY_INSERT [dbo].[genres] ON 

INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (2, N'dlaDzieci ', 0)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (3, N'Dorosli   ', 0)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (4, N'poradniki ', 0)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (5, N'pozostale ', 0)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (6, N'bajki     ', 2)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (7, N'malowanki ', 2)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (8, N'trilery   ', 3)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (9, N'horrory   ', 3)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (10, N'zdudujDom ', 4)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (11, N'zbudujBude', 4)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (12, N'wedkarstwo', 5)
INSERT [dbo].[genres] ([genre_id], [genre], [parent_id]) VALUES (15, N'jezdziectw', 5)
SET IDENTITY_INSERT [dbo].[genres] OFF
SET IDENTITY_INSERT [dbo].[publishers] ON 

INSERT [dbo].[publishers] ([publisher_id], [name]) VALUES (1, N'empik     ')
INSERT [dbo].[publishers] ([publisher_id], [name]) VALUES (3, N'kazikStasz')
INSERT [dbo].[publishers] ([publisher_id], [name]) VALUES (4, N'infiltron ')
SET IDENTITY_INSERT [dbo].[publishers] OFF
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FK_book_authors_authors] FOREIGN KEY([author_id])
REFERENCES [dbo].[authors] ([author_id])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FK_book_authors_authors]
GO
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FK_book_authors_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([book_id])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FK_book_authors_books]
GO
ALTER TABLE [dbo].[book_genres]  WITH CHECK ADD  CONSTRAINT [FK_book_genres_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([book_id])
GO
ALTER TABLE [dbo].[book_genres] CHECK CONSTRAINT [FK_book_genres_books]
GO
ALTER TABLE [dbo].[book_genres]  WITH CHECK ADD  CONSTRAINT [FK_book_genres_genres] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([genre_id])
GO
ALTER TABLE [dbo].[book_genres] CHECK CONSTRAINT [FK_book_genres_genres]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_publishers] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publishers] ([publisher_id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_publishers]
GO
/****** Object:  StoredProcedure [dbo].[Costam]    Script Date: 07.03.2021 21:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Costam] as 
BEGIN
SET NOCOUNT ON;
WITH gatunki
     AS (SELECT g.genre,
                g.genre_id,
                0 level,
                g.parent_id,
                Cast(g.genre AS VARCHAR(200))AS "Connection"
         FROM   dbo.genres g
         WHERE  g.parent_id = 0
         UNION ALL
         SELECT c.genre,
                c.genre_id,
                p.level + 1 AS Level,
                c.parent_id,
                Cast(( Trim(p.connection) + '/' + c.genre ) AS VARCHAR(200)) AS "Connection"
         FROM   dbo.genres c
                INNER JOIN gatunki p
                        ON p.genre_id = c.parent_id)
SELECT Authors,
       [connection] AS Genre,
       b.title,
       p.[name]     AS Publisher
FROM   gatunki g
       JOIN book_genres bk ON bk.genre_id = g.genre_id
       JOIN books b ON b.book_id = bk.book_id
       JOIN publishers p ON b.publisher_id = p.publisher_id
       JOIN (SELECT book_id,
					String_agg(Trim(a.first_name) + ' ' + Trim(a.last_name), ', ') AS Authors
			FROM   dbo.authors a
			JOIN book_authors ba
			ON ba.author_id = a.author_id
			GROUP  BY book_id) AS baa
		ON baa.book_id = b.book_id order by Genre

		
	END
GO
USE [master]
GO
ALTER DATABASE [LibrarySoftSystem] SET  READ_WRITE 
GO
