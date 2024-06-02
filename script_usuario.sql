USE [CATALOGO_P3_DB]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 2/6/2024 16:33:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[TipoUser] [int] NULL
) ON [PRIMARY]
GO
