USE [master]
GO
/****** Object:  Database [CATALOGO_P3_DB]    Script Date: 5/7/2024 18:43:05 ******/
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
/****** Object:  Table [dbo].[ADVERTENCIAS]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[CHATS]    Script Date: 5/7/2024 18:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHATS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDCompra] [bigint] NOT NULL,
	[Remitente] [int] NOT NULL,
	[Mensaje] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS_PERSONALES]    Script Date: 5/7/2024 18:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATOS_PERSONALES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Genero] [varchar](20) NULL,
	[Telefono] [int] NULL,
	[Telefono_Aux] [int] NULL,
	[Documento] [int] NULL,
	[ID_USUARIO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOMICILIOS]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[IMAGENES]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[MARCAS]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[PUBLICACIONES]    Script Date: 5/7/2024 18:43:06 ******/
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
/****** Object:  Table [dbo].[SUSPENSIONES]    Script Date: 5/7/2024 18:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUSPENSIONES](
	[ID_SUSPENSION] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[FECHA_INICIO] [date] NOT NULL,
	[FECHA_FIN] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SUSPENSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 5/7/2024 18:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[TipoUser] [int] NULL,
	[EMAIL] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Usuarios_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADVERTENCIAS]  WITH CHECK ADD FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
ALTER TABLE [dbo].[DATOS_PERSONALES]  WITH CHECK ADD FOREIGN KEY([ID_USUARIO])
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
ALTER TABLE [dbo].[SUSPENSIONES]  WITH CHECK ADD FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[USUARIOS] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CATALOGO_P3_DB] SET  READ_WRITE 
GO
