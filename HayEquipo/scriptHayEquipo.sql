USE [master]
GO
/****** Object:  Database [HayEquipo]    Script Date: 20/08/2019 22:33:33 ******/
CREATE DATABASE [HayEquipo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HayEquipo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HayEquipo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HayEquipo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HayEquipo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HayEquipo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HayEquipo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HayEquipo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HayEquipo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HayEquipo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HayEquipo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HayEquipo] SET ARITHABORT OFF 
GO
ALTER DATABASE [HayEquipo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HayEquipo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HayEquipo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HayEquipo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HayEquipo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HayEquipo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HayEquipo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HayEquipo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HayEquipo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HayEquipo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HayEquipo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HayEquipo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HayEquipo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HayEquipo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HayEquipo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HayEquipo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HayEquipo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HayEquipo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HayEquipo] SET  MULTI_USER 
GO
ALTER DATABASE [HayEquipo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HayEquipo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HayEquipo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HayEquipo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HayEquipo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HayEquipo] SET QUERY_STORE = OFF
GO
USE [HayEquipo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nroLegajo] [int] NULL,
	[apellido] [nvarchar](50) NULL,
	[nombres] [nvarchar](50) NULL,
	[idTipoDoc] [int] NULL,
	[nroDoc] [int] NULL,
	[sexo] [nvarchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[idBarrio] [int] NULL,
	[nroTelefono] [int] NULL,
	[fechaIngreso] [date] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmigosPorDeportistas]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmigosPorDeportistas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeportista] [int] NULL,
	[idAmigo] [int] NULL,
 CONSTRAINT [PK_AmigosPorDeportistas_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barrio]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[idZona] [int] NULL,
 CONSTRAINT [PK_Barrio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancha]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancha](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeporte] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[idTipoCancha] [int] NULL,
 CONSTRAINT [PK_Cancha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CanchasPorComplejos]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanchasPorComplejos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComplejo] [int] NULL,
	[idCancha] [int] NULL,
 CONSTRAINT [PK_CanchasPorComplejos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CanchasPorHorarios]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanchasPorHorarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHorario] [int] NULL,
	[idCancha] [int] NULL,
 CONSTRAINT [PK_CanchasPorHorarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplejoDeportivo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplejoDeportivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[idTipoComplejo] [int] NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[idBarrio] [int] NULL,
	[nroTelefono] [int] NULL,
	[idResponsable] [int] NULL,
	[idUsuario] [int] NULL,
	[promedioEstrellas] [float] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_ComplejoDeportivo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deporte]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deporte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Deporte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeportesPorDeportistas]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeportesPorDeportistas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeportista] [int] NULL,
	[idDeporte] [int] NULL,
 CONSTRAINT [PK_DeportesPorDeportistas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportista]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [nvarchar](50) NULL,
	[nombres] [nvarchar](50) NULL,
	[idTipoDoc] [int] NULL,
	[nroDoc] [int] NULL,
	[sexo] [nvarchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[nroTelefono] [int] NULL,
	[idUsuario] [int] NULL,
	[promedioEstrellas] [float] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Deportista] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeportistasPorEquipos]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeportistasPorEquipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeportista] [int] NULL,
	[idEquipo] [int] NULL,
 CONSTRAINT [PK_DeportistasPorEquipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleValoracionComplejo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleValoracionComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nroEstrellas] [int] NULL,
	[idTipoValoracion] [int] NULL,
	[idValoracion] [int] NULL,
 CONSTRAINT [PK_DetalleValoracionComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleValoracionDeportista]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleValoracionDeportista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nroEstrellas] [int] NULL,
	[idTipoValoracion] [int] NULL,
	[idValoracion] [int] NULL,
 CONSTRAINT [PK_DetalleValoracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncuentroDeportivo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncuentroDeportivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAdmin] [int] NULL,
	[fechaCreacionEncuentro] [smalldatetime] NULL,
	[fechaDestruccionEncuentro] [smalldatetime] NULL,
	[idDeporte] [int] NULL,
	[tipoEncuentro] [bit] NULL,
	[idComplejo] [int] NULL,
	[nombreLP] [nvarchar](50) NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[idEquipo] [int] NULL,
	[fechaInicioEncuentro] [smalldatetime] NULL,
	[fechaFinEncuentro] [smalldatetime] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_EncuentroDeportivo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[capacidad] [int] NULL,
	[nroDeportistasActual] [int] NULL,
	[promedioEstrellas] [float] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[fecha] [date] NULL,
	[horaInicio] [time](7) NULL,
	[horaFin] [time](7) NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvitacionEncuentro]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvitacionEncuentro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaHora] [smalldatetime] NULL,
	[idEncuentro] [int] NULL,
	[idInvitado] [int] NULL,
 CONSTRAINT [PK_InvitacionEncuentro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[idProvincia] [int] NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEncuentro] [int] NULL,
	[texto] [nvarchar](50) NULL,
	[fechaHora] [smalldatetime] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[bandera] [image] NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisosPorRoles]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisosPorRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idPermiso] [int] NULL,
 CONSTRAINT [PK_PermisosPorRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posicion]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posicion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[idDeporte] [int] NULL,
 CONSTRAINT [PK_Posicion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosicionesPorDeportistas]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosicionesPorDeportistas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPosicion] [int] NULL,
	[idDeportista] [int] NULL,
 CONSTRAINT [PK_PosicionesPorDeportistas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[idPais] [int] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSponsor] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[fechaInicio] [smalldatetime] NULL,
	[fechaFin] [smalldatetime] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsable]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [nvarchar](50) NULL,
	[nombres] [nvarchar](50) NULL,
	[idTipoDoc] [int] NULL,
	[nroDoc] [int] NULL,
	[sexo] [nvarchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[nroTelefono] [int] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Responsable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descipcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesPorUsuarios]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPorUsuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_RolesPorUsuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubro]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rubro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicioExtra]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioExtra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServicioExtra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosPorComplejos]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosPorComplejos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComplejo] [int] NULL,
	[idServicio] [int] NULL,
 CONSTRAINT [PK_ServiciosPorComplejos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sesion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[horaInicio] [smalldatetime] NULL,
	[horaFin] [smalldatetime] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Sesion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[idRubro] [int] NULL,
	[idResponsable] [int] NULL,
	[fechaInicioContrato] [smalldatetime] NULL,
	[fechaFinContrato] [smalldatetime] NULL,
	[idEstado] [int] NULL,
 CONSTRAINT [PK_Es] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCancha]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCancha](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoCancha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComplejo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeporte]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeporte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoDeporte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposPorDeportes]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposPorDeportes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDeporte] [int] NULL,
	[idDeporte] [int] NULL,
 CONSTRAINT [PK_TiposPorDeportes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoValoracionComplejo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValoracionComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoValoracionComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoValoracionDeportista]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValoracionDeportista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoValoracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[contraseña] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[avatar] [image] NULL,
	[fechaAlta] [smalldatetime] NULL,
	[fechaBaja] [smalldatetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValoracionComplejo]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValoracionComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idComplejo] [int] NULL,
	[reseña] [nvarchar](50) NULL,
	[promedioEstrellas] [float] NULL,
	[fechaHora] [smalldatetime] NULL,
 CONSTRAINT [PK_ValoracionComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValoracionDeportista]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValoracionDeportista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeportista] [int] NULL,
	[reseña] [nvarchar](50) NULL,
	[promedioEstrellas] [float] NULL,
	[fechaHora] [smalldatetime] NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zona]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[idLocalidad] [int] NULL,
 CONSTRAINT [PK_Zona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZonasPorDeportistas]    Script Date: 20/08/2019 22:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZonasPorDeportistas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idZona] [int] NULL,
	[idDeportista] [int] NULL,
 CONSTRAINT [PK_ZonasPorDeportistas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Barrio] ON 

INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (1, N'V.I.C.O.R.', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (2, N'ALTOS SAN MARTIN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (3, N'BAJADA SAN ROQUE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (4, N'IRUPE', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (5, N'VILLA RIVADAVIA ANEXO "A"', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (6, N'FERRER', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (7, N'MAURIZI', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (8, N'ROGELIO MARTINEZ', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (9, N'BELLA VISTA OESTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (10, N'1RA. JUNTA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (11, N'ALTOS SUD DE SAN VICENTE', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (12, N'MERCANTIL', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (13, N'SAN LORENZO NORTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (14, N'LAS MARGARITAS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (15, N'ALTO VERDE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (16, N'MILITAR GENERAL DEHEZA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (17, N'20 DE JUNIO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (18, N'POLICIAL', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (19, N'LOS JOSEFINOS', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (20, N'CACERES', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (21, N'CUPANI', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (22, N'CASEROS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (23, N'CONSORCIO 16 DE NOVIEMBRE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (24, N'ALTO PALERMO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (25, N'TABLADA PARK', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (26, N'PARQUE MONTECRISTO', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (27, N'LOS PINOS', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (28, N'GUI�AZU SUD', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (29, N'BAJADA DE PIEDRA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (30, N'ALTO HERMOSO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (31, N'SAN LUIS DE FRANCIA', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (32, N'KAIROS', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (33, N'GUAYAQUIL', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (34, N'PATRICIOS', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (35, N'SAN FRANCISCO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (36, N'AMPLIACION EMPALME', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (37, N'PARQUE COREMA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (38, N'BENJAMIN POLICARPIO CABRAL', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (39, N'PARQUE LOS MOLINOS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (40, N'VILLA CORINA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (41, N'PARQUE SAN VICENTE', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (42, N'PASO DE LOS ANDES', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (43, N'EJERCITO ARGENTINO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (44, N'COUNTRY CLUB', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (45, N'FINCA LA DOROTEA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (46, N'LOS EUCALIPTUS', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (47, N'SUAREZ', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (48, N'PATRIA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (49, N'CAROLA LORENZINI', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (50, N'EL CERRITO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (51, N'AMPLIACION ALTAMIRA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (52, N'QUINTAS DE ARGUELLO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (53, N'GENERAL BUSTOS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (54, N'AMPLIACION ROSEDAL', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (55, N'PARQUE JORGE NEWBERY', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (56, N'RESIDENCIAL OLIVOS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (57, N'COLINAS DE BELLA VISTA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (58, N'SAN NICOLAS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (59, N'U.O.C.R.A.', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (60, N'CERVECEROS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (61, N'ALBORADA (S)', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (62, N'CERRO CHICO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (63, N'LOS OLMOS SUD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (64, N'S.E.P.', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (65, N'O.S.N.', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (66, N'ANA MARIA ZUMARAN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (67, N'ALTOS DE VILLA CABRERA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (68, N'SARGENTO CABRAL', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (69, N'VILLA CABRERA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (70, N'HIPOLITO IRIGOYEN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (71, N'ARGUELLO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (72, N'GENERAL ARENALES', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (73, N'AMPLIACION FARINA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (74, N'MARQUES DE SOBREMONTE', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (75, N'JERONIMO LUIS DE CABRERA', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (76, N'JUAN B. JUSTO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (77, N'DEAN FUNES', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (78, N'MARCELO T. DE ALVEAR', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (79, N'GENERAL ARTIGAS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (80, N'ALBORADA (N)', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (81, N'COLINAS DE VELEZ SARSFIELD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (82, N'PARQUE VELEZ SARSFIELD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (83, N'LOS PARAISOS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (84, N'SAN CAYETANO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (85, N'EMAUS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (86, N'LOS CEIBOS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (87, N'GRANADERO PRINGLES', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (88, N'COFICO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (89, N'YOFRE I', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (90, N'SANTA ISABEL 3A SECCION', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (91, N'COMANDANTE ESPORA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (92, N'GENERAL MOSCONI', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (93, N'JARDIN HIPODROMO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (94, N'NUEVA CORDOBA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (95, N'INDEPENDENCIA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (96, N'PARQUE FUTURA', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (97, N'REMEDIOS DE ESCALADA', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (98, N'YAPEYU', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (99, N'ALMIRANTE BROWN', 9)
GO
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (100, N'CRISOL NORTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (101, N'AMEGHINO NORTE', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (102, N'LOS NARANJOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (103, N'LOS PLATANOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (104, N'SAN LORENZO (S)', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (105, N'CARRARA', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (106, N'PARQUE CHACABUCO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (107, N'SANTA CECILIA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (108, N'VILLA MARTA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (109, N'CENTRO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (110, N'LA HORTENSIA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (111, N'VIVERO NORTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (112, N'PARQUE LICEO 1A SECCION', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (113, N'ARTURO CAPDEVILA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (114, N'VILLA SERRANA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (115, N'LAS ROSAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (116, N'VILLA ALBERDI', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (117, N'MARECHAL', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (118, N'SAN MARTIN NORTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (119, N'OBRERO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (120, N'VILLA ALLENDE PARQUE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (121, N'SAN MARTIN ANEXO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (122, N'LOMAS DE SAN MARTIN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (123, N'CORRAL DE PALOS', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (124, N'PARQUE LICEO 2A SECCION', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (125, N'SANTA RITA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (126, N'NUEVA ITALIA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (127, N'CABO FARINA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (128, N'AMEGHINO SUD', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (129, N'RENACIMIENTO', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (130, N'JARDIN DEL PILAR', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (131, N'MARCOS SASTRE', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (132, N'INDUSTRIAL ESTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (133, N'JOSE IGNACIO DIAZ 2A SECCION', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (134, N'VALLE DEL CERRO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (135, N'AMPLIACION URCA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (136, N'COLINAS DEL CERRO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (137, N'PARQUE TABLADA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (138, N'VILLA ADELA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (139, N'AEROPUERTO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (140, N'PARQUE MODELO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (141, N'VILLA SOLFERINO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (142, N'ROSEDAL', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (143, N'VILLA PAEZ', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (144, N'CALIFORNIA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (145, N'EMPALME CASAS DE OBREROS Y EMPLEADOS', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (146, N'BAJO GALAN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (147, N'SANTA ANA RESIDENCIAL', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (148, N'AMPLIACION PUEYRREDON', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (149, N'SAN JAVIER', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (150, N'VILLA ARGENTINA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (151, N'VILLA ASPASIA', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (152, N'LAS HUERTILLAS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (153, N'FERROVIARIO  MITRE', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (154, N'EMPALME', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (155, N'LAS LILAS', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (156, N'PARQUE ALAMEDA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (157, N'JOSE IGNACIO DIAZ 1A SECCION', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (158, N'TALLERES SUD', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (159, N'VILLA CORNU', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (160, N'TEJAS DE LA CANDELARIA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (161, N'SAN ANTONIO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (162, N'OBSERVATORIO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (163, N'APEADERO LA TABLADA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (164, N'OMBU', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (165, N'SOLARES DE SANTA MARIA', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (166, N'RIVADAVIA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (167, N'4 DE FEBRERO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (168, N'SAN PEDRO NOLASCO', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (169, N'ALTOS DE VELEZ SARSFIELD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (170, N'RESIDENCIAL VELEZ SARSFIELD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (171, N'PARQUE ATLANTICA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (172, N'SAN DANIEL', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (173, N'JARDIN ESPINOSA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (174, N'JOCKEY CLUB', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (175, N'AMPLIACION JARDIN ESPINOSA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (176, N'DR REMO M. COPELLO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (177, N'GENERAL BELGRANO', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (178, N'PATRICIOS OESTE', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (179, N'O�A', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (180, N'PARQUE SAN CARLOS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (181, N'PARQUE DEL ESTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (182, N'VILLA ABALOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (183, N'LOS GRANADOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (184, N'RESIDENCIAL SAN ROQUE', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (185, N'CONSORCIO ESPERANZA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (186, N'EL TREBOL', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (187, N'LAS PLAYAS', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (188, N'A.T. E.', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (189, N'VILLA BELGRANO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (190, N'CERRO DE LAS ROSAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (191, N'URCA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (192, N'JUAN XXIII', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (193, N'PARQUE CAPITAL SUR', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (194, N'LOURDES', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (195, N'PARQUE DON BOSCO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (196, N'VILLA SIBURU', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (197, N'AMPLIACION PALMAR', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (198, N'1� DE MAYO', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (199, N'VILLA BUSTOS', 9)
GO
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (200, N'AMPLIACION 1� DE MAYO', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (201, N'AMPLIACION LOS PLATANOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (202, N'LAMADRID', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (203, N'LOS JACARANDAES', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (204, N'VILLA UNION', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (205, N'VILLA ALBERTO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (206, N'BRIGADIER SAN MARTIN', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (207, N'BETANIA', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (208, N'MIRALTA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (209, N'INDUSTRIAL OESTE', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (210, N'ARSENALES ANEXO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (211, N'VILLA DERNA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (212, N'VILLA ALBERTO ANEXO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (213, N'TTE. BENJAMIN MATIENZO', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (214, N'URQUIZA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (215, N'COLON', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (216, N'EL CABILDO', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (217, N'SANTA ISABEL 2A SECCION', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (218, N'CONGRESO', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (219, N'CHATEAU LOS ROBLES', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (220, NULL, NULL)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (221, N'LA TOMA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (222, N'VILLA MAFEKIN', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (223, N'ALTOS DE SANTA ANA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (224, N'EL PUEBLITO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (225, NULL, NULL)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (226, NULL, NULL)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (227, N'POETA LUGONES', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (228, N'LAS DELICIAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (229, N'VILLA ZEPPELIN', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (230, N'AERONAUTICO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (231, N'TALLERES (O)', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (232, N'TALLERES (E)', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (233, N'PANAMERICANO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (234, N'LA FRATERNIDAD', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (235, N'RECREO DEL NORTE', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (236, N'LOS GIGANTES', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (237, N'VILLA AZALAIZ OESTE', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (238, N'YOFRE SUD', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (239, N'CENTRO AMERICA', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (240, N'VILLA AZALAIZ', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (241, N'AMPLIACION RESIDENCIAL AMERICA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (242, N'LOS ALAMOS', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (243, N'GENERAL SAVIO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (244, N'QUINTA SANTA ANA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (245, N'ALBERDI', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (246, N'YOFRE H', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (247, N'PALMAR', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (248, N'VILLA CLAUDINA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (249, N'CIUDADELA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (250, N'URITORCO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (251, N'ALEJANDRO CENTENO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (252, N'ACHAVAL PE�A', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (253, N'BELLA VISTA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (254, N'PARQUE LICEO 3A SECCION', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (255, N'PARQUE CAPITAL', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (256, N'MARIANO BALCARCE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (257, N'VILLA SILVANO FUNES', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (258, N'LAS FLORES', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (259, N'HORIZONTE', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (260, N'SAN FERNANDO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (261, N'IPONA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (262, N'LOS SAUCES', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (263, N'NICOLAS AVELLANEDA', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (264, N'RESIDENCIAL ARAGON', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (265, N'QUINTAS DE SAN JORGE', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (266, N'SAN SALVADOR', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (267, N'DR RENE FAVALORO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (268, N'PUENTE BLANCO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (269, N'LAS DALIAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (270, N'LAS PALMAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (271, N'VILLA RETIRO', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (272, N'SAN VICENTE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (273, N'MIRADOR', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (274, N'RESIDENCIAL SAN JORGE', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (275, N'SANTA ISABEL 1A SECCION', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (276, N'RESIDENCIAL SUD', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (277, N'LA FRANCE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (278, N'LAS MAGNOLIAS', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (279, N'JOSE HERNANDEZ', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (280, N'VILLA CLARET', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (281, N'ITUZAINGO', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (282, N'PATRICIOS NORTE', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (283, N'PATRICIOS ESTE', 3)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (284, N'AMPLIACION GENERAL ARTIGAS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (285, N'EL QUEBRACHO', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (286, N'LA FLORESTA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (287, N'LAS VIOLETAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (288, N'LOS FILTROS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (289, N'VILLA WARCALDE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (290, N'CO.VI.CO.', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (291, N'CHATEAU CARRERAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (292, N'HOGAR PROPIO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (293, N'GENERAL PUEYRREDON', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (294, N'LOS ROBLES', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (295, N'AMPLIACION SAN PABLO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (296, N'SAN FELIPE', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (297, N'RENE FAVALORO SUD', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (298, N'RAMON J. CARCANO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (299, N'SAN RAFAEL', 5)
GO
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (300, N'AVENIDA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (301, N'VILLA QUISQUIZACATE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (302, N'JOSE IGNACIO DIAZ 3A SECCION', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (303, N'23 DE ABRIL', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (304, N'CARBO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (305, N'VILLA EL LIBERTADOR', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (306, N'SANTA ROSA RESIDENCIAL', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (307, N'MIRIZI', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (308, N'SAN MARTIN', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (309, N'AMPLIACION LAS PALMAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (310, N'RIVERA INDARTE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (311, N'PROVIDENCIA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (312, N'INAUDI', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (313, N'BIALET MASSE', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (314, N'SAN IGNACIO', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (315, N'QUEBRADA DE LAS ROSAS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (316, N'VILLA RIVERA INDARTE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (317, N'VILLA SALDAN', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (318, N'AMPLIACION POETA LUGONES', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (319, N'NUEVA CORDOBA ANEXA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (320, N'MAIPU 1A SECCION', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (321, N'GENERAL PAZ', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (322, N'BAJO GENERAL PAZ', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (323, N'JUNIORS', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (324, N'CERRO NORTE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (325, N'ARGUELLO NORTE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (326, N'VILLA 9 DE JULIO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (327, N'PARQUE REPUBLICA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (328, N'VILLA MARTINEZ', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (329, N'AMPLIACION SAN FERNANDO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (330, N'VILLA SAN ISIDRO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (331, N'RESIDENCIAL AMERICA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (332, N'AYACUCHO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (333, N'ALTAMIRA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (334, N'MAIPU 2A SECCION', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (335, N'SARMIENTO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (336, N'MARIANO FRAGUEIRO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (337, N'AMPLIACION PANAMERICANO', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (338, N'YOFRE NORTE', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (339, N'SANTA CLARA DE ASIS', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (340, N'PADRE CLARET', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (341, N'LOS ANGELES', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (342, N'SACCHI', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (343, N'VILLA CORONEL OLMEDO', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (344, N'FERREYRA', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (345, N'GUEMES', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (346, N'COMERCIAL', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (347, N'TRANVIARIOS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (348, N'ALTO ALBERDI', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (349, N'VILLA SAN CARLOS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (350, N'MALDONADO', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (351, N'MAULLER', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (352, N'SAN PABLO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (353, N'RESIDENCIAL SAN CARLOS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (354, N'EL REFUGIO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (355, N'LA SALLE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (356, N'CRISOL SUD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (357, N'CABA�A DEL PILAR', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (358, N'JARDIN', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (359, N'VILLA REVOL ANEXO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (360, N'VILLA REVOL', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (361, N'VILLA GENERAL URQUIZA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (362, N'TEODORO FELS', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (363, N'JOSE IGNACIO RUCCI', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (364, N'VILLA GRAN PARQUE', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (365, N'LICEO GENERAL PAZ', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (366, N'MARIA LASTENIA', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (367, N'VILLA CENTENARIO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (368, N'SAN MARCELO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (369, N'PARQUE LATINO', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (370, N'AMPLIACION VELEZ SARSFIELD', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (371, N'LOS OLMOS', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (372, N'ALTA CORDOBA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (373, N'DUCASSE', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (374, N'GUI�AZU', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (375, N'VILLA ALICIA RISLER', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (376, N'LA CAROLINA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (377, N'VALLE ESCONDIDO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (378, N'QUINTAS DE ITALIA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (379, N'GRANJA DE FUNES', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (380, N'LOS BOULEVARES', 2)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (381, N'ESTACION FLORES', 7)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (382, N'AMPLIACION KENNEDY', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (383, N'KENNEDY', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (384, N'ACOSTA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (385, N'COLONIA LOLA', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (386, N'SAN JOSE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (387, N'PORTAL DEL JACARANDA', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (388, N'ARGUELLO', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (389, N'ITUZAINGO ANEXO', 9)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (390, N'VILLA EUCARISTICA', 8)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (391, N'BAJO PALERMO', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (392, N'ESCOBAR', 5)
SET IDENTITY_INSERT [dbo].[Barrio] OFF
SET IDENTITY_INSERT [dbo].[Deporte] ON 

INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (1, N'fútbol')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (2, N'tenis')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (3, N'volley')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (4, N'paddle')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (5, N'karate')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (6, N'bascket')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (7, N'running')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (8, N'golf')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (9, N'ping pong')
INSERT [dbo].[Deporte] ([id], [nombre]) VALUES (10, N'boxeo')
SET IDENTITY_INSERT [dbo].[Deporte] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (1, N'reservada', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (2, N'libre', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (3, N'en curso', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (4, N'abierto', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (5, N'cerrado', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (6, N'cancelado', NULL)
SET IDENTITY_INSERT [dbo].[Estado] OFF
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([id], [nombre], [idProvincia]) VALUES (1, N'Córdoba', 1)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([id], [nombre], [bandera]) VALUES (1, N'Argentina', 0xFFD8FFE000104A46494600010101006400640000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080021003003011100021101031101FFC4001E0000010304030000000000000000000000070005060103040802090AFFC4003B100001030301040508080700000000000002010304050607120008111314151855D6172131567194B1D516192234579596A52362728192A1C1FFC4001B01000203010101000000000000000000000607000103050204FFC400391100010303020304070703050000000000010203040506110012131721075494D4081422315571D5151632415695B1243342458184B2C1FFDA000C03010002110311003F00F50DBC2EF07922D9C9153A2516A11E3D3E2B664D838B5557399D65538A4AA50EB105AD1CA88CE80E8FC4175A9386A7E66959165522E4A4BF3A73D3DB7DA9EEC5488AF34DB7C36D861C0487187495953AA04856300003A64A63B43ED0AB96A56E353E9AC531C61EA631314A991DF75D0EB8FC96D494A9A92C243612D208052485151C9070021DA8F2F77C44FDFF00C49B18F2A6DCEF557F151FC9E80F9D376774A178297F50D2ED4797BBE227EFFE24DA72A6DCEF557F151FC9EA73A6EDEEB42F052FEA1AE69BD366044E095987E6FE5AF2FF00B5B8F8ED7CAAB73BC55BC531E53539D376F75A178297F50D2ED4D987BE61FF008D77C47B5F2AEDCEF155F131FCA6A73A6EDEEB42F052FEA1A3BEEFDBC4647B96FAA5526B93D99512655A91054592A90706E5315971E57126D52A00E22AC16103403460BAD54CC4B4A2F6FBB4E9B6C2296AA7BB31C33572D2F094EB6E80180C16CB7C365ADB9E2A82B2559013EE20E59FD9B5ED57BBD7594D51A80D0A7A60298F5265D64A8CA5C94B9C4E2BEFEE03829DB8DA412ACE72304AB8B7516F395D9755DA57D396CAC2AED4683D5E16E85585C487365CCE94B24AB14F50573AC397C9E4AA0F27573094F4A79B4EFBFBAF4E7A07D9626F166392F8A6618FB788D32DF0F608CF671C2CEEDC33BB1B46327DDE9D9B0BC2AAC548D64D3C3101A85C110449DDC275F7789C43298C6EE36366D38DB9DC7380D9F57533F8B6F7E8A6FC4FB13F378FE9F4FEE6AF25A11E45A7F53AFF00684FD4342DCA7BA459388A9512AB7666594CB735F562332CD94CF31C51E0A64447731080A6A4404515274D7402704336C03B42F4A8B5FB33A4B558BA29622C67DEE032945454B71C7014EE000824F40AE8900AD6721230952924F6BFA2ED5EEF9AE41A3DC25C7196F8AEA9749484A53D703A543A93839EA0207551EA90A79C7BB965AD932DB8D73DB3991F7E0485D040765B2AEB0EE81356DC50B9F41A69315175BE2D9FDA145430311EB59DE91F44BE68512E1B7E908934F9832DACD49414956D04A4FF004585019C05A729242874525694FC5707A36542DAA93D4BAA5C4A6A4B5D7D9A40DAB4E4A4293BAA008EA920A543727A672082673F57533F8B6F7E8A6FC4FB14F378FE9F4FEE6AF25AE2F22D3FA9D7FB427EA1AC2A76EE4180F24E2F742EF3BA7E945D6D34A27431A3F41EA88153735210D52A2B23A47582270546B95CAE28A7CCFB21977DE06EB4C04FD9E207A8AA4AB224993C5F584B231D586766CE167FCB3BBF2C753DB1AC4FB96AA991533511514C34F58822967D5152159E921FDFC4E3E31ECECDB9F6B71C14FB4F63DC2F5EBBAD6BAE05D52AA532E6AA56DA72894C81321A439729E88D81BD2AAD05C1908EC0794DB46545009B24709488471B7EC9AB5C90DC9D01E80DB2D485C65094FBCDB9C4421B714425B8EE8DB8752012A04907A6304EF73F68744B527B54EA9315275F7A237310A871D975A0D3AE3ADA4294E4964858532ACA4248008209CF4CAEDF985BB9F217E4547F116DDDE54DC9DE68FE2E4F92D0E73AAD4EE95CF0717CFE80B9E7783DDDB3AD023D16B3032144E8EAF364476CD125C79512502B4FC692C1DC248628D9BBCAE224284F39A838A838D29BB5BF44F9BDACD1A2D2AA754834E720CB6A6C5990E74B6DE6DE61C4B8CAD2E370D2E256C2C296C94928CAD69710B4A86D3BB13D2928762D41D9D0A9F5A7C3C8DA5B5458C92950070A4113BA6E3B42FDCAC21252A1821528C45BD4EEFF0088ED466D9A553B234BFE273A4CA3A0519B433E1C05A65B1B8051B8CCA938AC828A28F34D3808E800ECF669E8CD3BB32B560DAF48994C7988691BA43F3A5B8E38AC138DCB86A594254A7149DEA52CADC716A39560732EFF00493A0DDF587AAD361569A52C6D6D944389B509CF52713F056A0121447421081D482A252EDF985BB9F217E4547F116CC0E54DC9DE68FE2E4F92D0BF3AAD4EE95CF0717CFEA1754DE02C9CE391F11B76843B8E215B7762BB505AF4085084C6AB4F9C11922AC4A94F57545603DCE4346B42137A54F52E91AB8AD3A9DB0222AA0E43704D2FA5AF5479D770580D95EFE230CE321D4EDC6ECE0E71D325D6ADED49BBD53934C667B469E98EA7BD75969A0A1254EA5BE1969F7F7105956EDDB700A719CF4D6DDE5F1A5F550CA7559F4FB7664E8321A3E5CA65D800DA9F5AD5DF26D524CC8EEA103521932556B42A382A067E7E079D9EDCF41A25164C5A9D41315F5D45E7D2DA9992E12D2D88C84AF2CB2E27054DAD382ADD91F840C12B3ED42CEB92E0AFC49B47A5B936335488F19C7532223412FA244A5A91B5F7DA59294B8851525253ED6012738D7CF25790FD53A8FBC527E65B1DF306CFF8CB7E12A1E534B8E585F5F0077C6D37CEE9792CC87EA9D47DE691F33DA7302CFF008D37E127F94D4E585F5F0077C6D33CEE9792CC85EAACFF0079A4FCCB6BFBFF0068FE75840FF8B3BFF229D50ECC6FA3FE80F0F9CCA779CD2F25990BD559FEF349F996D5CC1B3FE32DF84A8794D7AE57DF5F0173C6D3BCE6B61776BC717A42C8B45973A872213116B74596E1BCF44738B2C315E6DE21489224AA72CA547425711B15E68A0911714459768F70D1ABA8A38A4CD4CC319734BFB5990D06C3A98C1AFEFB4DEEDC50B1ECE71B4E4018CB77B28B5EBB6E2EBA6B5017044C4535318A9E8EF714C75CB53A008EF3A53B03A8C95ED0777B39C2B1DB956BEF0E7F7F82ECAED388FE2FF64FFDC698769ACB542F42FB17E1B4D5A7DE3E63F9D591F4A7B53E3B4D6CAF71F91FE3578BD0BEC5F86D358A7DE3E63F9D38DBDF7B4FEA1FFBB4D6DF99F90FE55AFFD9)
SET IDENTITY_INSERT [dbo].[Pais] OFF
SET IDENTITY_INSERT [dbo].[Posicion] ON 

INSERT [dbo].[Posicion] ([id], [nombre], [descripcion], [idDeporte]) VALUES (1, N'arquero', NULL, 1)
INSERT [dbo].[Posicion] ([id], [nombre], [descripcion], [idDeporte]) VALUES (2, N'defensor', NULL, 1)
INSERT [dbo].[Posicion] ([id], [nombre], [descripcion], [idDeporte]) VALUES (3, N'mediocampista', NULL, 1)
INSERT [dbo].[Posicion] ([id], [nombre], [descripcion], [idDeporte]) VALUES (4, N'delantero', NULL, 1)
SET IDENTITY_INSERT [dbo].[Posicion] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id], [nombre], [idPais]) VALUES (1, N'Córdoba', 1)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (1, N'deportista', NULL)
INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (2, N'administrador', NULL)
INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (3, N'invitado', NULL)
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Rubro] ON 

INSERT [dbo].[Rubro] ([id], [nombre], [descripcion]) VALUES (1, N'indumentaria deportiva', NULL)
SET IDENTITY_INSERT [dbo].[Rubro] OFF
SET IDENTITY_INSERT [dbo].[TipoDeporte] ON 

INSERT [dbo].[TipoDeporte] ([id], [nombre]) VALUES (1, N'individual')
INSERT [dbo].[TipoDeporte] ([id], [nombre]) VALUES (2, N'grupal')
INSERT [dbo].[TipoDeporte] ([id], [nombre]) VALUES (3, N'equipos')
INSERT [dbo].[TipoDeporte] ([id], [nombre]) VALUES (4, N'pelota')
SET IDENTITY_INSERT [dbo].[TipoDeporte] OFF
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([id], [nombre], [descripcion]) VALUES (1, N'DNI', NULL)
INSERT [dbo].[TipoDocumento] ([id], [nombre], [descripcion]) VALUES (2, N'libreta', NULL)
INSERT [dbo].[TipoDocumento] ([id], [nombre], [descripcion]) VALUES (3, N'DU', NULL)
INSERT [dbo].[TipoDocumento] ([id], [nombre], [descripcion]) VALUES (4, N'pasaporte', NULL)
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
SET IDENTITY_INSERT [dbo].[TiposPorDeportes] ON 

INSERT [dbo].[TiposPorDeportes] ([id], [idTipoDeporte], [idDeporte]) VALUES (1, 2, 1)
INSERT [dbo].[TiposPorDeportes] ([id], [idTipoDeporte], [idDeporte]) VALUES (2, 3, 1)
INSERT [dbo].[TiposPorDeportes] ([id], [idTipoDeporte], [idDeporte]) VALUES (3, 4, 1)
SET IDENTITY_INSERT [dbo].[TiposPorDeportes] OFF
SET IDENTITY_INSERT [dbo].[Zona] ON 

INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (1, N'Noroeste', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (2, N'Norte', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (3, N'Noreste', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (4, N'Oeste', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (5, N'Centro', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (6, N'Este', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (7, N'Suroeste', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (8, N'Sur', 1)
INSERT [dbo].[Zona] ([id], [nombre], [idLocalidad]) VALUES (9, N'Sureste', 1)
SET IDENTITY_INSERT [dbo].[Zona] OFF
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Barrio] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrio] ([id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Barrio]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_TipoDocumento] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_TipoDocumento]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Usuario]
GO
ALTER TABLE [dbo].[AmigosPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_AmigosPorDeportistas_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[AmigosPorDeportistas] CHECK CONSTRAINT [FK_AmigosPorDeportistas_Deportista]
GO
ALTER TABLE [dbo].[AmigosPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_AmigosPorDeportistas_Deportista1] FOREIGN KEY([idAmigo])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[AmigosPorDeportistas] CHECK CONSTRAINT [FK_AmigosPorDeportistas_Deportista1]
GO
ALTER TABLE [dbo].[Barrio]  WITH CHECK ADD  CONSTRAINT [FK_Barrio_Zona] FOREIGN KEY([idZona])
REFERENCES [dbo].[Zona] ([id])
GO
ALTER TABLE [dbo].[Barrio] CHECK CONSTRAINT [FK_Barrio_Zona]
GO
ALTER TABLE [dbo].[Cancha]  WITH CHECK ADD  CONSTRAINT [FK_Cancha_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[Cancha] CHECK CONSTRAINT [FK_Cancha_Deporte]
GO
ALTER TABLE [dbo].[Cancha]  WITH CHECK ADD  CONSTRAINT [FK_Cancha_TipoCancha] FOREIGN KEY([idTipoCancha])
REFERENCES [dbo].[TipoCancha] ([id])
GO
ALTER TABLE [dbo].[Cancha] CHECK CONSTRAINT [FK_Cancha_TipoCancha]
GO
ALTER TABLE [dbo].[CanchasPorComplejos]  WITH CHECK ADD  CONSTRAINT [FK_CanchasPorComplejos_Cancha] FOREIGN KEY([idCancha])
REFERENCES [dbo].[Cancha] ([id])
GO
ALTER TABLE [dbo].[CanchasPorComplejos] CHECK CONSTRAINT [FK_CanchasPorComplejos_Cancha]
GO
ALTER TABLE [dbo].[CanchasPorComplejos]  WITH CHECK ADD  CONSTRAINT [FK_CanchasPorComplejos_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[CanchasPorComplejos] CHECK CONSTRAINT [FK_CanchasPorComplejos_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[CanchasPorHorarios]  WITH CHECK ADD  CONSTRAINT [FK_CanchasPorHorarios_Cancha] FOREIGN KEY([idCancha])
REFERENCES [dbo].[Cancha] ([id])
GO
ALTER TABLE [dbo].[CanchasPorHorarios] CHECK CONSTRAINT [FK_CanchasPorHorarios_Cancha]
GO
ALTER TABLE [dbo].[CanchasPorHorarios]  WITH CHECK ADD  CONSTRAINT [FK_CanchasPorHorarios_Horario] FOREIGN KEY([idHorario])
REFERENCES [dbo].[Horario] ([id])
GO
ALTER TABLE [dbo].[CanchasPorHorarios] CHECK CONSTRAINT [FK_CanchasPorHorarios_Horario]
GO
ALTER TABLE [dbo].[ComplejoDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_ComplejoDeportivo_Barrio] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrio] ([id])
GO
ALTER TABLE [dbo].[ComplejoDeportivo] CHECK CONSTRAINT [FK_ComplejoDeportivo_Barrio]
GO
ALTER TABLE [dbo].[ComplejoDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_ComplejoDeportivo_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[ComplejoDeportivo] CHECK CONSTRAINT [FK_ComplejoDeportivo_Estado]
GO
ALTER TABLE [dbo].[ComplejoDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_ComplejoDeportivo_Responsable] FOREIGN KEY([idResponsable])
REFERENCES [dbo].[Responsable] ([id])
GO
ALTER TABLE [dbo].[ComplejoDeportivo] CHECK CONSTRAINT [FK_ComplejoDeportivo_Responsable]
GO
ALTER TABLE [dbo].[ComplejoDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_ComplejoDeportivo_TipoComplejo] FOREIGN KEY([idTipoComplejo])
REFERENCES [dbo].[TipoComplejo] ([id])
GO
ALTER TABLE [dbo].[ComplejoDeportivo] CHECK CONSTRAINT [FK_ComplejoDeportivo_TipoComplejo]
GO
ALTER TABLE [dbo].[ComplejoDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_ComplejoDeportivo_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[ComplejoDeportivo] CHECK CONSTRAINT [FK_ComplejoDeportivo_Usuario]
GO
ALTER TABLE [dbo].[DeportesPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_DeportesPorDeportistas_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[DeportesPorDeportistas] CHECK CONSTRAINT [FK_DeportesPorDeportistas_Deporte]
GO
ALTER TABLE [dbo].[DeportesPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_DeportesPorDeportistas_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[DeportesPorDeportistas] CHECK CONSTRAINT [FK_DeportesPorDeportistas_Deportista]
GO
ALTER TABLE [dbo].[Deportista]  WITH CHECK ADD  CONSTRAINT [FK_Deportista_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Deportista] CHECK CONSTRAINT [FK_Deportista_Estado]
GO
ALTER TABLE [dbo].[Deportista]  WITH CHECK ADD  CONSTRAINT [FK_Deportista_TipoDocumento] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Deportista] CHECK CONSTRAINT [FK_Deportista_TipoDocumento]
GO
ALTER TABLE [dbo].[Deportista]  WITH CHECK ADD  CONSTRAINT [FK_Deportista_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Deportista] CHECK CONSTRAINT [FK_Deportista_Usuario]
GO
ALTER TABLE [dbo].[DeportistasPorEquipos]  WITH CHECK ADD  CONSTRAINT [FK_DeportistasPorEquipo_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[DeportistasPorEquipos] CHECK CONSTRAINT [FK_DeportistasPorEquipo_Deportista]
GO
ALTER TABLE [dbo].[DeportistasPorEquipos]  WITH CHECK ADD  CONSTRAINT [FK_DeportistasPorEquipo_Equipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipo] ([id])
GO
ALTER TABLE [dbo].[DeportistasPorEquipos] CHECK CONSTRAINT [FK_DeportistasPorEquipo_Equipo]
GO
ALTER TABLE [dbo].[DetalleValoracionComplejo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleValoracionComplejo_TipoValoracionComplejo] FOREIGN KEY([idTipoValoracion])
REFERENCES [dbo].[TipoValoracionComplejo] ([id])
GO
ALTER TABLE [dbo].[DetalleValoracionComplejo] CHECK CONSTRAINT [FK_DetalleValoracionComplejo_TipoValoracionComplejo]
GO
ALTER TABLE [dbo].[DetalleValoracionComplejo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleValoracionComplejo_ValoracionComplejo] FOREIGN KEY([idValoracion])
REFERENCES [dbo].[ValoracionComplejo] ([id])
GO
ALTER TABLE [dbo].[DetalleValoracionComplejo] CHECK CONSTRAINT [FK_DetalleValoracionComplejo_ValoracionComplejo]
GO
ALTER TABLE [dbo].[DetalleValoracionDeportista]  WITH CHECK ADD  CONSTRAINT [FK_DetalleValoracion_TipoValoracion] FOREIGN KEY([idTipoValoracion])
REFERENCES [dbo].[TipoValoracionDeportista] ([id])
GO
ALTER TABLE [dbo].[DetalleValoracionDeportista] CHECK CONSTRAINT [FK_DetalleValoracion_TipoValoracion]
GO
ALTER TABLE [dbo].[DetalleValoracionDeportista]  WITH CHECK ADD  CONSTRAINT [FK_DetalleValoracion_Valoracion] FOREIGN KEY([idValoracion])
REFERENCES [dbo].[ValoracionDeportista] ([id])
GO
ALTER TABLE [dbo].[DetalleValoracionDeportista] CHECK CONSTRAINT [FK_DetalleValoracion_Valoracion]
GO
ALTER TABLE [dbo].[EncuentroDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_EncuentroDeportivo_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[EncuentroDeportivo] CHECK CONSTRAINT [FK_EncuentroDeportivo_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[EncuentroDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_EncuentroDeportivo_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[EncuentroDeportivo] CHECK CONSTRAINT [FK_EncuentroDeportivo_Deporte]
GO
ALTER TABLE [dbo].[EncuentroDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_EncuentroDeportivo_Deportista] FOREIGN KEY([idAdmin])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[EncuentroDeportivo] CHECK CONSTRAINT [FK_EncuentroDeportivo_Deportista]
GO
ALTER TABLE [dbo].[EncuentroDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_EncuentroDeportivo_Equipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipo] ([id])
GO
ALTER TABLE [dbo].[EncuentroDeportivo] CHECK CONSTRAINT [FK_EncuentroDeportivo_Equipo]
GO
ALTER TABLE [dbo].[EncuentroDeportivo]  WITH CHECK ADD  CONSTRAINT [FK_EncuentroDeportivo_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[EncuentroDeportivo] CHECK CONSTRAINT [FK_EncuentroDeportivo_Estado]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_Estado]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Estado]
GO
ALTER TABLE [dbo].[InvitacionEncuentro]  WITH CHECK ADD  CONSTRAINT [FK_InvitacionEncuentro_Deportista] FOREIGN KEY([idInvitado])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[InvitacionEncuentro] CHECK CONSTRAINT [FK_InvitacionEncuentro_Deportista]
GO
ALTER TABLE [dbo].[InvitacionEncuentro]  WITH CHECK ADD  CONSTRAINT [FK_InvitacionEncuentro_EncuentroDeportivo] FOREIGN KEY([idEncuentro])
REFERENCES [dbo].[EncuentroDeportivo] ([id])
GO
ALTER TABLE [dbo].[InvitacionEncuentro] CHECK CONSTRAINT [FK_InvitacionEncuentro_EncuentroDeportivo]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([id])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_EncuentroDeportivo] FOREIGN KEY([idEncuentro])
REFERENCES [dbo].[EncuentroDeportivo] ([id])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_EncuentroDeportivo]
GO
ALTER TABLE [dbo].[Mensaje]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Mensaje] CHECK CONSTRAINT [FK_Mensaje_Usuario]
GO
ALTER TABLE [dbo].[PermisosPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_PermisosPorRoles_Permiso] FOREIGN KEY([idPermiso])
REFERENCES [dbo].[Permiso] ([id])
GO
ALTER TABLE [dbo].[PermisosPorRoles] CHECK CONSTRAINT [FK_PermisosPorRoles_Permiso]
GO
ALTER TABLE [dbo].[PermisosPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_PermisosPorRoles_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[PermisosPorRoles] CHECK CONSTRAINT [FK_PermisosPorRoles_Rol]
GO
ALTER TABLE [dbo].[Posicion]  WITH CHECK ADD  CONSTRAINT [FK_Posicion_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[Posicion] CHECK CONSTRAINT [FK_Posicion_Deporte]
GO
ALTER TABLE [dbo].[PosicionesPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_PosicionesPorDeportistas_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[PosicionesPorDeportistas] CHECK CONSTRAINT [FK_PosicionesPorDeportistas_Deportista]
GO
ALTER TABLE [dbo].[PosicionesPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_PosicionesPorDeportistas_Posicion] FOREIGN KEY([idPosicion])
REFERENCES [dbo].[Posicion] ([id])
GO
ALTER TABLE [dbo].[PosicionesPorDeportistas] CHECK CONSTRAINT [FK_PosicionesPorDeportistas_Posicion]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([id])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Estado]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Sponsor] FOREIGN KEY([idSponsor])
REFERENCES [dbo].[Sponsor] ([id])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Sponsor]
GO
ALTER TABLE [dbo].[Responsable]  WITH CHECK ADD  CONSTRAINT [FK_Responsable_TipoDocumento] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Responsable] CHECK CONSTRAINT [FK_Responsable_TipoDocumento]
GO
ALTER TABLE [dbo].[RolesPorUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesPorUsuarios_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[RolesPorUsuarios] CHECK CONSTRAINT [FK_RolesPorUsuarios_Rol]
GO
ALTER TABLE [dbo].[RolesPorUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_RolesPorUsuarios_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[RolesPorUsuarios] CHECK CONSTRAINT [FK_RolesPorUsuarios_Usuario]
GO
ALTER TABLE [dbo].[ServiciosPorComplejos]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosPorComplejos_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[ServiciosPorComplejos] CHECK CONSTRAINT [FK_ServiciosPorComplejos_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[ServiciosPorComplejos]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosPorComplejos_ServicioExtra] FOREIGN KEY([idServicio])
REFERENCES [dbo].[ServicioExtra] ([id])
GO
ALTER TABLE [dbo].[ServiciosPorComplejos] CHECK CONSTRAINT [FK_ServiciosPorComplejos_ServicioExtra]
GO
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK_Sesion_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK_Sesion_Estado]
GO
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK_Sesion_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK_Sesion_Usuario]
GO
ALTER TABLE [dbo].[Sponsor]  WITH CHECK ADD  CONSTRAINT [FK_Sponsor_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([id])
GO
ALTER TABLE [dbo].[Sponsor] CHECK CONSTRAINT [FK_Sponsor_Estado]
GO
ALTER TABLE [dbo].[Sponsor]  WITH CHECK ADD  CONSTRAINT [FK_Sponsor_Responsable] FOREIGN KEY([idResponsable])
REFERENCES [dbo].[Responsable] ([id])
GO
ALTER TABLE [dbo].[Sponsor] CHECK CONSTRAINT [FK_Sponsor_Responsable]
GO
ALTER TABLE [dbo].[Sponsor]  WITH CHECK ADD  CONSTRAINT [FK_Sponsor_Rubro] FOREIGN KEY([idRubro])
REFERENCES [dbo].[Rubro] ([id])
GO
ALTER TABLE [dbo].[Sponsor] CHECK CONSTRAINT [FK_Sponsor_Rubro]
GO
ALTER TABLE [dbo].[TiposPorDeportes]  WITH CHECK ADD  CONSTRAINT [FK_TiposPorDeportes_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[TiposPorDeportes] CHECK CONSTRAINT [FK_TiposPorDeportes_Deporte]
GO
ALTER TABLE [dbo].[TiposPorDeportes]  WITH CHECK ADD  CONSTRAINT [FK_TiposPorDeportes_TipoDeporte] FOREIGN KEY([idTipoDeporte])
REFERENCES [dbo].[TipoDeporte] ([id])
GO
ALTER TABLE [dbo].[TiposPorDeportes] CHECK CONSTRAINT [FK_TiposPorDeportes_TipoDeporte]
GO
ALTER TABLE [dbo].[ValoracionComplejo]  WITH CHECK ADD  CONSTRAINT [FK_ValoracionComplejo_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[ValoracionComplejo] CHECK CONSTRAINT [FK_ValoracionComplejo_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[ValoracionDeportista]  WITH CHECK ADD  CONSTRAINT [FK_ValoracionDeportista_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[ValoracionDeportista] CHECK CONSTRAINT [FK_ValoracionDeportista_Deportista]
GO
ALTER TABLE [dbo].[Zona]  WITH CHECK ADD  CONSTRAINT [FK_Zona_Localidad] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([id])
GO
ALTER TABLE [dbo].[Zona] CHECK CONSTRAINT [FK_Zona_Localidad]
GO
ALTER TABLE [dbo].[ZonasPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_ZonasPorDeportistas_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[ZonasPorDeportistas] CHECK CONSTRAINT [FK_ZonasPorDeportistas_Deportista]
GO
ALTER TABLE [dbo].[ZonasPorDeportistas]  WITH CHECK ADD  CONSTRAINT [FK_ZonasPorDeportistas_Zona] FOREIGN KEY([idZona])
REFERENCES [dbo].[Zona] ([id])
GO
ALTER TABLE [dbo].[ZonasPorDeportistas] CHECK CONSTRAINT [FK_ZonasPorDeportistas_Zona]
GO
USE [master]
GO
ALTER DATABASE [HayEquipo] SET  READ_WRITE 
GO
