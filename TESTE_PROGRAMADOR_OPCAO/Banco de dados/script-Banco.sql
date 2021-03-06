USE [dbteste]
GO
/****** Object:  Table [dbo].[Bancos]    Script Date: 26/06/2022 20:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bancos](
	[idbanco] [int] IDENTITY(1,1) NOT NULL,
	[nomebanco] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idbanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ukBanco] UNIQUE NONCLUSTERED 
(
	[nomebanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/06/2022 20:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nomecliente] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uk1] UNIQUE NONCLUSTERED 
(
	[nomecliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contas]    Script Date: 26/06/2022 20:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contas](
	[idcontas] [int] IDENTITY(1,1) NOT NULL,
	[numeroconta] [int] NOT NULL,
	[idcliente] [int] NOT NULL,
	[idbanco] [int] NOT NULL,
	[ativaconta] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcontas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ukcontas] UNIQUE NONCLUSTERED 
(
	[numeroconta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movimentos]    Script Date: 26/06/2022 20:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimentos](
	[idmovimento] [int] IDENTITY(1,1) NOT NULL,
	[saldoanterior] [int] NOT NULL,
	[saldo] [int] NOT NULL,
	[credito] [float] NULL,
	[debito] [float] NULL,
	[dataini] [date] NULL,
	[datafim] [date] NULL,
	[idconta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idmovimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Contas]  WITH CHECK ADD FOREIGN KEY([idbanco])
REFERENCES [dbo].[Bancos] ([idbanco])
GO
ALTER TABLE [dbo].[Contas]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[Clientes] ([idcliente])
GO
ALTER TABLE [dbo].[Movimentos]  WITH CHECK ADD FOREIGN KEY([idconta])
REFERENCES [dbo].[Contas] ([idcontas])
GO
