USE [Gran_Alma]
GO
/****** Object:  Schema [PAS\patrol]    Script Date: 13/01/2017 13:48:45 ******/
CREATE SCHEMA [PAS\patrol]
GO
/****** Object:  Table [dbo].[Cajeros]    Script Date: 13/01/2017 13:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajeros](
	[CodCajero] [int] NOT NULL,
	[NomApellidos] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cajeros] PRIMARY KEY CLUSTERED 
(
	[CodCajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maquinas]    Script Date: 13/01/2017 13:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maquinas](
	[CodMaquina] [int] NOT NULL,
	[Piso] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Maquinas] PRIMARY KEY CLUSTERED 
(
	[CodMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/01/2017 13:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[CodProducto] [int] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[CodProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 13/01/2017 13:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[Cajero] [int] NOT NULL,
	[Maquina] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Cajeros] ([CodCajero], [NomApellidos]) VALUES (1, N'Pepe González')
INSERT [dbo].[Cajeros] ([CodCajero], [NomApellidos]) VALUES (2, N'Ana Ramírez')
INSERT [dbo].[Cajeros] ([CodCajero], [NomApellidos]) VALUES (3, N'Jose Goyanes')
INSERT [dbo].[Cajeros] ([CodCajero], [NomApellidos]) VALUES (4, N'Ines García')
INSERT [dbo].[Maquinas] ([CodMaquina], [Piso]) VALUES (1, N'Planta 1 Caballeros')
INSERT [dbo].[Maquinas] ([CodMaquina], [Piso]) VALUES (2, N'Planta 1 Señoras')
INSERT [dbo].[Maquinas] ([CodMaquina], [Piso]) VALUES (3, N'Planta3 Juvenil')
INSERT [dbo].[Productos] ([CodProducto], [Nombre], [Precio]) VALUES (1, N'Rebeca Roja', 234)
INSERT [dbo].[Productos] ([CodProducto], [Nombre], [Precio]) VALUES (2, N'Zapato Bermellón', 365)
INSERT [dbo].[Productos] ([CodProducto], [Nombre], [Precio]) VALUES (3, N'Abrigo Negro', 123)
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([idVenta], [Cajero], [Maquina], [Producto], [Cantidad]) VALUES (7, 1, 1, 1, 3)
INSERT [dbo].[Ventas] ([idVenta], [Cajero], [Maquina], [Producto], [Cantidad]) VALUES (8, 1, 2, 2, 6)
SET IDENTITY_INSERT [dbo].[Ventas] OFF
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Cajeros] FOREIGN KEY([Cajero])
REFERENCES [dbo].[Cajeros] ([CodCajero])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Cajeros]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Maquinas] FOREIGN KEY([Maquina])
REFERENCES [dbo].[Maquinas] ([CodMaquina])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Maquinas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([Producto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
