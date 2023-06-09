USE [master]
GO
/****** Object:  Database [samyAnthoLinqToSql]    Script Date: 3/24/2023 7:52:07 PM ******/
CREATE DATABASE [samyAnthoLinqToSql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'samyAnthoLinqToSql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\samyAnthoLinqToSql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'samyAnthoLinqToSql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\samyAnthoLinqToSql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [samyAnthoLinqToSql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [samyAnthoLinqToSql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ARITHABORT OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET  DISABLE_BROKER 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET  MULTI_USER 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [samyAnthoLinqToSql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [samyAnthoLinqToSql] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [samyAnthoLinqToSql] SET QUERY_STORE = OFF
GO
USE [samyAnthoLinqToSql]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentCode] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentCode]) VALUES (1, N'Sales', N'SA')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentCode]) VALUES (2, N'Marketing', N'MK')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentCode]) VALUES (3, N'Engineering', N'EN')
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [IsActive], [DepartmentID], [ManagerID]) VALUES (1, N'John', N'Doe', N'555-1234', N'jdoe@example.com', 1, 1, NULL)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [IsActive], [DepartmentID], [ManagerID]) VALUES (2, N'Jane', N'Smith', N'555-5678', N'jsmith@example.com', 1, 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Email], [IsActive], [DepartmentID], [ManagerID]) VALUES (3, N'Bob', N'Johnson', N'555-9876', N'bjohnson@example.com', 0, 3, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__6EA8896DC3870911]    Script Date: 3/24/2023 7:52:07 PM ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC344C2904E2]    Script Date: 3/24/2023 7:52:07 PM ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D105340F4B7756]    Script Date: 3/24/2023 7:52:07 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Managers] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Managers]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartmentForManager]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDepartmentForManager]
    @DepartmentID int,
    @ManagerID int
AS
BEGIN
    UPDATE Employees
    SET DepartmentID = NULL
    WHERE DepartmentID = @DepartmentID AND ManagerID = @ManagerID

    DELETE FROM Departments
    WHERE DepartmentID = @DepartmentID
END
GO
/****** Object:  StoredProcedure [dbo].[GetActiveEmployeeNames]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActiveEmployeeNames]
AS
BEGIN
    SELECT FirstName, LastName
    FROM Employees
    WHERE IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartmentWithMostEmployees]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartmentWithMostEmployees]
AS
BEGIN
    SELECT TOP 1 d.DepartmentName, COUNT(*) AS EmployeeCount
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentName
    ORDER BY EmployeeCount DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeListWithDepartment]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeListWithDepartment]
AS
BEGIN
    SELECT e.EmployeeID, d.DepartmentName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeFirstName]    Script Date: 3/24/2023 7:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployeeFirstName]
    @EmployeeID int,
    @NewFirstName nvarchar(50)
AS
BEGIN
    UPDATE Employees
    SET FirstName = @NewFirstName
    WHERE EmployeeID = @EmployeeID
END
GO
USE [master]
GO
ALTER DATABASE [samyAnthoLinqToSql] SET  READ_WRITE 
GO
