USE [master]
GO
/****** Object:  Database [УП]    Script Date: 17.02.2022 4:22:40 ******/
CREATE DATABASE [УП]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'УП', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\УП.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'УП_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\УП_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [УП] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [УП].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [УП] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [УП] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [УП] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [УП] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [УП] SET ARITHABORT OFF 
GO
ALTER DATABASE [УП] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [УП] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [УП] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [УП] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [УП] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [УП] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [УП] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [УП] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [УП] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [УП] SET  DISABLE_BROKER 
GO
ALTER DATABASE [УП] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [УП] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [УП] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [УП] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [УП] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [УП] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [УП] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [УП] SET RECOVERY FULL 
GO
ALTER DATABASE [УП] SET  MULTI_USER 
GO
ALTER DATABASE [УП] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [УП] SET DB_CHAINING OFF 
GO
ALTER DATABASE [УП] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [УП] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [УП] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [УП] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [УП] SET QUERY_STORE = OFF
GO
USE [УП]
GO
/****** Object:  Table [dbo].[Academicplans]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academicplans](
	[id_Academicplan] [int] IDENTITY(1,1) NOT NULL,
	[id_Semester] [int] NOT NULL,
	[id_Subject] [int] NOT NULL,
	[id_Marktype] [int] NOT NULL,
	[Hours] [int] NOT NULL,
	[id_Teacher] [int] NOT NULL,
	[id_Class] [int] NOT NULL,
 CONSTRAINT [PK_Academicplans] PRIMARY KEY CLUSTERED 
(
	[id_Academicplan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appendixs]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appendixs](
	[id_Appendix] [int] IDENTITY(1,1) NOT NULL,
	[id_Student] [int] NOT NULL,
	[Depts] [int] NOT NULL,
	[Leaves] [int] NOT NULL,
	[Improperleaves] [int] NOT NULL,
 CONSTRAINT [PK_Appendixs] PRIMARY KEY CLUSTERED 
(
	[id_Appendix] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[id_Attendance] [int] IDENTITY(1,1) NOT NULL,
	[id_Class] [int] NOT NULL,
	[id_Teacher] [int] NOT NULL,
	[id_Subject] [int] NOT NULL,
	[Attendance] [int] NOT NULL,
	[Absent] [int] NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[id_Attendance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autherizations]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autherizations](
	[id_Autherization] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Autherizations] PRIMARY KEY CLUSTERED 
(
	[id_Autherization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[id_class] [int] IDENTITY(1,1) NOT NULL,
	[Class] [varchar](max) NOT NULL,
	[Academic_year] [int] NOT NULL,
	[id_teacher] [int] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[id_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marktypes]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marktypes](
	[id_Marktype] [int] IDENTITY(1,1) NOT NULL,
	[Marktype] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Marktypes] PRIMARY KEY CLUSTERED 
(
	[id_Marktype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[id_Positions] [int] IDENTITY(1,1) NOT NULL,
	[Position] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[id_Positions] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[id_Semester] [int] IDENTITY(1,1) NOT NULL,
	[Classes] [varchar](max) NOT NULL,
	[Semester] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[id_Semester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id_Student] [int] IDENTITY(1,1) NOT NULL,
	[id_Class] [int] NOT NULL,
	[Lastname] [nvarchar](max) NULL,
	[Secondname] [nvarchar](max) NOT NULL,
	[Firstname] [nvarchar](max) NOT NULL,
	[id_Gender] [int] NULL,
	[Birthday] [date] NULL,
	[Age] [int] NULL,
	[id_Authentication] [int] NOT NULL,
	[Note] [varchar](max) NULL,
	[ProfileEnded] [bit] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studentsubjectmarks]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studentsubjectmarks](
	[id_Studentsubjectmark] [int] IDENTITY(1,1) NOT NULL,
	[id_Student] [int] NOT NULL,
	[id_Marktype] [int] NOT NULL,
	[id_Subject] [int] NOT NULL,
 CONSTRAINT [PK_Studentsubjectmarks] PRIMARY KEY CLUSTERED 
(
	[id_Studentsubjectmark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id_Subjects] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id_Subjects] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[id_teacher] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](max) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Education] [varchar](max) NOT NULL,
	[Adress] [varchar](max) NOT NULL,
	[Phone] [varchar](max) NOT NULL,
	[id_Position] [int] NOT NULL,
	[id_Autherization] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[id_teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetables]    Script Date: 17.02.2022 4:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetables](
	[id_Timetable] [int] IDENTITY(1,1) NOT NULL,
	[id_Teacher] [int] NOT NULL,
	[id_Subject] [int] NOT NULL,
	[id_Class] [int] NOT NULL,
	[id_Semester] [int] NOT NULL,
 CONSTRAINT [PK_Timetables] PRIMARY KEY CLUSTERED 
(
	[id_Timetable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_ProfileEnded]  DEFAULT ((0)) FOR [ProfileEnded]
GO
ALTER TABLE [dbo].[Academicplans]  WITH CHECK ADD  CONSTRAINT [FK_Academicplans_Classes] FOREIGN KEY([id_Class])
REFERENCES [dbo].[Classes] ([id_class])
GO
ALTER TABLE [dbo].[Academicplans] CHECK CONSTRAINT [FK_Academicplans_Classes]
GO
ALTER TABLE [dbo].[Academicplans]  WITH CHECK ADD  CONSTRAINT [FK_Academicplans_Marktypes] FOREIGN KEY([id_Marktype])
REFERENCES [dbo].[Marktypes] ([id_Marktype])
GO
ALTER TABLE [dbo].[Academicplans] CHECK CONSTRAINT [FK_Academicplans_Marktypes]
GO
ALTER TABLE [dbo].[Academicplans]  WITH CHECK ADD  CONSTRAINT [FK_Academicplans_Semesters] FOREIGN KEY([id_Semester])
REFERENCES [dbo].[Semesters] ([id_Semester])
GO
ALTER TABLE [dbo].[Academicplans] CHECK CONSTRAINT [FK_Academicplans_Semesters]
GO
ALTER TABLE [dbo].[Academicplans]  WITH CHECK ADD  CONSTRAINT [FK_Academicplans_Subjects] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subjects] ([id_Subjects])
GO
ALTER TABLE [dbo].[Academicplans] CHECK CONSTRAINT [FK_Academicplans_Subjects]
GO
ALTER TABLE [dbo].[Academicplans]  WITH CHECK ADD  CONSTRAINT [FK_Academicplans_Teachers] FOREIGN KEY([id_Teacher])
REFERENCES [dbo].[Teachers] ([id_teacher])
GO
ALTER TABLE [dbo].[Academicplans] CHECK CONSTRAINT [FK_Academicplans_Teachers]
GO
ALTER TABLE [dbo].[Appendixs]  WITH CHECK ADD  CONSTRAINT [FK_Appendixs_Students] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Students] ([id_Student])
GO
ALTER TABLE [dbo].[Appendixs] CHECK CONSTRAINT [FK_Appendixs_Students]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Subjects] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subjects] ([id_Subjects])
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Subjects]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Teachers] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[Teachers] ([id_teacher])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Teachers]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Autherizations] FOREIGN KEY([id_Authentication])
REFERENCES [dbo].[Autherizations] ([id_Autherization])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Autherizations]
GO
ALTER TABLE [dbo].[Studentsubjectmarks]  WITH CHECK ADD  CONSTRAINT [FK_Studentsubjectmarks_Marktypes] FOREIGN KEY([id_Marktype])
REFERENCES [dbo].[Marktypes] ([id_Marktype])
GO
ALTER TABLE [dbo].[Studentsubjectmarks] CHECK CONSTRAINT [FK_Studentsubjectmarks_Marktypes]
GO
ALTER TABLE [dbo].[Studentsubjectmarks]  WITH CHECK ADD  CONSTRAINT [FK_Studentsubjectmarks_Students1] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Students] ([id_Student])
GO
ALTER TABLE [dbo].[Studentsubjectmarks] CHECK CONSTRAINT [FK_Studentsubjectmarks_Students1]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Autherizations] FOREIGN KEY([id_Autherization])
REFERENCES [dbo].[Autherizations] ([id_Autherization])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Autherizations]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Positions] FOREIGN KEY([id_Position])
REFERENCES [dbo].[Positions] ([id_Positions])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Positions]
GO
ALTER TABLE [dbo].[Timetables]  WITH CHECK ADD  CONSTRAINT [FK_Timetables_Semesters] FOREIGN KEY([id_Semester])
REFERENCES [dbo].[Semesters] ([id_Semester])
GO
ALTER TABLE [dbo].[Timetables] CHECK CONSTRAINT [FK_Timetables_Semesters]
GO
ALTER TABLE [dbo].[Timetables]  WITH CHECK ADD  CONSTRAINT [FK_Timetables_Subjects] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subjects] ([id_Subjects])
GO
ALTER TABLE [dbo].[Timetables] CHECK CONSTRAINT [FK_Timetables_Subjects]
GO
ALTER TABLE [dbo].[Timetables]  WITH CHECK ADD  CONSTRAINT [FK_Timetables_Teachers] FOREIGN KEY([id_Timetable])
REFERENCES [dbo].[Teachers] ([id_teacher])
GO
ALTER TABLE [dbo].[Timetables] CHECK CONSTRAINT [FK_Timetables_Teachers]
GO
USE [master]
GO
ALTER DATABASE [УП] SET  READ_WRITE 
GO
