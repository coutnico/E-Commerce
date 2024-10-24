USE [master]
GO
/****** Object:  Database [CATALOGO_P3_DB]    Script Date: 2/7/2024 00:37:52 ******/
CREATE DATABASE [CATALOGO_P3_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CATALOGO_P3_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CATALOGO_P3_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CATALOGO_P3_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CATALOGO_P3_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CATALOGO_P3_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CATALOGO_P3_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CATALOGO_P3_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CATALOGO_P3_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CATALOGO_P3_DB', N'ON'
GO
ALTER DATABASE [CATALOGO_P3_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CATALOGO_P3_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CATALOGO_P3_DB]
GO
/****** Object:  Table [dbo].[ADVERTENCIAS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADVERTENCIAS](
	[ID_ADVERTENCIA] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ADVERTENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS_PERSONALES]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATOS_PERSONALES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Genero] [varchar](20) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Telefono_Aux] [int] NULL,
	[Documento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOMICILIOS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOMICILIOS](
	[ID_Domicilio] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Altura] [int] NOT NULL,
	[EntreCalle1] [varchar](50) NOT NULL,
	[EntreCalle2] [varchar](50) NOT NULL,
	[ID_Localidad] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGENES]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGENES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[ImagenUrl] [varchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[ID_Localidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[IDCategoria] [int] NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUBLICACIONES]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLICACIONES](
	[IdPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Pausada] [bit] NOT NULL,
	[Baja_Logica] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 2/7/2024 00:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[TipoUser] [int] NULL,
 CONSTRAINT [PK_Usuarios_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADVERTENCIAS] ON 

INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (17, 8)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (18, 8)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (19, 9)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (20, 10)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (21, 11)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (22, 12)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (23, 9)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (24, 9)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (25, 8)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (26, 11)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (27, 11)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (28, 12)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (29, 12)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (30, 11)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (31, 10)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (32, 9)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (33, 8)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (34, 10)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (35, 12)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (36, 10)
INSERT [dbo].[ADVERTENCIAS] ([ID_ADVERTENCIA], [ID_USUARIO]) VALUES (37, 13)
SET IDENTITY_INSERT [dbo].[ADVERTENCIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[ARTICULOS] ON 

INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (1, N'A001', N'Smart TV Samsung', N'Televisor inteligente de 50 pulgadas', 1, 1, 799.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (2, N'A002', N'Lavadora LG', N'Lavadora de carga frontal 8kg', 2, 2, 499.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (3, N'A003', N'iPhone 12', N'Teléfono inteligente con pantalla OLED de 6.1 pulgadas', 3, 3, 1099.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (4, N'A004', N'MacBook Air', N'Portátil ligero con pantalla Retina de 13 pulgadas', 4, 4, 1299.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (5, N'A005', N'PlayStation 5', N'Consola de videojuegos con soporte para juegos 4K', 5, 5, 499.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (6, N'A006', N'Nike Air Max 270', N'Zapatillas deportivas con unidad Air Max para mayor comodidad', 6, 6, 149.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (7, N'A007', N'Samsung Galaxy Tab S7', N'Tableta con pantalla AMOLED de 11 pulgadas y S Pen incluido', 7, 7, 649.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (8, N'A008', N'Canon EOS Rebel T7', N'Cámara réflex digital con sensor APS-C de 24.1 MP', 8, 8, 599.9900)
INSERT [dbo].[ARTICULOS] ([Id], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio]) VALUES (9, N'A009', N'Apple Watch Series 6', N'Reloj inteligente con sensor de oxígeno en la sangre y monitor de electrocardiograma', 3, 9, 399.9900)
SET IDENTITY_INSERT [dbo].[ARTICULOS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] ON 

INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (1, N'Electrónica y Tecnología')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (2, N'Moda y Accesorios')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (3, N'Hogar y Jardín')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (4, N'Salud y Belleza')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (5, N'Arte y Artesanía')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (6, N'Deportes y Ocio')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (7, N'Vehículos')
INSERT [dbo].[CATEGORIAS] ([Id], [Descripcion]) VALUES (8, N'Otros')
SET IDENTITY_INSERT [dbo].[CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[IMAGENES] ON 

INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (1, 1, N'https://imgs.search.brave.com/Ov2b2_0Wv41PMkAWTzAvcoQa8rXjrZEyFB3jWu0ydVg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTcz/MjQwMTQzL3Bob3Rv/L3R2LXdpdGgtdHdv/LWNsaXBwaW5nLXBh/dGhzLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1UUkFwZ2pX/WFU3VlB6d2ZYUk14/dXNrVTdiYmZva3BM/QXJmT0Y3OG1QQjBr/PQ')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (2, 2, N'https://imgs.search.brave.com/Mqe2XEi1_Y4h8cY2SvuFYn2WskiHE4LI5iAL_Kx3kf4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93aGly/bHBvb2xhcmcudnRl/eGFzc2V0cy5jb20v/YXJxdWl2b3MvaWRz/LzE2NDExMi04MDAt/YXV0bz92PTYzODQy/NDUzNDIwODAzMDAw/MCZ3aWR0aD04MDAm/aGVpZ2h0PWF1dG8m/YXNwZWN0PXRydWU')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (3, 3, N'https://imgs.search.brave.com/xBiKvecmQwxLhB6JChR-KmN3-CavT5AdqBEd99lgcF0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9kMjho/aTkzZ3I2OTdvbC5j/bG91ZGZyb250Lm5l/dC85ZWY4NGRkYS0z/MmRkLTQwMTYtN2Rh/My0xYzBhODI0ZmZm/YjQvaW1nL1Byb2R1/Y3RvLzgzNjhhZGI5/LWUzNjEtNzZiNS1h/YjdkLWQ0NTI0Mjk0/Y2VhMS83YmJmZTg3/NzczMzM4ZGY1Nzgx/YTUyYmZiODA2YTVk/Zi02MzE3ZWEwY2Yy/NzIyLmpwZw')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (4, 4, N'https://imgs.search.brave.com/-B4lDOnYfLrPfg97F14-q0mEVKPjKHVTJDNvq2zJYV0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTIz/MjA1MjgyMC9waG90/by9hLTIwMjAtYXBw/bGUtbWFjYm9vay1h/aXItbGFwdG9wLWNv/bXB1dGVyLXRha2Vu/LW9uLWFwcmlsLTE0/LTIwMjAuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPXp1TDJB/a0NEbnNiZk94eUht/RllHYmFXVFcxcFB3/Y21vZjlmYUdybTZu/ZkU9')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (5, 5, N'https://imgs.search.brave.com/WN9nw1BUl5PZloCEAXMHb65iIGgS6K7sqRpUHZv8Qcg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTIy/OTU2MDM5OC9waG90/by9hLXNvbnktcGxh/eXN0YXRpb24tNS1o/b21lLXZpZGVvLWdh/bWUtY29uc29sZS10/YWtlbi1vbi1vY3Rv/YmVyLTI5LTIwMjAu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PUd4c2o4bFg0S21V/NWFuYm14ZjN5dVkt/Y3FrbDdlaXFwVzJh/NUZlaDZId0k9')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (6, 6, N'https://imgs.search.brave.com/0tHTW6aRrPqAFrqZXIehLKFgec8X2mY9uUCpJhLwZcc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pOC5h/bXBsaWVuY2UubmV0/L3QvanBsL2pkX3By/b2R1Y3RfbGlzdD9w/bHU9amRfNjkwMjM5/X3BsYyZxbHQ9OTIm/ZXhjbHVzaXZlPTAm/d2lkPTM2MyZoZWk9/NDYzJnY9MSZmbXQ9/YXV0bw')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (7, 7, N'https://imgs.search.brave.com/ANT24mErNRuPW7DWkrOooBvxEXPck36oqgm9T73TZz0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/MzFnVjI5a3dnNkwu/anBn')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (8, 8, N'https://imgs.search.brave.com/06P4Kso6wBNmwkO2Az0tMoipmK8UBAUF6qA1fFoPKSs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnJ0/aW5ncy5jb20vYXNz/ZXRzL3Byb2R1Y3Rz/L24xcWtLU2NCL2Nh/bm9uLWVvcy1yZWJl/bC10Ny1lb3MtMjAw/MGQvZGVzaWduLW1l/ZGl1bS5qcGc_Zm9y/bWF0PWF1dG8')
INSERT [dbo].[IMAGENES] ([Id], [IdArticulo], [ImagenUrl]) VALUES (9, 9, N'https://imgs.search.brave.com/yyBTIdcJkJASVMnztIQxbDbjGwMB4kAVaCADC0OjCes/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/YXBwbGUuY29tL25l/d3Nyb29tL2ltYWdl/cy9wcm9kdWN0L3dh/dGNoL3N0YW5kYXJk/L0FwcGxlX3dhdGNo/LXNlcmllcy02LWFs/dW1pbnVtLXJlZC1j/YXNlXzA5MTUyMDIw/X2Nhcm91c2VsLmpw/Zy5sYXJnZS5qcGc')
SET IDENTITY_INSERT [dbo].[IMAGENES] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCAS] ON 

INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (1, N'Apple', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (2, N'Samsung', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (3, N'Sony', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (4, N'Microsoft', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (5, N'Dell', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (6, N'Otro', 1)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (7, N'Zara', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (8, N'H&M', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (9, N'Gucci', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (10, N'Nike', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (11, N'Adidas', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (12, N'Otro', 2)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (13, N'IKEA', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (14, N'Home Depot', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (15, N'Pottery Barn', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (16, N'Bed Bath & Beyond', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (17, N'Crate & Barrel', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (18, N'Otro', 3)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (19, N'L''Oréal', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (20, N'Dove', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (21, N'Colgate', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (22, N'Clarins', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (23, N'Nivea', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (24, N'Otro', 4)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (25, N'Etsy', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (26, N'Society6', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (27, N'Art.com', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (28, N'Redbubble', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (29, N'Saatchi Art', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (30, N'Otro', 5)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (31, N'Nike', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (32, N'Adidas', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (33, N'Decathlon', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (34, N'REI', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (35, N'Under Armour', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (36, N'Otro', 6)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (37, N'Ford', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (38, N'Toyota', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (39, N'BMW', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (40, N'Honda', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (41, N'Tesla', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (42, N'Otro', 7)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (43, N'Personalizado', 8)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (44, N'xx', 8)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (45, N'xx', 8)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (46, N'xx', 8)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (47, N'xx', 8)
INSERT [dbo].[MARCAS] ([Id], [Descripcion], [IDCategoria]) VALUES (48, N'xx', 8)
SET IDENTITY_INSERT [dbo].[MARCAS] OFF
GO
SET IDENTITY_INSERT [dbo].[PUBLICACIONES] ON 

INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (3, 8, 1, 50, 0, 0)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (4, 9, 2, 30, 1, 0)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (5, 10, 3, 20, 0, 1)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (6, 11, 4, 10, 0, 0)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (7, 12, 5, 60, 1, 1)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (8, 13, 6, 40, 0, 0)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (9, 14, 7, 25, 1, 0)
INSERT [dbo].[PUBLICACIONES] ([IdPublicacion], [IdUsuario], [IdArticulo], [Stock], [Pausada], [Baja_Logica]) VALUES (10, 15, 8, 15, 0, 1)
SET IDENTITY_INSERT [dbo].[PUBLICACIONES] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (8, N'admin5', N'adminpass5', 2)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (9, N'admin6', N'adminpass6', 2)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (10, N'usuario7', N'userpass7', 1)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (11, N'usuario8', N'userpass8', 1)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (12, N'usuario9', N'userpass9', 1)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (13, N'admin7', N'adminpass7', 2)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (14, N'admin8', N'adminpass8', 2)
INSERT [dbo].[USUARIOS] ([Id], [Usuario], [Pass], [TipoUser]) VALUES (15, N'usuario10', N'userpass10', 1)
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
ALTER TABLE [dbo].[ADVERTENCIAS]  WITH CHECK ADD FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[DOMICILIOS]  WITH CHECK ADD FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[LOCALIDADES] ([ID_Localidad])
GO
ALTER TABLE [dbo].[DOMICILIOS]  WITH CHECK ADD FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[LOCALIDADES] ([ID_Localidad])
GO
ALTER TABLE [dbo].[MARCAS]  WITH CHECK ADD FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[CATEGORIAS] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CATALOGO_P3_DB] SET  READ_WRITE 
GO
