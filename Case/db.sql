USE [master]
GO
/****** Object:  Database [Упшка]    Script Date: 18.02.2022 5:07:25 ******/
CREATE DATABASE [Упшка]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Упшка', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Упшка.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Упшка_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Упшка_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Упшка] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Упшка].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Упшка] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Упшка] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Упшка] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Упшка] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Упшка] SET ARITHABORT OFF 
GO
ALTER DATABASE [Упшка] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Упшка] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Упшка] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Упшка] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Упшка] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Упшка] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Упшка] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Упшка] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Упшка] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Упшка] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Упшка] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Упшка] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Упшка] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Упшка] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Упшка] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Упшка] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Упшка] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Упшка] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Упшка] SET  MULTI_USER 
GO
ALTER DATABASE [Упшка] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Упшка] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Упшка] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Упшка] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Упшка] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Упшка] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Упшка] SET QUERY_STORE = OFF
GO
USE [Упшка]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[КодАвторизация] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [varchar](50) NULL,
	[Пароль] [varchar](50) NULL,
 CONSTRAINT [PK_Авторизация] PRIMARY KEY CLUSTERED 
(
	[КодАвторизация] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Класс]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Класс](
	[КодКласса] [int] IDENTITY(1,1) NOT NULL,
	[Навзание] [varchar](50) NULL,
 CONSTRAINT [PK_Класс] PRIMARY KEY CLUSTERED 
(
	[КодКласса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посещаемость]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посещаемость](
	[КодПосещяемости] [int] NOT NULL,
	[КодУченик] [int] NULL,
	[Дата] [date] NULL,
	[Присутствие] [bit] NULL,
	[КодПредмет] [int] NULL,
 CONSTRAINT [PK_Посещаемость] PRIMARY KEY CLUSTERED 
(
	[КодПосещяемости] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Предмет]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Предмет](
	[КодПредмета] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](50) NULL,
 CONSTRAINT [PK_Предмет] PRIMARY KEY CLUSTERED 
(
	[КодПредмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Рассписание]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Рассписание](
	[КодРассписания] [int] NOT NULL,
	[КодКласс] [int] NULL,
	[КодУчитель] [int] NULL,
	[Кабинет] [nvarchar](10) NULL,
 CONSTRAINT [PK_Рассписание] PRIMARY KEY CLUSTERED 
(
	[КодРассписания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сообщения]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сообщения](
	[КодСообщения] [int] NOT NULL,
	[КодЧата] [int] NULL,
	[Текст] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Успеваемость]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Успеваемость](
	[КодУспеваемости] [int] NOT NULL,
	[КодПредмет] [int] NULL,
	[КодСтудент] [int] NULL,
	[КодКласс] [int] NULL,
	[КомментарийУчителя] [varchar](50) NULL,
	[Оценка] [char](1) NULL,
 CONSTRAINT [PK_Успеваемость] PRIMARY KEY CLUSTERED 
(
	[КодУспеваемости] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ученик]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ученик](
	[КодУченика] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [varchar](50) NULL,
	[Класс] [int] NULL,
	[Адрес] [varchar](50) NULL,
	[КодАвторизаци] [int] NULL,
 CONSTRAINT [PK_Ученик] PRIMARY KEY CLUSTERED 
(
	[КодУченика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Учитель]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Учитель](
	[КодУчителя] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [varchar](50) NULL,
	[КодПредмет] [int] NULL,
	[КодАвторизаци] [int] NULL,
	[КодКласса] [int] NULL,
 CONSTRAINT [PK_Учитель] PRIMARY KEY CLUSTERED 
(
	[КодУчителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Чат]    Script Date: 18.02.2022 5:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Чат](
	[КодЧата] [int] IDENTITY(1,1) NOT NULL,
	[КодУченика] [int] NOT NULL,
	[КодУчителя] [int] NULL,
	[Сообщение] [nvarchar](200) NULL,
 CONSTRAINT [PK_Чат] PRIMARY KEY CLUSTERED 
(
	[КодЧата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Авторизация] ON 

INSERT [dbo].[Авторизация] ([КодАвторизация], [Логин], [Пароль]) VALUES (1, N'Shab', N'1234')
INSERT [dbo].[Авторизация] ([КодАвторизация], [Логин], [Пароль]) VALUES (2, N'Azarova', N'1243')
INSERT [dbo].[Авторизация] ([КодАвторизация], [Логин], [Пароль]) VALUES (3, N'Sabitova_DR', N'1324')
SET IDENTITY_INSERT [dbo].[Авторизация] OFF
GO
SET IDENTITY_INSERT [dbo].[Класс] ON 

INSERT [dbo].[Класс] ([КодКласса], [Навзание]) VALUES (1, N'4Б')
INSERT [dbo].[Класс] ([КодКласса], [Навзание]) VALUES (2, N'8А')
INSERT [dbo].[Класс] ([КодКласса], [Навзание]) VALUES (3, N'3Г')
SET IDENTITY_INSERT [dbo].[Класс] OFF
GO
SET IDENTITY_INSERT [dbo].[Предмет] ON 

INSERT [dbo].[Предмет] ([КодПредмета], [Название]) VALUES (1, N'Математика')
INSERT [dbo].[Предмет] ([КодПредмета], [Название]) VALUES (2, N'Русский язык')
INSERT [dbo].[Предмет] ([КодПредмета], [Название]) VALUES (3, N'Информатика')
SET IDENTITY_INSERT [dbo].[Предмет] OFF
GO
SET IDENTITY_INSERT [dbo].[Ученик] ON 

INSERT [dbo].[Ученик] ([КодУченика], [ФИО], [Класс], [Адрес], [КодАвторизаци]) VALUES (0, N'Шабалкин Данила Алексеевич', 1, N'Проспект Мира, дом Кефира', 1)
SET IDENTITY_INSERT [dbo].[Ученик] OFF
GO
SET IDENTITY_INSERT [dbo].[Учитель] ON 

INSERT [dbo].[Учитель] ([КодУчителя], [ФИО], [КодПредмет], [КодАвторизаци], [КодКласса]) VALUES (1, N'Азарова Александра Сергеевна', 1, 2, NULL)
INSERT [dbo].[Учитель] ([КодУчителя], [ФИО], [КодПредмет], [КодАвторизаци], [КодКласса]) VALUES (2, N'Сабитова Динара Равильевна', 2, 3, 1)
SET IDENTITY_INSERT [dbo].[Учитель] OFF
GO
ALTER TABLE [dbo].[Посещаемость]  WITH CHECK ADD  CONSTRAINT [FK_Посещаемость_Предмет] FOREIGN KEY([КодПредмет])
REFERENCES [dbo].[Предмет] ([КодПредмета])
GO
ALTER TABLE [dbo].[Посещаемость] CHECK CONSTRAINT [FK_Посещаемость_Предмет]
GO
ALTER TABLE [dbo].[Посещаемость]  WITH CHECK ADD  CONSTRAINT [FK_Посещаемость_Ученик] FOREIGN KEY([КодУченик])
REFERENCES [dbo].[Ученик] ([КодУченика])
GO
ALTER TABLE [dbo].[Посещаемость] CHECK CONSTRAINT [FK_Посещаемость_Ученик]
GO
ALTER TABLE [dbo].[Рассписание]  WITH CHECK ADD  CONSTRAINT [FK_Рассписание_Класс] FOREIGN KEY([КодКласс])
REFERENCES [dbo].[Класс] ([КодКласса])
GO
ALTER TABLE [dbo].[Рассписание] CHECK CONSTRAINT [FK_Рассписание_Класс]
GO
ALTER TABLE [dbo].[Рассписание]  WITH CHECK ADD  CONSTRAINT [FK_Рассписание_Учитель] FOREIGN KEY([КодУчитель])
REFERENCES [dbo].[Учитель] ([КодУчителя])
GO
ALTER TABLE [dbo].[Рассписание] CHECK CONSTRAINT [FK_Рассписание_Учитель]
GO
ALTER TABLE [dbo].[Сообщения]  WITH CHECK ADD  CONSTRAINT [FK_Сообщения_Чат] FOREIGN KEY([КодЧата])
REFERENCES [dbo].[Чат] ([КодЧата])
GO
ALTER TABLE [dbo].[Сообщения] CHECK CONSTRAINT [FK_Сообщения_Чат]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Предмет] FOREIGN KEY([КодПредмет])
REFERENCES [dbo].[Предмет] ([КодПредмета])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Предмет]
GO
ALTER TABLE [dbo].[Успеваемость]  WITH CHECK ADD  CONSTRAINT [FK_Успеваемость_Ученик] FOREIGN KEY([КодСтудент])
REFERENCES [dbo].[Ученик] ([КодУченика])
GO
ALTER TABLE [dbo].[Успеваемость] CHECK CONSTRAINT [FK_Успеваемость_Ученик]
GO
ALTER TABLE [dbo].[Ученик]  WITH CHECK ADD  CONSTRAINT [FK_Ученик_Авторизация] FOREIGN KEY([КодАвторизаци])
REFERENCES [dbo].[Авторизация] ([КодАвторизация])
GO
ALTER TABLE [dbo].[Ученик] CHECK CONSTRAINT [FK_Ученик_Авторизация]
GO
ALTER TABLE [dbo].[Ученик]  WITH CHECK ADD  CONSTRAINT [FK_Ученик_Класс] FOREIGN KEY([Класс])
REFERENCES [dbo].[Класс] ([КодКласса])
GO
ALTER TABLE [dbo].[Ученик] CHECK CONSTRAINT [FK_Ученик_Класс]
GO
ALTER TABLE [dbo].[Учитель]  WITH CHECK ADD  CONSTRAINT [FK_Учитель_Авторизация] FOREIGN KEY([КодАвторизаци])
REFERENCES [dbo].[Авторизация] ([КодАвторизация])
GO
ALTER TABLE [dbo].[Учитель] CHECK CONSTRAINT [FK_Учитель_Авторизация]
GO
ALTER TABLE [dbo].[Учитель]  WITH CHECK ADD  CONSTRAINT [FK_Учитель_Класс] FOREIGN KEY([КодКласса])
REFERENCES [dbo].[Класс] ([КодКласса])
GO
ALTER TABLE [dbo].[Учитель] CHECK CONSTRAINT [FK_Учитель_Класс]
GO
ALTER TABLE [dbo].[Учитель]  WITH CHECK ADD  CONSTRAINT [FK_Учитель_Предмет] FOREIGN KEY([КодПредмет])
REFERENCES [dbo].[Предмет] ([КодПредмета])
GO
ALTER TABLE [dbo].[Учитель] CHECK CONSTRAINT [FK_Учитель_Предмет]
GO
ALTER TABLE [dbo].[Чат]  WITH CHECK ADD  CONSTRAINT [FK_Чат_Ученик] FOREIGN KEY([КодУченика])
REFERENCES [dbo].[Ученик] ([КодУченика])
GO
ALTER TABLE [dbo].[Чат] CHECK CONSTRAINT [FK_Чат_Ученик]
GO
ALTER TABLE [dbo].[Чат]  WITH CHECK ADD  CONSTRAINT [FK_Чат_Учитель] FOREIGN KEY([КодУчителя])
REFERENCES [dbo].[Учитель] ([КодУчителя])
GO
ALTER TABLE [dbo].[Чат] CHECK CONSTRAINT [FK_Чат_Учитель]
GO
USE [master]
GO
ALTER DATABASE [Упшка] SET  READ_WRITE 
GO
