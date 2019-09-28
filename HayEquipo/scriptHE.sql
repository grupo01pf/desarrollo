USE [master]
GO
/****** Object:  Database [HayEquipo]    Script Date: 27/09/2019 18:37:06 ******/
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
ALTER DATABASE [HayEquipo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HayEquipo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HayEquipo] SET QUERY_STORE = OFF
GO
USE [HayEquipo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[AmigosPorDeportistas]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Barrio]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Cancha]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancha](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[idTipoCancha] [int] NULL,
	[idComplejo] [int] NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Cancha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CanchasPorHorarios]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[ComplejoDeportivo]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplejoDeportivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[deportes] [nvarchar](50) NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[idBarrio] [int] NULL,
	[nroTelefono] [int] NULL,
	[horaApertura] [time](0) NULL,
	[horaCierre] [time](0) NULL,
	[idResponsable] [int] NULL,
	[promedioEstrellas] [float] NULL,
	[idEstado] [int] NULL,
	[mapa] [nvarchar](max) NULL,
	[avatar] [image] NULL,
 CONSTRAINT [PK_ComplejoDeportivo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deporte]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deporte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[avatar] [image] NULL,
 CONSTRAINT [PK_Deporte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeportesPorDeportistas]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Deportista]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[DeportistasPorEquipos]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[EncuentroDeportivo]    Script Date: 27/09/2019 18:37:06 ******/
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
	[idComplejo] [int] NULL,
	[nombreLP] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[idEquipo] [int] NULL,
	[fechaInicioEncuentro] [smalldatetime] NULL,
	[fechaFinEncuentro] [smalldatetime] NULL,
	[idEstado] [int] NULL,
	[idUsuario] [int] NULL,
	[horaInicio] [time](0) NULL,
	[horaFin] [time](0) NULL,
	[tipoEncuentro] [nvarchar](50) NULL,
	[accesibilidad] [nvarchar](50) NULL,
	[clave] [nvarchar](50) NULL,
	[capacidad] [int] NULL,
 CONSTRAINT [PK_EncuentroDeportivo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[FotosComplejo]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [image] NULL,
	[idComplejo] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosDeportista]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosDeportista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [image] NULL,
	[idDeportista] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[InvitacionEncuentro]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Mensaje]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Permiso]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[PermisosPorRoles]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Posicion]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[PosicionesPorDeportistas]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Publicacion]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[ReseñaComplejo]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñaComplejo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reseña] [nvarchar](50) NULL,
	[idComplejoValorado] [int] NULL,
	[idUsuarioValorador] [int] NULL,
 CONSTRAINT [PK_ReseñaComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaReserva] [smalldatetime] NULL,
	[horaReserva] [time](0) NULL,
	[idEncuentroDeportivo] [int] NULL,
	[idEstado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsable]    Script Date: 27/09/2019 18:37:06 ******/
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
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Responsable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[RolesPorUsuarios]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Rubro]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[ServicioExtra]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioExtra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServicioExtra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosPorComplejos]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Sesion]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[Sponsor]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[TipoCancha]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCancha](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[idDeporte] [int] NULL,
	[capacidad] [int] NULL,
 CONSTRAINT [PK_TipoCancha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeporte]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[TiposPorDeportes]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[TipoValoracion]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValoracion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoValoracionComplejo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/09/2019 18:37:06 ******/
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
	[intentos] [int] NULL,
	[bloqueado] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosPorEncuentroDeportivo]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosPorEncuentroDeportivo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioEquipoA] [int] NULL,
	[idEncuentro] [int] NULL,
	[idUsuarioEquipoB] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoracion]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDeportistaValorado] [int] NULL,
	[idComplejoValorado] [int] NULL,
	[idUsuarioValorador] [int] NULL,
	[valoracion] [int] NULL,
	[idTipoValoracion] [int] NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zona]    Script Date: 27/09/2019 18:37:06 ******/
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
/****** Object:  Table [dbo].[ZonasPorDeportistas]    Script Date: 27/09/2019 18:37:06 ******/
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (28, N'GUIÑAZU SUD', 2)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (179, N'OÑA', 8)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (198, N'1º DE MAYO', 6)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (199, N'VILLA BUSTOS', 9)
GO
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (200, N'AMPLIACION 1º DE MAYO', 9)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (221, N'LA TOMA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (222, N'VILLA MAFEKIN', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (223, N'ALTOS DE SANTA ANA', 4)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (224, N'EL PUEBLITO', 4)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (252, N'ACHAVAL PEÑA', 5)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (300, N'AVENIDA', 5)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (301, N'VILLA QUISQUIZACATE', 1)
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (302, N'JOSE IGNACIO DIAZ 3A SECCION', 9)
GO
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (357, N'CABAÑA DEL PILAR', 8)
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
INSERT [dbo].[Barrio] ([id], [nombre], [idZona]) VALUES (374, N'GUIÑAZU', 2)
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
SET IDENTITY_INSERT [dbo].[Cancha] ON 

INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (5, N'cancha 1', NULL, 4, 2009, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (6, N'cancha 2', NULL, 4, 2009, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (7, N'cancha 3', NULL, 5, 2009, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (9, N'cancha 1', N'', 7, 2007, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (10, N'la de beach', N'cancha de beach volley con arena ultra fina', 7, 1, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (11, N'ewefwf', N'', 5, 2007, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (12, N'erreer', N'rereer', 2, 2007, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (14, N'grrggr', N'grgrgr', 9, 2007, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (15, N'rrr', N'rr', 2, 2005, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (16, N'gg', N'rrr', 4, 2007, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (17, N'rggr', N'weg', 4, 2005, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (19, N'tyty', N'ytytty', 4, 1, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (20, N'rer', N'geeggr', 6, 2019, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (21, N'eewd', N'ewewd', 1, 2014, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (22, N'33ed', N'dd', 11, 2014, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (23, N'cancha 1', N'sintetico', 1, 1, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (24, N'cancha 2', N'sintetico', 2, 1, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (25, N'cancha 3 ', N'natural', 3, 1, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (30, N'', N'', 10, 3, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (31, N'', N'', 1, 3, NULL)
INSERT [dbo].[Cancha] ([id], [nombre], [descripcion], [idTipoCancha], [idComplejo], [precio]) VALUES (32, N'', N'', 8, 3, NULL)
SET IDENTITY_INSERT [dbo].[Cancha] OFF
SET IDENTITY_INSERT [dbo].[ComplejoDeportivo] ON 

INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (1, N'Don Balon', N'complejo de calidad', N'volley tenis fútbol', N'Manuel Cardeñosa', 4400, 28, 15512470, NULL, NULL, 2, 0, 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3407.1313652399836!2d-64.2328915853812!3d-31.355353981424436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94329948826e54a9%3A0x29fe4035526e3574!2sComplejo%20Deportivo%20Don%20Balon!5e0!3m2!1ses-419!2sar!4v1568491717583!5m2!1ses-419!2sar', 0xFFD8FFE000104A46494600010100004800480000FFED009C50686F746F73686F7020332E30003842494D04040000000000801C02670014484473795167554C4E587172584242536E686A391C0228006246424D4430313030306162633033303030303633303530303030333030383030303062313038303030303334303930303030366430653030303063643132303030303763313330303030306231343030303039353134303030306365316130303030FFE2021C4943435F50524F46494C450001010000020C6C636D73021000006D6E74725247422058595A2007DC00010019000300290039616373704150504C0000000000000000000000000000000000000000000000000000F6D6000100000000D32D6C636D7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A64657363000000FC0000005E637072740000015C0000000B777470740000016800000014626B70740000017C000000147258595A00000190000000146758595A000001A4000000146258595A000001B80000001472545243000001CC0000004067545243000001CC0000004062545243000001CC0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004642000058595A20000000000000F6D6000100000000D32D58595A20000000000000031600000333000002A458595A200000000000006FA2000038F50000039058595A2000000000000062990000B785000018DA58595A2000000000000024A000000F840000B6CF63757276000000000000001A000000CB01C903630592086B0BF6103F15511B3421F1299032183B92460551775DED6B707A0589B19A7CAC69BF7DD3C3E930FFFFFFDB00430006040506050406060506070706080A100A0A09090A140E0F0C1017141818171416161A1D251F1A1B231C1616202C20232627292A29191F2D302D283025282928FFDB0043010707070A080A130A0A13281A161A2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828FFC000110800FA00FA03012200021101031101FFC4001C0001000203010101000000000000000000000607010508020403FFC40047100001040102030505030807060700000001000203040506110712211331415161142232718108429115172352A1B1C1D1162433435462722526538292F0557493A2C2E1F1FFC4001801010003010000000000000000000000000001020304FFC400221101010002030100020301010000000000000102110312213113320422511441FFDA000C03010002110311003F00EA9444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444280884AC737E28328B1CC9B8419458E658E641E91637F259404444044440444404444044440444404444044440444404444044440429BAD66A1CCD1C0E364BF94B0C82BC63AB9C7BCF90F3288B74D839C00DC9D82866ABE24E9BD385CCB579B35803FB183DF77E23B9529ACF89B9DD637CE2F4DC33D7A921E564710FD2CA3CC9F01E8BECC4F0332F6F1525BC85F8AB5F7379A38482EFF00A8EEB3ED6DF18DE5CB2F308D8E638FB60BDECC46218D6FDD7CEFEBF805A33C5FD73649756ACD0D3DC1954B87E3B28E55FCB7C36D424E4F130484FDC9E3E78E41E6D72BFF00406BDD37AA226C55A3829E400DDD5646B41FF94F885496D5276CBF6C952378C3ADEAB83ADD5616F94958B07EE5BFC371F5FBB5B9AC472B7C5F5DFD7F02A61ACB5B5636DF86D2B8C87339AEA1FF00A306283FCCF72A62FE9BC58C8496355EB0C4D5B6F939A6AF540908F30363B0537BCBE26CCA7EB76E88D2BC40D3BA9406D0BEC6CE7FB997DC77D37EFF00A296EE3CD729DCD054320D75BE1FE7A0CA3E31CE6AF69CB337E5B2DAE83E2D6574E5B18CD54C96C5563B91CE906D2C1F3F30AD33D7D5E72E53CC9D300ACAD23B5262598219975E81B8B2D0E360BC72807CD79C1EA8C3E76AB6CE22F4172BBA4EC8C913B71CCB49EB66F771D7D1370BF373B95A5C4EC003BA8EE275B69DCBDF969633295ECDB8412F858EDDC36EFE9E8824C9BAF11BC48D6B98776947901A493B01DE83DEEB1B851BC46B5D3D99C94B431994AD66E441C5F131FD5BCBDEB5F2F14346C32C91C99EA6D7C6E2C734BFA870EF0826A9BA8547C51D17239AD1A868EE7CE40A5546F55BB5993D39E29E17FC3246EE66941F5A6E1787B9AC6973880D1D492760143B31C4CD2388B0EAF773757B769D8B18EE62104D116834F6ADC16A01FEC6C9D6B2477B1AFF00787D16F5AE0E1B841E9111011110111101616579E6DB7EA83E2CCE46AE231F3DEBD288ABC2D2E7B8FF00DF7AE5BD4F9ECB714357D7A559DD8D77C9C956073BDD60F173BCCA94F1FB554B93CC45A6F1AE2F86223B70DEF7C87E16FAF87D54231F46D690E216262B6E689E096373B97C39B75CF9E56F8E3E5CFB5EB3E3A3F87BA1717A3E83595A36CB75EDFD2D970DDCE3E43C87A298ECBC47DC0AFD3C56EEA9248D6E6F0F433741F53295A3B103C6DCAF6EFF0082E72E26F0BCE9BBB467C05A90C776C36BC5138FBEC7B8F4D8F88EABA7942B884D69BFA7B9834916CB98D3E2EE5E9F5DD573C7B457931994735F1035037011C9A3F4CCAF86B4000C8DA6BB692D4DE20BBF542D069DE1EEA3D414BDB31F458CA8EE8D967786079F1DB73BECB4767F4BA826F6C3BB5F74F6A4F882F5D99A7F05527BF2F6B1B64A9563645562FB823E5E840F51D55B5AF1693CD38FF2F83CEE93CD5786DC1629E44EDD83E03B979DFA7211DEAF69B4ECFABB4B63A2D515D95F58961E59206EEE31EDD0CBEA55B9A83091CD0406956ABED503B781F2B038C3BF7B9BBF715F98871FA47037729664123A263A49AC3CEE5C7CB7F0EBB04D4BF4B8CB1CCFC4A74BA574AE3B45F69CD6E490DDC8063BA37AFB8DFC002B1C02D46DC4EA67E1EC49C94B28035849E8D987C27EBD5432EDE9356EB27DBC84ED83F28DA05D2C87610C7BF4DC9F00DFDCBD6AFC7D5C0EA99E1C25F8EDD585ED92B5989E1DBFD478EE0A4F269126BC77257B3ED58C7BDDEEBC31CD78F270EF5C2B1E4EDE0F57CF93C73FB3B75AE3DE3D7DF3D0FCD75B70D3533351E99AD910E05D6A12C9DBD3DC9DA36774F5D895C7B9704E6F20D03DE36A4D879FBC516BF1D9FC39D5F5354E06B642A7BB1CBEE491EFFD8CA3BD87D3BF6508FB43F113F22635DA7B0D37FB52DB3F4CE69EB0C7FCCAA2F873ADF21A132D666AEC74B0CD196CB59FDC1DE0EDBCC28E65EFDCCCE52DE4AEBDF3D999E659243EBDC3D078221657D99DAD1C41B7B78E3E53B9F1EEEA7D556F978BB5D497E26005F25C7B1BBF997EC1595F6676BBFA7F68EC794D097AF8782855AAB1C3A9ED4F29E60CBEE791DDD03F7434DBE63851AA3178E96DC9055B11C4CED256432733D8DDB7E6D8F5EE5F7705750E434E6AAAB5BB777E4CBD276335771E809EE7FCC15656538ADA720C5DD7626B589F276A2E4DDF1EC19EE86FC5B751D1547A3F1D6327A92956AA0BE4E67484B7C03413BFEE44A7FC6BD7F6F2792974FE2EC491636A9ECA77B1DB3AC3877827C94234EE81CCE6AA36D51A51C559FD193587860791E037EA7E6B5AC0CB3A8436F3B6865B7B4CE3DFB17F55D6382C255B590B06E46D921AE1B1D5888F7191EDD0B47775F341CAD95C465F4A646316E2968DA6FBF14CC3DE078B48E8574170875FCBA83152479177364A972F6C47F7B19EE7FCC75DFE4BF5E3D63B1CDE1E4F23D8D64D0C8C35FF00CAE2E0081F427A2A8B81CF7B7594CDDCF66FA32F69B796DDE54A5D64D21CD05A77DC742B23B96BB4ECA67C2D491DBEEE603D56CB64044440444405ABD49916623057AF4A406C1139E3E7B74FDAB68AB3E3FE44D3D052C2C3B1B52362FA77FF00055CEEA2B9E5D71B6AADE0C625FAA75FCF97BFBC8DAEE365DBF717B8FBA3E857EFF686AFEC7AE68DD8C72F690B0EFEAD77FF006A6FF67FAD5F1BA1AD64ED3991B6694BDD23BA00D6F4EA7E8AB7E29EA83AF35356A987ACF963AE5CC80B1BBBA6DF6DCFCBA2C6FEBEB8EEB0E3F7ED74BE06D8BB86A3641DC4D0B2407CF71BAFBF9B7F02B9629EA6E206918D95E48ADB2BC2391B1CD073B4347700762149313C7AB91ED1E5315148477BE17EC4FD0ABCE4D4F5BCE6C64F57EDBB705481F359919144C05CE7B8EC005CEFC52E29C196CAE3E1D3D0BE68F1F69B389C7F7AE69F85A3E8B45A83526A7E27E5DB8FC7C32B69F37BB5A3E8D68F37BBBBE8ADEE1BF0AB1FA6A38EE645ACB9953D79DC3DC8FD1A3CFD53772F88B9E59FEBF1CDDC49C1C705CFCBF886BA4C1E44F6A1ED1D6093EF46EF23BA91689E36E734DE322A16AB41928616F243239DCAF6B477027AEEAF5D5FA05DFD6AF697F6786C4E3FAC509D81D5ADFF00A9A7A077A8EAB9FB39534BD3C8C95F39A5F3187B8D3B3E2AB373467D5BCC7BBCB657B7AC5FB75FAF8757F15352EA5CC52BFED4683A9BB9AB435491CAEF127CCF7294F15388395CB681C46232B5BD8F257769ADB1BD39A203DD24787377EDE8B4983D45A5B0794AB262B494D6CB1FBBE5BD2F68FDBCDACDC8DFE6B7594871FADF376B292E8FD4F62CD8EF2D90358D03B9ADDDC06C3C144CE54CCE5F509D2BC3ECE6A9C6497F1ACACCA6D93B2ED2C49C9CCEF21D3A85F466F8699FC2E32CDFB068CB1566F3CAD826E7786FEB72EDDCAC3D13ADB114F5150C15EC5498DC0D4698A365820BDB31277749F3276538E2F9A7A746275053A914D55DCD56D451340EDE278EEF2F04EDE6CEF2CDAAEFB396A86E3750D8C15A77F55C8C6648773D1B2B5BFBC8DD5696411AB24F3F6F777F9739576683E1D69CCDE3EAE730F8ECC41CB29733FAC8DDA5A7FD4B72EE0D611D7BDB1D8ECA999D299C9EDC7C5BEFFACAD3D8B4BB887F1C74234E51D9BD3703A46C92B61BB5D8DF8253DCE1E87F92FAB21A2EA695E1064E19FB397352CF0BEDBB6FECB7702180FCB6DD5ED86C6DB919939AC40DAF24EEFD135DB1D87813EBDCB5B9FD1B5EDE8F9B156E39ED9B128967744FD9CE76FBEFB9529D293FB3CFBBAEA7000005093A7E0A057E3336A2B708E9DADC7337F2DDFB7F15D15A3F42D6D27957E431B8BBEF9DD1BA1FD24CD2394EDEAB55270A318FC81B871B923219BB7DBB71D1DCDCDE7DDBA25161C24A51CE629F3D61EF6805ED86A6FB6E01DB7E653FD09A2DB84907E42A72401E47B45DB7D6591BFAA07DD0A77A66AD889F725B55FB032B872B49DCEC001D7F05BE03A20E48E2FE8DB1A635259B11C44E26E3DD2C7206FBAD71EA5A7D77EE5B1D1FC62CCE071F1D2B55A2C847137963739DCB2347913D775D279AC3C195AB2413C71C91BC6CE8E56F331DF31FC554F99E0FE19D317C58FBF0827E1AD30734FD1C7A20A8B5EEBCCB6B39E2FCA2590D589DCD1D78F7D81EEDCF9953CE16699B38BA124F6232CCAE5DA2282123DE8A1F17BBCB7F2528D3DC37AB8D99B262F09B5869DDB6B212768587CC3772158D81D3ECC6C8FB33C8EB37A4F8E67F7FC879041B8A55C55A9140CEE8DA1ABF74440444404444054D7DA51C7FA398C603D0DA1BFF00D255CAAA7FB45543368D82C346E60B2D27E5B10A9C9FAD65CD3785532FD4594C969DC6694C5C6F6C41C41645D5D3B8B89EBE9D55E9C29E1DD7D2B4D972F31B2E62568E6777885BFAADFE6B43F67BC1635D889732181F913218CB9DFDD8F20AE66854E2C7CDD67C385FDABF19218E46F2C91B1ECFD578DC2896B3D0D87CCE22E06E3ABB2E189C22958CE52D3F45355876DB6CB5B256F7197EC736FD9E72871FAB2EE22C00CF6966E3A75E769FFF005748B4740B9675AC3268BE2F7B6C3BC50BA71618478B5C7DEDBE8AF66711F4A1634BB3559A760483BF4FD8B2E3CA63E563C394C7FAD49B297AAE3284D72FCEC82AC0D2F92479D9AD0B99F885C4ED19A8734D9E5C05DC9881BD9B2532F64D23CF6DB73F8A90FDA3B52C196D098FFC8969B671F3DBE49A48C9D8EC3B8FE2A94D078AD3F97CABEBEA7CCBB135F9778A46B0B839DE5E8B5BEB6F328B5349716B43635CC8E4D26EA2CFF8CD0263F811BAB2F53714F0B84D174F51626B9C963EC4E200D8488F94EC4F9778DBB954B6F81F0646112E91D514EFB4FF00772100EDF4DCAD8717F1D5B13C1EC5E328B0B2B54C83600E70EB23C35DCCF3F549A84923E6C9E470DC53AB9CBD89C04D4F394E26C81C64DC4DB9DB6236EF4D0D9639AD2D97D3FAB209ADD2C5C5ED6C6871648C2DE9C9BFD57C3F67A85F14BA85EEDC6F144403DFF1FC415C7AEF4EE329D0CEE6ABB4477ECE35CC918DE9DA01B7BC7D7AAADC7776A5C377689F09388B878AED0D3386C2DBAB5EC48E2D749387F2120BBC97DD99E3AD5C6E62ED13849E535E431178980E6DBD365527073A711703D7705E4EFF00F295A9D67D3576676FF14FFDEACD1740FB41D4240380B3EA44C0FF000532D11C52C1EAB9CD684BEA5E3DD5E63D5DFE93E2AAB8384356DB2186B64AD1B5242C97FB106305C371B9DFB955D723B780CE4ACE731DEA13F4783F7DA7A11E89B36EE38656CCCE661E9FC57BFC546748E48DED9DD4367AF1D8DBD5C083FB949877EEA52CA22202144418F1594440444404444044582ED81250654038CB771D0688BB064656B5F337685A0EE5CFDFC02DEEB2D57474AE25F72F3B7790445103EF487C82E7BA95B3DC53D58659496C2D3EF387F670337EE1E6565C9979A9F5CFCDC9A9D67D493ECE59AF67C8DFC3CEE004E04D10F370E87F605D00DEE5CB3AC30B67871ADAA58C7991D0B7965AEF77DFFD6693EA7753AC6F1DEB7BA32589963F3742FE7FD9B055C33E93AE4CF8B96613AE7F57695F35FB5153AB2D8B0F11C3134B9EE3DC0283E378B9A52F6CD75D75671F09D9B28171C35EC390A91E130561B34328E6B12C477E61E0D0B4CB39278DF2E5926E22399B3778A1C4211526F2C0E718E1247F6710EF71F9A9A9E0157FFC5E4FFD36FF00252BE0A68C1A7703EDB763032571A1CEDC758D9E0D56501D1531E397DAA63C5B9BCBEA9EABC1BAD574E647117724FB18FB5B3C0700D30483B9EDFC7B95239FE1367F1D7A6AF4BB2C8B5BB8037E4908FF0049EFFA2BB3ED3192CA43A3E1A189AF3BE3B12FF599A1DF789A3C3A75EBFC150585E22EAFC7C6CAD4F33398DBB86B67687728F9F7AD74DA4D78D2361CD698CAB1A197B15908FE169DE377CF6F10ADED5FA966D5DC19A16724C8FDBEA640456391A0071E576CFD874DCAAFF319BCC6A7B914B97B12E42E01CB186B3BBE4029E62E3C252D272E8CCCDC6C39DC811681DF76567FF76D79F02412146CDC67811FA4BB9C85BEF4CE818E6B47DE01DB9D9581C43CB4D2D8D42D7B1F163A9628C46578D83A6791EEB7CCFBAA817B32DA5F31CC4CD472101E9233C7E47B882BF5CDEAACEE7A36C395C9D9B71B3A861EEDFD40EF533D4B71C1C69771230418D73B67B8FF00ED3D569F590FF7B735FF009A79F9F5563F05F4F4F8BCDD6CCE4627473C84474AB9F8CB4F7C8E1E036DD56FAD1CD6EAECD75DB6B2F1BF877A09BC3C66CED6C736AD1A18F8A511362EDC73170006DCC7AECA078FA590D4D9C10C41F62DDB90992423A0DCF579F21E2ADCC9F0BB1D7B4FCBF90EBCB164A1AB1D96C85FCCD9891B96EDB74557E8ED473E91D42DB4E80399B982D5678F899F79BE847541D49A0E16BE49E787AD586365589DFAC183A9FC4A988F051ED1F92A36F0F5A4C639AEA53379A070F1F307D429082A52CA26E880888808888088880888830E3B78A8EEB4D53434BE224B7764DE42368A21F13DDE002CEB7D514B4AE29D72EB8179044510F89EEF45CFF56A6738A3AA5D2CA5C2269F7DFF0072067901E6B3E4CF5E461CBCBD7FAE3F5E2A56CE714B54BA495C5B134FBEF3F040DF21EABA2F4BE9EA3A6F15151C744D646DF89DE2F3E65634C6028E9CC5C7471F10646D1EF3B6EAF3E64ADCEE3C546186BDA9E2E3EB3797D45388BA4E1D598092A3B665A8FDF824FD577F22B9BF051E3F0FA825C76B0C739F0737672104B5F09F070DBBC2EB48ECD79A69228E68DF233A39A0EE5BF3507E26F0F6AEAEA9DBD6E5AF9589BB326DBE3FF2B947261DBD8AF37176FED8A2CFE0CE072B519670D939D9148DE6611B3DAE07C55659FC0D8E1EEB0A42DC71DB8627B6766EDF764683D42DA69FD4FA8F86D95763B210486AF36EEAD2FC3F36394EF5764305C4DD2AE18D9E36666A832C30C8795FCDE2DF5DD52EAFEBF58658E194D4BEAD5C1E4ABE5B135AFD4707413C61ED3E9E456C41E8A82E00EAA755B7269BBAF2D6BF7757E63F0B87C4CFFBF257E8EE5BE194CA3AF8B3EF8EDAACAB31DCC0DC9D95DEE1EE932F26FF00CD579ABF0FA6B1D8DB9937FE46B0E898481D9339DEEF0076EFEAB5BC7C87DA735A7ABF3B9A2573D84B4EDB6FB2AEACE997B31735B8ACBE5EC2E9AB244E3B92C0EE5E7FC567972D96C8C33FE45C6DC61A3599AD5D909EB53B58CD3D51ADE6926821646F0093B35AEDB7FC14CE0E12E8BC45396DE5B3CFB9CA0C92BCCE3779F1EE3B950D7613170B72ADB16EF7698F0D2EECB601DCC3700745F1653154A9632B48E96FC93CF0B6607BE26F378159CE4BAF58CE6B67AFDA4CF5CCA6762C56988A1FC94488A08B22D1335ADF17EEFDF97CD5C78BD298BAB0C2EF6CC1456401CF2C51C7BF37A792A7AEE9EA318B9056B36BDB6B566597F30DA37B480EE5042F8352E2EA62EC3AA569AFC971A5A0BE42446491DC3F156C792CF57C39B2C67AE99C34184C6BDD28C8D69ADBBA999F334B87EDEE5A1BBA6F0366D493BECE0CBA479712F8E225C4F99546E4B4B36B65B0D523BD2C915DD992BC3CEF149BECE6FD0EEB32698AB24F032ADABF1C6EBDEC727B4020F973355FF2DBFF008D27F22D747E18D0C7BE67CF96A52BE50D039646B5AD0074006EB4992D3DA7EE5D96C9B3842F90EEE2F644493E7F3543374ED2B85871F76EB61F6A3564136E0F306B9C1C3FE9FDABE787098D8E0A1F957256E09AF17889CC27923E5716EEF3F31BA8FCB4FF00A2BA2F1B52A6360656A59AC656AAC7737631163003E3DDE6A5B572746CCAD8A1BB5A5908E8D64AD24FD015C838AD3DEDF83C9DD371ED96B388AD1B5C48B05BF11FDA17EDC2A9A466BBC63A396404B88279CF71F4533937569CDBB23B1810B2BC30FBA37EABDAD5D02222022220222202C1F1D96536082B0E24F0EED6ACCED4BD05F6C30B19D9C91BC6FB0F36FAA9AE97C0D1D3B8A8A963A20C8DA06EEDBABCF995B9236EE5E4F4DD57AC97B2938E4CBB33DDBAA938C3C4C8F0104B89C2C8D7E51EDFD2483A8801FF00E4BD717B896CC0C3262F0D235F93737F4926FB8807AFAFA285F09B86D367AC8CF6A46C9EC8E776914526FCD3BBF59DE9FBD532CEDBA8CF3CEE57AC6CB801A572CDCACDA9F2334D1C3330B58C793CD393F79DE9E4AF91DCB10C4C8A2632360631A000D1DC005EC8D80DBA7CD5E63D66A35C31EB34D36A2D3B8BD4350D6CAD68E767DD711B399F22A97D57C19B544496F01906BE266EEECE677239A3C83BC7EBB2BF26919146E7CAF0C6346EE738EC005CFBC54E20CFA86DBB07A74C869F3766F7C7F15877EAB7D167CBD64F5873F4D76BF557D696CD4C9C72D67BBDB21937639BEF12E1FBD58B1719355D7D99669C0F23A1DE1734FEE53DE13F0D61C142DC966626CB9391BBB1846ED84790F5564BB194651BCB4EB3CF9BA269FE0AB871E519F0F0678CFD9CBF9CD757F546531D6B2F045136949CED6B1A4120F7F7FC967FA4F0C36629626C8E60B92D891AFEE7C4F27A7E0574467F45E13350B19668C2C2CF85D1B4348FC168CF0A74E9EF85C7EAA2F165BDA2FF001F3B96F6A27239AA93D9D44F858F6C7906B3B16F4F7761E2BCE572D52EE1E9C2CC8DB8DF040C89D5790764E236F1DD5EFF009A8D39FF0005DF8A7E69F4E1EF81DF8A4E1CA2B3F8DC9FEA90CAEAD6DFAF769C924DEC7243136101A016BD806E0F5EE3B7ED5F1E4351B723A962B37269E5C547235ED849040D87403EAAFAFCD369BFF80EFC563F349A6BFC3953F8B25BFE6E4FF5473356D5B32452DDA8C86587202E34D76EDB8FBDBFAF53B2F72EA8A2CB103FDB2EDFE5BE2D83334030B37DF66F5EF2AEE3C25D344EFECEEFC4AC1E126993DF58A9FC792D383927FEA8976AE8EE49465C94B33A6A9664919B6DB3E27348DBE6091FB57CA32583BF571CDCB3AD31D48C9BC31B4113B5CF2E037DFA77ECBA07F347A63FC3158FCD1698FF000C7F14FC553F8725098CD5F4B1CDC5C1150864A90768E98BDBBBC17F43CBF40D5F870CFB2FCE050F677130F6A7937E876F01F35D027843A60F7D677E2BEAC670BF4FE32FC576A40E64F11DDAE054CE3B138F0E52CA9D33E10BD2F0DE83D02F6B67508888088880888809BA1EE5E5C7608324AA9F8B9C498F070C98BC348D7E4DE367C80F48079FCD7AE2CF11D984825C661A46BF24E6ED2483A8847F3510E15F0E66CDDA6E7351B6434CBBB48A297E299DDFCCEF31E3D563965DAF5C5CD9F25CAF5C1F9F0A38713672C479ED4AD79A9CDCF1C727C539FD677A2E868E26471B591B4358D1B0006C005E628C471B58C6B435BD1AD1D001E4BF5D9698E3D635C38E6301D06CBF39E46C5139F210D6346EE24F4016647B636973DC1AD037249D8051DD6D8A9753E94B7471B7044F9DBEECAC76E0FA1DBC14DBFE2D95D4F14E714F88563505B384D3C64351CE11B9D1FC539F21E9BF8A9B709B86F169F863C9E558D9328F6FB8D3D442D3E03D7D57EDC32E1A45A65DEDF9431D9CA1E81CD1EE463FCBBF8AB2802B3C31BBDD63C5C572BDB9190D2077AC80B28B5741B2C6CB2881B26C11103609B04440D9364440D826C8881B26C88831B792CA220222202222022220C78285F15B3392C26979A7C3C2F7CEE706191839BB207EF6CA6AB0E6870D88047AA8B37348CA6E694070B78753666D3737A8E378ADCDCF1C32FC533BF59DE8AFA898D606B1AD0D681B0681B01E8BF50001B00005955C7098A9C7C7308C74D916515DA691CD7985B39ED33771D46C1AD6266FBAF07CBC0FA15ADE15E97BBA534E1A391B86D4CE90BFBC90C07EE82A6A8A348EBEED8DB642B28A522222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220FFFD9)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2, N'Sol de Mayo', N'campito lindo', NULL, N'Sol de Mayo', 163, 2, 14876161, NULL, NULL, 2, 2.5, 1, N'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13618.360647105394!2d-64.212691!3d-31.425416!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd314d4eb7c1275a3!2sComplejo%20Sol%20de%20Mayo!5e0!3m2!1ses-419!2sar!4v1568661089176!5m2!1ses-419!2sar', 0xFFD8FFE000104A46494600010100004800480000FFDB004300080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232FFC000110800FA00FA03012200021101031101FFC4001C0001000105010100000000000000000000000701040506080203FFC4004D100001030202030A070E030705010000000100020304050611122131071335415161718191B2142252727374D108172334375355629293A1B1B3C11532424344546382E1F016242533A2A3FFC4001A010100030101010000000000000000000000010304050206FFC4003111000201030205020503040300000000000001020304112131051213323351712241536181A1C1F0141524D15291E1FFDA000C03010002110311003F009FD111004444011509C82F3BE33CA6F6A03DA2F1BE37CA6F6A6F8CF29BDA80F68BC6F8DF29BDA9BE37CA6F6A03DA2F1BE33CA6F6A6F8DF29BDA80F68BC6F8CF29BDA9BE37CA6F6A03DA2F1BE37CA6F6A6F8CF29BDA80F68BC6F8DF29BDA9BE33CA6F6A03DA2F1BE33CA6F6A6F8CF29BDA80F68BC6F8CF29BDA9BE37CA6F6A03DA2F1BE37CA6F6A6F8CF29BDA80F68BC6F8DF29BDA9BE33CA6F6A03DA2F1BE37CA6F6AF79A008888022220088880222202C6F472B257E5FE1A4EE95C66D9E6D16FC349B3CB2BB32F5C075FEAD2774AE3AB58CEE5423FCF8FBC1433A5C3F6933E3BF4FF3B2FDA29BFCFF003B2FDA2BAA319E2EB3E098A925AFB73E7154F7B59BC46C3968804E79E5CAB51F7F0C2BF42D77DD45ED42D8DCCE6B31A7A102EFD37CECBF68A6FD3FCECBF68A9EBDFC30AFD0B5DF7517B53DFC30AFD0B5DF7517B50F5D7ABF4C8177E9FE765FB4537E9FE765FB454F5EFE1857E85AEFBA8BDA9EFE1857E85AEFBA8BDA83AF57E9902EFD3FCECBF6CA6FD3FCECBF6CA9EBDFC30AFD0B5DF7517B53DFC30AFD0B5DF7517B5075EAFD3205DFA6F9D97ED14DFA7F9D97ED953D7BF8615FA16BBEEA2F6A7BF8615FA16BBEEA2F6A0EBD5FA640BBF4FF003B2FDA29BF4FF3B2FDB2A7AF7F0C2BF42D77DD45ED4F7F0C2BF42D77DD45ED41D7ABF4C8177E9FE765FB4537E9FE765FB454F5EFE1857E85AEFBA8BDA9EFE1857E85AEFBA8BDA83AF57E9902EFD3FCECBF68A6FD37CECBF68A9EBDFC30AFD0B5DF7517B53DFC30AFD0B5DF7517B5075EAFD3205DFA7F9D97ED14DFA7F9D97ED153D7BF8615FA16BBEEA2F6A7BF8615FA16BBEEA2F6A0EBD5FA640BBF4FF3B2FDA29BFCDF3B2FDB2A7AF7F0C2BF42D77DD45ED5B450620B662FC0774BAD0D098626C351168CD1B43B36B36EACF95307995CCE3ACA1839AEC93CC6FF006D06593E3717F59F2C2ECA5C6563E1EB67AD43DF0BB35114F115F1442222939C111101544440111101637AE03AFF005693BA571D5AB85287D3C7DE0BB16F5C075FEAD2774AE3AB570A50FA78BBC1433A561DB326BF740FC42C5E9A6EEB5416A74F740FC42C5E9A6EEB54168F73459F850444506A088880222200888802222008AAD6B9EF0C634B9C75000664AC81B05E045BE1B655E8659E7BD15E655231EE7809366391548209046446A20F12A2F40222200A7EDCAFE46EEDE7D5FE98500A9FB72BF91BBB79F57FA614A31DEF8D7B907D8F87AD9EB50F7C2ECD5C6563E1EB67AD43DF0BB35114F11EE8844452734222202A88880222202C6F5C075FEAD2774AE3AB570A50FA78BBC1762DEB80EBFD5A4EE95C756AE14A1F4F177828674AC3B664D7EE81F8858BD34DDD6A82D4E9EE81F8858BD34DDD6A82D1EE68B3F0A0888A0D4111100444401115C474533E312B808A23B2494E883D1C67A943925B8C16EBE94F4F2D5D4C54F0B4BE595C1AD68E3257B2CA666D92494FD46E88ED3AFF00057F69BAD3DAAB1B5515348266821AF320768E7C7910AB9CE4A2F916A4A5AEA6FF00454567C176F6CB52F63AA8B7C794EB7B8F237902C4B316BAE75B54F65D05B608622F85AF6076FAEE42B034D415D8B6E6E2DAE89EFCB49DBE920B073378FA96ED67C0F6EB63CC938F0D935689958345BD03DABE7EB4685BE65712E6A8FF009F3D0BD65E8B630D1D08C714F14EFA275154307C2D6E80D094F20198CFA7897CE5DCDE48D85FFC5A10D1C6F8881DB9ACAE21C6D4F6B2EA2B7B193D4B3C52EFECE3E6E73CCA3AAFB9D6DCE632D654C92B8F113A8740D8168B485E54D62F921F24F57FA9E64E2B43E974B70B6550845653556633D281FA40731E756288BB704D471279652F70A7EDCAFE46EEDE7D5FE98500A9FB72CF91BBB79F57FA617B464BCF1AF720FB1F0F5B3D6A1EF85D9AB8CAC7C3D6CF5A87BE1766A228E23DD10888A4E684444055111004444058DEB80EBFD5A4EE95C756AE14A1F4F17782EC5BD701D7FAB49DD2B8EAD5C2943E9E2EF050CE95876CC9AFDD03F10B17A69BBAD505A9D3DD03F10B17A69BBAD505A3DCD167E14111141A8222AB18F96411C6D2E793906B4664A028AE69E8259E3DF9CE6C34E0E46694E4DE81C6E3CC17D1ADA6A2FF00DA1B5351F360FC1B0FD623F98F30D5CE55BD454CF55269CEF2F2064D1B0347201B00E855E5CBB49C1726A69A93551C5BE483FBC4EDCCFF00A59B075E655A4B2C93C8649A4748F3B5CE3995E324CC72A9514B52422B9A7B7D6D5B8369A927949F223256C16EC0576AB735D541947171979CDDF647EEABAB734692CCE4912A2DEC7ADCF9AE3890B83336B607E91F2762DEF145D4DA2C13D446E02670DEE2F38F1F50CCAFAD9AC94963A4DE29584976B92477F33CF3FB147B8DEFADBADD052D3BF4A96973682363DFC67F65F3CB1C46FB9A2BE15FB7FB2EEC8EA6AC492759CCF2AA222FA8C1468334CD110683353FEE59F23776F3EAFF004C28014FFB967C8DDDBCEABFD30A518EF7C6BDC83EC7C3D6CF5A87BE1766AE32B1F0F5B3D6A1EF85D9A88CFC47BA2111149CD088880AA2220088880B1BD701D7FAB49DD2B8EAD5C2943E9E2EF05D8B7AE03AFF005693BA571D5AB85287D3C5DE0A19D2B0ED9935FBA07E2162F4D3775AA0B53A7BA07E2162F4D3775AA0B47B9A2CFC28222C9D9F0FDC2F7368D2C59440E4E99FA98DEBE3E80ABA95234E3CD37846A4B27C6861A27C52C95329DF5A408E1D634F3E32403D835ADC2DB8226ADA412CF5525246FD90C70E89239F339F6ABF86DD60C154EDA9AC90545691E29201713F51BC5D2B57BB635B95CE5CA3229E941D50B49F187D63B4F42E4CAB57BB97F8DA47FE4FF645C928F71B6C3B9E59D9969C9552F4BC37F20AF63C15608BFB897F9F238FEEB449B1C5EA481B1473B61C8645CD682E3D676752B6A4C597AA5AB6CE6BA59B2DB1CCED26BBA42CF2B0E2324F357F5279A1E849D1E1AB243FC96BA6EB667F9ABD8ADF4506B8A8E9E33F56268FD9692CDD2B3680FB592FFA936A3F82D86CF88DD79A59746924A4A9683A0266B8B1DC873CBB572EB5ADEC166A671EE7B528BD8CE8D432D83902B5AFB951DB2032D654470B38B48EB3D036951B5CB1162BD27B65DFE998091F050168EA7659AD626A89AA65324F2C92C9C6E7B893F8ADB43824A6F3526B1F6D4F32AB8D91B7622C7335C237D25B83A0A670C9D21D4F78FD87E2B4E54555F456F6D4EDE1C94D611549B7B8444571E30111106029FB72CF91BBB79F57FA61402A7EDCB3E46EEDE7D5FE98528C97BE35EE41F63E1EB67AD43DF0BB3571958F87AD9EB50F7C2ECD4451C47BA2111149CD088880AA2220088880B1BD701D7FAB49DD2B8EAD5C2943E9E2EF05D8B7AE03AFF5693BA571D5AB85287D3C5DE0A19D2B0ED9935FBA07E2162F4D3775AA0B53A7BA07E2162F4D3775AA0B47B9A2CFC28BCB6D451D355096B68DD56C1B2312680279F56BE85B05563EAF7538A7B7D34143101937406911D1C43B16A68B3D4B6A5564A5359FE7A1B549AD8FA4F3CD5333A69E57CB238E65EF3992BE4555515E925A221150333901993B02BA6D3322D750E198FE8CF200F39FD87E0B230592B69EDCFAF920747031BA4F99DAB21C4D6F2B8EAD7C59AC2BDE5EECC803900D80722A94D546D45EC4E0D82C57FA2B3553A67D13AA1D964CD1C9819CA40399279C95BD5B71C5A2E2F6C465929A571C8366190279011A9446BDC3FF00BE3F387E6B1DD70CA35FE29673EE4C66D12B5CB1D5A281EE8A37C95523751108F141E93A968375BBD15CEB5D3328BC1D8EDAD274C67CBAB223A9615FFCCEE92A8BD5AF0EA36FAC3390E6E5B974FA56B86953BB4BEA1399EA3C7F9F32B65F482411BC6967A04F8D96D1CE39C2CADCEC75D4B036AA6A73A2E1A42566B648D3AF4B56C3CA3FDD6A751424A327B918C986444561E4222200A7EDCB3E472EDE7D5FE98500A9FB72CF91CBB79F57FA614A325EF8D7B907D8F87AD9EB50F7C2ECD5C6563E1EB67AD43DF0BB354A33F11EE8844452734222202A88880222202C6F5C075FEAD2774AE3AB570A50FA78BBC1762DEB80EBFD5A4EE95C756AE14A1F4F177828674AC3B664D7EE81F8858BD34DDD6A82D4E9EE81F8858BD34DDD6A82D1EE68B3F0A0888A0D682CDE14B48BB5F228E46E70C7F0927381C4B08A45DCE299A296AEA721A4E706E7CDFF0002C5C42B3A36D29ADCF7059666B19445D84AB4307F286BB21C81C1440A44C7189DF4CE369A2701211FF70FC81C81FE9D7F8AD037E05D9BE28DDD0344FE0B2F06A75216FF0012DDE4F551A6CF895B2E1FC1F70BABE3A891BE0D4B983BE4835BBCD1C7D2B3381F0FDB2BA275CA50E95F1C9A0D864C8B5846BCF9FAD482B3F10E2EE949D2A4B55BB64C29E56590DDEF0C5C6C8E2F9A3DF29B3D53C7ADBD7C87A561429F5CC6C8C2C7B439AE1910E198214638CAC56CB355432C0646F84667C1DB968B72DA73E21AF62B38771675E4A9545F17DBE6254F1A9A79D854DD434AD930FD2D2CC3306998C783E6850BEFE5A738E38D9C9E2E91ED2A50C1B890DE691D4B544786C0359D9BE3797A471A8E370A92A519C576B14DACEA47177A075B2E93D23B631C747A158ADCF744A66B2EB0CED1AE460CFF001F62D3174ED2AF568C66FE68AE4B0C2222D0790A7EDCB3E472EDE7D5FE98500A9FB72CF91CBB79F57FA614A325EF8D7B907D8F87AD9EB50F7C2ECD5C6563E1EB67AD43DF0BB354A33F11EE8844452734222202A88880222202C6F5C075FEAD2774AE3AB570A50FA78BBC1762DEB80EBFD5A4EE95C756AE14A1F4F177828674AC3B664D7EE81F8858BD34DDD6A82D4E9EE81F8858BD34DDD6A82D1EE68B3F0A0888A0D682D970F6229EC953046D024A79A201CC272D1766EC9DD3FB2D6915556946AC7926B2894F07D279E4A9A892799C5D248E2E713C64AF971AAAA2B22B1A206E7B9EDD1B4B72A8A295ED6B2766934B8E4349BFEDF9291BC2A9BFC4C3F78DF6A81B254C87205C9BCE110B9AAEA73632591A8E2B04F5E174DFE261FBC6FB54538D6E4DB8E239446E0E8A9C085841CC1CB593DAB08EB7D5B29854BA9266C0402243190DC8ECD6ADD4D8F0CA76D53A8A5CDF2129B96815FD9ABE5B65DE9AAA13AD8F008F29A7511D8AC1331CABA938A9C5C65B33C99BBDDEE7BE4F533CD93581EC11460E61A0697FC2B0AA9AB955579A74E34E3C91D91E5EA11117B2029FB72CF91CBB79F57FA61402A7EDCB3E472EDE7D5FE98528C97BE35EE41F63E1EB67AD43DF0BB3571958F87AD9EB50F7C2ECD528CFC47BA2111149CD088880AA2220088880B1BD701D7FAB49DD2B8EAD5C2943E9E2EF05D8B7AE03AFF5693BA571D5AB85287D3C5DE0A19D2B0ED9935FBA07E2162F4D3775AA0B53A7BA07E2162F4D3775AA0B4668B3F0A0998E50B75C2761A16DA66BEDD63DF618F48C719198C9BB491C673D402BEA0C456ABE57B2D955628E28663A11BF446A3C59E4065D21736A5FE2525083928EEF4FE3372868478998E55B34D8623871B4567748EF0695E1ED767E368104E5D3A885B1DE6F16CC2D52CA086C513D9A01C5E4000F590732A677EB318D28F3392CFA684A87A91B2D9E930A472E139AF72D53B36C4E7B226B78C1CB595EEE379C3F3575BABA96D7A2E6485D550E8801C38865B0F4ADDA9EE74526107DC5B401B4623738D36432201C88E4D6B3DE5ED68420E316B2D7A7FD7E498C53C90F2BAB753C15571821A99D9040E78DF247BB20D6F1ACED43E8F15DF68296DD402858736C9A21BAC6D2ED5C816CB75B958F0908A821B6473CA5BA4E690330395CE20E64ABEB5E49629C60F9E4B6D34FD884BE66B98C310C7719996FA17016FA6C83744EA791AB3E81B02D594AF87A970FDE209ABE9ADD134BDC1B2C32303B7B701C5CC73E25A6618B0C77BBF4D1CE0F82C04BDED6EAD2D7906FFCE4555ADDD2A54E70E57150DF3EA4CA2DB35BCC03B4291AD54F03B7349E574111904331D32C19ED3C6974C4D63B5553ED9159A29E387C49326B4341E30331AD65646D0B701D5BADD98A4929E492369FE9CF591D47359AF2EA75214F3071CC960F514B269F852FB68B4D1CF1DC698CAF7CA1CD2216BF21965C6B59A87B64A995EC1931CF739A32CB204EA5BBEE7B4147594B5E6AA96198B6460699181D96A3B33585C31628EF77D9639B314B066F900D598CF20DEB5B235A8D2AD5A6F3A633FF00878C3691AF66395148D75C4962B455BED91D9E29E38BC49345AD001E30331AD5D4B6CB2BB06D5D5D0524458F8249637BD80BD99F167B751D4BCFF72715173A6D29358FC8E4CECC8BD4FDB967C8E5DBCFABFD30A001B54FFB967C8E5DBCEABFD30BAD8305EF8D7B907D8F87AD9EB50F7C2ECD5C6563E1EB67AD43DF0BB35119F88F7442222939A111101544440111101637AE03AFF5693BA571D5AB85287D3C5DE0BB16F5C095FEAD2774AE3AB59CAE5427FCF8FBC1433A561DB326BF740FC42C5E9A6EEB5416A74F7408FF00C758CFF9F30FFE4282D433459F85128E1BA99E4C04DFE1C5A6B206BDAD6919F8C0E7965CE0AD64634C4666DE5AC8F7DCF2D0F06F1B3E8586B35F6BAC550E9691E345FF00CF1BC66D7748E5E75B1BB747ABD0CD96DA66CBE59793FF003B5711D9CE9D59B54D4D49E757B1D0E74D6E61EBAB2FB70C45099A3736E9164D6323606B811E30D5D6B36CC7B52CFF00B6BC5A239B2D4E1A3A27ECB810B5C3886E26F7FC5F7D6785ECCF4068E5965965D0B6066E8B54E6FC2DAE9A5900FE60E3EC2ADB8B7938C57493497C9E31EDF6214BEE7AC6965B7C36CA5BAD141E0C657343E2CB4730E198D5C442CA5AA37D56E632430B4BE430CAD0D1AC93A4752D2AF988EBAFD2B0D496B228F5B228FF00941E5E72BEF60C555D6163E2898C9A9DE748C7266323CA08D8BC4ECEE1DB462DE65179DFF4C92A4B27DB05BFC171552EFCD7337C6BE36E90CB591A95D63FA1A88EFC6ACC6E304D1B435E066010322162EFF88A7BED64152E85B4EE81B930C6E24E79E79E6B314BBA2DC21A61154D24150F032DF092D27A46C564E95C2AB1B98C75C61ACFEE4271C72B33BB9E514F4B69A89A68DCC13CA0C61C322401966B19B9F5431979B9C048D378D268E5D171CFF35650EE87738E79A49208251265A2C2481181C432FDD6B34F5D51495CDADA790C5335C5E1C38B3FD955FD0D6A9D6EA6173E31F8279D2C17F88ADD53457FAB8E589FF092B9EC21A4E982731972ADEA9A8A6A0DCDE682A1A592F82C8F2D3B5B9E6725821BA4576F003A8299D28FEBD23974E5FEEACA4C71709ED55143510C5299C3C3A5248234B906CD4A2AD1BBAF0842514B95AF9EF809C536673734F8A5C7D2B3F22ADF73C9E365DAE7038E4F780E68E501C73FCC2C0E1FC4D5187E19D90D3453099C1C4C848CB219712C553575451D736B29A4314CD71735C39F8BA15952C675255B3A29631F81CD8C17F88EDD5547882AE396279DF2673E3706921E09CC65CAB7AA4A29E837379E1A8696CBE0D2BCB4ED6E966405821BA3D76F203A8299D28D8FD23967CB97FBAB2931C5C67B55450D44314A670F0E949208D2E41B352AEAD1BBAD0842514B95AF9EF809C565E4D606D53F6E59F23976F3AAFF004C28054FFB970D1DC6AEA4EC2EAB3FFE61770E7DF78D7B90758F87AD9EB50F7DABB3571958F87AD9EB50F7C2ECD4466E23DD10888A4E70444405511100444407C2B22DFE8E687E723737B410B8BE32696A984ED86419FF00A4FF00B2ED63B171E62CB79B5E2DBC5091908AAE468E82731F810A19D1E1EF59449937768C54E12B3D6B75B5B55B799F193FB280D7415FC1C57B8153D5C7E3CD052C539035F8D11D17FE01CB9F519A2CF4838FA33316D653B6CF533CA2904827631AEA88DCF1916B8E432E3D4B0EBD8964109843DDBD170796F1120640FE2BC2AE1069B7EA6CC859AA281B959831997854CE8A6CBFB46E9B7C53D4B0AAE69EE359490BA282A248D8E3996B4F1E5966390F428A91725A128F8D406B6A250CC8343DC065C99AF19A2A2B12C2C12666DF3442CF5CF7D1524AF8030B1F24799F19F91CF5EB5863AD7D1B348C8A489AF219265A6D1B1D91CC66BE6BC421CADBF51B81B56C7151D1BEC4CF8380D43A8E49800D2242E6BCF8DA5B32006CE65AE2BAFE235828FC10543C41916E80D99679E5CB967C4BCD684A78E5781A22D41555455E256E08C1B1434D4ADB8D05B1D47149154C2C73E739E992E6E65CD3C41BC9B351CD6BBD79F3ABA65CAB63A6F066554821C8B7441D80ED00ED03995A2A69D3945BCB259557D571451DAEDD235A03E412E99E3764FC82B1574CB8D64749E0ADA8708358DEF565AF6AF724DB5820B55D0183BFF1BEE7FADA870CB4E9AAE419F1E65C02E7F19EC0333C417416356FFD2BB86535A5C746696186948E3D2274DFF91562315E6BCB0F5642984E13518BECB0E59E956C23FF00B0BB102E58DC9E80DC3748B5EACDB4E5F50EE6D169CBF12175381A94997884B334BEC11110C011110154444011110143B173AEEE36275062D86ECC67C0DC221A472FED19A8F68D12BA2CAD5F1E6158F17E17A8B7F8ADA96FC2D3487FA641B3A8EC3D285F6D57A75137B11C6E1F8820A9A0AFC2B5A5AE043A6818EFEB63865237F7EB2A32C6985EA308E25A8B6CAD76F1997D34846A9222751E91B0F3858FA6A8B961ABF3668F4E96E34336C70D6C70D4411C638B9C153DD1DC30CEEC7871B455A053DD616E918DA40961771BA327F998793B541D09E6854EA2D62F739D116ED8B372FC41858C93EF3E1D6F1AFC269DA4E88FAEDDADFC473AD2541AE138CD662F211110F41111004444011110144E244E2527B41555114125510025C000492720071A917096E417CBF98EA6E41D6CA076BCE56FC2BC7D5671749EC2A4AEA5585359932D372BC232626C570CF3444DBA81C269DC46A7386B6B3ACEB3CC166B770C4ADB962282CB4EF0E86DC09972D86676D1D4321D656DF8A31758F732C3DFF4F61B6C6EB906901A0E96F44ED9243C6EE6FC8283AD56BB8E27BF43434A1D3D6D5C84973B5EB3ADCF71E41AC92863A79A953AD2D12DBFD92EEE09612D65CAFD2B320FCA960278C0F19E7B74429B16330F5929B0ED8A8ED5483E069E30DCCED71DA5C79C9CCAC9A93995AA7526E411110A8222202A8888022220055154AA20239DD1F731831634DCADC594F78637225DA995006C0EE43C8EED5CF55B4375C3775DE6AA1A8A0AE81D9B76B1C39DA46D1CE1765AC65EF0F5A710D19A5BAD0C35317F4E9B7C669E56BB683D086CA176E9AE596A88430A6EDD71A00CA5C4509AFA7FE5F098C01334738D8EFC0ADB6AF07E04DD2A99F5D64AA8E9AB48CDCFA501AE07FCC88FE7ABA56B38AF70DACA5D3A9C3751E1516B3E09390241E6BB63BAF22A2D7B2E987AE9A2E1576FAF84F3C72350D4A9D3A9F1519619B2E28DCC311E18D399F4DE1B44DFEF34A0B801F59BB5BF973AD314AF85F770BA500653DFE9FF0088C0356FF1E4C980E7E277E0B7196C1B9EEE9D13EA2DB2C54F7023373A9F28A669FAF19D4EECEB5183D75EA52D2AAFCA39DD148189B721C4760D39A963174A36E677CA66F8ED1F599B7B335A039AE6B8B5C08734E4411910541A6138CD662CA22221EF01111060A20D8BE90C12D4CCC86089F2CAF393591B4B9CE3CC0292B0C6E2B7DBB684F7778B5D31D7A0E1A533879BB1BD7D8A4F33AB0A6B3264661A5CE0D6825C4E400D64ADFF000BEE41886FFA13D647FC2E89DAF7CA86FC2387D566DEDC94925DB9DEE58CC808E7B9B4716535493F933F051FE27DD9EFD79D382D605AA90EACE33A533873BF8BABB50CDD7AB574A4B0BD5920C741B9FEE530B65A97B67B9819874994B50E3F55BB183B3A547F8B3765BDDF34E9AD40DAE88E63363B399E39DDFD3D5DAB46B6DAAED88EE061A0A5A9AEAA79CDE5A0B8F4B9C767492A5EC29B85B5BA15589AA748EA3E074CED5D0E7FEC3B50F0E14A93E6AAF32226B161DBBE28B9782DB2964A895C739243FCACE77B8ECFCD749601DCFA8B0550B9DA42A2E530027A9CB2D5E4B791BF9F1AD9EDB6BA1B451B292DF490D2D3B3647130347FB9E7578864B8BB955F8568822221902222901111015444401111002A8AA5510044440162AF9872D188E97C1EEB410D533FA4BC78CDF35C358EA5954425369E5104E27DC26A21D3A8C37562766B3E09547270E66BF61EBCBA54515B6EBA61FB888AB29EA682B2339B748163873B4FEE1766AB1BA59EDD7AA4752DCA8A0AA80FF44ACCF2E8E43D086CA57B38E93D51CFB867769BFD9F420BAB5B75A51AB49E746668E6771F5F6ADF854EE75BA8B036511C17370D5A5941500F31D8FF00C562B13EE1304BA75186EB37876D14B524B99D0D7ED1D79A882F986AF386AA44575A09A99D9F88F23363BCD70D450D118D1AAF34DF2B37DC4BB88DEADBA73D9666DCE9C6BDE8E4C980E8D8EEAEC519D5525451543E9EAE09609D8727472B0B5C3A8ADC70D6EAD89B0E0642EA9FE2146DD5BC5592E207D57ED1F88526D2E3BC05BA053B28F1052434B53C4DAD00007EA4A367E0A3059D4AD4BBD732F5440B6EB5D7DDEADB4B6EA39AAA776C8E16171EBE4EB52A61BDC2EBAA432A311560A38B69A7A721D275BB637AB35B05C7752C1F83A91D6EC2F411D53DBAB2A66EF70E7CA5FB5DD59F4A8B3126E8B8931469C7575CE8290FF75A6F119973F1BBACA0E7AF57B572AFD49726C51B9EEE6B0BE96D3045515C064E6D2E52484FD794ECE8CFA946B89B75CC49880BE1A7985B28DDAB7AA5243DC3EB3F6F664B0387704DFF00143C0B5DBE47C39EBA893C489BFEA3B7AB3531618DC36D543A13DFAA1D709B6EF11E6C841E7E377E1D0856D50A2F337CD2212B361EBC624AB30DAA867AB909F1DCD1E2B79DCE3A875952F617DC2618F42A71255EFCEDBE094CEC9BD0E7ED3D5974A9868E8696DF4ACA6A3A78A9E066A6C713035A3A82B8433D5BD9CB48E88B2B5DA2DF66A46D25B68E1A581BB19130007A794F3957A888626F3AB088880222200888A40444405511100444400AA2AA20288AA880A22AA20288AA880A2F8D5525356D3BE9EAA08E785E327472B439A7A8AFBA2022AC4BB88592E7A73D9A575B2A0EBDEFF9E127A36B7A8F5287F126E7D88F0B973ABA81D2530390A9A7F848CF4E5AC7580BAD550804644020A1AA95E54868F5472BE1ADCBB13625D095949E0548EFEF1560B011F55BB4FE5CEA61C35B8D61CB2164D5CD75D2A86BD2A819460F3306AEDCD48E15508AB7752A7D91F38E28E28DB1C6C6B18D1935AD19003982F6AA8A0CC51155101445544051155101445544051155148288AA880FFFD9)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (3, N'La Gran 7', N'muy lindo lugar', N'paddle fútbol basket ', N'Av Concepción Arenal', 690, 11, 15395629, NULL, NULL, 3, 3.9, 1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9628.586777486498!2d-64.18345731772072!3d-31.435623530589446!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9432a2ed17f69df1%3A0x4b6c077a65895199!2sLa%20Gran%207!5e0!3m2!1ses-419!2sar!4v1568661214384!5m2!1ses-419!2sar', NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (11, N'Pablo Pizzurno', N'complejo con 10 canchas de futbol 7', NULL, N'velez sarsfield', 1056, 3, 53535335, NULL, NULL, 2, 5, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (12, N'La Redonda', N'Canchas de basket', NULL, N'Hirigoyen', 12, 1, 8897866, NULL, NULL, 2, 4.1, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (13, N'Pablito Aimar Camp', N'Canchas de futbol muy lindas', NULL, N'independencia', 256, 12, 23151512, NULL, NULL, 2, 1.6, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2005, N'El Campito', N'cesped natural', N'tenis', N'nuñez', 132, 1, 351489987, NULL, NULL, 1, 3, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2007, N'Complejo Calleri', N'Canchas 123', N'tenis volley', N'dilkendein', 3254, 88, 265645115, NULL, NULL, 2, 3.6, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2009, N'wimbleddon', N'canchas de tenis', N'tenis', N'obispo oro', 343, 94, 5958334, NULL, NULL, 1, 4.3, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2010, N'Webber camp', N'complejo de volley total', NULL, N'providencia', 398, 75, 3544343, NULL, NULL, 2, 4.5, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2013, N'Marvin', N'canchas techadas', NULL, N'olmos', 342, 34, 23243423, NULL, NULL, 3, 3.2, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2014, N'Ginobili Camp', N'basket total', N'fútbol basket', N'independencia', 1096, 323, 987778899, NULL, NULL, 2, 4.9, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2016, N'Tamagochi San', N'Dojo de artes marciales', NULL, N'fray mamerto skiu', 434, 15, 221515112, NULL, NULL, 2, 2.8, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2019, N'ezeiza camp', N'Canchas de futbol totalmente equipadas', N'volley', N'fructuoso rivera', 2660, 300, 313351351, NULL, NULL, 2, 0, 1, NULL, NULL)
INSERT [dbo].[ComplejoDeportivo] ([id], [nombre], [descripcion], [deportes], [calle], [nroCalle], [idBarrio], [nroTelefono], [horaApertura], [horaCierre], [idResponsable], [promedioEstrellas], [idEstado], [mapa], [avatar]) VALUES (2021, N'Gol de Oro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ComplejoDeportivo] OFF
SET IDENTITY_INSERT [dbo].[Deporte] ON 

INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (1, N'fútbol', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (2, N'tenis', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (3, N'volley', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (4, N'paddle', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (5, N'karate', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (6, N'basket', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (7, N'running', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (8, N'golf', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (9, N'ping pong', NULL)
INSERT [dbo].[Deporte] ([id], [nombre], [avatar]) VALUES (10, N'boxeo', NULL)
SET IDENTITY_INSERT [dbo].[Deporte] OFF
SET IDENTITY_INSERT [dbo].[Deportista] ON 

INSERT [dbo].[Deportista] ([id], [apellido], [nombres], [idTipoDoc], [nroDoc], [sexo], [fechaNacimiento], [nroTelefono], [idUsuario], [promedioEstrellas], [idEstado]) VALUES (1, N'Shcurrerr', N'Aldo', 1, 33325659, N'masculino', CAST(N'1985-03-12' AS Date), 246534, 2, 0, 1)
SET IDENTITY_INSERT [dbo].[Deportista] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (1, N'reservada', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (2, N'libre', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (3, N'en curso', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (4, N'abierto', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (5, N'cerrado', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (6, N'cancelado', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (7, N'habilitado', NULL)
INSERT [dbo].[Estado] ([id], [nombre], [descripcion]) VALUES (8, N'completo', NULL)
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
SET IDENTITY_INSERT [dbo].[Responsable] ON 

INSERT [dbo].[Responsable] ([id], [apellido], [nombres], [idTipoDoc], [nroDoc], [sexo], [fechaNacimiento], [nroTelefono], [email], [idUsuario]) VALUES (1, N'soldano', N'franco', 1, 33259635, N'm', CAST(N'1978-02-12' AS Date), 31351312, N'adsdas@dssd.com', NULL)
INSERT [dbo].[Responsable] ([id], [apellido], [nombres], [idTipoDoc], [nroDoc], [sexo], [fechaNacimiento], [nroTelefono], [email], [idUsuario]) VALUES (2, N'Wolkowisky', N'german', 2, 15632359, N'm', CAST(N'1988-11-20' AS Date), 26261664, N'edde@hot.com', NULL)
INSERT [dbo].[Responsable] ([id], [apellido], [nombres], [idTipoDoc], [nroDoc], [sexo], [fechaNacimiento], [nroTelefono], [email], [idUsuario]) VALUES (3, N'Aymar', N'lucha', 4, 26232356, N'f', CAST(N'1989-05-23' AS Date), 32323232, N'dwwd@gma.com', NULL)
SET IDENTITY_INSERT [dbo].[Responsable] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (1, N'Administrador', NULL)
INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (2, N'UsuarioDeportista', NULL)
INSERT [dbo].[Rol] ([id], [nombre], [descipcion]) VALUES (3, N'UsuarioComplejoDeportivo', NULL)
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[RolesPorUsuarios] ON 

INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (1, 1, 1)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (2, 2, 2)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (3, 2, 3)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (4, 2, 4)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (5, 2, 5)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (6, 2, 6)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (7, 2, 7)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (8, 2, 8)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (9, 2, 9)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (10, 2, 10)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (11, 2, 11)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (12, 2, 12)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (13, 2, 13)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (14, 3, 14)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (15, NULL, NULL)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (16, 3, 15)
INSERT [dbo].[RolesPorUsuarios] ([id], [idRol], [idUsuario]) VALUES (17, 2, 16)
SET IDENTITY_INSERT [dbo].[RolesPorUsuarios] OFF
SET IDENTITY_INSERT [dbo].[Rubro] ON 

INSERT [dbo].[Rubro] ([id], [nombre], [descripcion]) VALUES (1, N'indumentaria deportiva', NULL)
SET IDENTITY_INSERT [dbo].[Rubro] OFF
SET IDENTITY_INSERT [dbo].[ServicioExtra] ON 

INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (1, N'asadores')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (2, N'estacionamiento techado')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (3, N'estacionamiento s/techo')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (4, N'vestuarios')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (5, N'quincho')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (6, N'cantina')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (7, N'resto')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (8, N'lockers')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (9, N'camisetas')
INSERT [dbo].[ServicioExtra] ([id], [nombre]) VALUES (10, N'ambulancia-emergencias')
SET IDENTITY_INSERT [dbo].[ServicioExtra] OFF
SET IDENTITY_INSERT [dbo].[ServiciosPorComplejos] ON 

INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (3, 2, 2)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (5, 3, 3)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (6, 3, 4)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (10, 2007, 2)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (11, 2007, 7)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (12, 2007, 4)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (17, 1, 9)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (18, 1, 2)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (19, 1, 4)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (20, 1, 10)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (21, 2019, 1)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (22, 1, 5)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (24, 12, 2)
INSERT [dbo].[ServiciosPorComplejos] ([id], [idComplejo], [idServicio]) VALUES (25, 12, 7)
SET IDENTITY_INSERT [dbo].[ServiciosPorComplejos] OFF
SET IDENTITY_INSERT [dbo].[TipoCancha] ON 

INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (1, N'fútbol 5 ', 1, 10)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (2, N'fútbol 7', 1, 14)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (3, N'fútbol 11', 1, 22)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (4, N'tenis single', 2, 2)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (5, N'tenis dobles', 2, 4)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (6, N'volley indoor', 3, 12)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (7, N'beach volley', 3, 12)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (8, N'paddle single', 4, 2)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (9, N'paddle dobles', 4, 4)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (10, N'basket 1 aro', 6, 10)
INSERT [dbo].[TipoCancha] ([id], [nombre], [idDeporte], [capacidad]) VALUES (11, N'basket 2 aros', 6, 10)
SET IDENTITY_INSERT [dbo].[TipoCancha] OFF
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
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (1, N'nico', N'nico', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (2, N'enero', N'enero', NULL, 0xFFD8FFE000104A46494600010100000100010000FFE1002A45786966000049492A0008000000010031010200070000001A00000000000000476F6F676C650000FFDB0084000302020808080808080808080808080808080808080808080808080808080808080808080808080808080807070A0707070809090907070D0D0A080D07080908010304040605060A06060A0D0D0A0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0DFFC00011080384038403012200021101031101FFC4001D000001040301010000000000000000000005030406070102080009FFC40054100001030302040502030602080304040F010002030405110621071231410813225161718114329109152342A1B152C11624336272D1E1F04392F12534538217445463A2B2C2D2183545642674839495C3D4FFC4001C0100010501010100000000000000000000020001030405060708FFC400361100020201040103030205030305010000000102110304122131051322410632511461154271819123B1F033A1C116345262D124FFDA000C03010002110311003F00E6DE20F12A38416C6474E8B9C754EB392779C6C0AC565E5D37A9CEC940AAE3DF6DFE9D921076CF9C631BFBA9B58A8DA3ABB7EAA276927940DB7FD519A4AD6B3D27727FA2421CEB2BC9C7281BE3AF655A476F32BBA8EBEA24E000AC1D436E058D925772B40CF28EA549380FE18AE7A927115140E652870E7A8782198CEFBFBA42203A5ECF2544ADA4A0A77D4CF210D6F2824824E32401D3E57D27F0C7FB332968638EE9A99FCCF0048DA66B806B36C8E63D723DB656CF0D385160D0F48D706B27AFE5F5CCE01D2F3E3A33E32AB3E23714EE77D7B98E7BE0A3EED88E1C5BF39F848458BC50F142CE616DB27A238FD01C4121A06DB1EFFAAA7B576B19A8D9E6D44ED74A464E76C9FA28C4776A2A03E4D087D6559F4F960174AD3F38F946EDDE14B51DD89A8AC8045111CD1C526D263A8C8484436C5C5EBED6B8B28A6118CECEE424611BBE5FF575280F757C5237AF296631F1D53FBBC759633E54B4AD89A360F01563AA38A5533970CF3349F74842578E33D6D4BB92B9AC7386C5CD40EB6B891B7451B9E5739D977281FD538A89F03F30C242075D06FB7DD45EB69B39DD17AE9F7EBB216F906521010DBCE4EE9C515B893EE8A4707B828DDB2DBD300A423D6CA1CE3B7CA9252D210B5A7A6C7D3E11DA3A4CF62908DA9A0247BA74CA6F846EDB6BD8EDFAA20CB6A4222EEA63ECB5652152E75B3E126CB57C24202C34E40094143DD1F65176C6C3BAD5B479D87542D081943485C798F40A0BC46D6CC88168232A4DC43D62DA484B4380791D3BAE56D4F7F74EE2E27B952242046B5BEBA57289C6DF7EA89D4C273B9435ECC65108770B96B52DC84942F1EE942F4C21A3A3C2D094F79729486DA4E76C24207617B08C7EE47A4A6B43825B4421473E1127CE0B7E535A7B4B894423D3AF295080733B7E8913223F3E9C77D50B9AD8E19C829A84325E5B382C8626A11AE163297F28FB2C8A74A846D195A4AD4F23A738E8939633EC9D086385BB18B67353BA6A73EC53884E9E9939752A70C66128641EE9081724185A4712232342D18C484309A2493110A96A1EE48468E5E5825650B11E5B2D16F94C23CD5B172D72B0908D8AC15A92B0908C95E58CAF653A119296A72904B4651087E245EF39327C9ECB0254843F3326D3D565206548809842F0EE47CA945B287640A861DC29A5BDB86A484319ADD94949684799D166446221B536DC21B534854D65833D908B852A66222C234B4652D50CC14DDC50311B93BAD8245852A1DF29C46856A58B7E6F95EC27119684A06AC35AB701211A90B52B75A39211ABD6179E56039211E016ED0B5CA521290872D62D9816CC216CD09084666A664221304C5E9086EF5AA51EB01211EC2D5AC5B65642423CD4F2960C94DE01B8452D6C3CDD1210B7EEBF74A8B50C27E59CC71F74B0A2D93D080AFB6E01C2112D211952D752119DBAA655149B744A844516A9E5653969E89A261196ACE1602D81402135E5B95A24230BCBCBC908F2F2F2F2420A525465A1B85B90E0E03E7B77FAA6510231BE3E54B34EE957C9FC577A18DDCBDDEDF09087F4D485831CA4B8F4C2690C8D6CAD680E73C9FF00663D44BBB60293D96D955739D9416B81F512B8F2F3B5A48DF6CB8E3D2BE8B786FF000236ED3F032E57B2DA8AFC07889E46223D7A1FCD8484517E187C0455DD5CDB85F79A9681B87321390E91A37E9EC5765EA9E29D0DA299B6EB1C4C85AC1CAF930074DB24FBA80F1B7C54F31F229DE18C03958C8C64B874003028C70A3C3CDDEF6E124AD752D238E5CF20873C1F8EC908895EB50896A32E7BEB6ADE7D308CBC127DB19015B1C3DF0917CBB39B25C25FDD944704431FA667B7DB23A6CBA6F44F0AEC5A722E60D8BCEE5CBA5930F793F19DDAA01C48F1B5047CCCA768C8C8E6CE7F41D921168F0EF81563B1B018A18BCC1F9A79F95F338FBF31C94F355F882A0A504F3F390367647E8BE7D6BBF13B3D439CECBBE3D47FB655475DC469A771F31C4B4FF2E4FF00CD211D39E2238EB49750E8BCBF56E1AED9721565A4B1CEC1C8CA928B88C0E519F7CF6436EB706E08E9F290886DD598EA105ABAEC84EEEF5D977E6513AAB96FB74CA421D49524ECB489DF7298C72927647EC96C738F4CA420BD9EDE5F8254A28E9703185EB6508C0ECA454D6D1D8A421BD35ACFB290DA6DA7D938B7D0EDBA915B2DFEC908CDBADE4E7288FEE73F09FD1D29E8475E88AFE1B03709088DBADDF2B5FC361177346FB26325537FC2908612372081B1416F7A819471191C4177CA77A8F52C54EC323F036E8B93F8AFC507D438B1AE3CB9F7EC8D2101789BAE9D5731276192A263669F94DE5940DCEE530A8B97B1FB226842D58C082CE13F73DC5357C07D90086AD0968DE92785AE12B10469C8CA3744428BC4F20A22CAFC774F62250C902635F541097D79C21F3D6172562245057B7647A9AA01682AB76B8A7F05E5CDC0EC9EC44F76F748CD421C105A0D54D1F98225FBF987A14B8100EBECE1A7A265141BF4462E372050BA7DCEC5210B4F4FF09BF9384F27CA6323D308760E026950ECAD0550E8B57B92108B59BA2B0CB8098363EFD92B29D9211B54D524192A62F91294EF4841358E45988ECBCE298424F626B2313F73522F80A71030C6BC9DC9126EF80A111A05EC2C02B394C23D85EC2F6578242355E59C2C2423CB66332B54E28DB929D08D3CA216CF87652686CE4B738436B68C8CEC884088C2D5E9573524E4CC4630B23AAC00948D87292106AD916E148DB2003AA014720016F517218C27105DF7000755E65CD46055E53EA6CA21070D721D70AA495449D10EAAA84CC433AA9325357B96D29DD248188DB99679D68BC9846C5C9485E915BC4908211397A42B585CBCF4623571493CAD9C52522423573D680AC1584C2370E4B44F4D929194843F85C9C87EC98472270D942711BBDE9ABC6E96734AD795210DCB12784E9CC4816148427CAB0F0B7C2D5CD4846D1BB1BA2B6CAD4280D96C1F8E89089687E7A2771556028BD35CF03AEE8B535712958821255149B8E526C03748CD560774F621ADE29C1DFE147648F08CDC6B73B03D90727DD308456E02D4ADB28446CB05796084C2345E5E5E484797979792117354686A3B747CF52F2F97A88FD8F6DBD8A9B7047C3D5DF554EC8E9E27414591CF26088F93BE0FBE15EBE16BF67855DC9CDBAEA373E9E918EC88A53873C377DC1EC55F5C6FF17F6CB2422D3608D864FF0064C8E9DB9739DD013CBBF548489869ED3DA7F425116C02335BC9FC59DFCA497637DFA8DFD973DD5710EF7ABEABCBB647249117E0CEF0E11B5B9DF94F438529E05F825BB6A1985CF53CB2454C487C749921CF6F51CFF185D79A8788B64D354ADA5A26431963795AD88007207F3637CA4268867083C1B5AEC8D6D65C9E2A6AF01CE74C472B0F70C0763BA6FC60F18D0D2B4C345CA1A32D1C9818FA00B99B8AFE24EBAE5239A24E58F38E5CED8F854DDE2803B774A43B393829505D933D67C6BAAAE91C6595E1A49EE73F70A25FBDA0EAF7173BE5422E55DC876767E7BA14FBAE7394825126771BD53BCF440A7B9C7DB6406A6AF6D933924DF39EDD121DC494C3A879508BB5FC9277D90196B9D9D90FAEAD24EE911262176AF2E7754C23A8C949D43798EC08462CB672E230D4843FB450671B770AC5B35ADA0744DAC565000C8531B65BCFC242A16A2B73703011FA3A218E8B6A3A1C0DF0548682DD9012109D1530033847A8A35B32DA00DD2CD0D6F62521AD0F281A3240EA9E3DCE67E6394C60989ED8FEEB5967DF1BEFDCF644921C677799B8DBF32866A3D471D331CE94E08190111D67A9A1A38DCF7B839FBE005C6BC54E2A4B5523B24860CE07C254FE043BE28717DF3BDCD613CB9D955B2DCC6E4EE53296B0BBB7DD65D0671B81EE9B91509CD584A49927F74F7F769F70968A871DB29F91E8734B8E89D989B849C14BF6F85BCF1254C1A0557C03B218E88A355946E4C3CBDF053ED4150D58C29611A76D83EEB12242A1271D934311EC9D06A7F6FA4CA4301DD4C527C8A5D2DBB6D902AFA1C129840E6ACE48EEB4C2F14D421715451CB5C39402152AB20451109D74580501136EA4777781951699DBE53B10429298147E96C9903640ECB2EE14E6DEED827484358AC031D1215762DB60A470C656EEA528A8457953A59DD9251D848EAAC29A2DBA260FA4CA6DA22212D2E36436A65C297D7516725446E51EE50B888419589E4350842D848530831280984D224CCC5264A42321AB3CAB38F85E6F5484639579AD4AE168244846A5AB5704E9B4E4A4A58084CC42088D99833F743894E6DCFC3824BB116351C639147AF38C2214F5986F751DBBCA4E7744C40C9D36253889B949CB01084426D29C3537684E62D938870CA8C26F35424A472D031210E61722D4F36C844111CA7A25C242169EA50E965CACCEF4D8A611B3C6EB1CAB3CEB6E74842242D528F5A10844612D0048A794D094843A8215BC90A710C6B7784711029F1A6F314FEA5A874A85884DCB0BCBC98479641585E4842AC7A598F4D414A36544988274C729FB2850BA29C04723AC181B144C432A8A543676A29555010B96505308440596B5679D7848908C16AC162D8CA1643B2908D18DDD15A379C2674F0E4A27143B2423692A4842AA6B0E510A96A0D50374846934F9292256CD0968999EC86C4B9116B56795387C25685A9587B4470BCB25793D83468E58C2DB0B01A84635C2F2DB95793D08FA77C49F14B7DD6157FBB34F42F6D21C35D3B416C6CC9F5608C0D82E9AF0E7E086D7A72315F737B2AEE0473BE59B0E0C7F5C343B3BE7BA9FD27EE3D2545F86A18E28C8CBB231924FBBBAFD971F71D7C53D4D6BCB23792D390003B7DD308BCF8E9E31B943E9E8C818CB411DBB6011D17166A6D555152F324DCC7272493EE829BB3C12E90E7273CBF3F5432E9A81CECE4F5EC9AC9E31E0DEBABDAD765B907FA28F56DC1D925CEEBD135AAA876F93CC86D5541DB2853B16D31595594C5C483F55BBEA06718C24C9C671BFD52B069A1C36A81184DEA651EC9A31CECE53B6B09E832913276867C9949C94993B290D069F2EEBB29250694E9E9047BFBA7457946888DA74AF37E653CB269F0CD82356BB163F946149E86C60764432065BAC3DCA955B2CF9EC9E5BACA76DB3BFE8A4D05006242633A4B1608251A6D235A17A4936D824A6A8D921923324D80984D504775B4BBEDD539B75A5CEDF972A39CD47B0E185CE54909514A49EB81DCFB25EAB494B38C4153131E7F2B9EE000FB153DD33C3232EF28E561EA077565D0F0E6C3135A2A295D291DF988FEC42CD9EAE2B8B36F1F8DC95D1C33AD3C116A7AD95CEFC651C9191B1150C6EDF4CA854BFB35AFC7FF168C9FF00F9967FCD7D231A4F4C03B524833FFDFC800FFF00096A745698FF00ECCFFA8A893FFCF513D757C96578E97CC59F351FFB3A750376FF0053207FFBCC7FF35A1FD9E3A887E56D23BE3F10CFF9AFA5C744699ED03BFF00EE24FF00F3938A6D0DA73B46F6FD2779FF00F2944F5CFF0024BFC3DD7DACF95977F04DA92004FE1192E3FC0F0EFD30A2157C18BD404B66B6D40EDE98DCEFEC0AFB274DA26D4CDE1AF743EC0BCBB1FA945A9ADB10D85E23C7FBD1C67FBA916B5FEC47FC3E3F87FE19F102AB4AD4C0312525435DDF9A270FEE10D154D6E43872B8F63B2FB77A878694F55FED2AE9EA3DC1646DCFE8A1B57E12AC327AA6B653CA7BBC3C03F544B5FF009625E353EAFF00C1F1DA6A988F521A7EB9436BADA0EE3D43DC05F5C351F813D393B486520A73FE261E6C2A9EFF00FB31A8E527C8BA4F18EA1BC9B7D14EB5B0FC95F2789CBF08F9A53D3966F93F449799CCBBB3587ECCEAD859CD4B3B6A7E24202A76F9E0AAFD138B5B461C3FDCDD588EAF1BF9284BC7E48FC1CDFC98288DBA4DD5A571F0AD7E6649B74E40EA4467FE4A2B5FC28B953EF2D1CB181DDCC23FC94DEBC3F203D1E5EE86D14A3084DC1C375A545448DC82DC21EF739D9F7F952C66A5D3209E19C7B434923DD61D0A74CA523AE12D0DACB8F707D8F4C226E8AE328695486D8CC2D696DDDBF5253D8472F51FA225C8869708B2A3F574C72A5D2B329949423AA4C402A405AA5968B98C60A8FCF0E0E5376CFCA52BA1E8B161B803D1292DC3E540597C23B2D25BF38A7DC31376DD3B04BB2ABDD57705DDC0F54620BB9D92B1128A86039C7B28B5D68BAA310DCB6C909956383BE12110C922DCAD0239F8119C653C1616E33942222C0A5E37A7F57425BDB3F448C709EA400908D32B523B227050176E06CB716B3DB04F61DCA4202962794943929D3AD8E07D45AC1FEF9C2734D335BB03E61F6664FF00926B43A4D8BC16CD933B95AFD91C6553C0FF00DDE73F461FF926F5555263269A603DDCC23FC927243ED7F8222EA12B7A461051592B1BDFD2EFF0B81FF92D61E527620FBE3B249A138B43E654EC107B9309251EA78B2718DBFAA51F6F6E7B9F7C0FEC9EEFA05F0476DB4673BA29594ADC277343C9BE36EDEFF740EE172DF09BA621ACAD5AB5ABCD00F74EDB49B2425C83A50B460DD3E7521DFE1204E3B22A10F5980D4DA7916AF7EC91714C2340E5E25670B442C4672B21CB55E4C236256B95E5E4847939A79536CADD89082B1542F4B5287B26C76587CD944988565A8CA68E2BCB09988F6165AD5E684E21A6CA54210E458C27B25263BA6AE6A542135E0B7F2D60B5210A472A751D626B0D3129CC36F39EE9C46279CA66E7144E6A1C7BA672C384E21BE56DCEBC5688588DCBD6F13D24B762610F629709E47528573251B327421E4D3A1F23B7597CC92CA7B119704B538F94814A4281B0E0B91CC812252AE724CA6B2CF0C48B57B9578B97894A9959B35C2CF2AC862CF2A32335C2C2DF95793D8E7796AEE2455D7BCBE52EE9D09F4FD4285B2EEC8CBB232EEFFF00343EB2F85EDFCD81EC36402AEAF3BFB2119852E77604E4143E4B8E41DD0AA9AA04268F97D8A027836159AB8219595394D9F2EE95C6764CB82CB435F30F54EA9E3E609E53E9F2EE80E148AD1A5F948C8CA720F902DBEC1CC77CA945BF4CB400A416EB1B89C35B80A4F45A5F037EA904C8D5058B3D0291DAEC2E1B76525B4D977D9B952DB76962772DD8A403E488D1D931B0524B6E9B27AB54BEDBA6D8D192D28ACD4C1A364F646E246A3B78601E95ACA41442E151B6147E59BD4424D5F2347B3D24F84C2281EE722D43687C870064153BB1E8700073C10A967D52C48D8D3F8D9EA1DA22967D24F71DC6CAC1B069D64607728F525BE368EA1253BF0718FD1729A9F21B99E87E37C2C71FDE89459AA434616D716B5DF9828F52D6107E3BA22F3CCE0373F39593EBB6CE89E971C58CE6100D8B03BEA902EA7FFE0E3FB27751C80EE3A20F5B52C076270A294A764D1C78FAE0725F4D9FF62D09B544F00E8C01351748BA72A6B53708FB37FAAAD29E42E470E27F83D251C0FC92D3F629075AA0FA7C1253692B19D811F42BCDB8B3B80ABFAB95FC9716970D748254F6684747BC7FC24A78D796FE5965C7C943292B1A7FE8708887B71F980FA908D4F2953D0C69F485BF7D3DBFF8B27EABCED51507F2CAEC7CA1D306E7739FA149977603EC9BD49FE49969B13F80BD2EACA927F3177D4947A9F88CF8FF00DAF3373DDA146A89A7236247C6C97B95ABCF6F96D918C79D873103FBAB58F364F828E6D160EE4950EF5171FCC430D941F821BBA890E3351546595B0C72349DF66FE8ABED4FE176E9E6197C9756C64E7920947301F182A3571E18D1C7E894555BE6C7E59439C07D4F45693D42F734E83C583C7E48EC8B8DFED45A9A8781DA56E9190216D3BDDD1CCC0DD73CF12BF6713F3CF6BA864ACEAD0E3BA901E1D560DE8AB195207F2F3861FD095BD2EA8BCD11F5F9918F66E5FF00A1195661E4B241F28A79FE9DC3917B65FE4E59D67E152FB420BA5A27BE36FF003B4123FA2AEA59BCB7724CD731C36396918F8DD7D2ED29E2BE6DA1AA8F9DBD3F88DC03F5C852CBC5269ABD3447594703091BBE06B5AEFD40EABA0C1E660F891C2EBBE99C98EE51E51F2D1AC0E6E23DCFCE13331B9BD765DF7C45FD9A74D52D33E9EB806BFA8A794EE7E067DD721F13385975B34861BB50C906F86CFC85CC70F7C818195D1E1D44322E0E1B51A678A54D15E39C5788D93D92DC1DEA69F49E98394C1AFC6410720F5566ACA2E8635916C8255330A475AF1B63BA0558F43542181715A1294715A2423CD29ED2CC72990446DB064E52106E0057AB18708851526D94A565292110801487746E477A50E6D1EFF3945A969F3B60EDD4A48402AB8B3F94FE8B1476A27E7EBD94B6D9637CCF11C10996427018C19273D3A2ECEF0F5FB32ABAE0D8EAAE8F34B4E487183A3DCDEB8CA69492E49144E27D3FA6AA6A5ED8A963754484E0321692EFBF65D5FC25FD9A979B8724B5AE8E8A038241DA7C7FCD7D10D39C3CB069988C7434B1CB518C06F207CCE77C3F071BA0D76A7BBDC72EA87FE0290F487FF188F870E8B2F3EA5D1B1A3D1FABC3297B6F836D13642DFC7D43AB6603D514E799A4FB0014AEDB57A6D8716FD2B1380D84AC887291F709FB348DBE89C4F90E9E43D5D547CD3F519CE10FBAF14DD0B488C323683B060000F8C2E733797F4F83BCD17D35EAD526FF00EDFEC4A285FE60F459ED94ECF6958DE703F45A57D82023D749693F0E6B71FD95357BE334CFDB9BAA80DCF5A4CF27D5B2C3CBE79AE8EBF0FD1AA4B954741CBC3CB4CAECD459EC72B0EC4868E71F23E5403567815D2772739D13A5A2948D9B4C47941DF4F6558B6ED2103D4ECFC128AD0D5D40C72BE469ED82421C5E7A49D92E7FA271B8D229EE2AFECEABC5B8BE6A0923AEA7192D6B4E66E5F623DD7385CE19A9DFE554C125348D382D91A41CFD4ECBE8EE9EE255CA948E590B81FE53BE7F547B50B6CF7E1F87BD52B2371181346D0D933D89780BA4D179C8CDD3382F25F4A64C09B8AE0F9677885F8F4EE0F7EA5442E277E9BAED2F101E06ABAD23F176971B85B8FAB91BEA9236FB123AE02E56B85999335EE6658E61C3DAE1EA6B87504755D5C2719ADC8F37D4609619ED6887C0DDD1EB49E6D90696123208C11D53EB3CFCAE180A64452544965B50C1FA28B5DA9F94AB058D05A0FEAA1BA9611944020242DCEC9D8A1D9296CA419EE8F7E11A0742858E4466870912113B934650E7206234C2D9AD5BB5A12D4B0E53086E632B0588DC76B09A54D360EC9E8430E45AE53C74013774612A109E57B2BD958CA611B2F342C656F1754843CA5A6CA251D1A694B3611582A73D51081F3449B9A3450C009D93AA6B7651B1007F04BC6894866A0010BA99300FBA011A52C6023F4AD181D1448561CF64F62B8918DD32107AB221ECA3D5984BBEECEF70854B327B108C8D4905B194AC029988C2D9632B20A611B82BC569CCB1CC908C958715ECAC24232D4AC4936A583708593405495A2CB775B49180989EA86FCAB1CCB5CADB9D194D8A02B2B5056F848630BCBD85E4845F5156EDD5273CA5D8EC8752CFEE88F99FA24309E3EE92E42ED834E7DD12A7A32E3E8D9486D96170C171425A853005069E73C671BA915B74D81F98294DB6D981E9EAA4145A7B3873BA7B216EC969C7B23D4967E81A148A8B4C81824A90D0DA01D98D529B5E8C7BB05EDFFAA65C0AAC8ED0D949C068FBA96D8F439272EC9536B259A36000B423B1C41BEA674F64E9D912EE80367D38C6F46E308B1B76DB2526AA39C9D81F64D6595DB969DBD910F2E06956F2011951FB85E9A36C94BDCAA1C327A8F651A96503D536CDCEFF0044CC64AC7D4D5C1E70A4767D1A2770C838F7500B971B2828F3C9107903F9FA65049BC723E36E22A6807B6155CCE4B889A3A68413B99D6366D12C898006389F7C27725B9CDFF1307C85C4D59E376EB26D196C7EC476515BA789CBB4A4F3D5BC7FC2B13369B2643ACD3F91C187ED3BAAAE08C9CBA400FB9F485AC35B003CA268C9F870385F39EEDC5EAE7E4BAAA5703D413B298F871D5B24D5C5AE739C30720925525E2DC9F269E4F3F051F69DCBFBF28E2397D5460FF84B867F44465D6546C6798FC167F8F380BE6E718F53C91DC25039B01C7F98FBABCB4DEA3756D824033CF1B4E77DF65771F894BB327279FDCBE4E96AAE3FD8A3D9F2E4FC6E854DE23F4E9DF2E3F6C2F9DD63B9B5C5CD78DD84E7277EA9FCDA9A000E1B9F82ACFF000C8F4535E69FEE776547890B064FF0C63FE24D87885B01FF00C31FF9D7054FABA2FF00E030FDD22DD6707FF6767EA81F8C805FC724BF277DBB8D7643D1AD03FE3FFAA754BC4FB13BAC81BFFCCBE7DB755C44ED0347DCA336EB935DFF00843F551AF11165A87D4528AA767D06835BE9E3FF00D6B09D0BF581DB36AB24F4F52E17B3DAF9BA8C7DD3BB9E99207331E411B8C152FF000840BFA825DF2774C3596AC80D979BDB072865D35E5145332167E771C379971C704F50CCEB9B2073DC40EA09D9483C46DF5F4B78A27825AD32301C74EA137F0483E478FD4B25F92F7E2EF18CDB3D2F686B9E32D2171F6BCF1055153290D91E3FE0711FA615E1FB412D07F77D0563766BE368C8EFB05C05537C737063EBEE8E1E2211764797EA194D34CE99D11C74BFD110FA4AB95A0F67BCB863DB055C145E352E6E686DC69A1AB6F471F29B923EB85C2541C49A867571214D74DF19A42E0C70041EC5694746AB6BE8C6FE28D4B72ECECCB5714F4DD5BB3514D2D13CFF00347216807DF0159FA5745D1558C5B35144DF686A434E3E32F2B8E6CF353D50F5C4327B848DEF85C3FDA53BA461FF0075C47F655E7E271C9D9A31FA872AF96760EA6F0CF7E9325943497267692395ACE6FD0A859E085C699DFC4A27D11C7E58C99467EBBAE61B47884D45667114F71A80C070222E7161F8C92BB93827C78D5F35B85754D3D1491386637487D6EF95979BC5423CA46AE0FA935125B5B8B5FF003FA957D5BB5251FF001E1A591F1C7BF9CDCB5E31FEE0EAA71A0BC69D2DC58FB66A4A30E89C3CB74F2460BF276C1C8CB3EAA6DA73C7547E6986E94CC89A3D25F08CB73D0E7E10FE32F0AEDD5D4C6EF6E6B268DDBCCC600799A7A9DBA38208A9615ED2473C7AB759A34DF4D1CC3E263C0D8A58CDD74EC9F89A2702F753B5DCE6361DFA0F65C7EEACE7041CB6569C3DA46307A2FA03A3751D55A40AAA191D3DB9E7967A779E6E41FCCDE52AAEF135C06A5AC84DEED031CDEAA8819FCA7A9C81D16A6975CA5C3313C8782705BE0ED1C7554DC12107AC29DD7D53B3EA1B8D8FBA1324C495B0A57C9C7CE1B1D1A3D6B95B94A7E10E32888D082236CA8C143DCB6E6C744AC44F6DB701CA13F9AAC6142686E180064A90413E4235C8CD8EE9C02EDFA6149F49E919EB66653D33799CF201C75DD01B450B8E30D2E2E76001BEE57D5AF017E1562A2A7172AD8479CF01D1878DC03BE7741396D0E29B245E103C16D35A618AAEAA21254901C39864B49C1E842EB0BCD34B23794111B318C37B0F7F8FA26D4DAA03DE4331CAC1B91D3FEC2856BDE2586F34709F51EAE1EEB373E651566A6974D3CD24A2809A82E3496EC98DA259DDF99E7D6E1FDF0AADBFF11E57073A479C6E4676C0427566AC8E1E691EFF00E21CE475C95466AAD7525413CA486E7A2E13C879175513DBFC0FD38A94B222717CE2A17670323A64F5FD140ABEAA499DD7AEF84368E3738827AA9A59ECE1D8F7F75C8CB2CF2BE4F51869F16923697443E2B23F272329F43A5B9BB2B260D33DFB2254961683B34FE9B2923A572ECAB9BCA462881D9B48341DC05268AC990761B29452D84E73CAD1F54F21B51CEFB0E9B7453AD21972F28A4B82B0B8DAC8D81E63D87B21D3DA9CE1CB2608FF000F7FFCCAD2B859583A6DEE503ABB0C67F9DA3EFBA5E9383B43FEAA3963B6685784BC5292824F25FF00C6A479E57324DFCB69EB807AA8578B4F0334B5D03EF9A74815182F9E959BB26EEED87428C54D85A5DB16923A6EAC8E0DEBE7DB6511BBFF007794E1CD76E37EFF0045D878BF23B5ED9B3CB3EA3F069AF5B12FEA7C7BBDD8DDCCE0E8CC53C648918E182D70EA307B28C53B5C1E398617D5AFDA09E10595707EFEB3B1BE73473D44518DA46F52703BE17CCB10893D58E4734E1EC76C4387518F6CAEF31CB747723C7F241C5BDC11A598F2FD9472F8325180FC74FBFF00D10AB93B7532764086D6C66E8DCC3640E097051274C4B7AA576391FB83B7287129E57F54C903119E645ED1103D90A036466C72EE950891C14830835C631952374839547EE2F19474205BDA9A3D89D3DE90704C2192C25E66FC2D0310D084D64396085E4C21664F84E23AB4C56F1F544844A2D072A570C20050EB4546308E4D7338EA88435BAD6804A8AD5D66494EEE75049EA843CA111B1917BCD2B45E42237F34AD7996179211E5ECAF2F2423D95ECAF6179211ECAF2F2F2423CBD95E590121E8CC69CE122C0956A12C6342B1B5692BB0B6E6D924F4C4D211CAC95AB8ACB115147E4DC14A858C2F1098546CB2922E5E4742A2E8A7873D1492DB64E6C67A774F2C5A531B9533B65B4BBD2D1B1DBA260A481B45680D1E9526B4E9E73F7EC8A5BB4D8675EAA6963D38F930D0300FB201E3C7200A2B5B5B8006EA4D6BD38E7F5180A7166D04D0013D7E54968ED01BB6DB2165C8E4B0259F4CB58065A32A431D13477FA0587F2F4E8961801303277D1A193B72FDD25355728F48EBFD137AD9C8DCEFF4426BEF38F5120003A22489B65C47150F7F6DC77F84DA091EFC861DFD906A7D541E4F37F0D9D39B3FE4A137AE38D3D056C2C67F103E40D7B8EC0E4E3F44440A3F90CEA0D46C8B98BDF87B7F9573FF001438E4D66582404FF8475529F1D3679E96586BA95D882AE26938E8091BE17193E377FB477AF3DCEE984F82477FD6F34F93971693D3D821B497DE53D10E6D6E76FE8B663024452764BE9351E7B80116A2BE35DB6CA0908008D93E8E5F6D94DB48EC9556DD1BD03B27AE15A1E16AB01AB91C0F40A89964D8F7DBEEAEAF0687CCAA99B8EC5284558CF23DB46BC57A60FB94993D7255B1E186B03E9EB29F39CB5C31FAAAC789000BABD9DF0E44BC296A4E4B84D4FF00E2710A575602BA2A9D4CF7535C2A22E80E71FAA88576A470CB76D8AB4BC57583F0D7174A3F98AA1EBA63BBBDD049723EE63D9B51B8F5272B58751E3B94072BCA2A43EE64DECDA84B8FDD5C9A4E2E6682B9D6C9372BC7D5743E85BE3791BD14F0686B64FA89BEC51DA3809085D3D5B1E36233F08FDA671B03853B684DB235C368DCDBD35C06D9447C7135DE65248DEAD73493F4213BD150B5D78601EE3A290F89CB289E78E21B90338FA22DAB682ACB238D36C6DD34353CDF99F4EC1F2760BE6545642E8F3D08CAFAADE132D5FBC2C574B7BB73144FC03B8D8760BE7C4D6330CB570380CC723C6E3B02556682454F4FA69CFE9945ACBA4646BC3B07628D69C76657B7B02ACEB05A9A71D324E514509B0DE83A620372D2AD78E9B999CA011F2A2B61A30D23BA994D57C91736D81BA9BA2294E8ACAFDC3F1595F4B48D05F991A5FCBED9EEBB938A93C76CB5C5003CAC8E10037A1E6E5EAB9CBC2B517E2AE5515CEFF6748D2ECF6F4AB23C61EB9FC469C757346E652C691EC364D38C5A24C6E49DA3E796A6E273CD4D40E6718DCE39F61BAB9BC2478B77DA2A9B4D50EE7B74C791F1BCE4343B6277FAAE50ABA9E6F51EAEDCAD231B1CFE6ECB1F2E052E11AF8F5D35C367D49E30E9736B91979B68FC55A2B306789BEA645CDD5D81B0C209602DA677E2A8C89ADD5831343D430BBAEDD9535E0CBC54FE1C7EE7BA133504FE8E57FAB949DB6CFB2E94B9F07A6B497D45B81ABB4D57A9CC233E5736FE91DB0B98D469658A7713D0BC6F91865C4E190E02F143A0A2A3AE73A13FC29F2F681FCB9DF0A927B174F78BD8DA5F139BF97FC27AB7E173AD1DBB9B7CFD9749A36E58F9380F2918C72BDA696AB317952E1A57D0B6B553060030A4114ED0168A462AE8AC6EF66E44214C356D6839C287B5031046868C9EEA496BA7E8132B547B74FBA94592D2F91D1B18399CF7068C7C90893A0E31B3A67C0FF00DF74B93257ED4F010E7023638DD7D2DD75C4421D1DB2931E61018DE5E81A36EDD1573C13D27069CB046F7340A9A88C3DC7BEE3A2DF87EEF2E29AE33B713CC488F3D434F42DF65979F50959D3E8F45EAD5226F7ED4A696214B4E79E5C7F19DEC4F5DD549ACB5E474F1901D9948F7EE836ACE22F90D79CFA9C49CF7FD551572BE3E7797969764FBAE275DAF6DD23D7FC27838C62A725C8FAF5A89F2BF9DFBE7B2630869FCC7949E813414CE2738207B2DE1A7775186FD572597748F59C18A187192EB4D3336DD4E6C12B011F4550FEF47B0FA4731F6F7FA29058B51B9BEA7B7CB19DCB8E11E0C72B5C199ACC89A7C9D2FA3AD2D948CB7656143C38077E524760D1BAE42ACF16B476E070E6C8F0361CDDD43DDFB496F73BBCAB75BDEF24E1A5B1978F8DC03FD5769A3D3A92E51E33E6B3E68CFFD3676CD6F0CE624F246E68FF7B283D470F6566EF2D681EEE0172EC5AB38A5716F3C34F1C313FBBB958403F539FE89CC5E10B5657B79AE9A87F065DF99AC71207C7A48FEEB467A2C6B930B4FE473C6552765EF78653B061F53037DF2F6A83DC1D44E77FF00ACA95BEC32323FAAA9EBBC0453427FD6F53CD2FC3798E7F5714CCF841B337FFDA3349F57119FEAB27360C2BB6755A5D5E7C8B8BFF05B0EB6D1B8FA6E94B9FF0089BFF3446263F94B592C153D810E6E47C854B7FF00A28D9FFF00B4CDF5121FF9A6D27860801FF56BB4F091D073BB1FDD51F4F0C798B37231CD91353E51D77C20E258607505690C64A0B073FA9A4118C03D17CE6F1E5E1E7F715D0D540D3F82AC25C0F501EE39C6DB615B4EE1C6A6831F83A98AB58D3B364700FDBFDE3BFDD4F753EA937BB3CD67BDD21A3B842C269E477AD8F701B61FD37FAAEABC6EAE953679AF9DF11B5BC9147CD9966F4F519FFBE884D4BD119ED4F864969E4DDF0BDCC27391807AFCA8F4B37A88C92BA953DCACF3B9AA74C4E49B0519A47E5A803D88B5049B0099764630BAB3A2188C5D9D92843D3311908C5B5C074414223465388930A83CA3280DC2A374B73EDD4A1B5A11588F35E976B134A58F2548E8A8723A25D880EEA54B32876525759FE1226D895088955429B16A94565B3E1079288A1A1038356ED6A78DA0394E5D4640E890865154E12AEB914D8E7D920E4D6217A99729B2CAF61308C2F2F2F2423CBCBC02CF2A4230B21670BD84846179670B0521185E595E090E616E16AB76A412366255A16AE62DA26212C411B949393B6B33B7B2D26661312C90C9E16D1352985B06A9194999216AE0B65A943F231A15E5825654A39DBB4365E6EDB297D9EC200F48DD11B6E9F73B181B654DECF616B3AF50A30B6832C9A433EA77F5531B7C1E5E394631DD6E1E3095F3F6C65012442347710763B14A4D54CED9C85189EB307AE1262B3A9E6299BB26D9F80D495FCDD76013476A260201EC834D5BB125CA37592C921C34619FCCFEC13513C17C1359EF2643CB1EFEE87DC29E0E71148F1E74A366E7F4D957BA8789B1DBD85AD734BF1BBB2B9FE9F8D4EA9BCD1BCBF2DF35ADEBEE51071F6BE7A265C61E241A074B03C3839BB37DF75CCD7ED6B5350E12BCFA63702DF7D8AE8BF1F1A5CC55F4D3746D446C767DF60A8EA5D1AE7C24E3D242490396A5D1D7D24E2FFA4803EB9E95BB772000B836781E03A376C5A4823BED9EABAFFC09EA70C9A7B74DB3256B9A01EF91B2A1FC4468A341749D98C35CF71FB13B23DA67BFDCA8639718FAA20DAAFA267551E1C7FA24E2F94290EB80D47394EA390A614F27644A18D4C98A51E05E9A3CE46FD0AE81F029467F784CDC67D2554160B4171FB2BFFC08D016DDA71F054918F25664278DB3165F9E3A0C90A3FC32BC0A4BE30E462478FA6E51EF1394E5B7C791D79FFCD57BA8A2315653CC36F5B77FB846F863AE8BE3C74698E5104F8FCED073DB70B8F2E7B346DD57D09F1276B35DA769A60DCB98C193F002E05B943985B9EAD241FB28E51F9111E0BC56CE18E8B0012A01198E5C293D8F56BD9B64A8C984A523690A48B116BE9AE2616BB7270AE8D19AB5B316EE07DD722B1E47EAA6FA37533D8EC052EE18EB8E09C225BFB1BD47C6F953BE30C1FF00B71B17B0E9DC7D9433C09DB8D55FA1EE19973BECA57C67ABE7D6AE630FA43483F51B29A33B540516AF80BBD065D6EB43DE48DF81F50B8CBC41DB3F097BB9458C6EE38FA92BA47C2E5F3F0FACF909E5127A4FDD557FB466C069B51CD201E99F3BFB855E5C048E3817EF2E577C953DD0DAF5AE780E38C6DD554B7ADE471ED9E891A6ABE4391D902950CD1D9B62BE0232D2309CF106FE22A07C9CC32EF48DFA65734E91E22BC16C649EBD55B7ABDC6AE0A4A58C12659583EB9214EA5C0A92ECEA9E0B69B75BB43DCEE2369666BB94F720FB203AF819F86F0C98CC8642E71EF925595E33EB9B63D1543403D2E9A2635ED1B1E670518E1BD9BF1FC389A1682E7C20BBD3B93B6547B931352F83E5E300F2FAF4FF009F65BD347FCC7703F2FCADDF461A77EAD25A5BEC413DBDD746F86EF07F597C7B2A2A63751DB233992A1E0B5AE1ECCCE324FC289C922C6387C932FD9EDE1B1D77B97E36A63C51D31E77978C31D8ED92BB7A9F8A3241A8C5B4161B54ADE4647D403D36538BD5B68F4F5863A5B6C6312B30D7747BC63F3B8AE70E04DA5D5373757557FEEB461CF9242766B864E32B1B327291D068B88CA4DD1CC5FB4634F8A5BC18980363792E681EC4EDB2E6FB743803A7D55D1E2C35FF00EFCBE544CCDE9E171646EFF10076FECAB8874FE31B6169E18ED8D2307513729BB1BC4E277093AC73C0254A68ED381B8FB252A6CDCCD3E9569902E0A6EE1545C4E7DD358DBB8533BE697C679461459D6E734A8D8BB2456E1B01D7DC2E98F05FC2B172BBC0D2488E3707BFE31BAE6DB0C47AFB2FA4FF00B3EF4F3692DF59729180383086B8FD14799ED8D9734B0739ED2F2E275C7F1B7086D9112E829F979C8E9CADEA0A13C53D5CD8B0C61F444C0C681D36185EE1BD57247555F2603E673830FF00BA4AA2789BAA3CD98B2371C67D5ED95C56BB3D267B1FD3FA1539ABE900AFF7C74F26F9C67A2714544DEEE2D01059ABB9760327DFBA6370D55146D2E7C81800E8E3D4AE3E309E491EB5BA18552FC13475644C180438A8BEA4D4D4D102E924031DB2AAF9F56D5D63CC743039D9D8C98381F39462C9C0269C4B72A92E20E4C6D3B8F82B563A68439C8E8C5CBABCD916DC686172E34B9E7928A9DD3BC74383B7CEC13CB7F0EAF973C19E7FC3C2772D279481EC07BFDD59B61651D337968E00D23F988F51472396498733CF2F6DB646F538F1F18D7F7215A1CB955E493FE847749F87FB152EF5464AE7F52D7FE5CFD42BBF49715E1B73792DF6D8226F4079413B74DFAAAFE8A8D8DDC927EAA474F3B3941E56E3BE3AA05AFC8819F86C33552564F5DC75BACF9C96B01ECD7168C7D92126B599FB3E5764F56E495126CEDC65A16F1CAD3DB7F74D2D6E59F0D95F1F85D3E27EC8862B5C0EFF00989F7421F6F61EA00FA2C49567A6520F248CE5539E494BB3531E9A30E90B8B2C23B9FB24E5B5371E9271F290639C9491C7FC5F5559B65BDB4694F48339639FCE3F979886FF004522FF004B83D8D8AAE164ADFCAC7776F6DDDD502A73D7E537BB447939476DD5ED3E6941A31F59A584E2ED1C2FE26B460A1BA485A396397D6DC6F92552156DF5673F6C2EC5F183651353435007AE3D89F85C6F2CB9395E97E3F2FA90E4F9FBCE697D0CCE84643EA4BD3CB8726CE3B95A92B4AA99CD2E45AA24CA62F4A4856A50DD8F479813A84A6AD0956392B187ED7A42A42484ABD2CA9C43CB6C432A736AA618EA15794F5982A556AB96C9EC44A6A3184364902695573D90865DF745620CCACCF64C2A28C27D43579093AB012A10953D0848D7538C2791D48010EB9D40C266222F520F3148BD39AB1BA6EE1D1463D1A65642C2C809508F10BD8595E28A86321AB6E55E056E98469CABDCAB62B05C9873521630B62B04A431A10B0B75E4E359A2DE359C2DE16A16C923C8E1A364A44C0B4704AC67DB010597F1A14000DD6B2B33BA5DB3ED81CA909223EE95924C6C5ABC0250AD148663E19A95A382D978A41354224ACAF382F22B23B3EB45351868C06ADC55069DD33756FB7443EAEBBD8FE9BA8EC384ABB0A495C3E83B261357E0E33B9E88799BFC5F6FFD1212C6E3B8C91FD503658DBBBA14B85E1A3BEE85CFAA83463A7F54957DBDC72C072E3DBBAAF6AF5CD341E636621934648C3CE0903E0A8ECB78D5764D26BFE7771C37DCECAB5E2878826431F951B80DB7683BB8FBAA93889C75926E68E37EDB818E8A99B887BDDCEF39277EB928D0391B5CA25D7BD6B2D59CBDC434F6CA6561608AA69DE1A4E256107EEA3B4129E61CDFA29419C86C6FC630E18FB23F90B76E89D9FE3CA844D69B356119FE1B1A4FD82A8F4E50B0D3478C6ED19FD15FFC6A3F8ED1147372E4C0064FB6172DE88BF35F4A083BB3623E8A7AE2C812DA19D3751FBBEE74F50D3CA0BDA3EBBAB4BC78E87124549726373E6B1A5C47D1529ABEEA1D1B1E08058E041FA2EA4B9BDB77D2C33EA929D9D7A9D822A032C77747CF5BC50821AF1EC817967AA9A545B0963C7F81C47E8804349EFEEA36A88228670CA46CA456676484327A5C1FB22364930E03E534586D970E91B78DBE8AF1F05F461B789BE8553BA4E61CA0FB0573F84138BB3C8EE0AB702BB456BE2568B37E7EDFCCE55EF106DFCF0B081EA6107F42AD3F11F1FF00EDB93DF98A85DCC35C790FF337FAA793E41B3A8B429371D2AF68DCC51EFEE080B81EEDA7DCD6CCD23F2B8E3F52BE817ECFAAF8E68EBED927A8BA37F2B7EC5724F152D3F87ADAEA7230E8E57EDF19384D2639CFCCA4C9C613C65B4FB6E9FBA84B5D9F9524B75003825414223D1DAB6DC24E5B4E7A0531A8A16FDD21F87F8D92A1102A9A02074EEA41A4A97D5BEDB22335BDA7608CE9EB4398EE6E5F48049FD1108EDBFD9636606E5533BBA471BB07ECA95E2FEB5E4D61573F3E0472380FD574E7ECD4B4F25B6E95F8C7235F8FD0AF9E7C52D55E7DEEBE5CF595C07EA9D3A11D0FC3FD7823D4D45520ED248DC9FA956B7ED6BD3989ADD58D38123013F390B8EF495E4B2AE865CFA992B3F4E65DE7FB4A694D4D8ED9563043628C67B74097623E53DEE3CC8081D7AA1B20FB7C29E5F74C3A4208700794103B15AE9CE1997BB33BDB130772762A39248350B02689B63A599AD1EE0AEC3F0A7A11D72D43474E378E94B6478C6DE9DCFF006555E92D12C738436D864AA9DC71CD0B0BDBBFF89C06CBE91F840F0DD5563A0AAB83A2F32E92C67CA85C31F986C32926904F15F07237ED48E2C8AFBCC740D786D2D330076FB07306303E55C7FB2F3503AA6D974B7B99216989ED843E321B265A40E571184E6D7E0AAD30CF3DF7585633CD9E474FFBB9D206F9601CE06F977D3A2B17827E37ED75579A7B158A8636503472FE244618FDBA0F919EFBFD540A4ACB1E8C92E8A4B46F814B558DD5379D55235913667CB4D441E39DE4B896B48FE6C9ECAEEE0ABEE7AA2A2295F0B6D9A6E89C1D4D4AC6F96EA9E4FCA5C060B81013CD4BE1027BB5F2A2E7A86A89B7D2B8BA8A87CCFE1C9CBBE5C338FB2CD1F1666632E570A76B60A1B646EA7A7841E5697E0869C743F542D5BE0274910BF16BAFE4B8DD21B45B41126430B58368D8363D3F28C6EA9BF143C4486CD40CD3B6E979AA2501D5D2B4E48711EA6E426278C4FB3514F7D95F14B73B839ED647905D1B1DD1C3B8C2E55A1B8CB59512D65465D2CAE2F25C73B1EC92C5CF23CB35476C4236BB106461A0649DDC4F527DF28952DA76F5754936E806DD12C6EEDF75A09248CE6F7309436A18FB7559100C61378EF430374A47563B27B42606B959C1CA895D34E0EB85604F3051DB9CE3A219240C7B2396FA30D2DDBBE3F55F4B385F6B1069EA5A68DDBD5B8170F8EEBE6D4B2B44B18FF79BFDD7D3AD25531C367A49DDD1918E51F3858DAF96D81D3788C6A7950278CDABE3A4823A484EEC6869C76242E78AABA6CE2E232569C43D74D9257B9CEE6CB89500A574B59261B9118EA579EE7B9BE4F74D1B8E28250EC2D73D62F27CBA706479DB6EC8A58B85625C4F719091D442D3B9F84EED9411D36D180F7F728ED0465C79DE4FD1509EA3D3E2074BA6C139F330BD35D4C6043490B69E3E9CD81CDFAADD96304F34A4C99F6D938818C1D13D655EDD141EAEFED9AFE925F6A166527281C8D007B77FD53CF3FD3B8C26BF8BDBFEF64DE4A9C0EB94DB5AE506B12AE426CA9246E365A47540118047D7A206FBCF2B4E49410EAA24F53B74D92B13C65A14F559EA404AC95CD070E7807FC95546F9338FA729D8A79E4C75CA2DC55941593FA9BFC4CFE70508A8D7CC69C6420B4DA0DEFF00CCF2114A5E1944D1973B250DB0290B536BC27A0CA2915D9CEC61BD56B4BA3A168C81944A2A46B40C25C91CDAA1FD10200CEC5277BA805BB2D3F1082DEAB36C295CEA8AFE9EE207C68A46CB6DA9040243365F3E9CDC123E57776B4B80752D4464924B4FF65C255BB48E1FEF3BFB95E83E1A5703C33EAEC6A1946939DF649F32DE41B85A2E92F93CDD3342560AC90BC84465A56AE2B2B525218F072CB9CB55E4E31928DD924CEC821525D2D479289087F5D4C79738D9469DB12AC7BF5396C5DBA2ABAADE798A420F5BEE181D52935C7E7651E867C2505492709AC41392E3EC53696AF299BE42BD03892329C42D23136730FE8A55476F0E1D132B9DB7973B254191E5B05E2CC2C26059EE658CAC96AF61358C78392A1C904A353363A375A14A049C813208C732F2D42C829C168CAC82B0B052B04DD853885A9B4613B8428DB2EE28D9BC9D52ACCFB858D96DCA84B8A3429CC7E3F458C0EEB78CECB6E548190D2462464761389D8729BD446A633E6B912E658F316A4A4C14819B142BCB00ACA44567D4B7D500797B26938C64B4FE8864F59F1D510B372970693CBBF751B4F6D96962DD1BF91BD3B4B8E0E093D3E3EAA41436C9DAC748D6F3866E7977C01D72A31C55CD9E5A5A8941FC3D43C379BB6E7AAB0B873C4A829EF34F46C227A5B8C041037E47387F451BBA2E63838A00F1EB4FBA968A86F5484399CED1501BB868C8079BDBBAAD3C57705286BD96FB9B1E206D5C6D6BA46FFB3E7207E6EDD5754F0E3868EABA7BDE9D9C802473E4A62EFE469C9007B765475068695D6BACD39736964D48E73E91EEFE7603B161FA7B2AB927B0BB8703CB3D871EDE3C2857C7CCEA6920AA6751E5B81710ABBBAF0FEB60244F473331D5DCA7FA2E8BA2E10DCA97D56FAC2F68D8B79B7691D4145BFF00A42BBD380DADA3350CEEE2CE6D875ECA97EB9266D7F079D1CB36DB7405C01243B3D1E08533BA5939A11C801C027F45D011EA5B15700D9E95B4D21EFC9CB82B359C0BA2702EA4AC649969C37987E8ADC353BB9B33B2F8EC907D162F875A8371D1971A73873A00EF49EBB03D170E68FAAF28CB1105A399C067EABBBBC0B581F0C776B74AD2D124721692763B15CB7A83C3CD6495354FA7906639DC394FFC4B47D64E251FD24E4E995B5C2A0BE39185C01ECBABFC0A5EBF15495B42E76E637603BA6C0AA0EF7C27BE44DCFE1192003AB5BB9529F09976A8B75EA365446E8BCF3CAE0410DF56CA5C7962FB20F46717544275459BC8ACAB81D8680F7EC7DF3D47C2AD6B60F56C46C575378CCE19BE92ECE9B05B1CE3981009C83BED85CE32D540721CD7EC7A889C3FC90CE4AE889E377D11C99F94EE809E6053FB845063D32E3BE39083FD90DA79181D8E627E7184F1710258DDF45A5A62B881BEF9E80755D23E0AA1E7BC86F7703B2E5FD3F3318038C8DE9D33BAE89F0257D6BF5144187EE4642994A80789DF447FC53B0C7A8E58DDB6E7FEC2A9F535C84733434E55B9E380966A69DD9191D33D0FD173DD5B1F2CDCEF2D007B38279490CF4D2F83A67C12EBC651EA484B89E49806B80EA73B26FF00B45346FE0AFE676B7922AA1CDF5CEEA8BE1E6AA14D75A2A86BB05B3B0120F6E65DBFFB4F2DADA9A0B65D1A3D2228C39DD89C042A6A5C10CB14A1DA3E725C5C1C7D2E1D51CB6C07946F93F0BD68B840F393246D24776652953272BBF84D7CFF0011C6EFF240D34C6516FA43B0FCEDCA47C9580D68EA7FE49FDAEC3709C7A6D557203D30D70DBF452BB77022F338E58ACB5409EEEC8FEE996444F1D3649748AF8D4339B048072A456FB982D7B1BBE5B8FE8AD7D2FF00B3AB5054E1F34905BD8467FD61E323FAE512B9F8279EDADE79AF14B3FA802D88F5DFA7529F7FEE4BFA39FCA3AABC3A45FBAF4357D4118F3D9272E3AF42BE49CB54E9AA5F29C37CC91CEE677D57D90E30D87CBD27436E6CECA6330687C8ED872B8609C7CAE5DA2F0C5A1ADCD06E5709EAE50038B207E1A4919C607CA8259947E4931E872495D1C6F4776619A268782E6BDBD013DFE17D3FF12DA764AED0947E4452D4CDCAC0238812E27036C75554D83C41E8DB5B832D9A7CD5387492A1A1FF007C90575949C64AAA8D36FAFA2860A692205F1C41A391B819181F09433A91667E367056D1F37F855E00B56DD391CDA56D147CA37AC3C986FBE0EFD3B2E92D23FB3B2C741CB26A1BEC2D95BBBA064ADF28FB83BAA8AF7C54D637F70FFDA4E863792DE585DC8060E31B63094B7F8259E4FE35E6F2D6C4465C659F98E7BEC5C4A8659A374491D0C92B7D7FCFF9D1D6549E2B343E986B69EDB032594FA5A68D824323FA02E3BF52A77C70F145534962657C70F975758314F4E46256877E5247BEE171BF04F817647DF29E86DB236AFCA21F354104B4729CEC4A9678B5D5D357DF62A08278E9A2A36863A67E0B1BC9B038F750CE6DF44B8F4D053E4AE0F02AA6EA7F796ADBBBA063BD6C81F261CD69DC00DCFB7C2B0F849A96C305DADF4B61A490CAD91A1F525B86C8DCE339C775556ABBAD8E81FE65654CF79ACC6CCE7260047401B9C63E1593E04EF72DDAFAEADFC33296928DB96C6C6E3940EE5430DD66B6ADE2862F6F675EF885D5120BA50507361B53B3B738048DF2B9C7F68B5FE1B25A5B6EA701AFA8707C85BFCE7FDE56EF89EAC6BEE36ABAC4ECC11CE18F23A75C755C71FB58ABA496E14D264981F135CD23A1242D7846B9387949B6718D2DD1F3B83E7797B5BB35849200F80A40CBB7B6CD1F940FF355C4154E6907B1529B638B829414EB90C4B5A7F30271EC9196E87E53DA5B69212535B374FC829246D6EBA9271BE54B6DAE38DCA0964B47AB70A66DA46B5BD3B27484C8A5DEE0465442A2FBBEF946F5AD463A6DB2AD9B50E2FF00BA1930576492AAE079A277FBEDFEEBE8A6A4D40E669CA3C7F3463FB2F9BD54EE5E4CFF0089BFDD7D057C7F89B05206EF88B7FD162791B703ACF0BC654733C81D2C80B8E412A716DADF2C724781EEA25594E63C34751D52F495D8FA85C3E5E5523D674D26A69B2C7A07300DB393D4FCA3B4F5E1A0038EAABCA1BC8F7C233477407A8CFB2C79476B3D1749AE8B8D13E8AE19CEDB04B7EF007668393DFB288C75640FCDB1EC9FD2576DD7A2AD746CC6A4494C9B75491381B21B475793BA22482877AE83D833AAA5E61B6425A86C8D38F8EA966B8E33D92F4D201BE7AA923C81283413A1B633B34A334B08ECD2084C692A761828B0906C49C2B318A32F2B62325672F548495A49EF844248584F5050F9FCA1904389F83B236922AEE7F22905C88706E410B26E032763D7F4438D167F2B80FEE9AD6D488DA4BE7637B1CA1A72E10F270AE4755F73236193F23A20779BD0630B9CE0DC0E87A9FA286DFB8CB4D092C889A893A37937DFE81634E70DABAE444F587F0D4E0F306BB6711D549FA5970D83EBC1F18C1CC73E6A6AB94B70C0D775EBF50B8CEB23CC8F776E677F72BBC78AB590C343245011CAD696B8F73B775C24E6FF00B43FEF1FEEBBDF111A81E15F57CAF37208737759116774ABCE72B78DBB2E87A679AA5CF03291A934EA6674487226414951A2C253CB5B08D38084B952829CADC45D13A6C3D13A18423A07123A2B0749D8DC373840AC16CE676EAC8B7D0600C29521E81BA92DC4C7B76550D630871055F95FF2362AB2D5B62192E1DD0B4310C0DD961AC4BF918D97A92024E147421C51DBCB9486DFA51DF98E308C69CB16405326D830D0A4511D118A2A0E5EAB6AEB5876D8CE51F36A213CA4B5129C22B3ACD2AE1D820157667B4F4578D4D908081DC2CE08C91BA7DA036540EA2704DDECC7553BBA5A719514AEA4C28E8706839D92CD80E16AD8F747EDB6EE6085A1D017CB2124E6E5492BED3CA102946E990EF81BB612B52C4F692916B534E8D206C6842C25C3123CBBA162AE2CDA309DC47E1623A7CA771418EEA266860BA13C8C6775BC4FCF44ACB1E47DD693C78C61322DBB1D40077EA89414208CA14DDB088435981845442C52BA84019D900AB6E7A2295371416A26521427D8D1E526B79168D4E4523CB0B7E53EEBC980A3E9D55DBDCD3BEFF3D826BA9AE34F1C6C93CE6B9ED7B799A0EF8CA805DBC60D3432F9469D9247B65DDF756A6859F4FDDE9E47B4B62A878D985DFCDFFAAA99A4E3C1D0E930C72FC977F8BEE1E4370D2503A0673C8C8192B5E3AB0E012B997F670E907D55E3CF9813151467D4EDFD4D076DFA2EB4E105C5D2592BA866736434F13C33BFA31B2AD7C2FD8DF69B25DEA83713C8F904471BEF9C00A1C937149973D251BC4BB0A704F8BE2B755DE5E1BB52412B0460E398B738C7E88C47AF68751D34955E598AAED933A394347A8460905CEEE463DD736F856B3D4D2EA07CF28C1ACE67480F7CF62A7FA7355C161D555704B88A92E20F9AD77E4773FB76CEEAA4F2C65D9763A49E26A515CD0FF50F838FC70756D92FB11749EAFC235E0BCC9D4B4B41CB77DB70ABABC685D716A6B9D536C654D3B7F9800F739A3BE373F6C2B8F5CF81FA73526E361BA545B2697F89885E5D1EFBE40CE0263648F885697178AB82F708E8CAA760E3E42A8E18CBD8753ACABFF7E3FE7F83996A78B1433645D2CF3D21E8E93C9735A0F739E50BD49A2EC551EAA1BB18643B86176307DB0BA6EE5E2EA6903A9F54697718BA668A0F31BF52EDCE3EE81BB857C3CBDB4BA9E616394F56CAEF2A40EF86B8FF009A2F460FA65B7AFC8956687F8E7FDB9FFB027C385ADF43716874E2A1B2B0B79F3B6E3FAA886B5B6D54574AB8629E289B2CBCDCDCC32327D958D6FF0004F71A4962ABD357586ECD88E7CBA891BC9CA37C6727B211AF2E1486A246EA3B15CA8EA4FA4D65AA374B167A73640231DF2AC38CA31E0AF0D46172DCFF00C120D25C3AAB0C0E75D217FBB0E37517E36E86E464356D6B5D2C0F0FE663402403927214B786FE132C3726E6DFA8AB4CA46441212D9D87D9CC38391F455EF1BB87371B017C13569A9824690C32E79C0FF9A85EF8B4CB787369735A7C32EAE395923B969FA2BC421AF96958D3264077A5BD411F650ED31ADB4D55D342EA9A8A78647B007B4D335B877423384B781BD7F4F5D415F649AA2373DCD718D849E6DC1DB05727EB5A486D771A8A3B8C5985B2B8C67040C67B1015B9E668C886383C8E2FF3C1D793F0FB464A32EAEA6F9C31A1251F852D1B59F92E34CD27DDEC6AE59A5BB698971BB987B8CB804F1FC2EA5ABDADAC1393D03647736FF19502D634FA2ECFC5C64AD33A567FD9A7A7643965EE99A3B7F1E3FF0037053BE0EF828A0B25647574776A6A87B4FF00B31230B8FE8E2B8B9BE116F03D4FB6D7729E8637B8FF00F95D15A5E1AB82970A2BB44EA8A1AE1183D6473B97FA956D6B2D74674FC6ED76E76BFA22F4F101E0FADD75AE756565C60A738DDA646B4EFF0052151F71F081A4A9B3CF746BDC3FC328767FAAF78AAE1D57D75DDED1455669DA3631B8807F42A21A534C5A2DE1D25CA8E6618FF96471C93F4CF751CF55FB17F0E831B8DD98D53C0FB0B6071A07BCCB190F0F23236DF62BA5F57D2D2DD346D3B261E6FE1B01E06F90D54B69AA4BD5E1934969B553D3DBA369C4B558673B00EA09C67656FF0085DD3D5AFB55C28AAE00049CE21E4DD8E76F9E528B1669A57454D4E9313A568A4ED7A8F4752C5089283126307D39191F38525B7F890B153E4515BE338E84C40FF92070E8C16EE78AE741186B5CE313E7006465079F89B658C9E56D137B7234E7759F9F599AF836B4BE2B4EA172689AD478DDAE6ED49698C8E81C2203FC901BAF8B5D5138E58A81D193D1CD6636FB042071E59D292DF34A3A0F2622EFB8DBA22768D67AA2AF6A2B554C79D819A1E51BFD428E393348B6F0E9712ED15EDF2975457BB9A77D4347B73B80C7D13FE1DF0E6A24B851D23DF339C646BA40ECBBA1CAB8A9FC317102BDA0BA4A6A763BAE5CD6B80F80AE5E08F84EA8B4547E22B6E71CB585B8C3CB7D04FF0087E8ACC31E66D3662EA357A5E631AB2A3F1D77C9AAEAA86D74A5B1F951B1B2BDEEE46B3940193D951B4BE1FAD6C7F356DDA9DD21C73344AD23EC72BA938B9E0DEC12D6495D78D4EF63E4F53A1748D68C1FE51877363B7455ADCEC7C2EB7B4B6674D58E6EDCF1BDCFC9F8DD5ACBA694BE4A583C9E3C70DA9595F5E34ED8E9A3262A98A568180237873C9EDB0DD766F8668E26D8243551114B26400EDF2C3DF7E9B2E3ED1570D3174B9C36FD3B69702E783254D49386373BEC765DE7C44863A6B4CB490B98DF2E12303A1706EF852E9B4CE3CB657D6F915962A91C81C46E0FC14533A6A3BB88A82625C5BB07479EA07D1525AF35269DA41CD2CF5775987E56F9AE6B01F723383BA85EA2D72EA9F3691EE7F344E7E3738D89E8AA2B7DB659EAE2A46339DD2CAD19C64E0BB09DE0B914F2EBBD8A28FA4FE052862A6B75CAFD3C229D8E89E29F2DC72EC7033DCAE11D5FC5E7555C2B6A5C49F32478EBD81385DDFE30F530D3BA3E8AD2C204B51135CE0DD9C0B80CE70BE53D1D6729E9D773F7569634657EA25BB92C4B0C0E9A47C99E992063A2FA43E0234E1A2B05DEE0FF00CD246F603D3B1E8BE7A695672C65F8C34E00F95F50B4AD01A2D02FDB0656993D8F2B829238D5839734A6A887EB1B93E4D046A4FE76D5BDCD7E72460923754978AED3E6E9A3ED9720FE6920686CBDC9C7B956FDE483C3D91AD3B073DFBFB950EF01F5715FB4E5C2C73B79A40C7BA2CF6201E8ADD70669F304CDD0FF00453FD254F9682846BCD0CFA2AEA9A3782D304AE6807FC21C8E697A90D1CAA2F91C9B51538C2615B080739494974E5180502B85E94DD0A8975A5E3AF4456BEBF0DFB2AF6DF7DC009ED7DFBD287700D01756DC73D545692119072BD7FB9171C2630CE410A3931D2E4397770207FDF45DD9E1CAFCDA8B04A33BC0D3F7D97CFF00ABABE81746F841D625BF89A32EF4CCC7003EA151D5C3740DFF00179B6E5411691297B9BBFA8EFEDBA1F5164909F48DFDFDD0EADF361967A667A5DCE707EA52034AD61197D43DA7E1729E9C2F93D39679B5C0F26A6999D5AE207F84129DD0EA8C7A5C1ECFAB4A09556AAF847F0EADFF004207F9E530378B88FCFCB37D40FF00904D2D2E39F4D04B5D971B2C6A1D40CDB2EE9DFBFE88ED0DD1AEDC124F65464FAD6769DE9430FB8CFF00E8B10715278CE437F51FF455E5E2EFAA3530FD42E3F93A1A1BAF6DF29FD25D5C760D3F55CF749C71A869FF0064C27EFF00F24629B8EB5E4FA2941FA35C7FC9547E19DFC1B10FAA92ED32F81572E3F29C7B2D99513F688E1531071AEEC47A685E7E8C71FF00F252EDD7DA81FF0092DF55FF00CB0BCFFF00929FF83C97CAFF0024FF00FAB6155B5FF87FFE17B507E2FA888E3E76441BF8807F8BE5B063392F1B0FA6551169D3FAB6ADDCAD8AAE207FF88DE468FB96A931F08BA8A7F55556D344D3D79EA0038FA60238F8E8C799C957FCFC157279F9CFFE941B659951AD68E369F32A59B75E53950CBD71F6D7167939EA1DED923252145E102D900E6AFBC65C3AB6170703F7EAA496DB0697A36811533AB646F47CA3A9F74F2869F1FEE1E3D56B33FF002D15CFFF004C75D5679286DF2827A1E5711FAE31FD5486D3E1E2F75E7CCB8CC28E1C64B9C77E5FA2B1071A2589BE5D2523206FF290C1903F4422E775ADABDEA277F2776E4854F2EB71C17B228BB8F43A8C8FFD49703AB1E9FB2DA3FF007668ACAB1D6578E66F37C03F286DE755D55492E95FC8D1D236EC31ED84D268E1887A1A09C752803647EEF79C83D154596799A34724716921DF344278CB79E48395A7F30DC65733C126D27C9569F182F2649391A7F29DC2ABDD161DF0BD17C5E1F4E3C9F3CFD45AAF5F337FB8C5EBCD7ED84A5424DA16C4BB39387684A56F448129DC813621020A7D984A06AC72A5E26222348C08FF00A2774D1737C2442776F1BA74349132D3B4BD3B6CA716CF63BA85D927C614AA9AB005321E3C85EAA9C16F4504BE50EE4765318AE00840EF1283944D8055B75A1E5277485B002E1B2257B1B9436DC7751D88B474A423D2158829001855AE99ABC729561C5771CB952444272D285BD2C2338F743ABEF407B2634BA97053844B24A2EDD504BC5B0609C6027116A027A6112A2A884BC1A873C33B868D91913655977A050DB950AB435747179A4C47311E99EAA255D6FC9D944C3208688E54BEC50636EAB02CD83D113B5D3F2951B4123D5F6DE71ECA1F7AB3B587D2FE6FB2B29C3A6DB21F59A6DB283CA305350F22BAA204657AADBDD1FAFB3F95D4671D546AE159BE004801AC8300149B66F85E738E16AC08186B91E44D4FA38FE13381F84F5936CA166BE08F0641F8C05869C1DF75ABA65E1D1244ADD0A4F264FD12534CB56949CEE448AF2636A9A8C9C2479F1F2B131DD6244E674BB33E5E568634AC612861443C908720584EB90FB2CA7028F4F585E4B8E4B8FE889D9752D44079A394C641C8C1237401ED39C225476F77719CFF0044328EEEC931E5943A6772F805F12539B98A2AB3CF1D50F2DCE71EB9D976078BAAE82D54D474703BCB6CF3B5CEEC08711D7F55F33FC1D68E96AAFF0048D612D6C3235C5C3A601CF55DEFFB52F4FBCD1D156C6ECC70F23799BEE319504F0EE8D1A383535914D83357BE2A5B9D15444E0418D8323A6E065597C65E16DBEF74F0998064A71C93B76787636DFEABE745F38BD52218642E2E63037049C9D975B690E22CD5DA5DF5B4DEB9697D45A0EF81D563E4D24BE0EB61E523276C33494F7DD3CCE46975C6999B8032E7860FF90523D15E2C6DD56EE49E47D0CBD0C728237FBEC85786EF154CBB4621F2C0A98C72BD8E23D58D88DFAA7DC4DD4DA56AE5751DDA9D94538E9235A1AECFBE400AABD1CFF25F8F90C5F82E8A1BC99D9CD1491D44646C1A58723E7AA8A5F38496CAB0FF00C55B29798FF3F2FF00133EF9685CF63C3D5346E1259750B9A0EEC63E6DBE01194561D4DAAE87D20C35ED1B021C3271F74D1C12458865864E89349E1CE0A578750D7DC68C976D1C723843F719E888EBFE316B0D3F0B006D35CE808DDCE6074BC9DC38E09271EEA2D4FE21AEE5C1B57697023A960E61FD14E751F885963A00F16C96538C18DCD241FD42B7EE4A9333F511C53925249F2555A1FC534170B952C915BA2B6D4F386CB246C2C73C938DFA0EABA2F8BFC5E868668E9EE76A6DCF9D81F0BC34176E33839CAE3CD2FA985C6F3498A414AE74A0BA3E5E523073ECBABBC4B39B5346D9E9C1FC45BCB04A5BFCAC18CE548949F665EA638A334A2B81AF0D78DB65FC64622D36DB6CD33B97CF2C6B5C49F9C048F892F121A6AD75ADA7BCD80D439E32DA9746D31BB3F242E72F109C6085F4F473D2C85F246F8DCF2D38E52D239B2559FE32B4D7EFFD2345748407BE9E2697E3771700339215D826FB3333B8A6B636BFBBFF007B18D37889E1D4E3D56C820C9FF001CBF5C04B47A9F8792EF0D64D44EF7A525AE1F45F31ADB490E41907FC43D8FD15A3A3A828DC07F05A7E708FD28BF801EAB2D56F7FE4EF186BF481D86AEBFB07606A0868FF00F04A3568D29A5E695ADA7D4F7DAC90904471D4171FBFA5AB896B34851BDA408FD5F00AB0BC0BD0362D48C6060000EFB8FD11FA6BF057F566FB933A9F58F0534C090BAA7575D28E42378E4A92D70FAB790FF751DD0DE15B455C2B236C5A96AEEF50C707790662FE620FF38E5031F55CA3FB41AA1926A295B90C001EDB1FB2BDFF0065E68A868A92E17896169F2E37B5B316EE0E0E304A7F4D3F803F51923FCEFF00EDFF00E1D13E236DD42FA78AD305DE1B643096B5F4EC21B33C038C0C60EE8DD76A682D2DB55B2273879CC688E5FE67730FCE7BE4F55F2BEFBAE9F76D56D95D9919F8D0D1BED8127D576978F4D48FA1BC69A7C7E90D6C19F6030DD949182E882799F7616E3670AB48C75D23EFD7DB84B51F9C5319088DA0EFCA07B7650C83C44F0EEDACE582C62B1C360F7B439CEC772482807ED45D2B1CADB7DD5B180258D81CE68C649032495C5B4D494D0442470392011BFC277817744BFAAC8E35B9D7F53BA2ABF696D1C1FF00EA8D3F153F6697C6DFB76406F7FB48B5354B711329299A7A10D68385C2D7DD7FE67A63610D0319070A36750CA7FF0011E3D86537A5F8239674FB3A73885E2AB534C1CE92EB3443DA9DE5A7FA15D6DE10E9A6A2B056DFAE7513D64AF8DC62354E73834E362324EEBE65590C9532414EDCB9D23DA0FCE485F4A3C59DE8D9B46D0DB81E574D134B80D8EE029A38C89E6380F887C5192EB5D3CF50EF3073BB95AE73B943727180B4B653C52340644D046EABEA2A3716E475EBF5539D115320CBB97F2B48C7B84B600A55D1D91FB35F4C13575B525A1DCAC2D66C362BA975BDCC9AB347B3898647BC1EA32D2A19FB33B43134551538C07B8ACD92EE6A7555D5BF99B4F4CE1F4D8A915243B9D9F3EE9ADD8B85638F46C92E33D3F3156A7803E14FEF2D42FAA731CE8295C5EF3FCA0377546F16751086BEBA16643A49DE001D412EFF00AAFA0DE1C34E47A5F47D45D24259535511201D9C43820A0371CAFF00B4478A3FBCEF52C2C7FF000293D31EFB0C6D82B91D8C2F7868C751BA3DC42BE3A79659CB8933C8E79F7DC9298E9AA4324D18F919C2540C997A5974F895B454CDDDD2CB18701D48242FA8FE26A66DBF49C34E000D6D231A477CF2F75C0DE17F4C8ABD43410E32D8DCD71CFC10BB13F69FDFDB05BA1A56BB0FA89191307C6C3646809BAE8AEAF13F270EBCC230247386EB977C01EBB7D9EF94BCEE2D86B4F2127F2E1DB2E97F1637016DD036EA177A5F235848FA81BAE19A7BEF974F4333767C1246E0475C64226465C7FB4DB865F82BE7E2DADC45520398E1D1C4EEB952D172CF4DB1D72BE98F8EDB236F1A46DB7360E67C1130BDDDF21A3A95F2DADD4CE3EACEC77D9034392CFC7B8839C7C20D57212774FE22361F1D530B98C6E9C4254F507207644257923081D3C9B84663284446EE70807B95EA3839B7394F6E70948D1CBCA850F112ADA6DFA1C2977073551A4AE8A418FCC01CF4C28FBEA721326921DCC0F42832C6D51369F26CC9675E713EC3CF232BA01CCD780F7E3B1EE8A5A681B511091A7180323BE545F80DAE1B5117E16570DC72FABFCB2A6E6CCFB6D4349F5D3C877C74195C4EB714B1DB3D93C4EA21962AC0D59A6F27A21755A6C741B2B76A6D6D239E221CD233B7CA032DA39C9DB0560AD5493E19D7BD0C322BA454555A6C33DCE3FC5D12D6CB8C916ECA7A5931DA56E72AC2AEB2923040CAAA756CD2C2E3CB818F85A38350F27C9CFEA7431C2BED2554DC64AC8BFF00D936C763A1F24144E9FC51DC9830DB55B47D206FFCD57745ACEAD8CE7746D7B3E88950EB589E73E5F2388EFD169EEAE68CFC7B7E49CB3C5B5E7F968689BFF0C2D18FEABC7C575FCED98A2FF818D18517FC7870DB947D08487E14BBF932AB64CAFE11A78716397364867E35DE27FF006B5D3EFD984009B1A89A61996AA679F6738FFCD0B8ECC46E32D4A368C83904ECB2E7924CDDC51847A08C1A7A371F53DF9EDB9C1522B6C2C8F031D3A140227838F5009F36BDA0639C647CAA9384E46AC35B0C689A51DDDA3BFEA93B86A368CE4E76ECAB9B96A71D1A0F37BA1115C2576D82725575A6F9657CDE5DA5ED24773BC798F1EA21BD484C3F7E9C4A46795A0EDD96D4F662D6F33F3F64AD768A7BE8A77C7200704E3BAE83C760DEFA388F2DE4A4E0DBE19CF370AFF3A791C73B13F740AB25DCAF4D7220969FCC1C413EFBA6F52EEEBBDC70F4D248F22D44FD46D8D9DEEB301CAC38ACD37553328C5726F23533714F654CDFD5468966B8339EC9D46364D3BA78CE889818D0997E0A714D50426EE09363D1C41CBD929A2BAB863A23316A2DB7C2AFC543BDD6ED91DEE949D0505C160C5AB9BEE10EAFD4A0E70428354BFD8A6C253EE9590C83B5F70E6DCE10F86A883B2645E56D1CD8394AC6458565B97A46E32A491DE0E037047CAA869AB5ED3908C3755B80DCEE3B7BA352423A3B44787BBADD217CF49119636025C40E98555DF2924A595F0CED2C91870E69EA0857D786AF1E735A28E5A36C01CD91A5A0E4020918DD505AFEF52D655CF5720C3A5797119F739D91D85F02F4775F628B3750123AFC6EAACA9BBB9A7638C2528F549E87AA17260961D555877509B726318FEAA3F4B7DCA3149579C2421DCB16774BD050E7AA5693745A9230120D1BC34A005AD6376D863E8959A6C245B327485200D6508707076F955A6A8B7F23B61B2B8AB23C82542F575B439A4A1688915B10B31ACBE1EDF294A76A8A44F8D5B1ED1C79EA9E73048C676DBEE9C3E318CAACCDCC6A908B5C12733564C7BECB67391A149211ED95A4C9591D90B47F4448A7218B5B9EAB47B774AE30B580651229333104E98D48C2DDF09CC6DEA8B813117159587C4B29021FB7DA877097A8B691BE3A22940C21BDB2B7BAD290C3B1C91B63DD48900E27727ECD8D038A1BA5C648FD51C2F313C8FCA403D0AB9B877721AA74A5DA19C798FA37CBE5E773919E9FA24F81B57FBAB4149239A1AF998E0E38C1C386141FF65E6A731CF5D6D98ED56647B41FE60EC9462499C7D65D08EAAA2A881ADFE253B9ED27B8C74185767ECE6D425D25C2CD50302589EC6B5DDCE0F6532E2470F9B64D455307E582B4B9E33D3989ECA9BA426CBAA692A5AEE564AF6E48FCAE0E3D10EC258C995936E7369DD4CF6B4B9AD8EABD43700B4BBFB2EB2FDA07C386D750D15E699A1A6485AE716F738DD55DFB4CF43362AEA6B942072D531AE716FBE015D11E1D2EECD41A3DF4EE7665A2616B41DC91855DC7E0B70CAD33E5DDBF57D54670C9E4660E0E1C4615B1A435F5D00063AC94FC7338FD9427899C3F7D156BE370F43DC48FAE54EF415BBCA8F9B7FA2AF2C565BC5AC9C1934B6789EBC523C73D41E51FE26E7FBAECAB4F186A2B34D3AB439AF963DDC43064617CFDE2239B242E3D1C02EC0FD9E58AEB05CE89C79DDE53C807E1A532C04F3D6D91CF0E9AB5B75D4D40ED8919E7C0C6FF0021741E83B83AA2FBA86D0E765B51149CAC3BF407A7B2E60FD9C761737564F1B867C99A41F4C12AD0A1D78DA2E244C39B0D9C98F19FF16CA5588CF9EA5CDD9C93359C89EE76A7E79E19240C07B0C9E8BAFBF673EB96D7DB6BF4F557ACB18F6C4D76FD8E31954F78CDD19FBA35507B472C5560BDCFEC4BF7C7F5509E1EEAE9AC1A8696BA271104EF687E3A1E63BE548A1442E6E4531C6BD066D376ACA291AE6F2C8E73323AE49D825B45D606904E7FE1ECBB77F698707E3AB651DFA9632F64AC6BA67B06C09009CE1711474186B5CD76C7FA23DA576E45AD6BBDEDDB6EAAC6F042E326A72EEC1A551B6679C75F8CFBABF7F674D097EA394F50D6945B47B95152FED063CFA91EC6F7786E3EA42ED8BE3FF7070F9AC00324AB8B231B1CB82E49F12B68359AE1B086E47E21A0FF00E60BA6BF6965E3C9B65AADACD806C631F18096D2376CE15F0EDA70BEF36F7118324CD791EE4B81CAEB7FDADB756C7576700E0C6C8FED80152FE1AEC21DA8ADECFF000B99FE4ACEFDAAB4E2A6ED474ED3EB633A7D00492A634BA45ABC6787F7E6818266B048FA38C65DDF60BE5B5CEE3CF4EC0EDB00B71F2365F4CBC085D9D5F62B9DA1E72591BC60F6C02BE7271034C79159554AED8C52BC0FFCCA46E87F82BC2F38C764E2859970CF40B4A81CA709CD34386F377ECA356C1B4749F811E187EF3BFC25CDFE14243DD9E986EEACAFDA43C48FC5DD19411BB3153811803A0E5D95B9FB3D747B2D966ADBC4EDF598DC187DB65C17C50D64FADBB545513CC0CAEC03F52A4E50B831168D739CCE51B0037F7563DA2C0D8A1738FE62DC7DD69A6256BA204EDECA437A6F2C2C0D1973DED18FA90A4AB1A8FA69E05E83F0BA6C3F182E2E713F18543F859B8F9F7DD47519E6C36569CF6032BA7F84F18A2D2E03C729FC1BA423A6FC8B903C015C03E9B53D6BC6E1D3E0FB81CD840D0BA39474470C5D7BD612D3F2E582A8B9FB6C00765750FED34E314705351D86888C5331AD9797A600DC1C229E0234AC74FF00BEF524EC1863A511E7EFBAE2DE396B035F5B595AF7FF00B495C180FF00872986DC5155F5664D9BD1BDCAB1383DA69CF93CC0D1C83DFB28A696D252D44C238A3748F71D9AD19CAE8AB3697FC0D3B8C8C31CA472F97DF27A228A19C8E98FD9C5A1FF00117A9EA48CB21610D3DB23E5487C7E4A6E7A8ACD6E6FA9CC9D8F7B07B072BFBC09E8165B2D31CF337CB9AACF38CEC4B48CAA3AC363372E20555738E60B7C4E3F196A07D8A4CAA3F6A86B16F2515BDBB08A2634B7D8B405C3DA779E58C33AE06C7E8AE1F1BBAC0DCEFB52F0EFE144F207D9477853A6C3C83F1D1483FC1DEFC2677EF2D015946E1CEF843BEA1A02F97565B560CAC1FCAF7308FA13B2FA8DFB3D660EA4BDD2BFD4D11C986FFF00295F3C2BED61970AF8C0C06D44871FFCC50B1116A7A6C65B8E8A3F7B977C29857B3939BDC9506D41364EC8440E151D31D51DA29F23AA8BB7646ED722110B5C8FF5401D2952CACA3E66E7D9452AA2C142847BCC212B11DF1D8F54D92D11DC22DC2AAE49B699B9BE073246920377D9770F07F5952DD68FCA9403263183D7EAB842D64E305C0052DD13C469ADB309A3DDB91CC3E1676B74CB2C4DEF19E4A58A6B9E0ECA9EC535B9F9634CD48E3EAEFC88DB2D114ECF3299DCD9DCB7B8F859E18710A0BA5379B1B839C4012D39233F5C2D6BB45CD4EE33D13B6EAE8477F801703A8D17A6D9ED3A1F28A704C0959425A7D4D00850DD67A3454B1D80D070718EA55C163D5F4757FC1AA6FE1A71B00F18E629DD7F08256E65831237B0CE76FB2A58E2E2F83433EA2138F2724697A321B2C0F19209C0F6511BB5339B3F96E1CCCFD30BAC6AF841373997CB6B5DDC63AAAFF51F0A1CE9798C646FB9C6CB6219D457B8C3FD2A9F473E5D9DE4B8189E4FC13D13EA6D6F3F27A7191D7E55C970E17C201218D79EE0F55143C250F24B4797FEE8532D4E36B9217A0CA9FB188694D526A627E7D2F6042AC9AA1EF9CC6776F4C7CFBA3DA5B86B2C131EA5AFD9143C0B9FCF2E8CE03B70A19E5C56E8B98F0675D910D5D33A3788DA773DC15BD269895E1841249EA77576E9EF0EA4B9AF99DCCE3EEAE2D3FC26A781992DCB8055A791570588E095FB8E72B1F0F24001734BBECA5CCD3904039A70D60C7A47B9FF00AAB56FEF8E161380DC28368CD12FBC5634480FE1DAE1BF6D8ACE8C9CA5458CF18C31DAECDAD9E1D2E578A6967B7930358D2E6878C35E00EC4FBAE33D53AEEBE9279E926718DF139D1C8074246CBEC2F1378C34960B43A08FFDA88BCB898CEEE2303A2F8ABC4BAB9A5AD9A6A86B9AE99E5E43B63B9CAEFBC646308FEE78FF0097D465C8EA5C2238497389273BF31FBA55E765A40DFF0090FF00AA70EA75B4DBB39D496D1848FDD28CCE765ACB160A523760A76410FB855C99C89E3DBD4FBA63294D127C8B835E6DD3D63F64C7E538A7949D9132B43B1479D936CA7330C26811C3A166300A5005A352AD09A4498B94212B1221399C24004364335C9E2B5212842D4A56448D415BBA4256084A31BD538E3FB1307364A97C958397AF650FA0D92F5771384482F807DC9D9714D4396F33B2B50D4D6087ECF21EEA656B031BA845A4A92D1D6FF452FC0CC97D2C072308D53BF1D428EDAEEB9C04679F1DD313C7A15AB667A6C873E729C4AE27A143E43F28D11B09C4E2463DD08BCD2FA48C22744EF9495C8EC50B0514F5D60E579C6C12313519BE47EA284C7D557932E625C8AB09FD5389199C05E7336052F1B7A1509B30E84623BE30A6FA67873F88639E48000F75057B4E51EB1EA09E30E6B5E707AA2404C1B76A16C4F733AF29C21D8CFD1179E98BB2E77F36E86C91E0A2467CD8C67A723E8BD1C7EC9E364E63CA922DC3B953D158DA2837D822915B76270B6B6516EA44CA71CA8D224AE0893E80FB2CA913E982CA22B9ADBEA3B944E9E9DD2490341FCF235B8FBA869ABE4C1272A49A3ABF9EB293076F3D9FFE304902D9F5B3C475A3F05A2A8A00402F8E22EFB81FF35CC967AB367ACB45C22D9AE313242DD87AB0375D1BE3FEAFCBD2D6F25D81E4C276EFB357116B1E2379D6988647F044641CEE08C291324823BC7F681682755DBE96EF4CD1CD08648F701BF2E013BAE1FE2F46DADA3A4AD84F33E12D73BDC118CAFA29E1B75447A8F4A082421E594E6177725DCA70BE7BE97D3EFA6AAB95A2A011E5BE431076C7972718053A63B5C96C71B6DE2F5A4E09880F929583246EE180A21FB2D75E0A6B84D6EA82392AA37358D3D09C11FAA9C784DC4F4973B5487279642D69FA1C602E55D17767D9B5042F702DFC3D606FB65BCFFD9294780DF05F3E2E38285D5154628C99299C64E4037E5CE73F455770FED227A76BF6C81CAE6F769EF95DE5C6BB9C505E6DB57372FE0EF3132295E7A379DA07F9AE55E2A70E4E97BCC9049BDB2B9E64A697B7AF71F6DD0A88FBD14D7133479F25D81903DBFCD5E5FB27F5072D5DC294F47C32347FE52A29C4A8D91C2EC1CB24692D3F5E8987ECD0B9F95A81F11FE7E61F6289AE089CE8BDBC18698F23595CFF00C2D748E27EE57367886D4CF875BC956C2E0C8AA5A79BFF009976FF0087EB1726A9D412B7611C523BFA15C6F7DD26EB9DC6F2E039A46C84B0FB10506D128D9D09FB48ECC6AADB69BC478739E22C9C76006551778D2CDAFB73300095B187C67BE40CECBABEA74BC975D06E8670D33D0B4E30727D23FE8B99F8575DCF46CEE621E5B877C8D93A8922674B7850D4ECBFE9DA9B255E1D3C2C7B180F5CB4101701DF3479A3ACA8B64A087C52B837237232718572695D652E9DBD4157138B69EA5ED120EDB9DF2AD0FDA05C2EE66D1EA6A1634C6E0D33F26FD7192EC22DA0B65036BD28045CA5A010D39DBE3AAB83F6695AB96EB709BA8635FB9EDD5442DD75867A11551F78FD5EDD3756FF00ECF1A36B296F1598D8324FEC7BA7E88ECAE384D61174E20CEE3EA6C12971CEE3D2512F1F7A8FF786A6A6A36EEC840E9D072A97FECF0B4325BEDE2E8E190D328CFB75EEAB074A2BF52DCAA9E32D85EF6B49FA9E8990ACD3C24DA04BACA08FF962C13F6576F8D8F0D571ACBD0AFA785CF823072FF60AAAF0394BFF00F1A4AE3BEE71F4CAE80F137E3D050DCAA6CCC8798BB2DE6EB8CEC9D2E48DF6736F827D48EB5EA6929A53CADA9CB083F9493B6EAACF1F9C3A75BF514CF6B406541E66E07A4F36E9F6A2AD7D3DC292E6DC87099A5D8F9217447ED14D2F1D759EDD7660F5F230BDC07C0EA53B88E8F99174B5B8BB3F4D919D25A69F5555052C6D24C8F6823BF50A5166B1B6488C99DC6E4F60BA33F675F07BF1F797D64A07914A0BF98FE5CB77EBD144950E5EFE28B51B2C1A5696D9110D9658879806C771DD7CBCB7C84BC1FF0011DCFD5753FED0CE2D9AFBAC90C4731C2EE4001DBD3B6CB9329DE5AE077C044C12FED2DB31A1B824615A1A434C9ACAEA28B0706567301EF90AAAE1B383DA1D9DF65D45E12ACE25BB39FF00CB4F199093D32D47190ECECFF11575149A66A431D8F269BCADBDF97185C75E11EE063D37708A269335739CD18EA4BC90AE0F18FAE0FF00A2356FE8E96721B9FF000F4DBE1413F66E593CDA463E6FF6718F30E7A646E8AED918F3C40570D3FA5296D1192CAAAA25D38070E21FBEFDFBAF9D5AA223C819B1E4EA7B9CF55D29E3438B8EB85F663CD9869BF86CFF0009036DBB2E6DBDCED734F29CB89C9FA7B26612249C15BECD49531CF4BCAE767A3C67AAEA0D17A7A5BF5E2929DCDE6CC8D7CFCBF0415CCFC37B5F96DF3CEDCA3207BAFA55FB39786AD6412DE2A011249CC21E61D5A3AE126F8E062F3E245FE2866868212182929F38F60D6E0AE62D35776DA2D37ABB487FD62BA69228B3D4B0E4023E15B9A7AC26E578BA5748E3E4471BE227F9412B8D3C537131950F1410FA6969321D8E8E783D7E52F8059CA776AB32C924927E695E5C49EA724A9E70840127C2ABEEB7812CD867E51B0FFAAB2B40FF000C73264C347657ECF3ABFF005DBCB7B18A4FEC5716EB567FED9B8B47FF0015FD3EA576A7ECE98333DDE4FF00EE243FFE095C49A827E7BBDCDFED3483FA94982426EBD5DF52A077381C5DD36CEE7D949F515CB0E7EE3AA86D5D4E4E72403D544C22E5D71C17B6D3D9E9EE115C59255487D74C3A8D95436579E603F44D99F2E3CBF3D87C0442D670411D8EC7DD388B4EC5610F67407FCD47359682EAF68FB053FD3751FC36F4040DD6F747EC73BE51D5A1CE739A020918E8B566559D72D1C1C4918DD46EA749B987BA8DC05609A2AE3B0F64F25AEEFF00D1206DA5A4FCA635A4F44C9D70C74BE5128D0FC45A9B7CEC9E9DEE6E0E719F4B87B11ECBBAF843E26E86E9C8C99CDA4AD000C9C08DDFE5BAF9C81D8EBD3DB29C52D516905AE2D767A83823EEA9E6D24729ADA5F253C2D72E8FAD374D374952392B62183F92A611927D8E5BD12F69D0B71A11CF6DAA6D6C3D453BDDEBC7B64AE19E0F78AEB95B408DC3F150742D93D471F04AEB3E1B7897B35616091EFB74EEEB8761A4FF0092E7B2F8CDBD1DB69FCDC67D934A5E3846D779575B7CD432038F3794BD87E760A432B286B1BCD49550CBDF94B9AC3FA1DD4B29EE90CCC0D6CB4D58C70E8EE57B88FBF450AD41E1EAD339321A5A8A694EE5F0BDCD6FE8D385953D2C97C1BB8BC8636EEC0372E19C84E7CA613D8B1C083FA20751C3194758F97FCD158BC3BBDA714B7EA983D98F69763E32537ABE045D9B9C6A2CFF00C4C1FF0035425A77F274183589F435A5D161A7D406DEFB23B456D8633CD2491B00E997055FDE382F5E33E7EA1616FC601FEEA2F72E1B5BA1F555DE5D3E3B35FF00F5513C2D7468BCF06BDC5E357C44B6C0D25D3B091D40C13F6C286DE78B0EA81FEA90BF93FF008CE05A31EFBAA8AE9C56D3B6F19A789D5928EEF3B03F43D5567ADBC415C2E398E068A783A06C6DE5C0FB2BB0D1CA4ADF46465D7462EA24EB89BC508A020193CD949F50072D1F656070E389ED8E8FCC67A5CE0766ECB8FE7D252921CF71764E5C7A956C688B6BA36603CB998E854F934B8E2953E4CBFD5CB2489CD06A99AE15CCFC412F8D8F07D4723AAA4BC6453B7F79B5B180D698C118185D21A134C31BFC43B775CBFE2C2EA1F72672F46331FD56D78E8D338BF36ECAB69290601EE9C984264CA9FC98EFD53C74CBA2672D15ED633A8880EC9B1EA97A991332E522E8AB05521799B9086CC1110DCA6520DD42BB2CE45C08009D44D490DD3A842919520B93591BB26A004464A4277DD36FC01F63FA22C63E6E06CD8B74E994A918E03945A9E99472EC3C7D03A5A34E68ECE5D818EA8A5350E4EEA5F68B58C0D94B1890E66461BA3C918C7DD09B969F319C615D94D6305A805FAD4D391DD48E2410653F152EE880A1F8442BA8435CB47CB808368E30961C21752FDD13AB97283CA774344AFA300A5234904AC7D124443C825C221054FCA0C1E946CE8844AA9EBBE484661BF123AECA0B1D594F21AA0075D93A64F0E89F32EBE9EBB20D5173DFD24A16CBA00373B26325C46764F604FB25F6DBC91DD3CABBB82DDD57B1DD88CA50DDC9EE958111CDD5EDCE7AA60C8FD96BE664A771B3655E7D9A9A789B0849FB2D9EC27FE8B589C06D93BA51EE03BA859AD5C0D7C9456DF488679833BA3B6A737DD1C4A7261536CCB07D1462E147CB95331543000ECA337E76E8D94E488C88B0E44A969BD794C667EE885AEA323B6C9C8544935BA8B0729DC8FC0293A4A805BD42D5E720A3434909199652658B288808BDC2DE467659D2EC9239627E7019235C7EC54E2AAD8093B6420F5D47C8D2EC6C304FD328888FA59E2EF510ADD074953CC1DE5C6C664F6C00BE68D1EA4229F91DBB5CD0080BE994B4D15D787222863DE26E5DDC9202F955FBAA401CDC1C07103EC4A62CC0FA59FB2738A8D8269ADEF25AC90734609EAE46BC7D68B16BBD52DD98D2E8EA1C1931036193DD70F787CD76FB7D7D2543642DF2E46F30CF519DF2BEBF7890D1F16A4D32E921E574820133241BE1E1B9C0F9CA68F03374CE21E1D5F3F017F8256E0455A003ED8774554FED06D1C6DF76654307A65225CF41D72A2953AF1E21A63238B6A68AA1B1BB3B1E563B195D35E3CAC82E9A7ADF708DBCCE646CE791BDB00672A6BE0793B458904C353E858AA231CD5B6D0DF2BDDBC8339F7EC88E8CA0A4D77A6BF093380BB5B59E5E4FE7E68F60077EA152FF00B28B898D73EAACF3CAD0CA98DCC89A7B9231B2805CF55D568AD5F53E417085D2733DA768DE09DF6E8701059011E8DF3B1D3D9EE0D3154C04B5AE7EDCCD190DE5CF5CAC784679A0D49107E065D8693DC2ED7F117C0FA3D636B65F2D3231B708A3E777958CBDC064B5C06F9CAF9D3C3FB8CD0DEA06D487B2AE39031CC70208C1C677EBEE9D30DAB3EA9709EC462AED435AF1812533F91DD89E52B82F843AA79AB6EC03F95CF7C833F392BE916B8945169A9AA00FE24B4E72EEFBB7BAF8BDA4F54C91D5CAF8CE39E67171EC72E29C652A3E817ECFAD5EEA9FDF16BA8939F99B2F2B5C7AEC71805519C3D0FA5B9DCE89E03792579637E327B2DBC3D6B516DD4B4731DA3AB2D6C98D87AB037523F1C36236AD4ACAE84164358D1BFF00292EDFE88D31EC475569F6D65349148079ADCBA227B11D15CDE0F35DC775A1A9D3773C38F23991971CE7620633FE4B9A06BCFE27399016E37F609A41AA9F475905CE9896F2BC7306EDB677253DA1AC07C44A1974DD657DA660EFC3B8BFF0D9E801270015D79E19280DBF45575639B833B1E013B75054878D9C0B875C5BE86B294B1B571961988C64B4633958F1AB10B2E94A6B4404F33DB1B1DCBFE238050305B23BE062DE68B4D5E6BDFE974C652D3EF9CE3754BF065E3CBACA976EE9E679CFDCABEB895332CDA028E104325A86379C7F312F1DFF0055CEBA0A2962B744794B5AE192E3DC9451049A7821A5C6AF988EED71554F8B46736B2A93FE1255CBE041B9D51239DDE23BAA9FC4853176AFB8EDD01210B74C21AEA0A415148F68EAD1CD9F6C7B2E9FE1A538D41A32A6DF82F9A9A377293DB94765C87A62FF00CDCF19207E6057477800D6C29EB2B2964713148D700DEC7293609C0F4D2C94FE75039B890486200FE67E4E3017D2EE1E6958F4868C7D4CAD0DA9AE8C9DF6737986DF3DD29A03C074675054DF6E7C8CA1638CB0C2EC004824F36FB2A5FC76F1DDB76AA1454E4B68A9BD1869F43B976006364CD0E8E1FD5556EA932D53FD5CEF71C9EBB9510A7A77F5EA0AB0EBE9839A6360C3476EC8653D89DD46F8423931E194FC8C738EC1A3A7CAED2F0C96C34D66B85D1DB3A42628C7BF36CB8AF4C42E6E0169FE238347D4AFA3B74D24DA7B458AD6D3CAFAF9639241DDA363B84CD0255FFB40AF1E569DB3D1E4F9957CAE73475CB8FF00D55B3C2AD37FB8747899C39679E238CEC402DEAA1DC45D3ACBBEB5A3B5CE0494369858E791F972D00EFF00A29F78CAE20C3350BE1A561FC3403CB0E6FE4D8630A58A199F2CF5FD73A491E4B892F7B9DFD494274B51098F97D09EBF28A6AE2D691F276C75DD12D1168F2DE2570DB19FA2690E8B27879A325AAAAA6B6C239DF2BDA0E3B341DFFA2FA79A03521A3A69E8616B7C9B6C1873BA7F10B771FAAE72F03DC26F222ADBFD48F2C44C77E18BFA3C9071CAAD8D23309A9FCA6731A8BACEE926683B88DA7249F6184247222DADF8AEEB5D866E4706545C6573B1DF19EABE747163589634B79B2F90F339DF255FBE3375C896E469A23886859E5819D8BB1BFF0055C41A96EE6590927201C613B61A316EB990FCFB9DFE55EFA0EEEDF249EE46173A45177CFF00D15A7C31ABCB319C9E81BF5411639F437C144A686D578AC3B6619035DF505702D0D797CD5B3939F366909FD4AFA03A91FF00B9B42BDAE6F973568D89D890E1D97CF9D3F6EF2A99E4F57E48F9253B04ACAFD3E5EEF82857989D5E01F31C0FBF44C0B4A8E410A87A5E8EAB95C1320B78DB92124C45BF60BDFA027735DB2545F4E53B8B40C1529A7B51F65327C0D615B5461CDDC27B516B6969D96B6E879461117B8F2A215959EA0B63476505BAC433B2B0F5756E3208DC2AE2E15209EAA17C8F1740D7AF46B0E5E6A0AA1EEC9B68CAA04729EAA53596E63DA46307B1E8A05A5260C783FAAB02BEF8DC1C01D3AA2DA9F63AB8F4C0741AF6BA81F9A6AB91807F85C4E3ECACAD15E39EFF004CE04D49A860EAD90765435DE473DC70DDF3D9690DA252061A47D142F145FC1616A322F93EB3F0438F6353D13F01905642DCFA700923AAA7B883255091ED92AE4072461A7A6173CF831E22C96DBB3233B326F4B81F9D974871B6DE22AEC90EC4BEA1F7DD723E4B0ED768F4CF03AADD1A6513A9A924DF35133BFE271552EA273DAE3EA791F24AE8CB8D903F3B76EEAAED55A3724E038FCACFD3678C5D336F5CA6E3ED2B0B5D3BA478C838575E85D23CE00080697D1E411B2BD787F60F2C825AAC6A7536BDA65E9B4F26EE4331C2E11B39F19290A2B06086B7DF255B37993F85FE1FAA8569FC0977DF27FECAC68CA5291B328AC6AE83B575629A9DCE71C00CCFDC05C29AC6BDD5F573487768271FAAE92F147C441041E433ABC63EC5732E899C608EA49FD5775E3B0D46D9E6BE6353BE7B50C24B572636DD27D3B2B02E54239738DF0A1157038BF18D96A4D9998A3C01EB24C764C4551CA961B0170E9941AE167F2CEE308E3D1526AA6623E89A4CD4EE9B3DC607648D5B1448B9917B41C1D84EA964CE1224029DDAA0C90A5651C4B9277A7EC7E6005486BB4882C59D24C01A148BF100ED952631F528A3F5050794EC7CAD68DF9520E26D3F2BBDB7518A777A4614725C8B0AB41B8AAB18526B55DC640CAAFEAAA3185B535D4B4E728E0C87322E8A7BD728C041AF1710E076FBA84C7A99D8EA9ACB7E793B9D8A91C8822856E957EA281D555E525595B93B94CA47A0B10E5AE4CA41BA730B4FB24C37728095F42418B76B52AD62DFCB4488840B161C12FC892704846D4E9691C9285AB2F42CB11E852776C136E64A4DD026E99013140E5BB520CEA95614E0C421084F631B2634C9FC7D14523674F1E0D7977F65E9A31D565CDF709199BBF5D9465F9F46EE95A7E084A514FBEFD97A4A36363E6E705F9FCBDF098736DD7051C4CF91228EE1DD0DB8D6E5C9AD34DE9DCEE9027DD1B22637A976E94A7760A46461CEFB2CB013D9310261882E45A8DDBAAB9863DD4443CFB291E9EC920636EE8D0D261C6401613C6C23DD6548571E1210EAE25DCCCEC4613C9A718FEC83D43FBE7EA88891DEBFB34389B0CB0D658AA6403CE8DCD89AEDF723B02B9BF8FF00C2A92D570ABA47B09E691CE89C5BCA3049E8AB8E1F71126B55C69AE14F8E689ED2EDF196E77FBAFA49C7CD0F16B7B14776B7B9BF8FA68839EC66399DCA32E181BE522552AE4F9ADA47483E5326C439B9E51EFF002BE9D7ECDCE368A9A49ECF5AF0248F99AC63CFE669DB605704F06AADA277413F347511BF90B5E30720E3073D8AB3B58534F65AEA7BAD3E5A439BE6727E5E5CFC27510B76E211E3F783F259AF331E5229EB1DE6308D8039CAE99E05DC1B79D1D534A4F33E089C1BDF180A55E2FF004F47AA34BC7718007D553B1AE7E372060671DD51FF00B31F52EF5B6F946D231EDE53D73823A235123BF8397381BAC64B3DEA19C1C79151C8F236DB9F0BBD3F692E8682BADF437E8D998CC4C74AE8C7E6240CE485CB9AB784AC375B9D28686C997BE3FA82485D71E12354B75069AB8582AF2E9E8DAF6C4D78CB9C5A0818CF642D50E725F84BF14157A76A9AE6E64B74CE01EC73B983438EFB15F4475D7868B46AAFC35F6DEF8E1AA686BF2C03D4EEBCAE03FB95F26E0B01A4AAACB6CCD3CF148E001EC32718FA2E84F09FE26EAADCE36D88BDD2736226EE43B7D81F609D0CCEDCF177354526909A39B26463791C5A3F940C6765F26784D6DF35AE908E873EFDD7D88A7E26C77260B25FE38E096B63221CE395C5C36DCF75F38F8DBC01ABD1D717B248DD25B6A24262980CB5AD27A38F41D764AC605711C18A9E92AA3FCF04AC71737B6085D49E37284DE348DB6ED101CD4D13399C3725C005416A3B4B2AADCF34FEB85EDE6CB7720E32AFDF0577765E74C5CEC739E775331EE635DD76071B27623E7551EAB7BA16B89F977D54BAD5AF79E99ED710300F5559DEE89D4953514B202032678E53D80270A79C07E0AD66A1AB652D3C6EF2038799260E0373BEEA38AE413B97F673715AA5E0C6C8A43133F33F7E4E51D77E8AEEF1212C5A9A4A7A0B7963E7A79DAE946465B876E80EB0D6F6CD0D64FC1C0637543A3E5246398BCB71827AF554C7ECCC9AA2B2E373BCCBCED6339A470DF948DCE02998C48BF69BDE9D4F0DAAD4CC0708E30E1DB2D032AA9E1FD9DE6385AE90BE30D1E93D3385D3FE22F87B47AD696A6B2D527357DB89CC47F31E5EC075ECB99B835ABDAEE6B7D534D357C04B1D1C839738DB23384D622C9F055421BAAE7F6119C0ED9552F1DA84BB56DC5C49C61DFF00A2BAFC1AD272EA8A869DF0C77A86E0FDD57FC4CF259AA2E6E9C86C4CCB9CF76C10D211CF35363744F7CCECB58D2E3BEDFF00AABDBC0A582B2BEBA496089DE4B4FAA7230D6E3D8F42B4E1FF00062A359DC0454CC7416AA67FF1AA48E51200770C3D1D90BA4BC4271BADDA52DCCB358D8C355CA18E31609CE305CF23F9BBA35411D0976AAA0BB51D55A1B55CF50C8DC0B58FC3F9B1DB0720657C68E24592A2D970ACB6D531F165EEF25EFC92F193D09EBF5534D37AE6EF66AE6DF1923E4748E0EA88F249C1393B2ED2D5BA46D3C44B536A694C705DE2665A760F6BC0E8475392998347CB38AB5D1CBE5B8E7DBFEAA456E9417F2F73EDD0A73AE385D576DAD928AEAC304D19219338111CA06C30EE8494D238D90BB3CCD2DC6D93BE546C22E9E0568675C6F143481BCF1B6463DED03B348272BB52B6BE2AED61E5B3D34968A42E0DEA048C6F4FAE42AC3F678E8F96182E17D7B062189E2127F9891B72FBABD7C23E868E9E2BA5EEE072FAB95EE01FB0116493B9FEC93E412B5E11693A88E6BF6A5AF1F86A593CC8A02EFCCFC6403BF40A0BE20AEAE6E936D542D1E4D44CEE6901CE77512F1B7E2FE4BA4535A6D518828622448F1B79B83B8C74FBA96F02646EA0D13536C01866A2639CD19C9CB467F5469D08E12A7A02F0C7F5040D8EF9FF0092BBB81FC2FF00DED574F4D9F2D81EDF34FC677FAAA4F4E5E8D3C72C52006A2391D188CF5D8E0607BAFA41E033C38BA829DDA82ECEF29863324313FD239704871CF74317C8B697F71361A5A5B6D35AA9719680D118EAF2D032E2154D4F726DAA82E574A9CB668E2315337A61C411E9FF00A273E1AAE1FBEEF176BBCCE7369298BD94DCDF9091904B7B630A80F183C6335738B7D3FF00EED038BA423A3DDFE68E4B91551C65C45D52E7892695C4CB50E73C9277DCE42A7A4049F727753DE26D4F3C9B0DBA63D94269A95D9F6FF7BB0FBA8D88F5346E710D03EA3BAEA3F055C277DD6EB0D1B633C8D73649A4C6435ADDC825531A0F87D3564D1D35233CC9E57068C6E77237FA2FA8B6A868B87DA75E642C7DE2AE3F56305EC7386CD1DFBA04866531FB45F88A2A2B296C94AFFE05186B5FCA763CB807A2E6FADB1B431AC66F809BD0DCE5AAA996BAAC9334EE2F03AE0139C1520654877C2952B122A2D59A1339737A955ED75ADF19C3815D2B252824E718519BE69C8DD9C8194D288E5080754F2CB0F33C0FA221A92C6637EC36CAC697A33E603DB2A351116EE9EB180D1F21481948D6A1945736B1A013D90DBB6B40CCE3054CB8435066499AD3D765935FEC7655A5C756B9E7D96F49AAF0304A66C6A1EEB2C1C9559D6F552BBEDD83C6C5446776EA290424129045CC70B409FD9F01C33D328508356AB5637EA91BAD611DFECA6947511861C055E5F2AF9A43B6C8D883DA469448EF7560436CE51D1571A1EBF91FF556B4F527933FD93C456422A277D355C550CDB91C09FB15DE1A8AA45D2D3495D1E1D230343F1B9D82E0ED41287B1C0E73F0BA3BC1871003E29682479D812D0EE8B1BC8E9F7C6CEA3C26AFD3CA9489AD15BC3F73B3B1D144751D0B0139CAB6EEF430C5CD20918DEB90E206EA8DD7BAEA167334B9AF3B9FE1EEB898E096FA3D4F51A886C415B0D0C7B10558BA6C80772B9828388AD0EF49701F2A7F66E27340DDDFA29B2E9E4BB28E2D4C2CBA2F751CC08CEC86D3F2C7979DB03FB28C5A35C324EF9CACEBDB972D33DC32323FBA3D3699B92B22D76AD471BA396B8E5AB1D555AF05DE9612028B694ABE47058D5F487CC73CF7283514B8702BBDC78F6C11E49972EECCE45C82BB99BF64DE86D7CC7250EB257E5A07BA90D1119EA8A6CBB8B90D5AA859D0B7EEA37AFEC2D7332D0A5B4138C63DD0AD52E1E5B8775245F045957B8A661C8C8EAB5A9711D92A266871CE7AADAAE3E62305577D9665CC067456E24F4EAA6760D284907096D2967E623B9570D974E600D82B15ED2863E1D116A2B31637A270CA520654E7F7193D96469E38DC0C278449350B8292D796A32379BB8508A2A4C6CAF2D5D6C01A76D95353B8090809B2223D3022E31EE99BD98DD17B845DD316C7CDB26C7D11EA17BC6BE713D12E5C46EB67D2F2765BD2C05C093B0FEA9FE4AEBB184CD25202229F54D19EC524C81DDD260FC8E689AB4969774BD10E5393D13CAA68DB18DF7DBFCD3264D2053A35E73939E5EA9973A220661C568943195AB1331D1B342CF2ADB0B2C6E5359662B812704DF953C731372C4C47312016F1356004BB63E8858D8A36C794AC4F6209BD31194F3954723A1C2AA26253B26722759DD22FA720EF84089243695253764B4C3FA26EE39E88CA331703609BBD6D1E4F4E8958C0271DD122B8F69ED7E6C448DCB3AA19CF81B75563F0B6CDCD3721C7249B1CFBA575CF0BCD2CEE6F2FA5DBB31F29DA1B6957079CA9B69E83F294CA7D2EF68DDB8FAA79A7B98641076F6FF2451934433448846B2B3C8EF62B0A5B20B004F57F28649587DD0975E73DB09B36A894364541D654646E4607507BABAFC2C78A4AAD3956D91B239D4AE706C9138E59CA4E0E42E7E8DA5DF4F85E344EEF977B0448547D58E3DF870A2D5148CD45A7258995ED67992D3C4406C840C9F48FE6CAE75B2F13CCD4B35AEED13A9AB2305AD64C397988DBD25CA84E07F888BA69FA96CB4B2BFCA041745925847B72F4FE8BBCECFAF74C6BD89B0DC9ACA0B991B54B088CF376248C7752A63BE3A12FD9FBAA9D531DC2CD31070D788D84E720E718F851FF000ADC1D9A8356D6EDC91C65EE7736CDC67B2AFEE1C09BDE85BCC17089EFAEB7078E6AA88178F289FE7C67B772BB2B8C56D372A382FB6491BEB634D4C6CC093181CFCC06FEFD5489F23A3983C44BDB49A963AA601E54CFE579EDB9C215A13599D39AAE0AA61FF54AE203BFC1EBF7EDDD59BC54D170DDEDAD753FFEF300E67777878DCFCF55CA9AD7558A8A534B5198EB29706373B6396F4FEC8261D170FED32E17B282BE9EF146DFE1D5B43E4781E925DBF55577838D346B2EF04ED691EB6973F1D4E7A05D65C2CBAC1AD3474F6D9C075C2823223EEF7728D8E7AF650BFD9BFA54C556FA491A0CD4B316C808DC72940982C4BF6AB6A2929EB2D7240F2C9A9F91CD319C38103BE1597E197C545BF55D09B2EA064264F2FCB64B2E39DC7180413FCC151DE3FEB1D5BA84C031C917F92A1E5D28DE70FA6798278B05A5A71EA1BF649A1A8BCF8D7C0DB968BA97BA063AB2C93925AF00BCC4D77BE3D8213E0AB8AF4F4BA9DA227B4D2D77A6419C005DD9C15C9E1E7C7172C6DB4EA381B5103808DB33C07803A6483952DE2AF80BB156B5B79D3F54292685C27772BB0C70079880CDB1F44E3339A7C61F8539E5D5A22A78F960AF703CED1E80D2724E7A745D5578BD5A741DA053D2794EAC7C5FC479C737311BE3BF552DD777515B648AE54CF6CD3DBA3E494B465F98C609F71D17CAED5FAEA5BE5C249EA9CFF221272D713825A7A6E9F80411C51D7B5D7CA9F3672F2249311337C9C9EA01ECBEA2687B6C5A4B441948E5AAA98B2EE6D89E76AE3CF051C203A8AF6C99ECE5A1A2208C0C02187BF656F7ED02E2C32E55F4F64A527C8A6E56BC30EC4376C1C7B26EC4519C12E2F5CF4ED632E9139CF82AE52E9E3392DE571EA474E85765F1BF80343AC68997AB248D86E91B4492088805EE0325840F73B2E58AB9A18A114AF0D73394373EDF1F5511E15F1C2E1A6AE43F03239D04AE1CB038E46E7A7B25423A2BC015BEE10DE6B3F7953C94F341139A4BC10D7068FCC09F74674678538B545F6E7595B2D44745149FC870C9707707DC2E97D31C667CD4AC96E96D6D30A9682666603DC08EA71BE1527E20BC5952D0C1FBA6C21A679B3E63DA465BCDD738EE8B60890F1DFC40D2E9FA6658F4FC518786F965D181E9C8C17388FE6FAAE491A35ACE6AA9DEE96AA425CE73CE4F31DFBA35A42C6DA7699A6267AB97D4F73F7E527EBEC9A6A9ABF49713BE3A7C7C235008ADAEFAD0C2E736501CC391F1F440347EAAACB5D50B85A667B7D5CCF8187D2403BE4051CD6B772F7919000EC5674139E24023390E3BFF00DFB28833E8FE88E2A69DD734028AF71C315735B812603646BB18CB5DEF95556BDFD902C06396DB5D24F0991BCCD7B8170667A6DF0B9E6D9A3FF1975A5A5A7649E639C3CC34E4B1D8EFB85F4BF8197D86DAE344C82B1B2B1872EA891CE0E701D893DD2A2364738E1A968B47E9B86DD006999EC6B1918C73BE47000EDD4EEAB1F105AEA7B768AA5748EE49EB1B92C1B3873F4DBEEA8BBC57566AAD76DA5A80FF002A8A607CA39E50D6BBA91F6524FDA3FAA4565DA86CF4D9F2E9C332D6FE51CB804101288C720DBEA3921C4992E91A4E4F5DFDD5C1E0038C31DAEEEFA695CC6C15798DC24D9BEADB6CECA21C50D02E672B983F2B065BF202B3BC167874A4D4B52E6D531ED6D36089A3CB391C3DDDB6774F543D1D0BA13F67EC4FD553DD6AD8C75AC9FC4C5D3CB27F36FDB1B21FE2978F32DF279ECD6B262B7510E5A8961D865BB72348DB1F453AF175C6AFDC96B8F4F5B267D5DC2A31031AC7733D8C77A7248DC6C87681E15D1D82C70C5543FD767FF58AAE6FCCE27D45AE27AEE9A2B9B02C465D531E99D179D9B3D464461DB39CD3B731EEBE6B5C35D4D33DF92ECC84B891F3BE32ACFF0011BC6E92F95DE4BE4F2A969472C51E70C0D6F4DBA65553699EAAB251456EA5755484F2B4C6C277FF00882527C8E04BAD8723CC99C40CECC07D44FCFC29370A38315B7AAB8E9A8A92691A486BDCD69F2983DDC7A6CBB0B833FB343CA85971D575CDA5831CE690BB1263AE327F4525E2578EEB658A275B34AD2C6C2D6F97F8A2D1CC71B73176373F29AC726F6BD0F62E1F5BCCD33E1A9BB39991CD873A3711F959ED82B81B89FC4FABBDD6BEBAB5EFE4E63E54673CA076201512D79C4AABAD9FF175D3FE2252FE62D71CB46F9C6328AF10F8B4CB8434F1B299B4CE81BCA5CD0073FCEC970331ACD7B208E5200F7FF25A1D50477512FC5647C80933509AC489B47AAFE561FA879BBA823E627BA4FF00104774AC70E5D2212124EE87D2D0869C843DB703B01EEA6161B6F38C9428402ACAE737B9C20D533F37BA9C5E6C381ECA17353E0A36218C8DDD69CE9D3DB9EA9A491051886953505331BA7D333E13378C25211A39663908596C24A21456DE6DB384C9085E1BF3834842E524927DD4F6D9C1DAC9A07D4451F34318CBA4CE3ED8519A9B4100676F8454260EA1AB730820A9A50EA6796E33D9447F7711D9486C541DB94A446EFB47A7AC3CDCC7BF647B863AA8D1D7453349C170E703DBE53B66976968CF53DD0FBA6942C707B7A0FCC3DFE420CB1DD1A2FE2C9B5A68E8EE37563A16C556D05F04ED0EC6FCA1DECB9CF52DFF00CC3CCD0D8B9BA90BE82F0A785CDBCE927B240D3244796371EA0F65C25C5EE104F68A8FC2D5B5C247379E3273CAE69E983D1632D3A8CACEAA5ACDF0493E488DBE671763983BFCD58BA523E603D0D50ED376938DDBCA7B67B8568E94A3C027A05067483C1396E24D65C3480581BF214AF5CC61D49F650FB60773E47BF7E8A73A9685C68CB8F4516957BE8B3AE93F4CE69D4FA5F98670A0971B196157D575BF99BF6502BC5989CFF65D6CA3EDA382E2F92216AAA2001ECA5B6BA8246547A9EDD83B9E9D549EDA4001A463D8FBAA32FC1AF87F248286A500D5F5A791C07B238690B467B142EF741CDF391D14917C0D955BB2A8A5EF9441B0744F6AACC5AE3FF784AB680E0127ECA268971F289A6868B2E69576DAA9863E5531A4872B9A55BF66B9B48DF62ADAAA28A5FEA5123A3A12E4E6E16E01A72426515C8019CEE83EA0D42D0D3CCECA51916350B8205C52BC35ACE51D7A2A468C0738928FF106ECE924D8E5B9E880C4067D94395B2B69D722825DFF002AC4952D047A404D6A2A9C3A0FBA626B0F7DD3E37C0B53F71368ED31CCC076CACC1A2CB8801466DF772C0ACCE1CD7F9AF6F3119EC8D76525D91FBA70E1EC6E7054427B7161391D1761D5E996C9082083B7B2A135F69AF2E4C7F5533883F236E15E92B655BA6FC6D4184B184B074CBB1B0FD557374635924AD8F78DAE21AEF719D8A33574C19B868CFBA1B52CE66918C1EEABD724F25F20D638765A3E3DD2432D072374E291DCDD4E0A22BB1195231754F2AE9F009CA690206C38A15296A7091725A2286CB290991D522E6A5DEE4914E88E68440DD3BA78D21C89DD1B93326D3C6D8F190A721ABC37016D1BF3D94323A2C71543BB15344E94366716B0F521257BA6859296C2E2F6762537E7EBD31DC11FD961E1A7A37F442930A69036A3BE136E5C04E261938030B154DC001488C9C8F910859DFDD3CA08C6522CA4CED9FBA3961B3F31C0DFE5122BA57D16870C2CBCCE6B8750411F65D8573E16C35F6F8AA033F8D1001C31B91EEA8AE0368794C8CF4F30C8D97D28E13F0B1AD8C39ED018E6E0B0FC8EAAE42165A6923E6B6B3E19171E40D38FA2856A2D26CA4600065C4751D97D7AB9F00EDF273FA035F838C8F75C9BC64F0FF6CB7BDD3D6CDCE09CB6269FE8A4789153223E7AD5198B89687E3FE12B0BA0EEFC78A78A47474D6F8BC96ECCE6682EC0EE4AC28F699DC9C4FCC9EDAA2C94CDC3BA2B6097D5F755D0897D9EC79455D63012D64A900764662209C952881515A9A06E01480B4061F3A073A195BF94B491BA3CF68432AA7EA08C04E397EF00BC7AD7DA88A2BAE2BA864C3646CCDE701A76D89CAFA61E1FE4B1D6533EA2D2D686D4309929C3F2D191BE1B9DBF45F1274B6B1A7A5AA64B550B6AA169F546FE855FBE183C4D9A6D46CFC237F0F4752F6B440D27906481B04EA422D9F109AE65D277AF3E38CBA9277FF11847A464EFB74520AFE14D8359B3CEA19E3A5AE7332464372F23A7EAAE9F1DFE1FDF7CA17CD4BC924D1C5E698FB918CFA7E57CA5E1F5FA6A0A90C89F2535443206BD8496F43DC2937262DC74BE81D257EE1EDEA37CD099E8EA5C18E737D41ED71C7F9AFA01C10E1CD1C353537C631D4EEAC61222231BB8679B0B9E75D7161B77B7DB291CF0FA9E68F71EA783B6E55D7C47D44EB6BECF47354F2F9E191E5D8032E0027A5F0326701F19EFCEA8D415CF7F4617004FD554176BD0131E438767700AB4BC5FE97A8B4DEAA04ED2193FAE1940FE1C80EE307A2E7496F1CD2E5A00F93DD4736159665AAEAC75446D76EE738068EB825773F0BAEB0453416FAF99F486AE3E48A4070D7170C0C8E8B86380FA58DC6F34CC66795A41763AE477FA2E80F143C5E653DD29A9591366920686B5DDDAE03AEDF2A4872816746F06B4554E9FBA57DA2B4BA5B75D5AFF0022A40E6692E071B6E0755F39F8FDC2CA9A1BF545B20CB9B5136210D1B96BDDD703EABB4FC38F8F2CCEDB65D691D593878FC3BE36F339809D867D82BBAB3C3FD3D66A48EF955188E1A78BCC0D23D4081901E10B40918B15253682D261E5AD15D550E4FF008CB9CDFCBEEBE7BE82BC49255545C6A49E7A97B9CDCEE5BCC760AC8F1A1C6E9351DECD2C12F2D2D2BB94B7386FA4E36055737FBCD35BE36B9CF6BDCD186B5A41C9FA051887FAAF54474AD74D3BB39FCB18DC927A6DD9599E0BFC3254EA2AD6DD6B83A1B6D3BBCC6870C0786EE064F6D90DF08FE0F2B754D67EF3B935D4F6C84878F3016B65037C373DB0AFFF0019DE32696CF482C1606B5A433CA77938F4ED83B8EE9D31072F5C4C65D75436D748F3FBBE8A3C4A1A799A5AC1BB076CEC83F1D7C2550DDC4D73D2CFF2EBE889FC452B9DBBCB7A9C673BE3D9543FB2B247BEF5506A3D5248D73897EE413D502D7DE22AAF4AEB3B84F4CEE6A773FF008B064F2B813B9C744DBD88D342F175B2B9D6FB946EA5AF8B2D3E634B0388DB6CE32146F88FABDF10734E00E9CC3FB85D8DA8746E9EE23517E2291F1D15D9ADCB5CCE563CBF19C3B1838CAF9E3C6DE14DF2C150FA4B9C12CB1B0E1951CAE313DBDB95C0633F7EE9F7308875D2E627936DFE9D14EEC370FC388E38BF8D552E1B1C6D19209D874FAA8C70FF0085378B8C8C8E86D952EF348C3C46EF2C03DC923181F55F52FC1C7ECF5A7B1F2DCAEE45457101E1AEC18A0DB3BE7A16A0B63D86BC12F854FDD54E2ED7300D7CEDE7683FF831919C1CF43854EF8A7F1BB18BED25351B80869E502A6463773BE082429BF8CEF194E05D69B412E99FE87CD1EE1A3A6011D30BE7FF001374A9A3A3C1224ACA9782F90EEFCB8F4FAA7B631F4EF86BC21A465D5FAAA8DF1BE0969499802321DCB9E9EF95C0F49AB3F78EA3B9561767133D8C0EEAD6F31F7E8176EF03AFB4FA7F4A507E38971B872C527393B07ED9FB6572171FBC22DEED977FC458E9E5ACA4B9E1ED91832D8FCCDFD78E8D19EA9EC40AD7CD756D4456AA1619AAAA1E1AE2CDF91A4E09C85D8F5574A7D0B6286DF4910AABCD634011306642F78C7AB1BE1A4F7530F06FE0CDB61A77575639935D6767339EFC1653F30CE013D0855AF1AF8A76AD3B5AEAA7482EF7EAA77253B7FDA329B3B038DF0427BBE056483815E1DA3B6472EA4BEB8545CA4619442F3CC29F9B76B707A10AA6F1997BAC9ADB1D5D3B24966AE7F970471B492D69380703B2B76BEC374A8B7C55D71798E29DC25A88C13F93AF2E3B0C2E7FE28F8FB868EA7CAB753C72B295BE545E6005AC207E66F6CE54B1E01A2BFE0A7ECCDABA9632BB515636DB487D6E63DC1B23C75C1CE0EE15B578F159A5F48C6EA3D3944CA8AB602D7D53DA1DCC46DCC1DF55C69C5FF13B78BCC85D5757288FB42D716B07C606CA97AFBA1C103F5EA7F55148545B9C6DF16B76BDC864ACA890B0E710B490D03DB6548555E5EF39E807B75C2652541F75A79B83F5EA86C42D15564E4EFF00745E8AB7651FE64F28A44D622431D475493AA5356CF809ACB5495887FF0089484F549A7E25359A7299B10EC541C8C2B3B4556EC32AA463CA9A696ABFAA7888B0B514A0B7ECAB0B84C3254CEAE6258719FBAAEEF2E2094726230EAB195A99821449CADDAF3DD449887AF7249D1247CC5B3494F210F29A9C1014B6C36DDC1DBE72A356C6153DB05367AA288891D0EA49590C9032531C4FEACE80A87DD29DA76C82427BA8DE58DDB7F950FF00DE879B9BBA7E84148E846517B7E1A7B202DAB3D524EAEC6F94222CEA794380C6364FEA62059BFEAABBB05CDC0F5CE55816B6193923FF001387DFA291D50316ECFA19E1D28638B4E44D0435D3CCDDC9C775A78E5E17DBAE969F36291A6B28621CEF6007A0E85DFE4866B08D9456DB2539CB7CD746E781B1EC9C78D5D414D68D3C69A98064F5C012F3F988700B3B2B48DCC117C1F39B43B32DE593D5825AD3DF215A3A76D186E0A80E91B6796C61C125C013F5EE55BDA1CB66706677F7ECB9CD44DDF0761A6C4B86C5AC960CBFA6D9569F116C8D8EDAD18C17239A5382550EC4D83E56C49EF8F84978849DB15235A33E81B0FF009AB1A2E6656F20BDACE78A7B3873421576D239DF1F7E88DD8AEAD2D193D5139EE4D231B10BB294783809492652777D39CAEF6DFB0CA95EA6E1C53C3470D4C7526495DF9A3C7E54FAF6199EBF442A38B9B6DC8F6ECA8CA3C9AF85A6B81BD9AC2F9E13BEEDDC04C9F687677CE5BB156568A6B1B2376033B11D94875570FCB24D86D20C823A6E99227947839E6E762713B0249291FF0045DDD5DB2E8D87879E5465EF68381B2AE6F96C7487180067F97FCD34E2C2C2BE0AFE2ADF2C0007444A0D4E40EA97BB69623393B63B7F9A893ED4F693D7EE8D745392DB909E43ADF2DC13BA88EACD544B4E0A6F47637919F7EC98DCF49C8F0762A38764D9BED21F4F5A5CFC9F7527A5B307EE764260D38F61FCA4E3E11FA6A673863D4DFA22C88A9A67C806FCF0CF484062933D54A2EF6F38F7F941196D3F28718DAAEC47209535D0B3F23C10A28C8F1D5B8525D3EFE5191D54BF2524CE99D2DA89BE58C9ECA33C43B736569200CA8AD8AEBCACEA73EDD917AAD43CCDCE06718C765680FE62B87DAC91CB8DC2037AB111870D88ECACAF31B9E6DB3EC87D453B4924E093DBB0505725B97DA53B70A439CFEA86CF111B8EBECAD0BB69B07703AA865D2C0E6BFBE10B454037984B70918A22A4535B761B26DF80DCE32A3A278829EC29C4611216871E8B6FDCC46DBE7FA25458044C9253BD11C26ACB954369E9232F91DF1B24B893C22ACB54FF0087AC8CB1E3A8C23488A6429A110A58123151EE3AA2D053E02865C17B4901389F82950DEABCD87073BACCAEF85059BD0548D5B1E07BE568E6EDECB769D8FC24A47EC888F28C3383EEB3E5F315923B81D56F147839FE88D1919158F28ADD923FEF0AC1D2B686B483827E71841346D81D3B8630D1FE22AF0D3335150905DFEB327B756A340E3545FDE18213239B881C318F5B8607D57D04D3350C11359CCDE618E857CB7A0E3455F334445B04476E58F6DBD95E5A0F8D0F88B41797138CE4ABB8DD12BE59DCB78B8FA7236C757636FD57CE6F1897CF36A5CD0EE76F4EB90AE96F88496A249295F272B1ED21A475CE1715F16F513DB5334129F5071209EBCBD8A9A52B0322E0A6EBA965E7763A6765E4AD55E4731DD7955B33B694CBE24A51BB95387C41206350A20A24B6CBC60291D05CF2A014D90549E827C0C8EA8EC7A259154ECA377DBB8683F3B05B54DF39475C7BA87DDAE464761A0E3E06725262B1A3EA897124F4EA3DD581C1CB80FDE742EC60095993EDB855BB23DFFBE76C22BA66E8F82464AD76395C09FB14C973C8EB93ED4F1D78D2DB6B2D95F4B289191B236D644064398400ECF65CB5E383C31B2AA08F55590074152D0F9E266E438EE4003A60A99787ED511EA1B6CB47E87CBE516E5D8CECD44FC03EA6745575FA66EC4BE36CAE3045274032718CF6535205C48CF810E15D4C34D25FEF0DF2E9E0693035E3064E5F607DB0AF4E2CDBE8B5EDABCFB5CC22B85B9FCF1379BD5CD19C8181B91B29278CDAE315ADF49441A29E061F31B1FF002803A60745F337879C43AEB1CD1DDADEF7B581FF00C584125AF6E7D59097431DAD6E106B2B54D61BA30535FEDB196C6E9072BA6E41806327739C765F30F5A68B9EDB5751435AD7C72C0E73770473007D2467AE57D49A7ABB6EB78A9EE9689DB6ED414E5AE38706798E6EE5AE1B6413B614A38F9E0D9DA869296BABD8DA6BA51F28A92C68C4EC67576DD4B8042E2D88E75F03DA163B5DA2AEFB58CE57796E10B9E31D8E3195CAD5DADFF1571A9AF99E377BF903B7EE574578D4F12500A2A7D3D6B63DA206864CC6B08773018270064E4AABFC2F7802BC6A12D9646BE8A803817CB302C738773CAEC1C10A4DD4848B07F67AE969EE5A81D57147CD0B3F3C98D863D8F45D83C4BD6175B75CAA6AADCE65CE9E31FEB7403D4E6B07E6DBE9941757F17AC3A06DA6D96D6B2A2B9CCE591D190E739C47E6246E37ECB8C3801E2DABADB7F757D534BA9EB9FCB3B1C72031C71B8FA142D82CEA7D51E18AC5AEE9FF0078592765AEE40E2A601E8E57FF00335CC18277EE8A70DFF66F69FB146DAED41566A668CF365CE261DB7DDBBFE870A21E262C3358EB2935569C0E14D565AE9E18BFD97AB7717346DFAAE90E19F15E8752524947570B455D4C1F91CE0439C5BD40CFA774C0D1CB9E2B3F681C0D83F74E9E8BC9831E5974586823A659CB8C2E4BD27C3773C19E790BEA2525D97E5CE19DFA9EE90E2E70C64B1DFA7A6AC85F044E90981C41E570CED83D15B968AB0D8C4BE83186ECEC8CE308D50C4D3F678CA21D50E89D8CB9A5A73DFF00EAAB1FDA27A58D1EA79A692222298FE623D247C13B227E17AD35B70D511D45BB9991C0ECCD30079300EE33D17D07E3ACDA76EF1BA9B505318991FA5957CB8E670C0279F1B0EA546D72123E3D5AB52BED93C75569AC9192B882618F2E39CF421BD8AFA51C09F1435778A6829B50E9A9AA18D0392AE46F2C7F04F3051966BBE1FE970059691B78B9BCE2261027CB8FE5CEC70A6B7BB85E64B74B77D435315A691D19752DB23023763196838C6FF089506758DAB5653D1C3E6B2922A3A563325CC0C6B5AD03DC001707F8ABF1F53574925B6CC5C5B92D9276743D8EE11FF0E7C588755DAAE1677D439AF607FE1FD7873FAF28CE775C5F41506C359536DAE83CA7B1EE3E73C7E66E4E0871EA8D6D19127D334C68C73BCBA5AA94F33A47FA8373D569A67444F7EBED1D245970648D7CCEEADC03929BD06B69EE6E6D1596825AC9E47639F90F96DCEDCDCF8C6DED95DA3C00F0ED168DA492F17AB8B21A990734911C17460EE5ADEE7EC133A0AE89678D4E154F5B69A4A6B6C7E77E04C5E6C6C2038726338FD159BE17B8AFE7519A37F345534B101E4CA4737A5BBE33DB6503D39036FD236ED64B84ADA16BB9AAA12D23CEE5EBCBEF9C2A9E938BD1D6EAE929E2A7A9A38E389CC3218DCC6C8F031D7001C94FB53111AF151E36AADFF8BA38271492C2E730463674BD8631EEA2FE13F824DA467FA53A8DDE63E439A5825DCB89FCA435DD7EC9B683F0CEDB86A1B8DD6EED31DB6DEF749993D2262DC90327AE70AF6E0D503755D74F59261B6BB77F0E829B3CAC7966C0E360EE89AA983448FC6371C4C7A64C8D6F94EAB69118E9CAC236E51DB65F1FF98B5A32E0E2E25C49DC9277DD7737ED25D75239F496F0E0D117F2018181D06170FC34DE613818C75FAFC219075407AFABF8C2007254CEB74D13EAC13F080CF6670CED82A3E41014D4E537E5460D238EC5377D1612A1307613881852C69BE12CC85330449CF29ACCE4F2409A4E10884DAE5825797804BB10E69C298695660A89D347ECA496DC8089089C554A390AAD6FEEDCA92C1567719EAA3D7CA6DF644C447C85B3403D52D2B71D1259250242360C0B6E6583125A18BE513420ED8E9F242B2AD54380141F45DA259E46321617C84E1AC0325CADB6586485DE54CC7472B7AC6E1828A28446754DBF319FA2A7E56904FD55F779A605AE18C6DD152D7980091C31DD3C908F4357E94D9F2E56AE8F64CA690F4CA0BA112BD2B5639802AF3E17DB0CD5D46C6EE0C8DCFD321733515616B811D175C7847679B70A779F508C7311F4439254897146E5474E7880BFC66E96DA7CFA69DB18E5F63B2A73C7CEB635F514103776C41A31F200522ADB2C95D7BAAAB99FCB0C527A33DB0AA9D5D6E7DCAEE238F2E6C6FC730E9ECB0B365A74767A7C29C439C1DE08555CE76450B0960C07387468EF95D7D41E18EDB6F6B79DFCD3B402EC74CAB73C32682A7A1A3018079AE6E5E475E884DF6A39E7A8C803941C65569413564F1CAD64DA81767BF8F2648E3D9AC18FAE3D973EF1D636D4534A71BB01FD42B16C15E712EFFCC555DAD6E21CDA861E85AEDBECAB4326C9AA2EEA316FC6DB389A9B55399CE338E5242774BADCF72A0D7EA90C9E66FF00BE76FBA611D7939F65D863CAE4ACF3ACF04A5458EED49CC7AA336AB905595A5C5C091D47452CB0B8BB19DFDF0824DB2E69E4970599608CBDC08F7DBEABAB344E9E15946D6C833245B83DC8F65CDDC33B23E47B40F71B1F65DD1C16D04439A1D86B5C11E25CF26BCA3ED295D616A11C782C76FB74549DD6CE29C39FB7AB2707B2FA697DE1053C8C21ED0E76FCBB6C171F718782D152CAE7D44C1B1E490C1DFE14F923F2478787C9C9B254F9EEE4646E73F3B06838FD7A2313E8331B43EA795831B34904A985FB59C50B0C7470359B63CC23D44FBE552F7AB85539E4C85CFC9EE490A2E28A9A88D4C94D3C108D83463DD3C86863C74CA865BE37E7BA9051193A67651C124C9322B80FE5D3B19DC00855569907A00114FC3BFB65379EA5C3F3654F3AA2869FEEA21D78D303D9068F4CE3B2975CEF1BF5D904AABD819C1ECA1C6D126B5511CB859BAE404DECD6A25C076CA212D4F3EFBFCA91694A06BB18D8FCA95D198890DAB4AFA0158B8E9D7761B056158A95BC8011D166AA0E625BB0014A971632FBA8A8AB6CE4043A721815B73581AE18E5DD44F5568438270401D0A0A2EC9522172DD011B20F5F3F3750884D6A316DD532F376C151C8A8B964726A8DF18D97A37B79BA2252C0339C642D28A569CE1BD0A8932D28D0468699B8CA791DB5B823B75CA6ECAA03181844A9EE0D78C72F2E3BA2255CA2E1F0A3C43A6B45C63A99DC035A7B84AF8D4E25D35E6E46A20C1611D82A52AA63D1B8761253CDB02480476471AA209F601FDC6320FF0044E5B6AC745BB6E41CEDBA8E89FB24CF555323377450B4059E848F643EA20211EA8C21356C55D1A2FB053F64CAA9D809F4CC432A09271D94855CA272C98031D7D96D14A0104EE7FB241EDC9599183B234664DD3E495DA6F0FEC795BF1DD4A286F1CBD0E3EBBAAF69EA48682B575D88EE8D04B8565C56ED53B81D075CA9A5A788A18412EE8B9A19A81C36CA2547A97DCA2DC429F2742BB8A5FC66C80E0B482163C46C62AA182E319072D0D9797FCF0B9FDF7C3D73D94BF466BAE6A69A92577346F1B34FBFC14FBC2C8EC834B7C682B0815C69C87B87B1207D3B2F25654DAC59A72B610A6F23D66394A720A1EC51276D9F6C24ECB6A9277163377754954C0E639CD7021CDD8A4350C6BABF39CA96F0738910DB6ABCF9A91956DE52046FE9923AA8554C594998D159184F59EA1155552CED89B03647970899F9580F6087533097003BFB248B53BB60C3B23AA74F91D1D0DE10F8826DB76A71E6481923DAD70EDB9E8BE89F1EF838CFDE76ED416D7B227C41AEAA6E706469C6723BAF93F6ABA18648676EEE8DED38FA15F5E380AC8F51414B55CFE9869CB25841D9CE0DC7A87D54EA87605E1D6B8A6B95CEE76FA99006D6C5CB0B89F41711B86E76CE5712EAED072D9AE15B68AB6911973DF4E5C3F3309DB0BA32FF00C37967A6B94D4588ABAD353E6C51B3691CC6BB27E48C05B71FECDFE95E9FA7BE528FFDA96E686D5B07E7263182081BF6EE94C1E8E07FDE35967AA155432C909E6E6C025BDF3D02FA13E167F68A4B3F974D740E77361BE7387A4F639257066A5BAFE384203489090C9987B11B1C05DF7E177C3552D4D2B6AAB98D8A86959CE491CA5EE033D4FD12439D17C583A52D91B6F7556A64C5E39C54C30F987DF270EC7EAD5C39E22FF69DCF7163A8ACAC751D360B7CD6B7924E5E9F947457CF07FC55DB6E575AED3953E57EEE21D0D3138C13D07292B8C3C64F834ADD3758EAA818E9ADD3BCB83D833E564E7071DB080629C1AA1B97CB2CAF9AA1F92E91E799E33F050FAA74D3479DF072438EC47D539B6E9F86422489C398E3981F7EF90AC4B7E967D64B4B6FA6679B34CF6B4960CF2824679B1EC9C6676CFECF5D4D3DCECD516CB8B7348DCB639651E9CF6E525737F88ED1B7ED29778AB206C9F86649CF0CB164B1D1E73CAF23A0C2BC3C4AEB48F4CD968EC16F3CD719B939FCBDDED90FBE37EABA3786FC4014F60A266A7A76CEF7B5A312B39BD240C17730290C5256CE2EE99E22D032DF717B692EEC606B252DE521FD0169237C955FD83F64EDCE1A822BEF31C36961C891B20E7733D9C0900642EA7E24CB6FB55236E562D31495E4B4BFCDA7634BA3DB393CA3391F554070E7F680D15EDF35B750C6FA163C9661B963A31D3073EC83904B3AF1C73D39A3E95B6DB247157563DA1A5D172BC3CF4CC8F04E0E7E555D51E322A198A6B9D9A1B8B6A8E1B4AD1CCF01DDB6C9DB2A4D57FB3B34AD6933D96ED3B6A9E39A30D9B9DA5C77DF20614D741704AD9A329E5B9DDE71555D83E5199CD7608E9C80F428D743A24DC2DE0269BB6F977716EA5B7D6D4379A2A7A870E589EEDC7E6EF95C8BE3BF81DAE2E12BEA66C565B79B9A9E1A37F380DEDE9683DBE7ECAAFF00125E22E6BFD4B9F2CD2F2871FC35353E7CCEBE9FC9B7B2B87C24F1275E5BA2F31F415135B1BFFDAF3CE19DB05DF1F442C2473AF00B82FABE86B62ABA0B554C2F6B9BE9958E646EC1FE6DBA2FA5FAC7C3BD2EA3A3A7A8D4B4D0D2D7C0D0E7C7485A64983464B71D497631F7523E34789DABA1D3E6EB1C5EB73482DE50E11BB1DF1ECBE58D838FFA92AABC5DE9EB1D513F99E8A36BF1D4EC03494F18B1747566B1F1D349A6E296874FE98A8A6F27319A8A9A7733246DCFCD8C9F7F6541F0A348EA2E215CF9EBE7985BDB2734D9E61135A0FE46E7627B2FA1FC16E205DAE94CDFF48EC70C51B9832F95AC3918EAEDBAE3D940FC4AF8BEB3695A37D1596380D5CF9022A768F4B9DDC86EFD5271A17646FC54788AA2D1D6B86CF657363A9680DF4639B6EA5E07BFCA8A7873F1CF71BCC6D824B2C73CF08C7E3C441A3EAF7E3AAA67829E092E9A96775F350CC69289CEF35DE69E57BD80F361BCDDB0A69C77F15B6EB7F9161D32C6C30B646C73D434379E5C10092EF9FAA7520E8BAF893E1D7536A12217CF1D15BA5C3A5F2C86978EFD3AECAC4D59C3FA1D2F608E92924709E9C73F9836748F03279B1DB2A75C17D0B9A2A6AD9EBAA240210EF2C38F2376CF45CBFE21F8A6D9D97199E4BA08818D833D7191B7CA93F71D2E4E1FE3BF169D7AAAFC44A479919E4247438DB6F9513B45037FE4A27595F1199CE8DAE635CE2EC3BE4F6529B356070C8D9412972135448D94631923ECA3F7BB20764B46FECA4B495190531ACE9EDF29EB8232B4AAB61077D932750A9B56C03DB27E5057D1EFD12A05800D0A44D323C68FAA6D5743B26A188D54C78436728DD552941EA9A85A1083565AB40B39428416B60DD49A8E1C8515B4BB7DD4F6D2016F408D0862EA5C1CA615FBA91D641851CAE3BA76202CD4B92B782DD94B3A5DD3BA49426421092D9B241B6D1EE8D48E4CA59C0EC110892680D453514ECA88080F8882D3D559574E22CD5B3BAA677734CFC676C0FA2A6A9AA48E9B22505DDC13A74227F75AED8B8BB19EC3A2AC2F34F97976110ABBF13F4416A2E04FD10B621ACECD906A8722B5751B21533B640C4798C38EABB5BC0A5A79AA81CE3962767E765C5F4CCC903DC85DD7E07E0E5927F76C0E00FB6420CDF696702F7A2735768A89A7AA86105C0B9C491F54D746E9F8ADDCCE76F3B89273D42B6F8677D8E828EB6A1CC12543848D6F30CF5277543D154C9512BE67F5249C7B6EB94D54EA47A1E823EDE4EE9F0B750E9A0967249CE4009AEB488C66A1EED8BB28B784B8032DEE2475DD03E3A567307F2E4020F4EEAD4F8C7667C257AA68A42D5742D6CBF2E2AA9D495A4BE43EE1DFE6A654EE3E5BF04E72557BAA3A939EC5636395CCE975115E91C39AF66FF5C9F1FE329B435191B1EA886B8A6E6AD9C0FF00114166DB01A0023AFB15DCE1FB4F29D4F13648EC12907973D54C34B37D7BBF1BF6DD44B49DBA599DE9001E993D15F1A16C56FA2C49527CD97AF237719F65250FA77C974F027F8986B6173C8FFC423002ECFD2328608C17B3381B03B85C27171BA4C814F1B69A2E9E9182E1F2A6162E2349116BDD238927237FE8854A8EAF125247D1AB6D78731C492E0C192B85BC565E44B507973807A651CD2FE28E673FC871C35E0B411EFD375CE1C5DD43332AE56BDCE2092E693DC1534A5712BE48ED911DB857608046C476436A699AEC60A8BD76AC71763E147EE3ACF07A918F655D4B829EA57365994942DCF446E868DAA9FB76BA248F51527A1D6A7206524F9135702D582DCD2855DF4E83D103A7D6FDB6CA5D9AA8F72A7C8F829E08FBC8DDE34C81CDB2875CAC7CADCFBAB4AA6F6C2DDF07E4A8BDD2B63C1CE3E020C62D7A2BA654061C2356DAE0DF5B4F4EA9BD6D547BFA421543583718D94B232E08B32D7AF4E3D80EE977EAE2E20B4AAC5F5CE6838E88350EA0787E3246FD916EF68A2BDE5FB1DD8BB1EADC7652DB1DFD9281148DCEDB95425B6FE720B890A516BD5041F49DBB951C276CD1C91F687B5BD8A26BCB99D3D956773A368713EEA7F77B8070F7CF5CA86DE246B9A31D41DD3C8A38E37223953206EC372536A2B906BF05BF54EA6A50E237DC21972AC11BB71B7BAAF65F70E0375B117FA9BB04D09F9C26F67BCFABDD9EC7A2353D144E7076E5B90486FB774AC3C7004BA7007A1DBF742EE954F38C64FCA98EB99685E22FC1B5ED7800481DD0FBA87574CE1B1181F0894B82BE487233A179CF546619DD84C2DB10EA07FD5187608C742A94E474BA0C7ED184B31DD326CE4A21330E36FEA87C8DDF3BE3D8204CB9921B7919CAFDC8292862EA52E5BBFBE7F50B69460295328CA36AC12D6E32568CFEE884CD1D31D5690C03D9199B28DB12E7C003D9319C144EA5BD532011D95E6FE06919F84A3814AF96B5212234A8C0270968B2CC38148C2C2969D209A15A890BCF363AAC269CE7B121792B231091EBCC72C98D68E6292CAFB4734950E61CB5C4676C83829732F50ECF31EE4E7287C4E4E593A560343C643949490AC7E2160CC9C0DA359989381F829599251B521EA891515C1D8C019F6CAFA6BFB3BF59505B6DD33EA66779EFE91876DFA657CB18E72D233F656DF07F5EC905C28D99263925635E33B104808E211F4878C9AD64B3DCA0BE53C38A2AB01952C232D7B4EC491F74265AFF00F466BE3BD5330CFA7AF63357181CEC85D27E638DC37192AC5F17B646CB608A187F2FE1C3DB91D096E554FF00B3FB5AC777B456E9DB8BFCC039DB1878C869DF01A4FF009295F203E47FAEBC175B85643A86D33C6FA1A8225969B981C736EE2076FA28278CAF158DF221B2DA4F95106813F2FA4E7182323AAB5B8516614F5155A79ED7473B03CD2B9CF3870DF9460ECBE79F1169AA23BDD55357339258A4781D83867620F745D0D40B8F1492453C4E2CA96383C381DF39CF55F5E7C3371CA8B51590D3D7363A99618B9278DE039C5A06E403924FCAF8A3AB6B641391B80D3FF785607057C40D4D8EB22ADA771F2DAE02666767B7B8E5EFB28EF9A199DE1A8BF672D9AED34B53A7EEADA39039DE65349B96BFDB93A819EF8C27DA7785747A0299F555B3B6E37BA8FE1D1C71B72439DB37D3B91B91BA8BD1789FA5B9D532B6C142FA7A891A1B5333F2C884876240E8775734BA51962A676A2BDB65BCD7639E06319E6B61CEE30DDFA6DBE149B40B0070AF8490DB04DAB756399256CE0C94D4B2E0F92D3EA68E53DFECAB0D67E2FEAEF93BDA628E3B7332D88160CE3A020F6185CF1C58F12157AB2E2E7D54EEA6A588FA29092DD8740E6ED8F6C2390570F2DB1C2DE48C6C703AFCE528AB1160F0F7C45DC74D5519622FAAB6CAEFE2D3B9DCCD0D3F988073800655F3ADF815A435B530B8D34D1D0D66399EF8F0DE57752D73060B8E7BAE3FAED3153331CC6BB1111EA71EC3E117F06EC7D3DDCD152446A6673BAF31F2983BB9DDB6F952ED4351D0BC2D8A9B4CC82DD43435570AB94E23ABE671682760EE5FE51DD3FE22781EB9DE6615BA86F4E8281BEB34ADC93CBD7976E840EEBA6B54E8AAA8E264D6B6D3CD5E302A24CB4967B803B63DD59DA4EC72C948195C04AE91BFC56B86474DC0CF651C9A18E0D6F15741692688ED94ECB9560DBF8C048F0E1DC17376DFB636F75CD3C79FDA03A86F5CF4B4A1D41487A3236F21E5EC32005DD5C7CFD9E764BB73CD6F6328EBDB92DE4230F77BB86765F35B8D9C31D41A6AA0C35F079B0B8E239A367335C3B64807070A063D974785CF1F6CA2A7366D454DF89A193D3E63DBCDCB9D8B8939569DB7C0169DBED4FE3F4DDF5D4A3984AF863FE539CE063A6172A7023C2C5EB5654318D80D25135C0CB3C8CE525BDF97206765F41F53D659787D6C6C142C0FAA700D98E417499FCCE3EDDD3A63DD8729BC345EE09E06B6EEEACA463432406527031825C3B2806BBE0B699D253CB7DBB1370A89093030B4BE263FA807A8EA82EA8E1C5DAFB40DBA691BD3E39A56F3555B9D26013D486939C7E8A3DC11E369AB6CBA4758D2F9552ECB209E567A5F2741CAF23DFE51761A54736F88BF1B777D44F3052668EDEDD9AC8BD0393A76C76ECA13E13FC3ACD7BBB471C6E2E8A2787CD39CE060E48C9522E28F850B9DB6F5FB9E06B9F0D5C99A7900D9B113D49E80007DD779F850E1845432B6D946C19A701F5F523F9DD8C96877FD53506D517BDC685966B7D434D530C6CA7F2DB1E4120F2E3217CE9F128D732C3CCD043EA6673B39C7A49383F75D05C69D56CBD5E5D68B731C044479CEE6279B0771855EF8EEB4C34941434246666E338EDB770A7E90515C9F389944FD838138037476DB505981BEFBAB121D33B0CE371EC92ACD2036E9D154946D9238D80ADD7439523A48799BBA0326942D39051DB1C18D9C77532EA8AED0D2B6DA33B28FDC22C1562C947969C150FBD5B0EFB240B4038983980D92357184DAA5DCBB60A692D467A6C858D435AA873940AE1428C48E3FE24CAA9C846239343848A273C698CB1A110E2DEDCE3EAAC6B13806855CDBE3F5053CB4CD808908275A1446EAEDD1FA8B9750A35793DD3BE8407A89F74BD254217249939596CC853107E4ADEC98CD2E53332E522E4EA420B4351EC53E67363AA1F6705C7A2923AD27AFBA771B100A4AB3D13396B4F4462BADCE03A28FD453941D0E266A0A4CBD679160043620B599BEB67C617D0BF04B6DF4554B8E8CC7EA17CF4D3AC7191A07BAFA8DE09AC19B455CB8C96E30965FB4B9A7FBEC99DC6D40D15461BFC8F713F2B9E741BDC49077CBC8FEABAE62803ADB54E230444F1FD1730F0BAD1CEE71F679FEEB8ED5733B3D1341CC2CEE5F0FC432DEE1EC143F8CF2834CE737A8CA95F092B0474E63777080F1828C1A5796FB157F24D4B151430C6B50E472FD8DDCCD78EE72ABCD4E4F316FD55AFC3FA0E66CB9F72AB5D59418A870F92B131AA99BDA9770E0E2FD614F8B84E3E4A1061637671DFD8290F19607475EFC772A3D6F837C91B2EE74EEE2795EAD6DC8D066DB5CF00341E507B8D8AB87831C3C75C276C2D712E71C64EE72A93A6AC6970ED82AD6E1371C3F76D4B26A66E5EC209CFC2B2BA030F6748710BC35565AE30E95E1CCD8E08DF0ABC8AFEC692794FA46064ED9539E2C78B996F30343DBC9CADC1FA85CD95BA90E5D939CAAB3E0E9B4F2F82C43AAB9650FE8E69E6CE7B239C67BBB2BA8E1AC8BF346035F8EBF7544D5DE463BF4F746B875C440D12D2BC7A24040CEE329D4AE343EA1FB88ECF51CC739DC267359DD26E12D736F248E6E3604E3E8B7A4ACC11DB740BF056D4AF6A3345A649C7507E8AC0D35A0B988C92B6B4D503CAED8E07B291D2EAE110FAA3AA6343EC10BE682F2F0E51DADA1E519DD1AD59C5C8CB4330157570E20071007BA9323E0AB81FBC56BEF6E20B5B9503ACD50F6B8B5D9F8565D55AC48D6C83F9BAA0D78D105E3206F8F651E316BA2411DA8CE374B53DF36E89BD7D95C0E00DDA5306C441231B952C99910267FBD4160F951EADCB5F9F74E6D0CD8F64DEA6324E3AEE9DFDA28FDE3DA7B97BA7366BF9F308CFA73BAC5AADDCC09C6ED4D1B4A5AF248EBB2871F66AE55EC2CDA71CEC3BF6F751AF3395E5B9DD6B4552E11869EDD12735112E073B75534F8286157214ADA2C6F9DD43753073BE83AA96CD0641E53B77CA8C5CE98B8E30A0FDCD29A0651D4383703A296D82E6587A820F72A33516A2DEC9ED25390DE850D8F8C975CE9B6C8C1C8EA074517AF2E1B1DDBF2A55A7AADCE6E091EC95BCD8CF528EB8229F3223F698F6CF4C2270D303EA42D8EE52463BA96E9D8C17B43FF002923F454321D5F8F87B4015B6E383EC9C3B4D40295D379B8947F2FFD174B6B9D276916C6C90E0D4E37C7BE172A5EE13CC3FA8EC862CB1A98F14048C640247FD528D1CD9587C384DA6380AC44CB7C2A1091D977D13F899DD0DA666E8A81B291196B8931A5537AA65CA9DD4269846567CC8C96AD5CC5B3CFEAB68476EE9363D59B322D93697BA753C65BB3BAA632C99FB2498AE84895958E55AA544542C58B42C440DB7E527FBB7E51903432F202C363DD3E144B66D0A7236340C5A4AC2004F5D0E3B249EC3DD10D433C2D4B0E46C9D10B5748998A8D0D2938EEAC2E115B5A6E546E94E191C8C71CF4C03BA84D3550D80EA8D4523A3746F6BB0E2F6E7E994712367D9AD2B7F65FE5929A089CEA2829391EF70F4F37263D2B83B81725C28352D4DBADF0B9F28AA3CAF03D0C6F37579F80BB7B851573DBF4C415542581F2C60CDCC06FB24BC3370D1904771BF54BD8DA8AC6BDACC636C83B8F9CA9DAE01A2BEF1D94770B554DAAFF001F297C0E60AC961DDA7A730710A11E34784D16A0B552EAAB435924AC8DA6AA3877236F539F8EFD558BE1F38BD4B78374D2B767B5EE92490D33E5237E6C86EE5561C21B84DA26F95160BBB64759AE0E732091C7F86EE7C81827601B95181470F4D44DAB883A33FC56ECF07A8C75CA3FC08E01545FEE70D0533496070F3A403D0C683B9255D7E287C1B575BAEAD36769A9A2BA3B30BA205CD6F9876191B0C65756692B1D1F0EEC3CF3069BCD5C7B9382E6B9C33CA7BE4652484823C68D5FA7B475BA0B6C714334D13019300798E90019271BE33D14ABC0B788982FD154893979776B69E5C1F48DB001F85F2A3895AB5F73AB7D54F297CB238B8871CF5EC3E02957866E2C3EC9728E4E7E48DCE1CE3B0FA29B77142A3E81F88CF069A7EF7348DA763AC9746E791D8E486A1DDBD86495C57A9AC778D272FE1AF344F92941FE15635A5D1BDBDBD436FEABE8EC7C42A6D44C14B3F2E258FF00D5EA233895926363CC37EAAB3D11C766DBEB64D37ABA38E6A663BFD4AAAA9A1ED737F9417381C9C63BA6B04E38B1EB1AEBFCACA0B2D1CC7CCC07CA18E0C634F52E24765F46BC38F86DA1D2B6D9A794C72D6BA273A794904B09072DCF6C15B718F8A1476AA00CD3F494DE754E23865A46B32DE6DB98F28E6EFDCAA37C48F10E4D37A60435353E7DCAE639A50E7F33A3E7DF006496E3299B6C4535A3FC5A555A6F15D5F14B25553C92B9A69C12E6019EC17D0AE09F8BFB5DF20688A764154E6E3C998869E6C74195F14F466A60D8BD383238E5DED93B9CA6FABEECE63D9530541A699841E68C968C8FA28C47D07F139A4F5CC174151676C9246F764791931819C8E6C76F7571F87CE2BD6DD9FF00BA7545BA99D591805B9008763B9CEFCCB9B3C3078F2D452C1052C54925C30447E686E703A65CE20AB1BC65E95A9B6C34FA9E29A5A5AE606BA6A724E0F7236D9108B83C5A789FA5D2944E8296944533DA5B172B4363048DB047B2F9297FD5B5973A896B2BEAA490CC490C71CB5A0E76685DDFC5AA276BDD26CACA4731F5F4ADE69631BB8728DF6EB9D97CF0B43F2C34F302CA98096163B6FCBB1FD5307124FC37E265C6CD389ADB5B2B394E7CA2E3E5BBBE08E8BB77869E22AC7ADA116FBD44DA3BAB3682BA301B20907421DD7AFCAF9E11C25C5C5C3918D3D3A1525E0070D2E573B9B7F75B08746E04CA41E46807725DD1244B23EA7982A62A76DA43995B5EDFE1C17177AA5109D865DD720286F1FB8D74FA3ED6EA0A491B3DD6A1A4CD234E5FCCE1B927AEC4AB8F4558E2A4A0908AD867BBC501E70C20F2B837A01EEBE4A710354CB5771AE96B5C5D54262C6B4FFC581807A052850FDCEC3FD98D61A89E7AFBCD5B8B9E79DE1EEFF1F5C2A23C52F1427B85F6A04C086C44F28777F90BBDF80360FDCFA5627F2012550F308C63F305F3F3C41DA9AEB93A51B3DC32E1EC81B24DBF24223B9FABA6C5138650475E89AD0DAB60538AB88301FD544D87432BA5431A327750FABD54C6924103E105D69A9B738CFC60A804F70E62494FBA886512E4B56BC6F42423BFBD1920EDBAE7C82E25A8FD935738100F44932168B427B235C7384227D240F5FE8A4364AB123061188ED0E3D548B900ACE6D15ED94DA4D1E4F62AD2934F0EB93B248DA4A7DA332A5A9D12EC1C0394325D1D20EA0ABA1D6F72D5F69CF509B68C52F1584823BA3714380A7D369E6EF81BA0F2DA707184D435906A8C93D136ADA72E18009FA29EC9A58B87363A1C2296AB29864649C81DC843B07A1C1CA66AC5653777D25530B43E5825898EFCAE7B4807E84A0CE66175E789CF1166EB6FA6A16D0C71BA0680656300CE07BE1725BE03D0EC40EFDD038D0AC6D95BB46560B16F094287275A1ADAC733248E6CF4EEAC5A3B334B46CABAD1723411B2B5EDB30C29D080D72D3CD3D944AE7A3720E02B4F941436AA34F409514BA30FCA6A7479077D95B2FA609ACB4ADEE10B8851EC8569FD3DCAFCFB0EABEA97808B69361AD3DB2BE71D0D281CD90BE9CF81FA631E9E99DD9EE03EAA2C9F696B0CBDC48AFF004BE5DA6A8E46F90B9D784F6ED8E3BC849F8DD74FF1729DACB63DA1CD048CE3BAE6FE1E1E5D9D90739C8EE1721A9A723D17C7DAC76742DA2A3922C8774011FBA51FE2A825C0DC34E7F455FDAAB9BCB819DD581A26E00C13424FE669FEC945A71A23CB1719D9CE1A0A2E53333FDE72ADF58D19350E3D003D55935245355CACEC5C541B57B72E71EC4ACE9494666D460E58ED9C79C73D3F9ADE6CEC475ECA095F7311B3900073DC2BA38E36FF005B1F8E9B2A66E16B71392DFB2ECB492B81E67E46159591E7D69FCD8FB7BA91D9236B585CED9CEDC1EE93A7D3047ACEE06F845EEB1B0B5BE58DC0E8AFA5C19B0E1856D5A91819C877F7F751B96B3F8A4E7D394C66E7E61E9C6C959284E32AAE437B4D3E476EAA273EC85D2D5398F0E1FCA723E513821C84364A079761A3650C5F268E685F2496B2B4C9EBC8C91D12064181BEFEC91A5A57743D53C969DA7000F522E99526B744905BEF2E6340C61BD895B5E2F048D8E76EC869A421A324EDD938868B23E549220C3CA68825C6091EFCE4A2F61D39238E794B94929ECFCA72E19570E86D30D7479C6328DAB40E15532B7B6CAF8DA1AF047D559963B631CC0F760646136D5DA61AC6171DC855D5AB5E792F2C738B8671CBEC8F10B5EB80A6A9D391C73120821CA1D7AD1F93CCC1FA299DE35745280794656B67BA31F9070AC348C2815CD258DED243812113834E677C11F553E82CA1EE38484F160F2F53D13BFB42C2AE645ED34E19CEDEFEE90B242247BDAEC6C73946C51F29717050C75698E4716F42775522F935750AA03AAA9392570232DCE02394F4C0B41EB941AA6B39C8D91182A48031D94991F056D22B91AD54203BA7283D50394E5E5A077D91992AB99C3283D69C4848FD540BA3533521C1848201193EC8A47652EF481808351D59E71919DFAAB36C162E619E6EA847C5154402B34AC9110E692075532B3C6258F0EDC80A6551A38BD98DD0BA0B20889537C11B8FBC834FA7839C4631EDF2B2688B1BD318EEAC3B846D2DCB5BB8EEA357587981FECB3B21D8E8E09406369AF796905F907B28B5FE269D875EE51FA2BAB212799A31ECA277BBC365792D1CA1343A20D4CB904548F8C1FEFF00442EE4360075F6455C7273D709855C5EACA9D70664E3C0851469F49D124D0956A9519397DA309D34E6442BA3CA1C62EC8CA6BF265E7FF55B45FD7DD6591E4612863C0C2164F146923CF571C94D1F163E72961104949B774905288990B0B5207BAC222B933FC18F6499A3DF18DD48050773B7C271556B1B3B9720852ED20A228DA6596D367A045DF47CA76D87B25A2A2F64D446D013F07F0B575B823CEA229375194E12564764B40F649B6CBF1DFF00A2919A45834C998A88D3ECB8765A96BB0F437DDA5A47D41469D4E985E30D8CED971200F8CA787043289F5B3853036BB495053897CB9256068C1EA71DD47F48B2B6869AAE8EB39F929493175DC6320A8FF06F4ED4D2E90A7AA7487CC8DCD921FA0DF052F4DC6899F5F495173E56D255B0404B7F2648E505E7B1FAAB5B813813515CEA24BA545C28E47327A790BF2D25A70D39C6CBE8BF0875BDAF88765FDD973023B9533035B3F4903DA3D2E69EA31B2E40F149C2B974EDE1D3319CD415DEB8E403D043F7D8F4EEA19C04D6D2515E83E84C84BDC368B279893D0E10500CFA65C1FAFACD291C76BBB3CD6C25FCB495CE67398C74603B1C636DD70DFED038EE0CBCB5F5933A7827F5539C9E50D3D31DB2BE805BF8B7FBCE2FDD3736474B572C61D4EE7E039C71B75E84AADBC657861ABB8D8237B181D5B6EDC63773E36EF91EFB269300F947A86D8F63CB8E7181823AA1F2F99200D68C9EC47507E54C63A986A1AE8AA2430CD17A5E318702DEA307E887D2CEC6BBCAA263AA267FA5AD6B4BA4713B741943D8449F86BC7EBB596781E5DCED63DA5B18392467A7C2FAB977B259F58D861AEBDD29A32C602D99DE891AE03F30E84AE64F087E00042D6DFF0053111C4C1E6C74B21C74F501203D1447C6978E5657CADB65A9A23A3A621A7CBF4821BB72B71B11B23480A2E1B1CB63D30D3596E7DC6F05A7681D0BE48DAD1D5C0EE36427891C1EB2F1199F8FB55CDD49738D84496FA93CAEE71FC8D8DC411BED90150FC31FDA235F699236F9024A3680D9237C4D24B7A1CE477195D3D69D27A5B5A065C2D154FB05E1A39DCFA73E5B9EE1B9CB0100EFF08AC547CFBD6BC2BBA699A97525CE865E5CFA5ED612C78EC4380C6FF5562F04BC23DE754CEC73289D4B6D0E05F2CA0B1C5B919E5CE32BE90F0AAAEAE695B68BCD332F31427D15F3301765BD39DC7F5EAA4FAFF8A518A8367A7AEA5B782D31C462735B231C461A1A07B6C80623D74BFE9FD03696D3C623F3F931D01924931D4F76EEB963427ED17A3BBCB536BD4B4CD7D04EE2D8643D581DB039F8EAB9BFC5CF0DAF369B8B9B79A99AB6095C5D1551C9CB49C8CF61B2A3EFF43190D7069746E1E97B7A8FAFCA6B1CFA0B6DE11DC749D40BE69A985D2C32BB9AA2918EE67471BB777A0139C03ECA09E2FF008234D74A466AAB1370D3875752818744FEAEE668DC60E7A8547F86CF13B75D3F50D6D39755D2BC86BE96425E1CD3B101A76E9F0BE8258A46095955241F83B6DDDA1B534AE186173FA90DE83AA38F21A8B3E7CF03381972D5952C869E07414CCC7E26A4E4461A3F31E6D8640CAEB5BA6AD8E80C5A3F47C6D9AE0F2D6575C9A33E58CE1FEBC6DDFBAEC6BDF879A38ECCFB6DAEABF7552C8D2F9278B01F876E49775C60FBAE6BA2E22694D094137EEE9D977BBBF9B9E7610F95F21ED21C92003BA66A85C86E1B051D82E56CB732474B7199A3F19339FCDCEE77E7C8CF4DCAE75F163E19BF03A9E96B4C78A0AA998F7BBF9798904E7B632A27E1DEBEEB7FBF4F77984A5C1C5C00C9113739007D175278D8D69E6D9A9637383A612359CBD64CE40DBBA912B255165AA2F8DA8A6983AA00A4A4A5C46C1F9410DD883DD7CCED5BAA054D64CF327380F735A7B601385DBFC73AD16AD150E1859535100CBBF9C82075EEBE69D15D3969C1E8F77A89F92A39BA45B8AF87D133A9D4422C827A6EA0BA9B88A5C08694D29626D548D8E597CB61EAFCA8C6ACB1B6099D1C5279CD1D1FD956B1DC6B9F825B62D314753473544F5BC950CC96438D9CAB395DBFD0AD837B1C8FA250C3B7CA2BB2BB76362ECAC731CEDD96D34242D00DD32641245A1C32D4039B94957CDBE9C3867B2E40A3AD7C6EE66EC55C5A3B8B7E9E490E0A9E32A22A2EE6D0B0F649D4DA80F6511835EC5CBF9C7EA9BD6EBF8CE3D7FD54BB8449FF0077827016EED3D9518A0D5FCDB0F7537B5DF860651580D0067D3A067AA0D2DA0177A77563D4D53483D028FBA66F30000193D53ED4081E0B2B88D86E3B764AB34F1C64B73F20F456349608D9131E250E73BF94249B48DC6DB14EA28455378B36416B9B91EF8DD56BAA3862082E8B7F85D29556B05A4EC54666D39D4FF44D2888E48B95A9F19C39A463E10F630AEABADD20C901E660FD142EFBC248C8259B155B612D22B3D3D290A716EBF1180804BA59F19E888D2DB8E13F23124FF48709BCBA801EE83494EE4D5F4EE4FC8EF80DCBA85BD33BA40DE01C0CF751A7B30775A4B2818C1DD2B6322671548703B9FB2FAADE0EA94334D35CEE85D9DFBAF91B64AB700E39D86375F607C355217E9581C3FC24E477D9439AB659634D1B9959F887D78D7B9B0B1C4670300A875B19C8D8F739001E8A0DC4FAA9BF1DCCE18687F53F552475E43B9395FD86CB86D4C9EE3D434114A145B9A66E05E3A76C2985AA5746D38EA540F428F4AB21B4879011DC268743E79272A285E26B5CD94BC8DC950BAFABCB727D95BFC4AB46467654D5D21E4F90B372AA9266D626A58E8A8B8A36E12C24B772D39DD54D15B438649FB2BDB59460C2F3F04AA1A9EB4E1DBE0EF9F85DBF8D95C793CD7CBE351CA398ED18D86F9F74849A7FE304AB6F81B416CAB95CCB84E226B58487671BA86EB3AD822AA963A73E642D710C7FB8ECB6ECE71D27C1167E99C63B94A36C59DB08BB2EADDB2764F60AF6E4E30AACCD4D34B90041A6FA80128749E06DD54829EA1A0E7DD3D7D634B800A18D59D04DDC08A5A747B8BB3D7EA8A3B43F2BB9885605398C33246EB31B79860052522A463EC64127B06013CB903A14D4DB8E1A718CF453E969C60B7AA17F871D08E89DA2B69BE5112AB8882063BAB3AC57111C6D19C6CA290C1CCF70C0E990969C48037EBFD14DD4418AF787B59EA368809C67B657315CAEA3CC71E5EA7AFB2BD3564BCD1967C2A4EAAD197150E2EC6F21F6895E2FCD6B5A038F3613ED33747119CA1F2D9B9F623A231A6AC8E69C63625596CC08AE2C9EE8CBCB8B9DDC00901525F3E7386876E4A3562B38872F1BF30406BB791FFCBDC252E83C3C483FA828DAE665AECECAA4BDD272E77C1CA9FCD752232DEBB2ADEF15E4E477CAAF056CD4D4BF689C123B9465D8F6522B1D4E30D71CFCA8B318EC0523B45338E1C9647F0068A36C970B2646400A3F77A12DECA676DA81CB82826A3F808225CD42E5119B0D67AB18CE0EEAF0D3B4CD0C69FA154C585BCB2EE362AE0D39337704F6D9016B1C6A25814B778800DEF850DB8CA0C8F0700764C6B2B9D93BF4426B0F3EFCDBA99F088A11DD2B1C535CF9496F50845DE424F30FD16E0800EF929956546CB326F93B4D3C52C76462FCECEFD0FB28B32A32EDC611DBDCB918F942E48463E51C3A31B237298930601ED948CF16CBD50700652334DB2940C8A91AC8E19C7C2558C4D9B28FBA731467AEE3E54E97073D99EE74C7F41A6A79DAF745139E1832E21BB051D7337FBE3E72A6B61E21D5523248A17FA24043C90A10F9B99CE7677E6C93F2959147AA17A780E7E16D50CDD6C245A3A44CCB718D094EDF6099C911F644B932329A38F5C248697430733E1792CFE6F8584456A2E7B7D107169CEC76C775D6FE1F3C228BB53B9EF78006E36E8B92749CA1F2B59901CE23195DA5E1E3C5DC3691251D5443940C07823AAB91E4AF1655DE22BC3936D0325CD70F8EAB9C39874030174178B5E3CB2E728F2B3E5FD5737D3566D8ECA390ED0F8530292960C2523A90B574C0A123E86DC8B57B12F90B2084891218CB16106BD9F4070C6C41F9C046ABCECA3F703E839EDFD50FC90CD1F59FC295EE9EF9A5D94A6460FC3B30E6B7F3640EEA9DB669B6DCA82F76C1BCF465F252FBB7937047B7455AFECC1D4F510D6C91B8E28A5CB5F9E81C7A299F12F5749A4B573A59627CB6EB80C4BCA09058F3838C77C15622EC8AAC5B84DAE62D5D62769CAE20DDE8F31D3388CB89692D003BB630A7FA378136DD016996BEB792AAEEF6B831A70E6C67070475C10A537ED4B64B444D934BDBCCB73B97F11AF2DCC9197EE7B65B8CAE63F12FC6392A685D4156E7C75E093279AD2064F500944351CEDA8389575BB57BEE22AA4F398F261E576030039002EBEF0EBFB4F2A684B28350C46684E19E775763A7AC9EA30B8F34CD045142DCC8D0EEAE2D760A9C706382151AAAE51D242D2296323CE9B1FCB9DC653340B3BFF50F85BD03AAA41718AAD91BA4F53D94B3362DFA90E1EE8AC2DD01A2D85ED34F2CED1E82F1E74F91ECEE5D8FD942B88DE1EB43697A66B678EABF1859D23AA7379E4C75239B0067E133F0EB169ABA453C94F42DA9A88326582A4895CE8FFDC2E27271EC92446CE74F13FE386B350BCD3D14862A2071C8CF4BDCDFF780ED85444FA45AD635D186F99D4E7A93EE5761F197C16505C44974D267CA9E224D5DB1FB3C387E6E461DF1D7A2E67A2AC88BDD475D1BA9EA984B5CD7FF000F71D4027194CC75C95B4B609A6CB1B8C93EA1DCFD14D7C3D69FADA7BF51C5465E6473DA1CD693CA064643804F2F779A6A5CC7037CE9DD86B394F310E3D300755DA9E10F803359A8CDEEBA174B71AB18A4A7E524B79BA38EDB7BA2482A3B6AEB708D907E0A9E7A686E6F8378F2D04C85BD4F7EABE1B7892B6DEEDD79965B90923A864EE74530E6E5700EC8E53D17737897115B291D5B355BD97F99DCF172BF3E537A86100FD940786DE2AAD1A8206DAF554219372F236ADCD1CD9E81D93BFCA5B41A2C7E036BEB7EBCB23ED172E517186222291D8E625A3D383D57CF9E20E8B9AC55B536DAD6B8796E779448D9CCCEC77EA57675ABC09DD2DB5915DB49DC29EB622F0E641E6B41E5CE70EDF6D9752710FC2E516A06D1D75FE9D947554AD6BEAE36B8624E519279FB83EC85C4248F9E5E06FC3754DDEB4DC6663E2B6D282F74AF1CA1DCBBE013B2EF8E05EB8835054D4D179067A7A07E2190E3CB063E801E993855C6BEE224D7E959A5B49C0696DF1111D65546CE46F20D9DEB0002703DD34F12DC4CA0D11668ED16B903ABE400CB3467F88E7FF339C46FB1F7493A1AD81B8FFE31EF169BFC54D5F41F87B4B5E23C39A4B65667977236C10AB5F1A9E1C29A414DA8B4DC6D31D6E3CF8E1F5318F78DF0D19C1CF52A57C2EF1CD68BE5BE3B6EA4B6C954F8C727E25AC323C83DF9802411F55D47C14E1EDBA185F1DA2ADBF809E33E5D254EEE8A423621AEE841475612B286F0D3A19DA42D7FBC6EB52D8E4AE0310123980774DBAABE745F0E2C55CF8AE2E90D4C92FAE381FBB1AE3B821A57CD1F16AFBD525E7C8BB4921A78E60EA7C82627C7CDB0F6181D97D0FF0008CEFC7BE96ADAD6B6929E9B972D18697F2EC4F652465483DCD1407ED42E29E7F0D6C888696E32D6F40DF6C2E02B8B886067B0D974878F08259350BE673B2C0481EDD7B2E7CB85B89393BE7A2A993BB2D45DA22226DF0EE9FD948A8A9E9CC643F7763D25BFE6994F67CF65AB29F04000E3A950B64F177C3025451F21237704D9A4E48C152F96D9CE3618C217556E23EBFDD322B648D3E3A04BE0DBDD327C7FD11D8E98E718C7C7BA99D370C44948FAB333072748B2398FD94A9105158F967EEB4921DF3D0A2C6D87AF63FD168695202511945564777251D56E383CD8FAAD9F4DF1F44DDD17BA5605127D3DAA1EC232EC8566D9F5E35C076FA95450888E9D1282E2E6F4251C640B4748C7AB0118E71FAAD63BDE4ECE1B7CAE71FDED21FE623EE958AF32B7A3DDFAA93711D1D4F417F03727E9BA2B16AF18F75CA349AE67664079FBEE89C1C549DBD774EA5C88E9E8F520F9DFB24C5E5BEE573A43C6093F99BBA7D0F19F1D5B946F208E81FDE8C206E0FC21D74A963BE02A769F8D0C3FC9849D7F1681E89B7A1E89D5F5D191D1462294671EFD07BA8656EBB73FE8B6A2BD938326CDCEC47540E486A2C3BBD89F0B58E7B701FD3E1079E2C1C21F26A77BF00C85ED1D33D96B5374CE374D64D567AA2937C9C21F3D1352B575FB217256E4754CDF044F80944D0D61DFAE365F412DFC5FABB3699B74D0FAA176048CF8F85F3CE9002D393DC617D07AFD246AB4ADBA3EC700AAD9FEC2FE8B9995D6ACD482E65B590BC61C0131677053FD215992D6B9B820EF9EFF00214319C2C9E825CB03833AF292705587A5A7E620EC0ED904775C5EA23CD9E93A597145F5C3FA7D87CAB463870DDD56DA07F2B7A2B3AAB68F2A6847DA57CEFDC551C4968E5701D950375977C67ECAF2E2054F5F95CF9A825C480FCACACCBDC6D69DD408F5F290B98F6FB82B966EB50E8A6958727D457615FA9F1187E3A85CADAFE800A976075DD74BE3A74A8E37CD62FE620C2E2E0496E739F9FEA966DE1FF3F646A934F83BFBA78CD2FECBA38BB38ED9C0122AF93627289417B7A374DA4CF7E8B2ED2F84D3816F4B2A621437870EA728AD35FDD9C809A1D3C46E978ED640CAA3F27551F740394DAC8C843718C6DF5526A7BE60632AB5A7A670767747A2CED95295E2B868948BA729C976C7A14CEE978C901A72A3575A824728FE54D6884877391852329E3F6CE895D3DC9A1E3277EE8AC770126E1C035BDBBAACAE0C918EC8C9CA2D413BC37382329E52E0792AC818B8570E6764284DC9A038E3BFF446AB9AE70CE7755DDD669039C01DF2871303C8AF692BA6E418248C6718EEA4F0C6CC0E5C745504775734E0E7214E34DDE8B98491BF65719CF2FB49FD3D7FA304EEA375AF0E7141AE7A9F9006F7EE98526A105DBF72949F0498799224D554586F51BA0153616E73D7E88856DF1BCA13165E4121418DF2686ABA16A6B3838E83EAA4943630D1EFF451C15C0B86F8535D35EAEE8327658D0440539731C0744EEEF1F33411BEC9C6A08407EE13096E000F8EC85745ACEBDC057B771818211986E2E1820EE989AD6B9233CF81CCA2BE49D2F6878EA0713BF7D92DE681FCDD9425B75DF2895BEA8BDC328E4E91060E661E91C1A09CF54D2B5FB6DBA212D38D82615F9036545F2CEC22F6E322D5B19CEE3033D5376B0128DD4465CD3941C43CB9F747D193572B1855404BB1FA26B590E063629FC65C49CFD96B5E011F2A6406795200898F360045E922FF00113F40B48E9371B22EC80637529CF4F960BAB849040D876F7285088E371B047A58324EF803B26F33021B0E1004B1BEFF00A24E7F84560B6E772B3516923709ECB090CA0239707AA6120EA9F4B4C42D2783A256049030C3F558444529584AC8B692BA261EA090EEC4751F44FE589FD4B9CE27B94B5A69C15246DB8602B8B83323C114740F2DC1250FC169EBF652FA9808E810A9AD3CC7299AB1DB05B2A8AD855613D92CC5232DB4A06984B9EC4855A5229B2907D115A79447D12E9043AAA70C28F5D5B969C1D91792227AF44C2AA9C92C85A0B9F238358D1D77D90AE469247617801D1467B65C6A398C6D80178777CB77566E9D92A3514F15656B18696DF98A20E00F9D2038077EAACCE0BF085B67D1B387FF000E7AC88E7B1F504DB4A59FF77DA684B19CC01323DBDDC739C9F756A31215C301F196B5BA5EA6D958D7B0D5554CC2598188E3710395A3B602B1FC5369CB1573694DCE16C71D744CE4AD6B4379257818E670ED93DCAF9FBE3178C6EBC5C208A27E648A46B63DFF0023F38C7D8AFA6BC23E0EBEE3A6A9ADF7C114E5F102C7308E78C11E939EA084DCD8128B396ECDFB27ED2F865C5F192D4BF2699B1C8D2C0D3BB41C3B39C7C157168CD3D4DC3AB0CA250C92BE52EF2DEDC12F07A6E865960D3BA327104F5C6A2A647F2D3C72B9C5D18270398938D9539E35FF0079B792B6A7FD6ADB3E1F0BE2CB9B083B8CFB6148D5119CB1C52BFD45DAA9F5B709E47BA479736224F2B5A4EC3E3090D057DA8B4D5C75F6D99CC7C6417C20ECF6F7047759BA358F687B1DCECC0DD2368A7646F73DCFD80CB73D33EC82C6A47D04D17C408350451DDEC950CB7DE69403594A48636A037F302CE873F45626AFF0F562D6949CF530B29AE6D6F2C92C186B9B20D8BB6EBBEEB8ABC06F07DD73B9D4DC647C94D4D4AD73A42D25B1CB807638D8E55A7A37891551DD6AE5B597BA9C4A5B86E707070512E44A3F82D3E047ECFCB2E9A99F5D71A96D7CCC39859263D18E871DC84638F7E36FF02C73218980005B11E51CDEC3947C7C291EB1D18CD476F7FE1E69296E71379BCB2EEAE03DBD895F3A351DEE5A7AD7D0EA18DF1D4C2E2D8252088E400EC413B27BA0F69B8B3565F2AE4B9DC652D8465E038F51D46C7A2C688E07BF545CBF09491363A6A7399EB7F28646DEBBF4E83DD67506A096ADD0DAE84174950E0DF4740D2719DBE174C5F20367A1A5D2F636F3DD6B437F1F347BBA36BF1CC1CE1B8EE9ED8F28D05B861A6295D5EDB3581F3B21A1C1ADB8798FE57BD9F99AD39C6E476532D49E2665824A882AA91D5F4101F2E5922CBA40D1B12EC64A1FC57D5D45A1EC02869B964B95533F8EE1BCA6578DC93D7625723F861F1035565AF7C9758DD3D15C0933730E60D0FF00AE7B14DB904A1C1D85C4CE33D4D0D8CD6E90B653BE9A56933BA3C1AA8491EA2E03D5B7C85F37A8F35AEA8B8DC2774F52EE626379CF29DF6C1E98E8BE9047A3CDB65FDFFA79DF8BB4D5ED5D6F69E60D63BF316B3B1DFD972AF8C5F0DA226FEFDB3B5C68AACF34F4EDEB039C72F0E6F6C6E8687493E894F835D2CCA3B3D7DD648E32487F961CC0E03AE319509D2DE2ADAC932F0F8E7F38F9463C80EF56C3036567D756B28F428746E0DF319B7C923A63AAAF7F67F784E96F152CB95C2370A0A7779AD2E180F7039C6FD93F285547636BEABA6B9E9F135FE82274D2303691DB7984B87A5C7B8EC99B6E0DD23A40004365AA77F09B9E81DF947BF42A05C58E36535DB51C168A42D14F4380E1FCA4B7A0F6EC83F8E6D0179ADA18E48313535239AF7451E496359F03E0264AC2714FA209E363862E92CD6ABC349F3240D7CE3B60E0F55CBF516D06363C630E00EDBAFA79C33A2A6D53A3C52C81A64861F2F97F99AF6B71D3AF55F36E7D3AFA39AA2825043A07B8349EED04E104D714146D70450DB483EE0AC55DA07D11D7B0EE31D3A26D5232ABA8963B23525372F75A1A36BC0CF64FEB5887B64C388481AF87D0D67B7E1C3E1621B79738B5A48CEEEDCE3F44ECC65C762A49A5F484D3F37200030649F708E3C95A71DA4766B1646DD7A7C14C6A74F90320655914968C0DFB1C612CEB48C7447B48E5C9547EE3F843EA2CF83D15AD5B69007451AAEA1DFA27A40D1029ED673FE49AD5D90F55339A9F7E8BD253823A26697C11B44145A4E3A2D85A891D31853534631D1662A21EC9812022D4727A85A4B46E1EF92718C6CA72EA2EF8FF00926D259DA7725C31EFD09F844902E884BE94FBEFECB48E33F756E57F062E4CA5FC69A379A42369B94F29FBAAF9F6FC64E3EDDD2711A818C8FDFEE929C63A279E5E3216AC832145C92A19B24206414FE0A977BA43C9C6CB668CFF006443343EA6AF2D3B9D8F5466DCC320CB7A0E8A33F85CB801D0ECAF6D03A01A191E7A9DCA28A4C14D9009ACB239BF95DFA20F516B99BB79648CF55D5157A539631868E9ECA2B53A65C76E518FA23D826ACA5ECB19E5C3A3EE375F4235CDC24A5D2D6991A0B1B90491D36C755C85AC346BFCA3246080DC12075385DFDE1C26A2D53A5BF7413CB554CD2035C47373636C0EAA1CD16E259D34D419518E34C1554987B479AD601CC07C28DE87A9F31E48DB7CFD5452F9C389ED324B453C6E6B98F23988D9C33B1535E1BB58C6F6CE5721AA83B3BFD064DD1B3A2B8792E5A36E8ACA9EA7319506E1D5B320386E0853ABA5272468E2AA216497BCA5788130395CF5A92A3966C67BABD75FBF0E2B9F757B313B09EE56465ECDCC7C4112CBBC59A66BBDF6C2E60E27D0F9751EAFE60BA83500269E16B7BE1513E20AD01A6377F30C656B78F97273FE5E3702B7A19472804E083FAA274F53BF50A0F0DC0B1DB83849D46A3E5C9C15D6C5D1C54D522D56D78E9D52914CD2AA6835CF28CE093D116B76B9E61B8473970069FEE2CBE504258538C01EEA1947AB814669F51B4F7E8A849A3ADC2BD816650353EA6A46F70800BE0EC884570E6C60A36F82B453DF415FF473CDC6001F29856DAF93D276C7B2742F3C98C3B7E85277B0EE5F3339525A71B206AB202A1B6171C9E88A4168276EA10DA5ACDB73D514B75D71B650F6B905C5BCA2170B0E02845CB4C92E2FC0015A0CA80FFAA037AA1C9C0EA7B23C5107C92F6159D45A623923F37C85BC0C731A30338EDEEA7F47A09CEDDD80112769518C63E8AE38BA39D8D5146DD6096479701D7B7B2D68A8256B8733491D15D2387C06FD094628F44B0373CC09EE0A8A4B825D346F2515155599E5B9013BD2DA78BC1711B8ECACEACB3B73C98C6DD5628E8A38DAE0CFCC0FEAA3C51E4D2D6429159D5D89DE60C348DFA29959A9F937CF647E3A3F3772DC10985C293946C3EEA19DEE2EE8A151B015DAF27272DE640AB6AC1693823E3D949CDAF0399CB68F4DB648DC477E89741CE2E522BCA4B80713D4279535996FF92D63D3C6373B3EE9A54B0B5D8C289F64928B48674AC77374277527B7B88DBA14B51DB1C402004E63A3E5392134985A6C4F758A1AB27A923E89C3240E69EA578537DC9E896B6CE035C08DD43C1D0CE5C500A3610EDFA12B377B78ECB069DC1C49E89474FCDB25D95B6D11B9E32093D40439D53939C23F70A5EBEC503118CE14F132F50DB1DDB67DF0E1DFAA903A21CB9C65456269E6C764768AB4E394A90CB4B911A8A60EDF1CBF441E68FD580A45C9807287168050B2CA54216DA4C1EA4EFD116AE6F28CE3AA654D291BA755729737EC82C3A045CE41CB8C7DFBA6100E6FB775B49263AADBB12DD93D91B30E691DD616A212579385B5138B110A614A3231D942EC4DC295D254ABC61362B347D9691D10CAD7F13BA72244C248C496E053296D3F08CD3CCB67CA0A74C7E88CBACE3D8A1F35B3D94BB210B9B1CDF6412E7824F8237350E01DF7EC15FF00E0278574B71BABAA6B0B7969B76B4EE36F85485C221CAE774C34EFEEBAA7C076839FF095B58C61E60D2E8CF6763728E11A11D5DC49FC45F2B29ED144D7434503819E520E1ED6F66FB6C140B8C7C4CA783535B2C4C735B0B6311BB0460ED83CDF27E55E3C13E27B2A6D15551131BF8AA66BDB3000641683DFECBE3A6B7D7B5936A392AC733EA7F17864609738FAB181DC2372A2168B6B57F871A8A8D65514D470BA58A397CF2F683CAD19CF5E8BAFB5C6B7B85AA94CBE6163A1634319CDD7906E31956C687BFD2DAADF156D746CA6AEAD85AC7038E7DC6C493B82B89FC533AE16DAF655553CD65AEAF05BBED1077FCB2A441277C17AE87D45A6F88144FA4AB8A3A7BC46D204A70D94BC7470775C67B269C2396A2D72CDA4752013524E1CCA0AA9376E0ECC1CC7A76EEB8FEF5A21D04915CED133A29011237CB3827BF2903A8ECBB0F857E206D1ABA8D96CBCF2D2DD29C3445393CA4C8DE8E0FDBBF643760BC6723F1EF8612E9CB8C94754CFF5495C5D4D3B7F2169DC7DB0A09A6F4C4D77AC86D96D6191CF78E797070D69232BEA07888F0872DF2D34D44D9639EA2001ADAB2E05CD60E9DF7C0512D01C31B2F0EADD255D5D4B2AEE0E61F51C73B5D8386B5BD7AED94206C0171EF5053E8DD390D9A90B3F785635B1C85B82F2F78C1E9BE374CECB4ACD31A563A999A3F1B540CA5EEEC5E33D0F7DD543C0DD2959ACEFEFBE5735CDB752B8BD9CF9E50D69C8033B6527E3538B7FBD6AC50D39E5A3A401BB7E5C336DFB764F63EC6565A27C505E6DB5ADBAC8E2E8247EEDCFF267DBE8BE81DC6CD60D7F6B6CEC0C358D68CFA792463F1EFB6775C03C09E04546A3AC6E5C62B4D090E9A476CC7866E5A09D8E70AC5E37F88F8AD5571D3E9F8DB0474F8638C7B094B762E763DD0B617A6CB8F43785F834A97CB1364AFBB5412CA58F05C20CEC1C4F6C29B431D0E8DA2A8BC5D6512DEEB039C39B72D2EDC31B9E98E8B9EECBFB512BE084F9B6A8A59B1CADA9272E071D4770AC2D25AB2D9AFAD73D2D6011DCD81CE8CB9D83CDFCA003F28B77014B1B3926FBC4796F55B2DC6B09765C791A4E5A1B9DB64FAE1AB22733CA9181F1F468F60A28CD07536DA99ED9564C6F8DC5ACE6180E19F4907BAF54E939D8F0D3B83D08DD41264F1C4E8B4B857E256A74E4AD9291CEA8A176D5148F391CA7F3633D365D63A7FC4E69BAE67353CBFC2AB1CB556E2DE62C73BF3168ED8257CECD67667C500881CCB3383401BB8E7A0C2EC6E0770B2DDA4AC5FBD6E9047256D4B39A10F032C18CFE53DD4F0901E9ED2F3D21E122867903C5409AD25DE6368DEEC7213BE307B28F78CEF123058ADDFBAAD31882478F2DA236E0341DB391DD708EBEF1AB5F512FFAA39F4F10765A18480E6E7B80BA3ECD5B06ACB09680D370A76E43CE39DCE68F7EA94E541286F39CF8276C9292E34F532CBCD51532073DC4E4FA8E4E4AFA6BA7B563E29CD2FA5D154C1EA6B8679896AF947A52EB2C77282967CB658270D737DF0EF75F4CA099DF8FB691FCCD8DB8FA809F1BB0FD3DA17E1FDBE1B351D7D4F2F91FC4790DE8CC9F85F3B3897A84DC2BEA2AC6325C412360467D977FF8FDBE3286D6F8C7599DDB6DC85F332DB37F0B6383B93F3951649513471EE562EFA9237D89E899D53FDF73F0841B911FAADE5ACCF450EEB05C768D6B25F843666F7C27151294D66ACC6C858CE9A1A45585AF536D395CEECF7373D70719503A99B7CE11CB1576E149195159FE1967418D8A7046DD109A7A8F484E8561C755614AC8651A335718C7450DBA8393B614AAA2B0E3AA87EA1A9CE4E50B23A01C953BF65E7CD8E882FE3064F54B9A9D9022393A6126D47BADD95210D336C12B0CA538C958F096F7F7CAC5637669036C8383F0B439FF00BF659F3CE7A74E9EC89305C68BA6EDE2E6BA5B20B2F23053B3FDD1CDFAAE7699BDF3BF7472A26390DEE7A841EE31019C7DD3B644E54067529712B46B307AA732F376E8B474600CF52A261C5884F08EB9DD36A71F09D3DC3D936A8C842D92B41281987467FDE0BA9F4544D2D8B2372D195CAD42EC98FF00E20BA8B4BC80470FD029B1C41A2CAFC21207B7659A8B534B7A0C84EE8C82C072946B413FDBEAAD82037D0B3625BE9FE66E3623E8871925D3D2C57EB6C8E635B2B5B51082795EC24736CA6F1D19C1CB7391D507D475AD16CAB825687071CB7BF2E14791703420DBB3AD38E559417BD3ECBC43C8657421CEC63998EE5C907EEB84F879AA4737292719C7DF29F49C4B9AD94944C0E2EA0AA8CB5EDCFA79CEC84D6DB04723668C0F2DF870C74195CA6AD1DAF8B9D2A3B678057E0EFE1BB71DBDD5D97AB40730EC765C8BC1AD46617C6F1BF36176A58AB1B3439C6EE6EEA9E1F7705ED52DAD3394388D6BE590E738ECB9DB5F47CB3B003BF3775D89C65D3E5A338E872B90F8834E0CCC7636E6C2CED44299B7A7C9BB19326D3B646420FF002E0AAB78F761E73D32ADED1F49CFCBB740A3BC61A004005B9FE8AE78E5EE33BC8ABC672C7FA30D3805BB77EE9FB344D3BDA72DDC2B229B4B30B73CBCBF7CA7306951EFF6C755D9281C34FA653BFF00D1A40ECFA484C9DC368FA34387DD5E6FD1A09F6184DC695ED852CB1DA2AE275228F6680783E97631EE968F48CCDFE65704FA5F076195A3F4D12B3E78F93AED34BD853D2586A5A7D3D31FD538B4DB2AB7E6E9DB0ADE834B38B8018C774BDC6C0F60C0C2670E00BF79475532A413EDFD51EB35C659627467248F8562D3E98E7CE40251CD39A3C4720206C7AECA6847DA56CBC6445155F2BDB819231D765A415E41C8247D574D6A5E1530B83C33670CFE5512B970C23D87263EC99C6A2584FDC8AEE96E8E0063A774B7FA5F1B4E1C5A3EA11FB968960047372A84DD3860F7FAA37977D93614ECADE49FB4995B35346E20F3E423D2EA685BD00DFDCAAC28383B56DC3DD2F28FF09D962F5A46A1A3639C7B395F6D9CD41704F2A35135CEDB18095FDFAD782D3FAB762AB4A2B1D502406927F54EAD72D446F224611F50A1C92E0B9A35FEA137737A3B729CD7BC06B48037EAA2336A87B0FE5F4A6D5BAC9C7B6C87132FF9097C137B4CE0E41E8B2FA712100EE3381850DA0D56397E51CB05FC0702EE99CAAD397B8D2D2C6B1A24B71D3603001EDDD234363746DCE36296BD6A10F2DE53B277FE9030C7CA4F4184CD96A31E6C8ADD34F35CFD9BB1518D43A576040DF3FD14E195EDCFE64CEEB710EC009A8535642ADBCCD3C841C233590B5CDC616D718C6CE0403DD6D0F4CE42AF2ECBF8A0A11024D1E30374D9A0B4E41C0F94F6E61DCC08DD25511120671F44D25C124391BD64E31B6E5078890ECF64FABA518E5010F89F8DBA94D0E88B231DD5C3CE06102A9A7E538C22B4D50724670B176C06EDB953232E7C814480607CA7E37C11D90AB7BC6707DD19120C6DD149653DBC9B57D592074CA112BCF5295AAA8CF44DA63B6E85B24A3685BCFB029405CD38CE426B40CC1C84A9AA20E397298210960E62BC5A3A6E9C866E5C764C04BB93D922262E001EEBCB5154B08C1B255493E11015D8EEA371542D9F58AD186F9246DB8FCA5D973F95156D4255954903B592E8EE07DD2F1D7FCA89475C976D7945648B82506B3E5246505036572599393FF34CC2DC1311991D1C58C97B8371F75F583C34E916D25A0445818C309DC0C7339C3A15F2A3475433F1D4C6438631ED713F75F42B5678ADA2CDB6D94AF0DF3795AF3D3D93A61A22BE1035E082FF007BB3CAE0D64BCEE6B49C076738C6530E03F00ADF417DB8DC6E0D6BC899EFA661DF91D9C871ECAA7BF70AAE775D5D3476893CB7619E754B010D8D9DC9774270AE4F155C47A6D2F6916C81EDABB85433966A979E690388C120F5C0289B1E93397BC6E788AA8BA5C5D053CA4470BB94729C005BED8ECAD0F0CBC59A6BF5B64B0DDB95F335A5B04B21F5038DB04AE1DA49C97191F92F738973BDC9472DEF929E6654D338891843BD2709B782A2ACBCAE369ACD3B59251D48260E63E4C8EFCA5A4EC33D318413881516F959F8A6BC525533D4C319C073BA83B6EBA2B863C53B5EA5A31457801B531B795B21C076C3FC4543355F87DD39662EA8A89DF5AECE61843F99ACF6E6096E2C6C23DC35F133759A94537995F1BDA3963A9883B90FB171F64BD8FC3ED55D2A5951A82F8C753F387063A5CCBCB9CE1CDEDB287DDF8F7D63A5844307401800D90B35F4D51EB7C8E6BBF9B24E0FD3742E41A823A8F8F1E292D966A06D96C0E6BCB9818E742092E38C6496F7544707BC395CEE6E13D597D2D2B9FCF2B9FE932349C91BFB845387DC62B5599A5D15B21A99BA896A19E66FEE320AD788BE2C6E17105AD0DA7616E03221CAC03E8309B793A82A2D2E3EF1F296D942CB2D9582301BCB33E3EAF76304B885C750D9E4CBA490FA9D9273F28BD3C44B8C923F99C77C9EB95AD64E5C773B7BA5EA223963078A76803B8F6EDF444F4DDD6A28A7656D139D1CB1B839C1A71900FB049319BF4DBFEF74B5149CAF25A700EC73D0A877724918A7C33B62236ED79411B72CA5BCD3B3D32ECD3239A3A1EE7242E70D73A3F505AA5FC2D55B27988F4473D3B0B9AF1D01C81D5432CEE9E9A66D550C8E8E569CFA0E1A4FD174D695FDA3D5F042C8EBE8BCF7C7F964E505BB7DBAA95640E58ABA31E1DBC32540905EEFD1B61A68073C304BB485C37CBDA7B2A67C55718DF7CAF7451B9CDA284F231A3F200DDB03B233C63F15574D400C61C69E989F5B47A4F2FB0F854D55D27960307E5EEEEE4A794BF006DDDD91C974DB19B3003BA9D700B891359AE0C7027C990E1E3F9403D5445AC192D2708D436DE7672F71B83EEA3DC0ECDBD173F1FB44C5257D15DE9872C72C8C327277391B95D3D79E24474759682E737123631CC4F41B6EB917406BAE681D4552ED9BBC79EC4744075A5EE79E7898642F108F4107F281D3096EA2E63829F6756FED10D57E7C31F23DB247B11BE7B2E0D7559E5C838C0E8AC1D55A827A989B14CF710D1E9C9CF455DD55BF941C1C83B28E4EC296371E866E983C2C318B4A6A7C22662DB60850DB14D502DF4C0774CE70111A8888EC994CF1D308ECCE9C763A18B9E0A7F6F870414D3207644AD6FE6384681708B44A282A4E3729FC92E134A6A7C0581195222A38FC189AA7B28ADDE4DCA95F94146EED4BD54944525B4054D0076D84FF00F74EDD12743160E549E95A0842911388161B3E42771DABE11864613C635A8D2235C0023B67BA6B5F467A0E9ECA492C2DEE709854C431B14892ED11B94606E3D5EE87544590518AC873BA1D36C122B4A2067B13770441ED4D9EC423740F9BA7B14D7941EBFAA715277DD3569DF05312458FE21EA8F97FC4174F69A8F2C8B3B7A42E6DB5C792CC0EE375D25A6B1E54449F645898722DBB3500E468CA2715B8731C74C74F94CAC150DE4CE7A046A89CD247CABDF0475438A783D38CEDECA2FA8AD21F154C6D1BBA3711FA29F525282421A68C36A397FC4D23F541957B478F2CE79D696F6D4E9668E6C4D495183EF807A285F07388A76A5A8F534FE52EECADDADB2036FBC42D1F9252E0B94E829E5616C9D08E9FAAE733534D1D0E965E9B4CEEBB238C4D8CB1D8190723D975DF07F5809226FAB7000C7BAE07E0C6AE3550723CFA9A36579F0F7553A9DE0171183D173F193C733AC6BD687074A715ED6658DD8DF65C4BC44B416480B891876C0F4EABB2ED9A8DB54CCE7A8C1558719786EC7C05C074DF21499A3EA7283C12D96982B863A3B30B66FF0077BF4E8ABDE344036CEE15DBC1EAAE6A2F21DD1A08F9517E26E80749039F1B798341DD4DA3F6C8A5AEC97139CAC54A0FC83EE89B69B2EC0EC9C695A61EA6BB01CD2765258A801E800F95D941DA38D7C36479D6F7743D52ECB51C74471F4E2339272B51706A96ACAFFCC017593AED84D24B39E98DD4D22707631D922E84732A799533A5D2BF6117A4B56DB37073D562E9617119C29542581E73B6D959ABAD8DCC201417C075EF21B6FB611801993EEAC1D2FA4B9C648C148696A11CD9EAAEFD056763FD4074F8D94D8D595F3C7DE99BE8EE1A9A984B0B4646C09EA028E6B6F0F6F8637480F39DF65D0966A10D0390F29F841F5FD7B994EFC9DF07AFD114D517F0C77491C4B5BC376124CE4300EC135FDDD031A5B4ECE63FE23D47CA3B750F9643CC72327FBA73456BD8F2E33F01060451F2F1A89505CF4F4CF71E67123D9316E9176FB6FD95BF5362EE7A94CDB65C1CE55B944E661D101B5595D18CE37F74CB50D16C32DC9F7C2B5A974F970CF50130D496C6B9BB3771F0A0CABDBC97344DBCB452EFA2663D4C0524FD350BC60C602B029ED6D767212B59411069DB7ECABE1A8F6696BB13748A86B345C20E1A71F0B1369B0060152E7DA3D59216F2E9FC8CA838DC69E2758D2205359E4C7A5E5376D8E63FCE7E55826C0709B8B0B9BBE7AA864AA45A845EDB210CA27B4F72B77C8E6EF83953536E2067194D9B479382DDD1B952063172910D89CEDDC5B9F82B10DCC9DB97954C2AA898761D5333650EED82AA6EB91A8E3B63C9109EE19700926BCE7251FB9E9B1D47651EAE8793A9FA2926C0C4BB60AB8D6E1DBEC98FE239BA023FDE4A549693B94D65AAE5DB239528AE0A195F26D34C46318F927AA59C4FB84227764FB8F84422C0667254A506329690F3670946D463BA78F872DE6CA1864C1F7456268DDC5BD7A1493E273BFE4B59633F9B1B1E8B7A73CDDF053511B3DC846DD30B615241052F536E91B873FA3B64C2B8E06076428922BF266B2B39BB0FB2D2980C8E6C81DFE535825E5DC8DFD96CF793D48C1ECA44453379E68F2704E17965B4A3B6161310D0FDB27C253F13F0A2ECD42E1D53866A7EC42B36612741F6CA52B1CD82800BF3528DBF312B24DC483F12B664C5068AF4C4E5B7461EE958C178EA13864E7DD0765C19EE3F54E23AD69E8E1FAA74C3AAE439415AE69C8C7DD7AED79944F14F9CF94410475FB2162B07B8FB2C3EE0D1B673EC0FF5CA763A3B3B497ED00A3B75BDF151D1F2D74B1F2C92E3D6E38C64BBAFF55C4DC4CD7F555D50FA9AB739F2B9C5CD04E4301DF1848D55C23683CBB9EB9C6E0FB051CAEA80FDF2413D72A36C2AB08D967E7C92739ECA4D0ECA3563A70371B7B052688E53051831E533C8DDA4B4FBB4E0FEA13A7D6977E773DDFF0013894D58DC25D916067BA6B2FE388854CA1DB0184D9ADC274F0464ED84D5EE41B8968274F5B8F63F54BB6BCFC212D900DD64D40436251B0A3EA96ACA94C239F1D16CDAA48358C2A6AF6C2D1936135FC48C2D195794FBC37878E03D43792DE88936FA718383F55109AA31D0ADA2AA39DCA7DC86845C7B2515978DB6C0DBB6CA3F535E4F749C9383DD7A36B50291364C77D1E8883D91AA2A803080F3909DC1507DC7D1272060B6F0C9347503D867DFBAD4D600728336A4AD64A8CEC12DC4CA1F808D457E50AAB3CDF65A3DE9303E5039162325D31A4D4E07449C5524750890C7B7DD25594C40D86532764593157B90D59EACA655B4D84B8252D3B0607BA9514A494F860099833D0A2B6A182309395873D92D0F5D9488CEC985A7C12FA37EDBAD5E0F6E899DBEA36DC84E6423DF014B740F0F8F9127FC1FAA157393EE884F8C1C67A20F3BF6DC23DC42E3B7B02BA319C81BFD5168799A32E231F0533740D27F2848CF26361FDD0A915A4A98722ABCFD12F1D76100866213963CA91488DA0DBEE190874AE3D535925DC60E56B2C84F544075C1AD5CBCDB20F337B27E5C7291A88C75EE90540A90A6B214E67CE4EC9949F5FEE848A486750F03A84DD9360E40EA9CCC7B1DD271C85C3669C0DB38D826234C2144776F63CCBA2F4C3488A3C904101737D0BF05A1DD3982E92D2D1B5D0C783D8228169725B3A6642D674CE54A6D73E7B0513D3737A37076524B3D46485693066B8263471E3751DD4F3F2CD19E8A5744DC80A07C49CB48760FA7A2967CC01C641ADB5C3F0F7CC9EA1D85CF34F6D0E819203D1BFE68CEADE203A135708CFF00181C851DD0974E7A730ED919FF00D1737963C9AD09F143AD03AD4D35487071E5CE0FB2EBFD33758AA5B1C8C3CD903A2E0BBB533A390E06D957BF0275C3A12C69396FC958F9F15F2751A3D4A8AA6771E8DB8BE1C7F85CA677DBDB2684B3AE4600F9507B5CCD928FF10D3F94670141F496BB2FA8209F4E7A1ECB3DE5DBED36766E5B8B578761B4D308E5F473EC1DDB7571556910D1823304A30E2371BFF650EB359E2A98C65B9246CE3D47D149B4EEA57D03BC8AA6BA5A771C73919E4FBFC2D2D3AE6CE6F5B68E0FF10165364BB16349F267F5309E83282C9C416823B1DB272BB33C6B78776DE6D2EA8A22D32D3B4CB1BC6E70067957C8FA6D53392E8A52E6CB138B1CD3B125A70BA5C12F69CCCA5C9D3575E2130E70EE9F283D36BAF33F9952B4B58F95A719DB620754C8DD5D1F72A779688972CEB0B36A8CB06E31EE9DDD754803D2E1D173FE91D71E92D73876EE8EDCF52736037BFB155E73B3A2D37DA4CAAB5BFA8FAB27D96B6AD40F91D8C12A0F45692F70729DD1DA1EDC63618EA9BE0997DE5C1A1EE11331E71E6F80AE4B36AD219CB4E1AD67D375C9F6EBC98739DCFCA9AE9CE26728C13BFB2B18990EA9D72744DAB5F49013977364FBE508D5BAD5D5904B8D9CD076553C3AF58E0493BFCA1943C460C7387676463EA873CA8BBA395885AE4DCEFB82A5F48F686139192AA8B95F4472388CE0BB23EE929F884064676C7D93609153CBF45815556DE6EA12133B98ED85564FAD038E41CA905A3598DBD24AB92C8A3C9CF42171E0B1ADBB0EB9298DDA9A47EC1A4FC06FFD16F63D614C30643CAAC3B171769198E56B5DF240CAC4D57904DD23434BA59A96F4535556A7440BA4A6980F8613FE4A3F5BAAE948C3A9E518DB76119F9E8BA9A6E3F44063CA691EC5831FD9472F9C46A2AA043A923C742E6B07FC9657EA99B52C2E4EE473A5356D13BAB8C59FF129559F4A412B4F93331CEC74242DB53688A59B258CE5CF4CEC1553A874C54D1BB9E26FA7FDD714EB521BC64CEE965731C5AE69383D5A36FD534A3A40E71008C0EC535D25C72F24795543208EE3FCD4EEDEEB7D58060958C91DB919C1CABF8F3264F1C9B55319476EA4FC33C48C3E6FF2E140EE1661D8E159171B1C94EE1CFB8ECEECA27778DAECE3DCF453CA4A8B5A29294BA214FA3C7B14A53D06374FCD17B653A6D300DC672AA47B347554EA88C5CA9C39575ADA2E521591701CA49F6ECAB7D78E3904A3976576B6E3B229348319210877A8E53D9C7377C2691B8FE50DFBA9974616595B1363307AF292763D829349680C635E276C84F5680A3AD85DCC30016F707FC917A66868FCA07D0E52647146D58075C6323A2186200F4EA89D6BC86E7393EDDD0B8E47123D24FD132065D8E9B1676C745BFE1437B23B41419036DD3A9EDD8EAA542A220F80C8402E3FAA56B6DE00C7F544ABAD81A7212E29B233B151A24970882D4400EC909583A298D6696C8E6050B7E9B201529424F90544F00755949CD6CC1EAB0841DC47080B5D911FDDEB0EB61F6560C4DA30710B4FB27A6DE7D963F779FA242DA3504ADB9CFBA59F40EFAA4C521F6486A300FCA562908EEB4FC3FC2F0849E832931E854D73C775B36E2EEFBA4C42EFF0AF67E10F64A85BF7815833E4A44332B47BFF00A25B4954A82D4F720D28CB2FDCAA2B0CA33BA70DA8CF54D44B19264B22D541386EA607BA8690179B11424F17F826C6F4D23AA4CD68F7510607755B36B4A165953253F891EEB2CAECA8EB2A09ECB7F348E88592C55921172DFD92AEAECA8EC6F277EB8599272989946C9436AC2D84E3DF0A2C2ADC774E21AE434588FE19207387D7E52ED9C63080C559FF00A2D3F187384A82715FCA4805785B0AF0A3FF008B5EFC784C4714FE49236AC95970DB3EDDD018AE1EC9DC770EC7A1EA913A8C5F6166556719394E24A918EB8F9401D5CD1F1ECB4155819EA1304D25D12174A0F7CAC097FA2154F5AC1D4E1282739CF608BB16C4FB0992739CEDEC9F0901FE6408DCB9BA0CFC7448B2B77FF242D50B85C0766A51D8A672B71FF358FDE63183B2D5C36CFF002F629D4A8867814959A1839B75BC50E1349EA797E89182E593D54AA6519C2B80B3DD85B495DB6094D4CA993A604EFD148A46664C7B5EE41A6568D86764DEB4E7BE42191D5B4647E89C45543A1D91A63A7BD0987EFD364B7919ECB3343EC52514C7A651D9566A9D1B987E12F1B01182B66AD393B77F6456556DDFEC6EFA06B46DDD21827E89EB46363D56CF66C8C6705D82E6830764DE683BA2648CFC2466F84DB41E1002A69739CBB031B7D55A36DE335032CB25B9F6F88D53BA5596FAF1F555F548076C744CE6836C0C1F7D925C0D56057400F768C0FCC9D47AA658E034E2388B5C777E3D5FAFBA40B9A3F36C911083924823B0085F236C1BC2E00B3ABBD43AAE92D1F91131DB6303ECB9AE58807B00CB4F305D2BA2A6FE0B01E9819F952C049516F6991CD1F5525B5B4803037CA8C6946FA76D94CECED3F6EEAC20FB44AED6DF41270A3BC44B717C3D474FD14929D81A37DF3D028AEB8BA35ADEE3D87BA95F4475470EF1AF4CC91C865DC7B91ECA19A2EE9C928DF01CBA9F585B99571BD8F60C9070B98EBB4DBA8EA83646FA73E93F195919E25AC5D96F55E8B6CD10701938CA094140607003D241DD593A16B872B06398380FB233AD741F342F918DC9C6721733A8C94E8EC349877C7717FF0004AF6D96D130CE5C1A7FB2A634A5D0B6AE4693BF3939F6DD17F095AA0724D4CFEA72394A856A297F0D75737A35CF38FD566E45B959BD89D70773F07B57873591BBB775793EDEC9A2731E39C15C5DC33D4FC8F6FAB1D32BAEB485E848C691DC74CF55734B2B54646BB1F36412975ACD65A9F2EA073D04C794876ED683B6EB91BC7BF833E477FA416469929E4F5D4C6CDF941DCB98076F75DD5C4BD34CAA85D1C83D383D7739ED855A705B583A95F2DA2BFF008B4D37332273B701AEDB072B670E7A7472F974DBB93E6A691B6B2485AF60C1C609F7F707E42896B8B03C64B06C3AAEC0E377021B65B9BFCB69FC1D492F663F2B0B8E703B6EAB0D51A2F98EDB0216C6D5256518476CA8E78B1D1B834388532A79F007BA965B745636232329DCBA3B071840E26F618F030B25F43705C54FFF00D3189D1EC77C2AFEB74ABDBD5B8090FDDCF036CA85F01638DCC5F536A6E5DC12A3316BB3D7988C22753A79EE073BA1126922762CC25093B1F558E9125A3D72EE4D8E56926B37EDD8A076FD34F682D00EC88B2CC5BD5B94FA893A25F1B1E43B5DAA1CF664BB70A35557C2D04BDC067A35DDC7C7CA316FA4208686173C9C34019E6F8C2E84E08FECF4AFBC4D1D55CCFE16DE087088ED23C7B03D8151E9A6C0F3097C9CEDC35D3D5F799BF0D6BA596739C39CD69C467DC9E980BADB4EFECB7AF30F9F5575747558CB636BB11B76CE1E3DC745DDDC3AE195BECF10A6B6533230061CF681E63BE4BB1BA69C527D3321CD4D43E22E07761C9DFE9DD4BA8BAB399C32F728A3E646BBE12545B24F22AA764B2038E68CE411F384BE91B0173865DCAD3B7CA77C78B2BE195F2D1D4C950C7124B64612E1F4255396BF1033523F1242F18D89319C7EAB959C1CA477FA7718633B8F41709616F2CB513C661C6795C464FEAA5B753650E0C8E9263EEE8C7A0FCAE72E12F1F2DB5D86D61E607607CD11721F96923385D33A76CD50E60344F86681DBB7187103D890AEC31ED28659A7CA600938576FAC3CB048F85E7A365FCB9402F5E19EE100765B1D44673F97B0567D669BAC71CBE8BC90DDCCE0EDF5C26D4BACE56131472CB301B1382004D2C09F2568E79F4BA38DB88DC0F73798F925AEF623FB2A4EBACCEA477A7998FCF5C91BAFA45AC2A629E221EC3CE3B9EAB8D38D36F0C739AF88919F496F551AF6BE09E51728D915D25C7C2C7B61AF0648C6C0F5562555AD950C33D248DF2CEE580EEB976EF41925AD618FFDE794434B6A0AEB6BDAE8E4F3613D71B8FD16826DA2BE9759E94A8BB638BD401DBB1056B5900C9036212B60D534F706F33486CC3AF6DFE8B7AA6103077036E652C7A3A28CFD5F710DBB633B6E7BAAEB88D4B900976159B756341E61B9F655B6BB1CC3242490DA893DB4568F68CFE6E897A78DDBEF8F84E9CC8C0DDBF429CCF6C2E68231F5CA95239F6D82B91C3F3F4EC88D147EC32B7A4B390ECBBD4D089D6DDDAD1CB1C78F9421C1B18DD63018081EA271F64A5A68C801231BC9F929FD1027E148BA1E68396E8C03F2899B767D456B606341DC65482A9CDEC36468683A21D5366CF748C56603BA93FE15AEFA245D4AD1F7D90C42C80A7D2C65BB1DD23450B0E58EEA7A1F652096D8C1B63086555B9B9F49DD48CAF08DB20B72D244BDD8E99595386E06C7AAF2AC5FFD394B9185A8AB3EC906BD2AD97DD5D38CB1D365CF60B7F2FDC6C9BB40ECB1BFBEC905C8E4D3B4AF0A36A49AF03BA7259B6C538D469FBB9A578DA5BD71D1290BBFA255BB9E84261E8C3AC4E2DE60C7F27F8B1B7EA9B0B3B7BBB0A40CBECE23F27CDC467F9531C6FF0097B7548240EFF475A7BE568ED34D47213D7E13A6007B6E99B2758F776455DA63D923FE8CBC298BA05E6C6EEE86C9562223FB89FD178D95C14D5910EEBCE8C12849A302111DBDD9C1EE9034046D8DF3B29DC940D2BCDA066D9EA3A2164B1442E5B648D68738103A05AC6C1DD4FEB0798035D8C0E9F54C5F6361F648B6971C114123474EFD528E685223A75BF0B66D85AA364D8EFE48E1A7F6E8B591B85266D91693E9F07A67286CBDE9A9A22F1F3653C8603D5128F4E38755E6D95C0FC26DC3471ED193A0293703EC89BAD25686D8F0959338260A3193D161D467072513346476C2CB28F3D7A2719604C13138B8E09E89E19BB1E9EE979ED23E9ED84DB9B94608E6FA24DA07638F66F04401E6073F55AB67717ECEC7BFB2569F71BB485BFEEDC027AE7A7FD53586B15F2272D6907739FA25E3A969E852229B986F807E120610D29EEC678BF23A92A083B94F28EE47F28429A01EA9FD24601077C348FA24E3F24918FC05E5B44CE6E4B1C5BEE06CA395D52587185DA5A4F8A763164746F8DA6A8376381D70B8EB505489647966002E240F84C915F2E14FA068BA3B3D52FF008EE6E885D653B87B2469E42D52A6644B0BBA61792AB1F55A32E24754C24793BA6F3038DFBA90AB3C7B7ED0FB2F2491BECB79AB7B82A25E639BBA750551C6E4224CA7357C324B4D7A21168AECDE5F57E63D157735493D0F4598AE673BE4E3A22B2BEDAE09D7EF8C25E2BF65427F7897744DDD752D28B702E145866AC1E85686A7E543A8EF848C774ABAF247B234C81C1124925394CDF23B741A1BA93B8CEC9C7E3B0373D529310AD646D76E9A8A51D41DFD93A6381F7C9494B4BCA72813244988D402E2C38DF2BA034412E8583D80542990F337EBBABDF418C319BAB10024BF05C3A666C331DD4C6DD3608F62A0D6878183D47C295515737A9E9D9580A1FB93FA06F3B73EDD14235CC59DBD91EB4DEDB8033F55BDE68D920272305158F28FE0A3EA69DD9E9B28C7143876DA9A6323062460C83EE42BCDFA71A5C06364ECE91CB0B30394F43F27DD43385A1F1F0F9393B85378716185E71230E0FBE02E9AD0B50C9A3309DC918DFE8B9E38B3A35F6BAD64ECC08A53EBC7CAB3786B7F21CD23769C1E61ECB8DD7E3A675FE37373B7E04EDB6E75B2EAD1F95AF767EB929C7895B579734156CD9A7949C7CAB438A3A41955047530EEF60073DD45356D1FE36DAE63BFDA46DDB3EE3D961C66EE8EA324128DC45787BA847F0DDD9CD0BAB7861AAFF2B33D7A2F9FBC2EBF11E871C98CE08EF80BAB7415FF00663DBB631856B0BD92294A1EA636D9D6F585CE67BECA8BD7B63713E634F2BE376411F0ADFD1B7112C4D76774035CD8FD2F20755A7D7B8C0496EDAC856BFA26DE6CEE3B1A8A56EE7F98F285C6A6F8C10904EEC716BB3D411B2EA5D3D777D2D4F2F48A53CAF6F620F55CC9E2BB461B6D699226914F53EA18E9CC775ABA7D45AAB33353A77195D00E8EF609ECA534F2B1E1A7032B9EE3BDBB9C639B1DD585A76FDB60BBE80ABCA5F92CE27C16854D918F07A28FFF00A3AD0EC1C613066AA735B8277CA714F7FE7F64A74C9304BFD40C7EE267B043AB6C8C0EE812F25E30D05472B754FABBA0849596F58BDA4823D38C2325A8457D937C01809F5A35303B038FAA565AF3CDD9C7D93EA25C11F8D7C926E13EA9A1B4D545515F0F3C591EBE5E60CF95F46F49F88BB05640C7C376B7B5A5A3D1354C50B80F62D7BD98FB2F9D56EB8D3B29A43551B656819E47E394A0DA738E9C39734C374D3BFEB0C2419622FE577D395ED00FEAA960934CA1E616F767D0AE23F8BDD31668CBE6B84129DFD147236A1C7E3D0E23FAAE42E237ED52B33C96D2D03E56E7D324A0E4FD41E8B8A38CD5F63A9AA7CD60823A3A56F48A671329FA076555125DDD23C34C6D03BEC33F52ACCA6E5C185822A1CD9D9957FB426965792FA3660F60C18FEC8BDABC75D9E5021362A7AB7BCE0364018327DDD85CC1A22CF6E0419CC6477070BABB86FC19D11758D90D4D4FE06576009A321BEAEC01F7CAA6F1C53367D6938764D69AE7A524F2A7BDE91A8A1F30831D45187C94FF0057B98E01BEF92ADCAFD656CA08992596711C0F6FA636BF9C7D1D92794A27C3FF000CF358E3E58EE75977B3C836A59F91EDE423F94EE718F6547F1CB8354D0B9F25ACBA163F25F4E4FA584F5C0ECAA67C8A3C163478FD497C963378D958E196D5493BBAFE180CC447B17A210789A6B7D12C4CA67818702D01BF67775C3B6CBE5DE924C4327A01FCAAC8B0F1625900657D147363F988FF003541EA59D0C30463C517EEA0E38C7203E5B22793DC9C67E8A81E25563E6CBCB1C39B7C6320297D4EA489CC062A4A72DED8CF335476B2F0F76C461A7B11E91F4512CDCF21E4C49239E7505909CB9C0BC7B74C28F723D9FEC49FF79877015F17CB0E32E003B3FD156775B03DAE73A3C027F303FE4B6B1E44D1CA6A316D95A055A1EF6113C2436469F53738CFD95B563BC36AA319C093F9803DD511535A237E7041077F62A6DA1F503448D733604FAB2AD7659D2EADC7DAC9FDCA830403DBAAAF35AD33718568DF98D2039A7F32ABF5E8C0CA78A3672E65B6C88B68185A7A20D5C5ACC6CE1FD96A2BC8F7EB91EDF74EEE17A32B394B5BB771D54D4637A9B9F02F157E40C631DD61F461DF080B1C1B83BFC046A8292593D4C8DEE6B77240D87D50344909F210A1A26B7B6FF29D7E19DD4E31F0989AE2FC0C63B7CA3F496F000C929D32762D6469E8DE9EE51689F83EE9182304728DBDB1D52325339870339F9468AB2951B564FD86CB78AB1B8C774CE1A5739D9236EE91BACAD67E5EA9D7016EDC1415049DD32B85563B20CCBA4877C24E6BA13B10824CB78E35C9AD45CB72B2994B09273B2F280B7B995487ADC3FA2402DF955FB383DA3874A948E41DD336CABC5D9EF848574158003B0192AE7E0FF874ACBB3088A2248DC2A3EDB260E4F41DD775F82EF12D6FB6930CEEC730DA43D8FB2348B18EA5D9427177C3A575A0344ECE407A95524B2B06035C5C7BFB6575E78EBE3CC1727B23A778735A3F3039E65C5EC971B1F4A163CE974113238F52D012F1D5EC4EF91DF1B218F986460631FD54A9DAEC7E1BF0C69DBEFE677436028DF20E15606FD72961559EF84184BFA7B259B503B04D648A7F01864C4775B89FE50A8E65B8A8F84CC994C2A2A165B50870AA5B0976424D19051B3251B2350F24FB2C3A5C2164C98504AD5BB646A1E0E375912A064F195209798DF65B737D90E65414B35D9EE8596232B1E31F8EE9D45284358D1F55B008596F1CE822EC657BC809947204E5930F643545B872C5040160C5F0B6748401E97007A1C6C56048E3D3A210E8C9B783F9BA26B25B7FF2A58C982439DD3A0F74AC15A0F5E88835C0D859877E8535974C81F95191337EC9BFE2307AA1DC3DA9022AAC4F1D0A461B6B80390A446669EF85974981FE21DBE13D80E325D0023B0E53196CA72A48D912F1347742C7525D321B3DAC8E8B48E37018C6FDD4D8D1048FE0464EDB7B27530FD3E2D107F248E991EE33B2458704EC54FDB6D67F8561B6361FF751A65176990299B9EA995541DCA9FBB4EB4E71823DCECB47E986BD981D4754640D6E2B7C90978DB953A9748371CB8C1C6C7DD341A24B77CA9148A9931906AA8132316375620D1C7B0CA155BA31E7A7F64E6764C56C8B4582919A14725D232B77032B48EC7213CBCA73F4527652945A025354E13E9600E1909DD4E90947F2A6F4B6E901C729FD121A2AF8063A2734EC956D313BE727D91C96D871FF00443A6A62CE8D39F7456453851A523DC01EC937557AB1FD5664949D8FEA9BBFAE71D115151A63A8AEC41CE7A2232DDB9F1BF4403D3DC6138631B8C8384D44B19054DD437AF657170CB5830B395DD7B2A2A4A76900839F8F64E6CF5CF8DE0B5E5B8FD13C6448E276359F50FA4E022349AA8E08735739688B9DC6A1FE5D3832BBB35BB93F64FEFBC41AFA390C5534CE8DE0E0876C7EAACA9F046CE92A3BF8C67A22D4FAB063AAE53A5E3C11B3A238F708853F1EA03D43C1FA143BC9A2CEA6A3D52DCFE64769B55B4F5764775C9B47C69A7775247D764629F8C50347A6418EF928E39392297E4BBB89F6D86BE99F106873B04B4F704054AF096E4F88BE99FF009E37631F0B6A5E31C41D96C83076E5CA09A8EB3C9A986AE23E9948E623A2C6D76252566B78FCB52A3B0B8795E248DD13BF2E3383EE875FAC9E517168F4BB391F5514E1B5EF9B94E77201CFF92B46B63F362CF75C4CD6D99DEE39DC68E44BE45F83AE739A30243F6DD5EFC37D41CCD033DC61565C66B411977707AA4F86BA9880CDBA7CAB5DAB2B639D371677DF0CB54000309D95957568737DC10B96B446A2E50D775E8BA63485EDB3C43381B7457F4F2DCA999BA8C3B25B914B710EC7BF337230763EC7DD46F5B68F17AB5C90BF0E9E9DA5D19EFB0E8AF2D6D67041C7E985535B64752CFCCD186B8F2B9BF07BA9F77A722092F523C9C2274F39BCCC70C491B8B5C3BEC53BA2A2E520E0AB97C45E978E96B3F1518FE14FBBBDB255694B778F7E9F4F65B98E6A48A9086D1BD6539FCC06DEC9EDA6027B271473C67A907DBE88A452C7D00C7DD1CC974F8FFD4B19560C8C28BD6DA5E4ECA5F96A519083F0A2C7D9ABAA82712134F47234E77FA23D6B86479C9C9F81D7F5526A7D30E78C8C9C760324A9D70F38632D4CAD89914DCCFD866321BF77636526A7A39FC595626E8E77E25DC6AABA58ED96C8E59679086963324EFB6E474FBAE92E16FECBBB753503EB755D63A3F47396C72F96E836E8EEA5C7E995D076CD3D63D1901AA99825B94DF9618DA259DCF3D1AD0324027B8502BA684AAD45336E1A9AB3F7650BBFF73B7BA4F2C107F2BA6DC67E8E54B13715C99D9A4F2CBF639EB5D7ECD586B20757695B9C170A7683C94C4FFACBB1DB7C1CFD42E21D6BA72AE86A24A4AD864A7A884F2B9AE0416FD49EA3E8BE8D6B7F0E579D3758DBAD867353464873C4527A1ACEBE9634E0ECA29E26B5D5BF535146E920105D62187BF9390B88EBCC70327EA896A609F23CB4529AF61C1BA32CD3D44CD6421D23C9D9A1A5DCC7FC3B7BFBABEE0E0E514DFC092A1F63BAB073082B39847527B7947203493D37417841AFAB74FD53658A9C4C63703CAE8B98168F638FEABE91E9BAED3DAEE8D86E9431C154D1CAC730864B1BF18E6E71838077C26F5A3297014704F147DC71DF07F8957FB5C86927AA98B46C39E5E7616F62CDC8008E8AF1B6DFBF10E2F964C39DF99AE39CFC855A71EBF67FDEACA4D45BEA65B951679B24932C6CEA1A06E5D81B6CB1C2BD1934AC6BA4F3D927B4AD2CC11D46EB2B571E6CE8FC64E0D71D96FD468AA7947A795BEE7DD049B49471039191EC429CD06952D60E73823B0283EA3C1FCCF3B6D8C2C793A3A0493915DDC355184E2385A583A80DDCA0B72D5F14A33C8587D88C295DC6A0B412DE523E46EAB2D4172739C72D037EA02683B636A29042093CCDC6CDF658BA5818E6938C9C261A7EB5BCD853DA8B48746790B4EDD33BADAC73A3032E24F939CF57E9D6E0976F8E807550FB2031B8FB13B7C2B675FDB08040049EF854E5C4398725C76E8DC2D7C72B473F923B2768BEB4DDC44907ABF3346CA01C46A57161737A0EA9D70CAF06463B9B63EC9871065734100FA7D94F145E797740AC21BB730C6371D53A6C2081CA3050C9A70D20B4633D538A79F989F5E3E148CA38E74D8A494E49C1ECA77A3F59CF4D1BE28DAD7364187138C855FCB2B8747F54FE96A0800EF9EF83D54722EE0E5D8564764938C1E647E8AA4E00CE505A29F98818E509E42F2D78C3723DF3D50A44F39130B3D01273D07BA2755427DC11EFDD33B5569237184FD9013BFF005FFA29910558D990E028F57DAF2ECFCA93D4CE06DD4A4E96973B9E881C8B58B191F36ECEC36412E16A703F3D94EE0A66F36E3210BD514D920B460773ECABCA46A4711057523C77594AD40393B95E515963D329D6BD281C93319596BBDD689E708D813ECB20FC2D405B35C5224DA65E3236D9669EA394633823B8EAB57BB2BCC6E7B7DD1260A55D045F5DCED00E723B94CDB38CEF9F84A5A70D7B4CA49873EB03AE3E11BD653DBFCC67E0449C9CBEB326FEAF8F84CC76037CC33B259B2266E77B6FF458F3DC0A61295049921F64A7326314C53A89D9EA52255C8A79EB76CC9092303AE526D7FBA1DC89541841B3250388EE98B1DECBCD7907BA66C351611655B8FA53DF2BA7320BD3F2E729DCF709080DC003FAA1B2D462D04DFB77D969E62194EF703B9C84EC48999663CA1CF9C9785F9EE8748FF64AC636F940C38209B1F8EEB3E7A1D1CD809C4720213597A2B816F34E52CD90A461C6D904E7D96E73BE07D10B64904EC925C3573E58591398D6363FE6C6E4214CB964606DF3EE9BD2420737987391D3B7D931924DCE3DFA202E3741C241F51EA92327603AA670CE476C8EE9F3AA7980DB0DEDEE9364915B8CF3903A2C1936F95AB71F29BFE18F3731270A2B1E589C7A1EC2D4E5BBEC7B21918C75E6C270D7FCEDFD52B0E2A5F26EFF0085EF30AF30FC1FBADDEE077F646A4BE4078AF916A69BDD3DF301433972B68F21036BE09F1BF863A7A522987B6FD124D70C7CAC4B1F7451604F07CA178981CF0C032491B0F7525D4FA1EAA91B1C93C5E5B656E63F91F2A270CA41C825A4771D7E11ABDEAFA9A88DAC9657481830DE639E51F0A74ECCE9476B1887E719FD7D96E231EF94D6964006FD52AD977EC9105262CCA5693B9C7C251D1F6C6DEE93139CFF002FDD6C6B71B3864F6C74522641931F26050B7B6374F2D3A7D8F7800FA890364DA295B9DCEFEC13CA5B898DC08187750429A2519E23A4AAFC1BE2DA2E05FBF2E48DBD9739DD34E42D7107720E3A2B1FFF00A6FAF753FE1E49DDE4E31CA0AAF2AABC64823A9C93DD4D68A92850364D37163B21D2E918DC0EC8ECE5BD5A7ECB669CF7DD35264157D90F9B4033D90FFF00E8F339C05604B312938B233F28932BE4C7456EFE1E1EBCBB21953C3C21D9E8D56FC8D07DFECB4318C118CFD5195D229E8F45C8D270DC8EC9B56690781D3955C21A3600630B153034EC5B9516DA2CAE48E700F892FB15632A846252DFE576E0FD97BC4A71626BDD61ACF2445CC3F2306022D516961EAD1FA268CD3CC3EE138D2814BC5CF8C61C0FC84E4445BB77775D95B53E8D8CEE739EC99D6688E6009D88E80277164495156CB44FEB80B4A78813BB467E0AB15FA2C0CE729176938E3C485C3FE10143CA264ACAEAA6DEE69CB41033EEAE3D0155F8CA29607FE68473479EBB28A9B379AE3B103B6149F87F4A209DA77C3BD2ECF420A8F2A7288583D93B2D6E0AEA5258184E1EC3CB83F1B2E8FD395C48009EAB956D343F86AFF4ECC94F30CFCAE87D37722703232171DA98A4CEFF004735288378BFA7B9D8EFA15CD943717C3386746E575CEABA612371BF45CD9C46D18E612F6039EAA1C2EF8616A31B5CA2ECE1D6B00E60613F45D19C35D5182D19D970370CF51904079C105756F0F2F070D3DB653A7B65C0CD2C98EBE4EA2AFAB0F6E7AECABCBDDAC1C91BA94E9DB907463DF1842F51458040040EE55FED5B32B1A6A4E2507C74B2FE2686489C3D6C05CC3F45C334D7970739AE24398EE523E8BE88EA7A889CD2D91C0B0E4737423EAB9178D5E19EE1179972B7D3BAB690FAA574273E50EA4B9A373FA2B1A7CBCED073C362DDF041A82EE41CF36DD9127DF1E08C1554D3EAD713CB8C3C6D820B794FB1CA314BA89E47A9B93DB97BAD772B23D3C95D96536FAFC672958354BC772ABF835213B01D161FAB0B5A4969DBBA820E99AD9A3BB1D9D1BC22E2988278C4839C39E3623E5778EA7F14D6BB7D3C3199216D44CC188E30DCB091B39E46E31D57C8CD2BAE43A68F19279BB762897136EF2C153CD3E073B41639F9CE08E9BFF922CD2DCB8396F4D376CFA5365E1E7E2CBAE56DABA4B95D1FEB6F9D235C29FB80D6938DBA74513D5FC529A5E6B7EAEB334E416C7570E4440F67646C08F85F302C7C59ACA19FCEA3AA969DD9CE6390863BE319E8BB134078E175C684D1DE43256018F3096F37D73D72A9CD4E31E49314613C95F01EE17F1EEA2D95D35B9937E2ADE49F258F3CC1919E8067AE029DF10F82B0DD22755D162394025CC0000E3D7B2E2FE2057410D5B67A094BE22413FEE8F65DAFE17F8A0C918C2E734B4B4023DF658934DBB3A8846105ED298D1103A294D3D5C01EF63B1EA68F50FAAEC7E15F0D6924635D0D27E19C71CCF6EDF740F8A7C3D82422B694B43C6EF071FD139D09C6EF2A3E42705A31F194581A8BB6C83518FD58D2474AD1511A781C269F9981BE973F071F407AAE51E29EAA74B296C4187909C38B437987BEC9F6A4E25CF5990E99BC83A35BB7EAA03A92B5CE69271903014BAACF19469153C7E8678A77222971E22CB1E413B8DB1DBECA3951C417C87D58DD09D4D0E7E4FBA845587337FEB959376744DC62F92CD68F337087DC6C4D703B8CA8BD8B541CE0BBD3ECA6D4DAA6958DE698803B0C2669C452DB3644FF00D1E7B376F29452829E46EE5840EE414A5FF5E53F2F331D1968DC8040207EAA1ADE385BB76F9CEE6F6C8C656862537F06464714EAC91EA5B73305DCC738E8A8ED636C6924EFB7C2B26AB519A81CCC0793B11DD45B5100E041046DF75B9A797F2B31B55055600E1C4A1AE2D1D494F789D8E43EE8470EA27367783D33B67AA35C5381AD6FA4F6DF2B663132BD4DB1E4A66A61D81490019F74466A805B841AA1F976021910C1D8FE31CC0E3B229433607A90AE62D693FCDD825E2AF05A36F5289A2FE19A8AA648DD746B4803A109E53D4F3F7C00A261A47E646EDD36DDB013A094ADD131B2DE30374661B8BDDD0ECA1B4F543723FE88B596E407529596608322A8FF00322B6F9000798F6409B264EDBA7B1D56D8EE1557236B1630CD7D40F2C728DD46EAEE0F20EDB2C3EB9D9F8EE9E6585836392A2F9342A9724327A8393E95E56147A2A9DC013E664F5C2CA9369159CB0C7FBAF3802969A97FDECAD45201F2AF9E6C909E16085BB0FB85E0DEA73D3B2448247E179AE20E7F55B9195E6D3948423939FF007565B0123D80FEA96E4DB0BCE18C261509B598E8B38EE56F925671D8A5606D350E5E7BFD92AD872B0E61E89592F42F4F559182B62F0532F2165AD2535124720E0939D93B0E23AA691BC85BBE5CECEDD33564F1C890F98C38C85A898F748472E3D23BA5A1DBA8CA8DAA2CAC899EF372B663CF55EE424EDB04AF96004C4A9B7D1E88F74AB65C948C2DCED9C25FC903A21649163C8802B6710364DCEDDF0B76439F9F940CB89F0291B8F36C761D42734CFE671F560774DBCAE5FAFF00DF44A42D1D87A8FBEC8593C19B54D580EC649EC9582519DDBF298FE1DD9DC10EED909692A24FE600909838B6FB1CC73B893B6CB6757BB6EE3B63A2461A82E046300F50948D800C0D87B2165A8BFC0FA9EA49EA9474BF283D431C7F29C2563050D16633AEC20F95CEDB65A373D125137E13B69F8C21A245CF2291CCEFE6C61396E0A1F334F65E824DBD926598530863D9643926DA86F6392B77B877D8A10DE352E8D43F0729CB2A329BC916D9EA1348A470E9B27B2BBB8BA0ABA15833761D56B1CA48EBBAF53330E3B7DD1A744728C668D5C31FE6B56CC3295701D49C94DE070C9DF3F0A54CCBC98ABA1792A0251B283DF1F0530350E24FA401EEB4279C7A8F2B874C290AED3F90B927F940F9F7488A8DFAEFDB29A452869DC92E5E9A573BA81F0423522AB8D86FF7813869EA77FBAD2A27381EE81C6FF565C7A744EA4AC69CF73846A4439609AA1F455A33B94ACB598E994059311F54ED955EEE52A65293554158ABD3A6D5E50061EBBE4764BC15983BA56415B835E795A79E532865C8EB92927CA7E42953219E3AE820E79CEFD4A52471DB047CA1B0CC46EEFB11B95BCAF3EDB77252B228F03D130F6DD79F124A376DCA324FF882D9D0380CE70913A56286A3A6C764DDD54E2491D165D5CE3B004FBE42466767006DFE496E02501B4B5409D81CF7CF44856B89F4EC08F6194E6A9A3000DD68C8790E5AEE5C8DCF5FB21681877C8DE3A33B381071D7B7F44FDB281EB38046E0245C0752773D0A6D54E69C6DBF4CA556A899AA64D2EF50658A0A96FF00260388ECADFD1D760E0C783B7285526879DAFA79E9BF9B94B9A3E51FE165E89698DFD5A4B48FA2E675D83E4E9F41968E858312336EAA09AB34F17B5CD70EC77529D35559031EF8C291DD6D61EC39193EEB9F8BDACDF9D491C726CAE827F61CCBA1F859A888E5693B288F117476C5DCB92375B70CEAC02D07B29B77C95E31DAE8ED4D0479DA083D91BD4749E8C977650DE17560C0C74F65665E202E61F4F65AD8FDD0B32F2AD990E64D7ECCF36FCE067703940FA8EF855DD8B5256DBDFE6D0D43C6FEB0F25D038776BA2E87F456D712A0E5CED8CE7A2AAE86539F4E320ED9E9FA2CAC999E39706EC30472C2996445C3DB16AE81D1D6534749750DC36A6060819CFEE63006775C77C72F0CD74D352FFACC66A2889C32AA36E416F6C81F976EE574CDAC48D904AD204ADDC3DBB1C8F81D5746E93E31D25553FE0AF7002C78E40F91B98DF9DB771FCA56DE9755BD72735A9D34B4F2DCBA3E4ED35B9A479B0372DC67739CA6374A624138E527F97FE8BB33C53782096DED75D2C599A89DFC47D33771183B9F2F19E60B93A8EB63A8CFA489587D6C70C39A475D95F4CD2C3AA866C7B45783DC3F9A6ACA76807FDA34FA58483BF7C05F47BC40F84AB4DCAD714F707B6867A785A22A8691EA381B18C6EE27D9722F023C4ABAC32994D14554C1D39802F1F40A7979FDA314D76AB8DB74B77E1696339616124923BB9A76F94EDFC9CDE68B964DABA06E80F061A6658C0AB9AB33BE25631F878FF1728FCA14DAD9E14B4040F0D96A2BA57E76691235A7EBB2B2EC37596ADA2E561B932A216E3CDA3744CE7E51D837E8ACDB0F12EDD56C0DAAA4689C6CF0616B4F377C6CAAFAB26B964F1D3C5538AE7FB1C51E22B8456E821CDA9BE5C23A67727EAAB7E00EB97D3B9D17380E6E7030BAC7C43D1D29696410085873DFAFDBB2E2DA9B4182A0BDA30D27770EEB2273ED1BF084A2936752B78AF235BFED39C1FCCD51B9754F98EE66BB977DDAA99935139A33CC41C2616BD5C79F771DFAFCACD9E19CB9468C3518FE4E9FB1EA3664646E7B844EF17505A71D30AA3D31A99A71BA9554DDC63EAA1A92E196DB8356889EA4AE70E6C0DBEAAACBD6A069C877303EC0A9F6ABABC838553DDA1DC92707B2D3C3155C98D9E7CF03BA0BA3C10003F0BA4B81F79B3CC44375734646371BFD1573C01E191B9C9E573869FF0013B6FD15FBC58F01CD82DEEAA8E790D4B185ECC0F4E46FD429230B914A79F62F73AFC16B7FFA296889213552B246C63D5E6198B1A47D3BAA9AF963E13B5E61748E12679472979F57D7971FD5721E83D7F15CAA05AB50DDEAA9291AFF0029AFA769C35D9C0E6F8FAABB38B1FB312929284DC2D97796E0CE5F31A1D1B7D4DEA305ABA2C78D461D1CB4A529E6E24FFC86F5970DED70B79ACD397531DDA1DBEDF0555DA82880692E6EF8EBD3FA29578699247DBEA1B51BBA9B2390EDCB8514D7D5FCEC7BC1DF071D955C0EF21BB9A3ECE4AD2C6EC4E4E76C94338A57EF4E1BBA1ECAE31B5CF7BBAF6504D4FA93CCC804E1745139ACCC45AE9000ED883D938A52D272EEAA394CF908FCC48F646692E400C16EFDCA89F6470FC99733F8992E247B25A0765D81B2DA9802EEBB1EC9E020151D12C6DB335126E0679913A59B0D43E9E89B9CF74F276818EC819A1088E28AEC771844696AB2865353E3A1E6CF64F6018EDF651B91A9A685BE49AD96A072EE467096753381CE7FF451FA62D1821BD91365C4FD95537B1476AB63EA8C00765AC150763D824DB5C5F9053C8E9BD18EA9122FF55849BA908D965462580E56106D9162B1949BE01F7598811D4273E564E4ADC53119EE16BD1E569D8C49CE7091349B1F7449DF4C7D124E8930864D8F0BCF24EC1387D3A4C43EC90625858E5F7FB25FCB2B573130E2384A463DFAA55B12DB90774D42A340C4A885798DF6FEA960DF7FE8859620AFB425E4A47CBF64F1A076CFDD6ED8D3D8FE9A6368E2F74A3DA3EE9C795B243F0606E49CA64C278E841B280774E9954DEEBC29B3BEC40F8C2B0ED1C0AAB9689D700E8C53B47E524737E899F2491851060CDB2D194A792EEE13763C807EA9D432FC9C21A2E45A5C08F98323212A67F84B3A3048C2525A53F09A82A4662CBB6E5FBAD246B06C4BF9BE3A2CC61D9DCFE9D30961D546D1661CA10653B86E5C3947BF54B452890E1B81F3DD397479EA120611D318FA20ECB515439A885EEC6F9C6D92993E9F072E39FA25E561036257A9E4CED84C1DDF4251C84FD16F2B8F60978D837D969234E10B2CC17028C8CE015992A013CA169111F29232729C8098957EE2F9F9C25193E3A9CA45937C6CB673738C0D93344D174FF60852499EA94A90DEC1306C78E853EA79723B040CBB169893998C6D84BD3CEDCFAB74B4AF2463648795828586A2D72397CAD3DF03D96D3C400D8A18F241CE12F4F39CA7024AC5A4258DCE179B3EF9CFD92B31C8436B07EA8970569C5AE85DF5C0BB185B31CD07607285BE770EA3EEB786E9838EFF0028C8BFAA1F48E19DDD8F85863773CBBFCA5E31CC32705662716E76D8A38CBE0AD971DF43727604E0E4E1398437E7EE9D53440FF2274CA3FA290CD70DA37742D23A2132C41AE273846052B81EAB575A0BB24A3891645B9700A8C35CDE60EDFA2693123AF4440D89C0FC2DA4A1FBA9BA32F243F61953D57409E4CED9339A848DCEC169355606DBFD53D15B943C75C7040E9F29E45504EC5C1C0FB28B8932ED8A7147562376FB9EC8AC752B24CD7807D00823FC5D1396127F30D8F523A20ECB89791823E42314793F948C770893239631DD2478FCAE1CBDFDD6276373B97FC1EC9AD53C9D9ADC0EE9074E00F4F3120F72A4BE08D5A083A948DF9B20F64CE29B071D514B7D4878F5E397E3AADEA6D6D70259D4745151612B40691FBE08C6536A894976C36C631FE69392A30795DFAAC364C9D8F4EFF08AFE0AD354F813A89C8EBDBB2D4CBB027609421873D7299BDEEC1006C3AE7FC90AE03245A4AF823A98DEDE84F2B9492293F0F7078CE1B37A9A3EAAAD96AF9181CD07AECA5BAA6B5D3D24158DC87C580EC75C0F7547511DC8D3D34DC59D07A7AECE04729D8AB66D775E6601DCAE55D09AED9231BBE0E064E7BFD15C1A6355386327A2E4F362D8CEAF0655244DF5359F2D7070EA15416B02298B47F895CF2DE848CDFB854FEA78FCB9B23B955AF82D4FF0748709B50805A095D0F1D4B5F1641ECB8A7425E0B390E7B8CAE94D19AAC483949EDD16A69F25428CCD5E2E880F1561FCD9DFD95756CB4138C3467E548B8D1A979662D0A3DA5EF41D804ACFC91B9334B4B3DB1A0A4B4441CE1AD70E9F28FE91D6F0FF00EEF7089B240F38DC74F969F74BC36F2F196E08F9DCA1B7ED361EDC3DB823A11D1042E1C92648ACAB6B2CFADA2B9DA23FC55ADEEB9DADC333524BEB9238CF5110F60172CF1DF81D49798E4BCE9873454459757DBCED34646EFCB7EBEC15B1C3BE36D4D9260C9899691DB1277E507B1CF6572D570E69AA9ECBED84C70D43866A228F0239DA7F336468D8B8FC85D169B3A9A4717A8C33D364FD8F951A5EE514EE2C78314F13887B5C31EA1B16E0F7CE54C29EEF6A98BA2AB84020639C001C1589E3BF845152CD0DE6859E53A6762AE16B701927F31007CF75C8BABEEAE9DAC7332D27AE320FDD686CDC42F3D2DE5A36AE230B157325B5CF511C6F70E76B8FA5C33EDD1773E93E2CC170859538025E505C4632E7775F271F512F4739CEE5E9CD9383F75D29E1AF88CE1FC27BB3FE11EC554D560DB06CB9E3B57EA4EA4749713755999D871040EC7AAA8EED6E0F04E308EDD267BA63CDB871471961CB718EDB2E43D4F71DB2C5EA2E3A28FD474BCAD503FC5F2BC7D55D9AE74D7A4AA8E4B460FBEEB53064BE0E735786509704EB485CCE46EAC892E396FD02A7B4FB0B4853EA39F6419634EC9B4F92554C4EE95A0E541AF30E5D9C641C614B2E92F5D90CB15279930F83DFA264DAE8797B9978700DB491B5A6799D09FF001838015EBAABC495BEDD17E1E92BDF75A89C721A673B9831A7638F65C7171B989EB21A28C8F5101E06DFA2EC5D03E15EC6C85B37E0E575406E5F235F87938DF94AB38AD720E5841A49F2523C54F004DBC41FBD2C8EE4A978E7A8A57B9B80FEA4306739CA75E1378997AB4CE6C77AA3A96C4416C42404E474F493B72ABB74F5B2C543505C2A6E343303911BE47963C8FD46E8D4FC478E6AA353532B6A446DE5A58447FC5F8264C775A0B5371A315E9DC726E8AE0A7B8C7A7E9A80CD2D20F2FF001193233A6095CC578A92E610EDC1EEAF6E3A6AD7543DE0B047B925848C8F65CD173BFE0B867A6D8EC8F4B6E565BD4CBD9C95F6B97F28E41BA80FEEE277C2B1EE5087125FDD0EFC0B71800AE8D7071B95DB215034F4E984EA1A539CE33952C769B05398B4F72B76DD3511AE3E4895502C6F4DFB2716A95E71CC3AA930D36E76091F44568EC008C118C28DAA2DE1E5F64727900DF1F75BC50876FD519974C64F7C2CCD67E46ECA066F618D8DA95A3A7E54E2184E7DC2D29ED848070517A3601B1503469E187261B2ED859155D07CACCD46E3B85B505AC93925446A462E4E90663A438E61FA2529AE39259D129034B472839296929F3F9801F4EA9BFA93BE1EC8218CCD19EAB294928467BAC26F5093F43328DB6CB91BA30E66C308369FA8CA95431656BB3CBE2902E4A51EC9B4B44A452D3A692C18DD00ED001F4E52620C2312E136734148431F2960C488B69B3D12D15210906096C6B60C3D822DE48F65B8A3FB260930318BDC7E8946B3D867EA8BB688FBAD5D6F3EE84962C1DCA7B8C2CB5A887E008EBBAD7C84CC91498D5AC5BB288F5C81F74E5B48E4A1B663B2065A873D887201BE798FB0D9138EF756D88C4D99CD88F58F98E3F44D1B4E73B2DC40EEE98274311083BFEAB3E48EDB04F8B4ADFCBDF74E889FEC0E101EDF64F29E94E3D452EEA2764109582339DD38F0BF9108A972729E329802968C0C6CBC1DEE85AB2F472A888CB1E490128D61F6095F4F63BAD9B4F9EE85AA2C473A11345EE9130067CFD13EF2F3B2C1870A3A254C64C69DF648BC0DBDFD911739339A23D4042D13A6619093BF45ABBDB0B00BBBF45B4870364344CB29E6E0FD16CF663A7449E31B85B4751CDB149A0965BE0520783D36FAA5E285A0E0E727DBA2653B067A745BB6A0A068B109D0FC6D9C15B535467AA659237F75E3547F551B45C84C281809C2D668B1D1326D491F744295F91B9405954C172CEE4E397252B5B4791B14C44C5BB67644991CA4A22959447A9230863A1C9F8F744E7A9070126E381B296F829BF70E6DF463B3BF54729DC366E33F3840A088908FD23080395C9931BD31F436F00E798EFD911145B745AD06475194419F5C29548AD930A1BC76F1827972929293D9B845A13DF2B773FEEACC4C8CAB6829D4008CA6DFBAC1E811566413B22141419DFDD48D3293926422EB6EC8C63A286DDA9797A2B86F5657B3A372D3D556FA92D8F390061A97256CD052568803AAC34E33D517A4B5BDDEA1BA0F25BB99D8F62AC5D3348D0CF525C9520AF8609B4D8F7C9241F9D822B58C647801DB9FF0EE9D564CC3B1E98D90B8A858C05DCDB7B26E4B1B6C5A1B83DBB1C1CF44DEAAA88DDC707D8745ADBE46BB3EE9DCD687483D3B83B611290BD2432A3D403BE037BEFBFE8A4B497D6F265AA1D59A71C1E072E3B1704EAA217C03941E607A22B2ACE2E2497F77B27DF61EE985768F7B47A4EC7A6131A0B8F20E67633EC9CBB5938372D38DFA2322BE391F51E9405A039D870599A90737211B81807B1FAA0159AA49DF705346EB219C3DC9037C87AAB4FBB94F423295D2CFE47185FF00ECDE08DFA64A0FFE9A83E96F4F7599AB7980C38E739055791B7860A51E01D2B5D41518DF979BAF6C13B2BB3496A56BDB907AE1416F16F65653B71BBA31EAC7B8514D39729299F8CE40382165EA306EE4B18E4E0CEA9B56A2380DCA8F6ABADDC93BA8A5935207B46FF4472E153E6478EF85892C35C1B31CC9937E1DD4F3B464ABBB47BDD1B81C9C1F75CD3C2FB972C81B9E8575A6946C523067AA18FB5D0791EF473E788ED40E8E70EE993D7DD0AD297FC79673F980527F1A5A5DD152475006C1C1557A49F982193B168453852B2B62C9EEA3AA7495C03DA0677530AAB5F330F5E9DC2A8785B5FBB7DB60BA2692903E2EE7E02831ADC997253DA73E6ABD361C1C1C0F27B1080F0C38995D61AC061719E8E47012C1D4807AF28FF92BA75869976FF9B7ED8433861C1B33D7C6F2086C6438E47B7F445A78494F807592C72C172ECB4B89DC19A7D5D42C6C324942C91B97C8E8B0F693ECD3D4FCAE7A7FEC62A73D751540CFFF0070CFFF003D776DE7588A68C362030CDB3803A7C04958357CF51821C0346EF3F0BB2C74A279D648647C2E8E0D9BF62FD38193A8A61FFF0041A7FF00CB552F117C03DC34ECADA8A2AB17085BBBC96F21C7D375F46F88BC6A2CE66C6E01ACD8BCFF0031F60AA9D77AD8CB4A0C87793A0F83D950D66A13838A37FC568250929CCE4BB2CF1D431AD7466395BF9B3EEA776FB2FA01CF4F742AFB69F2DFE66319DFA293E9EAAE6602770B84C89A99E9306A11E081EB6D3D9615495C6C7CA4FC95D49A9A98169D950FAB2980C9C615DC13A6666AA2A51DC41E9E3C147A8EB703B283DCAF1CAE2B3417A0739EBD96B385F2738B324E89ED5C8084E34FD18C9706E703EE108B1FAFAAB4F4458C1FB955A4F6B34211DD1B47256BDD473437032B1EE6BD8EC83D31BAE9FE0978F29616B19580BB9000241D71F4EEA92F149A30C35AC701B3C764034469F63F00B3D5EEB625287A4A8C6B9ACB4FA3E875478C3B6D5301FC23653FE27463989FA919509D53E21A47B5CCA582281AECEE5A323E8EEA1525A62C8E8FF3103DB3844353CED0CC7282B1316E96437A4A1085909D77AADD2BCE49748E3EAF56DF5CAAF6A227B4904EC77F747EEA3A9C01DF01452B65C9CF31FA2EB74F8A8E575D97F03934BCC011BE3AA730C2E07186E10CA3AE20F4C01D7E510128242D57C1CF7EE2EFA7DB3D0A5E8411D4642D2576C94A6AA3D88471E8AD3E505628C1C76F74B3A56F443CCE08C774E207B40C11BF643345CD1AE791ECB0B48D97A381A0608CA6724AEDBB0F64FE320E3754A474D8637235652E76684DAAADE59BB82273D3B87A9A565975E76F2BC2819AF1E65481B6DE5E9EE9E7E04764D994A19DF3BA7B15CF03046428147E592B9B8CAA06B514FCBBEE9FC01A5B92774CDD3123E1361301D146DEE66D634B0477CBEE63F733DB0BC98FE2D654B5122FD5E5FC1CDB6CA82D70C6E14DE8EB3A285D045EAC0D94AEDB48E27DD6A9E531B0ACB5498CD5C3DD1BA6D3B238643081EE532ACB0F2E7A1721A136C0D2D605A473EFB84B4D6E20F45E8E89C7B260B70B41284EB9DBB65C12115ACA5C5ACF6DD3721A921EC123138018990A6701D16630EF64B9274D0FDB1356DE4B3DB74CDB238765A179C9CE5351326974116D304A0B40287B2A3EA966DC1C81934298EFF7177CA485B9CB0CBB94BFE38A127714D091B415EFDD4EF64B0B8E1398AE63BA72169A18B2833B612C28707A65108AB584A7AD78C6C97F40E34056501C927ECB6FC2FC27B34C9855D5800E53D30DCD0CEA5AD69D8A095D73C774C6EBA81BCC4650CFC4F31DB74B940DA61586E401CE7AA374774077508999927B2CD2D416F74CC575D16550B83B74F268936D22F0E60D94925A107A040D22D432576465F163A0CADFCC3823911FFDD32771B2F3AD8F0090323BA8DA2FC32264524A52533752E37EFECA533C18EA309B9A30E1B6C7DD0D0EE71F823CD888ECB0E87182D3BF708E1B7E3BE161F690771BFBE1334C78CB9044D11DB0727B849BE43DC23E2D1B640C1F94DDD6377743B593A9019B559EAB22519EBBFB22325A88EC90FC11CF4E89F613C725F06B138BBB744EA99E3A7748C34AE3FAF41DD1196888DF90B4FC8C6542D17E3374359A6DB6195BBE8016E71EAF65E92418CACC756318CFDD0D0F19A6FDC3734DCA3761CA44BDBF429FB9FCE319DC21F043EA39DD1A07238AFB47B4791F23D949EDD10033CB9426DB4CD3BF708AD2D50FCBCA52A1E14C2ACAAE8320272D663A843DAFDC01B7C94EE269C819CA749A072531C17F6C2751C391E9DCFB27F6FB2648738E07B7BA96D05B60600EC65598333B2E38B407D3B61F33F38C7FC94AFF00D19631BF4E88B4B728DAD04330101B86AB0761D15F52460E48A4C856AEBDBC6C06C36CA8556556585CF1B2B12FFB0E600381DF0ABDBF3F9FB003FC28194A6D595ADF211CD98F6284C57695AE0D2ED91BD49612D3CCDCA066900C177551EE01ABE83F4F5A4E7039B6DFE12B474CD70209EFD103A0B73897104809E3262360705297EC1294AF90ED4D44591CBB10370B4A6B9E0FA64191BE10A30978EA0143EA6DDC8773B9F6516E2D257D130A3BF34B7D470493B14CEF5786BDA31B72ED9F7FA28C5BADEE7BDAD692E24EC3E7D94DAE7C3BACA76B65A9A774713BF292363F28D4809C773A2296D9DAF246E0FCF44954CD871C9031B01EE979E90071C7739C8F648D4720EBFA9EAA5DC65E5C2E2C0F535CF2482303B264C80BB248C9F6442B0B7B672B58B076E9EE8CAA37A799C3B0FA29151D43DCDF56001EC8741676386CE394B50C05A7AEDD1569AB35B4B925175F0497496A234D381D6379C381F9533D65A3D9913463D0FDF6E9BAAF5B4FCEC39EA0ED8EAADEE0A59EAA78268668C3E987491CEDDBF440F9546AE4C76AD15F53CCE808CE71D94DECFAB1AEEA467A6121AB34F181FE5CCDCC67FD9387B76DD44A7B7B987D2363D0ACC9C15915BC6AD93AA4B998670F07D27FBAEA3E1CEA92610ECFA80E8B8CEDD5F91879F534EC15E3C33D424340C9F65959234ECD5D36552897D788485B5BA7E42465CC19FA6173170D5BCD42C6FF008723F45D13A86B0C96C9E1CFE66F4FB2A7387F6A31C5E5F2F7283265B8D058B0FBECB0F8659CB40E9DCAE9DD21202C032411FD573F68AB586104ECAF8D3150794606DEE834FF00B9633C78E091DEED9CECE6C1C8E888E98BF329A2738F2F98E181D0613296A001824FABF45CBDC49E32B22BCB68CBCF96D6E5D83DD5F83D8F82863C5EAFB64CB7F516BD9679853C6799EE7E0F2F6DD4E75DEB465B69594D1BB33BD81D21CF418DC154DDAB8CB64A16BAAF25D54012D07705D85CDDC4FF0011DF8813D43896C8F2791B9E83FE4ADFAADAF689E89A9FBBA458DA938A62A6A1AD73F96084E5DBFE623A95B37880DB8553238DDCB14781F070B8ADBC4395EE3CB2005C77F639ECAF5E125CFCB8C3C9193B9F95919935D9B10CB09AA474CEBFA084D29CE061BB1F7D956FC37B9F346E613D1C71F450BD7FC5274A044D27D8A75A2EEBE5B362093B959B28DB2E7A8AA8B62EFCBC9BB874546EB9A61876E3BA9B566A6691D77559EB1BC0777EE8B1C1EE23CF996CA299D4B44E04E02196A692E04ED8EDEEA49799473139CFC242CF403981C6727F45BB6D44E4B66E993FD254792DCF457EE82A10D1D3755968BB0ECD3D7E15C967A6E4667E162E793B3A9D363DB12A0F111A4CCEC1272E4B4F5F654FE9C0231B0F5376C95D15C49939A1702B96EFB5E632E0DDB75670372E0CCD64363B2D2A1D42C2DF5BB2E1D8207ABEEFE9F4B881F2ABFB35EC976E7AA71A96F6718EDEEB6B4BA749D99797370319252F2395C7738C9E83E7E8995EAC1240F6913B26E6DC860CE3F443AB6BB60398E0FC6138D3BA95F039C581AF0460F3609FB2E822B69CDE69EE66CD9F99D803007527BA51F5601EA98CF544B892461C7240FE5497A01D8E5497654970838FAF6E01CECB68A50EFCA5037649C0E89464E46C3B29119F2B24B4150DC9CEDCBFD5128EADA4F4DBDD418D49241C9F947A9C12D18FEEA19B34B4C9928611F54A13B74C7CA8D4EE76DB7F54F685EFC6FF00DD5593AECE9F4EDC9ED8FF0072411577A71ECB4336DB6C4A1ED9C06E3AA68C7871DB20A8BFA9ADB9C1ED88F5F51D77C94F28E601B925357B40EE122EA90472A8F2725A856196F9F61D85C1DD3A26D594C41070B4A4696046228CCB8002AEDD1AB871CB2BF527D01FCCF8584E6AACB2871C05B28E99ABEAE2FC1CF7A7A9B99DEE7E55916BA4C0C81D3AAAFF004CEC770AC4B549D81C2DE3C5E21DFDE2FE4C6701027D1EF9DF7524A8BDB0C423F28647F3210D9063194837140D7D084A36D61392425E2C265C0CF1A1086D613A65AD39893A8B08ED03E957231FDD20AD4D911F8181387F284B80B6B229258CA4C5A3E14ADA014BB221EC998F14C863ECC7D82D4DA3E14DA4B7029586D030A368B702BE92D07D923FBA4FB9560BED4136FDDC3D93513BE8849B57D52B1DA4A98FEEE1ECB47DB906D23536F82202D241CADCD3BC7752D36A006520687E10D345B495111939F6FEA98DCE5C039FE8A71576805BB28F57DB435A7296F688A514551756E5C4E364CD8C78DC02895FA9CF31C744C9A5F8EBB7B23BB28B4D48D9B59B6FFAA70C94636DCA65E4F7395A4321CEC709B687EA576595A1EE9B72F7560D357818E6FE8A92D30D939F63B655BD6EA27168CA5B4B58A4A7D8785C87BACFE303B6DC65206C8E23D82564B1123776004A916A4F6F081D56DDFDC2D18C6FB25A6B3B87E5712B465B9FD7286886D99148C3D42DA2B70CEC7194B4746F4EA9E90E774CD16F1E4FC888B5F6C93F54C65EB8CF444EB3AEC4A192C27076FD546ECB8A48D7F0AD3DD38A3D2EE973C83A0C8CA6CC7E074C2DE8EEAE68F4BC8CE7640D9622D582E084C72079192C76E3B6C8EEB2D6BF8BE41E5B63E41CB91B67084D4550C1C9C9272864F202144CBCA7C089A12EC86EE3BA6A29F1D4607F54E23A92DE87194D6494F576E8B6956793E041F527381D3A67BA790407F977FAA68EC1DC0E89CDBE6C1DFBA251235936BE433485CD19C0FB27639B19CE0266C970D233827A2D5C09E504F542D3F82C47320EDB81240201521A6183E96E4FC267436FE460711B611ED3A06E5BFD50FB8B3BD31D52D2FF003C8E200E8D1D549AC55208391B0E99511A8B8E1C73D7B7B2686E4E27F311F014D02AE568B02E37F61616BF0D23A61435D72673728282D4B9E7776E0F74D228BBE467B299D98F9229B24B4746E9490398EF8010CD43A4CC1EB78393D95B5C0BA985928F3DECC3BA6519F13FA82904419088FCC03F3354898BD0C728DA3952BE389C30F7F29F62A3171B2F2EE082CFEB842AFD7325E4B9C1C860BD99011CDCB8E899A33D2519513586A230D1CA36EF9EAA2D76C39C4E4B4764D61A9781B9CA59B307EC7AA8E2EBB2694549706B6CAC1CDEA76C3A2903620F393BFF00C94627B6E3700E53FB35D8B4E09DB0864CB18128F120C53D4B69E412B41E6690E6FB646FBAB33897E21AAAEB451534AD633CA0037971B81EEABD73DB20E5D946AAA81CC71033842A458CB81256851B391B1EBEE134AD2739EAB60EC754A46F0E23E0A9148C9C91DCA81C6A33DB75B9711D00394A5CE8C756EC873E020E72A64CC79E26A4168CED8C60FC744E1F48F0DED9EA9952DC7971DD1AFC435C36EE865D17F1B4F8429415876CED8EA477525B76A89F91D0C72BE20EEBC99C11F2A132BCB3A6E895B2E640181825428D6C13A74CB8745EAE8E660A2AEDF3E98E63D5BEDBA0FA9B4FCF47272BBD501396BFB11DB0A2CE84C806F870DC10A6FA2F5C091A692BFD4CE913CF561EDBAA6FB3473E994A36452A58D0F047476FFF00AAB0787D74DF18DB3B2AB75AD04B493169C3A071CB1FF1D91CD05AA0738EFECAAEA31AAE0CCC0F64A99D5505D83E3119CE71DBA2CDB2CE1B8CA8B586E85D839C0DB0A734B5236EEB05C5A747478DAAE099D8689A00C6FF005564D96A7D03B7D156F61AA0E38E831FD5597A5691AE6E5C7D3EDDC957F161BE8A3A9CEA1D85752567934D2CEE700D8E32EDCEFB05F31E0B6575E6ED5355167CA6C84094FE5E507DD7D32E23E85325BE592A1E29E979497F39C39CCC6E067DC2F9B5C5CF1034F046EB7D9182389A487CB8DDDEE49F75AD8F0AAA9189FAB77710EDE6B2829E46D34B219A5790D219EA21C76F4FCACF1EFC115E69A91974A48A5A8A49181EF8C0CCD1348CE4B3AE30AADF0E9A6E49EE30D5540718992B5D248FFF008B3E9CAEDAF1D3E29EA21869292D954E8A27C6C64CE66398B700169ED83D11A8471BB44797559F22380784BC379EAE6F4C64F21C383B2034FCFCAEAAA2D0A69E30D7800E36C205C3DE29D2411011B581CF1999EEC73179EA47D516D47C528E4E8E1803AE566EA14B24BA3634D38421CB2255943CB23B23BF5436B6F8223E979C8EC826A8D65B92D78FA6540ABF51B9C54F1D3292E88A5AAA6E8B24F105B820920FBA8C5C754F313824A80DC2F40FBE53682ECE24007EBF4471D2A8B2A4F54DAA262DA9E6773751ECA7BA46D41F8C752541AC14A08F756FE8DB3E394818F755751250E0BDA5C7BDD96A692B60601EFF00D14B2AEA800A376EA80D1F649DC6E5CDF45CFE596E675105B41BA9073920F42A85E2368873497340C7C2BC27AF19E880DF087B48001FAAB1A7938B28EB20A68E6BA3A4E5763233DC246ED3B5BB93BFB298EA4B606BC91C80EFD141AE003FAF5CAEBF4B74711AAF6BA1946EE7CE77C740764E69648C464795EBCECFF64BD05A8F723E138AFB7F28C17839EC169A766555F205F3307D4DC823AB7BFD523F870D39DF7E89D47116ECDC91F3D92BE513D3EE89104C41EE3D424DCC7EC5B8DFAA59D4F8CEFD9210B5FD7B2962519BA743A6B8B476C774421BA00CD828FD4B89253CA4A6D8050CCBBA66EC310C8EDB23AEE8BD3570037D9096121B805274ED24EE540D5AE4E8706471751EC3D054073B6271D916A76066E71F741EDF072EFDBB2D2E3313B7755AF9A36A32F4F97D846AAA5BECB34708E607B26F6BA027AA2750E0D4D2923434F1737BF285DB838071F64FA4618F058545E9EBB3D8A314F5B9C67A055D9AFEAB74A3D0761BB9C6FD7BACA14EAC0B082D12D44E77D3E718FAA9BD054F7506B7D400A496EAC5B3BD1E4FC2E8910AB27FCD60D50EC87B6AB292321CA5BD0C133225595384244CB6131FAA7B1B70761AE09DC55CA34CAA3EC9C415BD532A25525449595E978AB77DD47A3AC4E23ACC276C38F2493F1616D1567CA011DC729D325D90DB2C7A6BE43EDAD3EE9E4171006145FF0013F2956557CA6B258C512364FF002B3CC1036557CA505C3096E0DE3B0D728FBFB255D1E067083C75809DCE165B5FBE33909F711495045A73F3F1FE6B79E26E132754E37484B5A95D8D1925C0BB9BFD506BCD27A4E4A76EAD1DCE3D90EB9DDDBCA77CA16AC3745697D8704A071609DDA8E6A6B865DE91B21D492B49DC63641D15AF93334591918FA21EEB71776DFBF6C225E5B7DF03B148534843F7F5B7F987C27DC0CB1A64938736625DEFBF457F5AAC5B01F4D930B5EB6B4496F861A6A50CAA69F5C99DC9528D375808DC6E360149B8B70C09F461D61276EC963A6011D3EDEEA434B2E7AA211D38D8A6E09FD2944833F4A9EC31F648BB4D3BB8CAB0CC67EC946C717BFABD93D12D22B6669FF84B49A74E3653FA8B4EFB0D933929C03829550EA316E915EBECCE1F9B1FA2427D39953F95ADEC329954463E9B21741ED68AD6AF4E60E02186840D881FA2B06A68D0CB95B06361F750CD71C16313E792095B45B6D82A3D510BB9B03BFF00453D96DBEEA37576405C4F377506D2CBC89006B2940C02ECFD130AA782EE560E9DD1BB9C6D1FF34C29ADED0EE7CF5EC9FAEC89D4B919C6FC0DF7F74E293AE7DFB2C5C0E0E71B0EA94B244E9B66B7F9B61DD488AD939EC751D2B9D91D9585A47872F7B5B249E96F6CF7535D11C308C796F9060E324145B555D397F86CC00DDB014A9009D117D4D6DC3431840C28F455A59B0FE88CCAD716F36E73D4A8DD546ECFA133AF82759A8752C9CDD4EFD427113DF8C066DEE50EA4A3CEE721C3DFBA321EEC6EF0020DAD06F245AEC424612091B7FBA9B79FCA3668CFCA7E06D86827FDE4CEA21383B60A24C8A508B5681CEBBBA37076FF006EC866A1D50E95A72FC9F776EB358E27201DFBA8E5FA9CB5B8711BFB294CDB70E990CBE53E4E7001F8411D1E4608FB844EA1F8EC5CB68030839EA9C892B760F824D8EFD3B27145578ED85EFC201929191D8081A4C916E83B0D4354E726D3D17538C26B4959EFB2354AF0EDB39CA85A2FC61EAF29F20DB75EB94F29047FBCA5514C1EDEC7E501BC59B03D233F299504CE88EE7EC80B3094A0F6CF9416B8DB0F5425D3358707FF00452CA2B8798DC103A20B70B30193FA24BB0B2E9B72DD01EE9DBAD3B5C4D430C8DC6C06D851DBEC4D3238C6088C9F48F84C7F1A587D433BA20CAB0EC7CF653A6604A1CD480F2100FB2214B55B80364EA7A519FCB94C66C34A32A6D96395AE89342411F29B432104E7B742985AAE433BA36F843B2474281D234F1494F95D84AD15B969C94F1AD2ECBB209EDFF7EEA37491B9A70738529B7E09DBA0E83E55492FC1D1E0CB71DB3095CA94CF485B2071E5FCA7D941B4BD73A395AC7103076F9F85D67A4F8562BEC95350C1CB2C0D271EF80B8EA8799956C6C8D21FCF8C1FAA69C6E2739A88B592D3E0EB5B0C47CB63BE991FE6ACDD3AFC81B6701432DF66CD2C27A1C0DD4CB40DA8CF2359B80D3EAF62B05E27299D0E26A38CB2B4A588CD8C0E500E4BBD9747683D11188FCF9B0C8231CCE276CF2EE4FD3BA8870CF40195C1AC0040CDE47676DBAE4AA1FC6B78B52E2FB1D9A61CB13796B6A23DD91B7A72070FE63D0AD9C496356D1CCEAB23D44F663FEE417C74F88996F9CD6CB5171B7D3BB15154DCB412DD8B41DB2074D9739684E05D3984CF3E7CA6FE671DB9F1ED953BE1DE957180CD5F37E1E823F536368F54EEEB977BF3288712B8B62A9C2285BE4D2C5E96B5BB7301DCFD557CF9DB3434FA28A54D00B566B2E473594A3CBA788EC1BB1763DFDD40B883C447D61008CEC06FDB1F54EEB1DE67E5381D87C271A774336A241E6372C6FD92C33DDD85A8C34A9156C97499871CC463E729CD3EAA9718321DFE55B9C5EE15474D4CD9E0690D77C67FAAE7A95F8D96CE38A67359F24B1FC92E152F710725FF0074F27AC76DB63650DA5BBB9BD13E6EA327AB41FBA9F625D10C7557D8E6AEBCE7D929669C991B9DC67748DA2D12D4BB11B324957568AE0696B43E63871EDECA9E7C8A08D0D3C259592CE1FE9A0E0D2075C2BDA874C88D80F303B74C284E8EB08A70067214CE7BA6D8CE1723A9C9B8EE34B89410D6A6A48CA1EEAF201C8D935B8D6EFD50A756EFD7A854146CBD39A43A96BC0CE4A1571271E91BBBE7AA5F941CE77CA465A30371CC76FCA3FC95AC71E4CCCD91B4CACF5B4646CF66DFE21D94024B1C8CFF007B3B8DFB2B2F8935D0F94D736685AE69F5472BF95FFF009546ECDA9285E473CD4C0607E697072BB7D1D6D383D7CF9FDC8FD354BF18E501C3B1EDF2B78A77E798803E48CE559315A2826FC93D339DECC901287DC3483DA4F96D25BEF8D95C9705683B890491A5C4EC067FAA4E9E940077DD4A9BA4DE720E1B9F9495468A78EA7EEA58438B657936BB20B23C73103629D368A4001FE5523FF44F93D477CECB5A9A2E51B3B3F0892A45293AEC8E88C138C6E51634C1A46CB0C858E3B6CE09BB98EE6DCEC143246869E5F8312D312ECE0E3D915A3A76E3A6E91824683B9FFD1128835DF93EEA06ACDBD36449DBEC46AA525A037A8E83D92F6EB7388CBFD4EF64BB2D47391D4F546EAF4CBE28BCCCB307B077A957953E11B5A74E53F52632655B5BB241B2F31FF34D1F1EDBF529D52C181B2AF48D4F55E57ED1CC74C41E6C8C7B25FCC073D9360765EA676E8197A12DA3D8FA2CA51927C2C2868B1EBC7F0734C2F21482DB5C718421B1774FEDAC0B6A91E4C987E96629E32A0F443299C9C87A54899487DE67BA558C27A754C5B3A53CD3BE12A2454C5F9CEF9EDECBC7200C8CE7A63D95FBE16BC3FF00EF99B0E69731BBBF1ECA49E2CB8274369E4F2241CC7AB73B82127C16238E2D72733870D8F4FAAD84FDBE5202A011FE25B8C14D604B1A5D0EE29FE5387571D9316342DA59027E87498FFCCC8CADC4DF286BE538D965AF42F9126EC33138FB84E29E5F743E9AA1B85E865C9D90516D3920889FDFA2714B563B042FCE2764BC6E212A258D3EC2AF792B5F3435A4BBEC999AEC8DFA21771B9077A4764E138C6B818DDEE19F5746850EBB6A5C6CCC9FAA79A82E6490C6F4EE82494800FAA4519C1BE81B51737B8E4FE8B786AB3B272CA3006FD522FA0CF4D93DA2178A4B9372F6E319DD22D7387E5710917D1B81FA27B48E23B256864987F485E0C5234B9BE9CEE7FCD742E9CBF3080ECFA481D3B2A0EDD18781B614E7494EF8DC01DDBEC9ED17E0A5F05DD0DD01DC6708CC172181B9C9E8A236AB900DC9011364C1DB823E12B45F5197F3075F7BC6C5663B8B0EE76F9EF951AA9A92137FC438F44B70DB0B0692B039CD01F827DFA2217BA4F2B949E5787FF87B2AEBF1FCA060F33BE160EA4703EA71FA27DC81F4DAE512A7CACCF709A55FA8E401CBDCF7421F786FE6CFD93EA6B80C67B7B27DC865BAF936A885A506B8FA7A74452BAB0386C30A3971A8C641C9C28E4D16E1C8D6A59CF951BAAB51E6C0190A4F48F047421627183FD947C0F283656979B7C99C06EDF282365E53872B275235DC9B81F655FDC287D592952642D38A04492BE471C74522E1E4AE154CC60608426118271D14B78696CE79C11EFD54D1DA8A2E526CE9FF00C40F2B99D8C968C2AFEBA9399E4FB9EA8C5C2AC86F27C20FE60EFD148DC593D3AE456BA20D8F0703B8C28C50530749800107BF74EAEF53CC7AEDD114B469CCB79DA52492E4A936C0525B79DEE8DBB63DFF00C96959606307ADD93EC13DB94BCAFC92063AA8F54DC864FAB3FDD4B716549EEEEC74642D682DCB47B21955722729792A08E808DBF9B7085CF9272EC7DBA267188FEABAEC1958C23A743DFBA01769B2DE5382E1EEA512C993CA7A28E5E681B82EDF2A01372915F5639FCDCBD9369F31B873823B8F94F2E929CF5DC1CA96CFA75B594AD91BF9E31EAFB240C5CA045A26F3EE3BA4EAE1F8DC741EE908286463B607951C730001C7AA8E4A8D286752F6C8032331DB74E68EE5CB8CB46511F2B3B8C2155940739E9BA0ECB508ECE62487F19CCDC7443EBE8411EDF3DD07FC616B86FB23B056876075CFF441545B84964E25D82A8AB0C6719C8529A1AC6C830E03285D759C75030873A4746EC842CB09CB1BAF81FEA3B0F768C85117131BBE029EDB2EBE60F5A177BB0F365CD194517441AAD36F5BA034A0AE2FC616D5B6DCEFDD0586A4C67A23D47720FF00AA977599D1706B63EC0D23794E0039526B0D79180707EA9BD5529233B21EDE66BB2126ACA9083D3CEDF4582DB7076FFD3B2DAD70E1D83D3B1F94DEC75C5CD52BB0DBBCC7C6C0325EF6818F92AA354E8E9F74658B7C4EEBF0DFC37AA92C2FF20339A676E5FD397FE4B8EBC63F0B23B6D6D3B8491F9EE70F35B19186EFD765F40EE1AB9B69B1D353C3E995D10C8EF9217CC8E3B55BAAAE4D12171713CC4B8FCF44A52F83969EF6DB3A7EDB0F3DAE9DECC9706B411EFD370AE6E0BE83967F2E389BBC982F3D80EFF755F709AD05F6D8E368CBBD2D67B93B745D317ED534FA4EC7255D43DACAB959CB0B0EEE73DC3D21ADEBDD0E3C3EEB1B36B25086D5DB231E28F8C8CB4D336C56D38ADA96E267C672E8E33B39EEC743D572969EE0439CD2F7C2EA6B54399AA6AE6DA6AC9BABB04EE584F456E7860E074B71A892F37191EF92A5C65789324B63273E58CF418ECAB7F1F5E243CE736C96F3CB4916D3161EB8DB9411D0AB19DC282D0E19397B397F273CF17B8AEDA993C8A7C8A584F24407F306ED92AB93213B92705329F946067E3FEFE5108318C75C2C1C9C9D6635B7863AB2D20E7009382765735C2D029ADE65C609C6EA9386A70F69E9B85D574BA505759260DDDED8F2077D827C7C329EA1A07C9A54DCB4FB8B0F3BA3693B6F800775C175B6E707BDB8DDAE23EE0AEC7F05BC6D8A86ADF6CB87FB19DC62773746E76EE92F1C5E12E5B54E2E744DF36DF51EBCC6321BCDBE4E17478551C56B5EFE8E2D68C1C11BFB2C968CEDFD51DA9B40918658CE48FCC3B8F942696849763BFB2B4E463431BDD459FC16B8B237EFD5748D3B8C803D8EE6F82B9B34B585D0343C8EAACED39AD9B1B9AD2763D573BAD6E5D1DC78D4A1D96CD054F6775F84EE6A9C918EDD10DA39C3873B37042794548E79D87D57313547590926F8185582E3D10C99A01F56D853875936E8A3776B3939CA7831B241B0707E718D8A7B6FAC01E32EC1E870A354D3F9721613D76CFB273574CF6107A83D0AB7175C99ED7C169D2EB5D29403CDBD59195E0F491809933F2011FDC25878AAE1677D2847D60CFF00FED501D23666C920F3B0E1ECEDDA885EB8F905AA7F265B45057403A72C2DE7FA1763AADED2EA9255FF003FD8E7F55E35E595A7FEFF00F868B83466A7E17DF5ED829E959689DC70C258F8DC5C7A63770FB844F8CDE0568A929BF1B6EBBC81BDBF14EFE01CF4C15627850D676DBD90F1A6ADF461A32D73E061793EE1DCAA39E37B5E4753574B61A4E5712E6996360C3236E7A602D4965E2CC7C7A771CBB1FF00CFF9FD4A3E83C19EA7A960928EA6CF3B080461DEBC28DEADF0D3A928FF00F7DA68CC63FF00121FC8D1DF997D0CE12D8E0B3DB44D235AC2D8C73B8ED8006D8CAE4CE38789AAFAE9DF1523C8A324B797FF00883DD47975CA1146AE97C2E5D6CE4B1AE11C95A8603192CCF311D87BA88D53837A64BBD8A9F5F9ACF39C4B4870EADFF3518AC6649C01F0AFE2C9BD2660F90D14B4D378DFC11C8E239E6E5C653E6461A3277CACD546E68F9285CD2BC7CA9668AFA7C95F039A9A96E400DCFCA3B6880000E3081D14EE3D822B155FB95525CAA4743A6D9F73EC903583B67E12CD881DB771F93D105A6AB2EE87A27F6E9CE48CA81F1FD4D3C797D595045D6BC1070084856503BB0002294D37407746FF0008D737D945B6CD78CE18D7041442709BB9D8D87552B9EDE37C28DD5C0413EC13EC2079E9DB13152E5E49607CAF21F4C3FD5147C8EEC025E9F0DEDD537981EA0AD2198B8F5E8ADED68E1D341EA5CFB225E40C74DD07A3AAC7745A09F3DD39616D7C191115EE5212DE62C8704CA4C6705F04D3865C6DB8D9E473E8E731F38C1DB390866BBE23D5DC653354CA647139C1F7FA28E89C0F92927E09C8393DC7B22DD63EC75D9BC73E7BE129193EF94DC3B3D425E2E9B0C27217B90EE29074EE95A8A7000277CA69CE3EE929E770EA99F248B24BE422CA8046DB25907FC4E42522A8299A27C730F400612F100364CA91E30958E5FD541C9A314A465C3053A66E3DD6F1D3E46E3290A8983761B226C778D08D454728518BBDD435A4B772511B85410093B85119FD649E81329321C91FC019F587249EBD92BFBCF23D416E69C13F1D921353EF8C234CA0DCD743865702978EAB2863A9080B6A3EA9DA196697C85FC971E853B8291E076FD138B3D2E7746A30DC2068B31CABF033A520636C1F746ED3797B1E37CA0D514E1C36382B7A06E1D8CEE8299A30947F25BB6DB973B7D914A5ABC6C0F2955EE9FB9B87A49C7CA90B6E87F2919FF7BD92A65C54D764B25A838F7F94C9D5A4650D8EAC918E6C05A493607E6CA2B229438B4C2F6FB8F3123A7CAF4F5583D73840995E33B6C9696AB033D53B7C011C8D7017656F310307EC3A2210D59CEC46DF29C686E23C749CFE653B66F31B8F50FCBF280495BE6CAE731A1AD272067A20A2CC249F68941B9646F84265AB249C26D5153B601DC7543E1ADC7CA1E8B3151F825549265BD90EAC6927AEEB5A1ADDB29264F97128779328A60CBD3886E33B9502A86389E5FEAAC4BAD20760A8E3E9F2486B7EE8B715F2E303C56F70040607170C6558DA068C53B399C395CA3963B693200ECEC55935B6E6F940044A4411C2AC3ADB831C1B91CD91F990BB844C2DC73FDB1D132B6D1B896B1AE041EAA417DB539AD0C8DA092372A58BB165C4EAD10B9E97B039F847A9EFA6288B7A1F65A4741E50CBFF003288EA5BA93BB7B765218F28CBE509DCEB8BB24F4F6F7431B4ED774DB09947702FFCDDBB273CC3B1C27BA2ACA02B3549E877C2D0D392338D96ED66DBF52957E79719EA8F7103C4D832791A31B20D73A807B808A5745CA3D4547ABD8D77442D0F175C113ADA70E9090771DD59BC15A16191D0387A66F493F5EEAB4F29CD760349DF72BA0B82BA3CCEE6380C39A411F28A30B0EC1B7EE0E3A9E57C447A06ED77BB55777DD1879F9180B8FC2FA3B5DC1092BE999272E1E07263BE1565AC7C2E4F49119238CBDE7A6064EEA5F48397E4E0DB9D28A7701B9F76FB2671BB9CE06093D1A37C2E83BDF87C2D7196E3308199CF20C7391F455AEB1D4F41487CAB65387B8759E4EBF655A58E89B1E7DAF921353A64E7F89E8FAF529ACF46C8F7049C246AEFB24E7333B27FC43B25232DC63720773DD40E2CD1C79632768DA9AF25DB1E88CBADE1C01EE81C9424EE06027F6DAA78239BECA348D28CAFEEE869556E91AED86C11AB65D3000722AE832DCEDBA01576E2D39CE7D93B880A6E2FBE0F5EF4C79839D9FA2873A3744EF6561DBEEB81FE4875F2DED7FA80C9EB84A3ED2A6A30C65EF8F632B4CCD78DDDBFB279F8319DFA286991D1BF38C6FD14DACF76638004297F729E4CBEA476C9726D4950E6640381ECAF4F0F76BF36BE94019F5B49077EEAA37D035C460775D6FE0A74931F3CD52EDC411923EA028E54D58D0C92C6B696B71B2E866AB6C63F2C6C0001D06CB8678856CF36ECE27A346E01EEBABAE1AE44D573B80CEEE1FA65739E8AD313DC7508A4863F30CB280F3EC33BACCC4DCA649A996D859F423C2768E8A2B632E35786C1034BC67BF28CFDD5314B5936B8D42E99D13BF765049CB0F313C92729FCDCBD0E30A53E2D75A4AC8A8749598E2A250C6549837745D03F9F1D01DFAA3F77BB5368EB4C3410E24B94EC01AD6FE60F70DDE71BE33B9CAD4735046469B13D4E5A8AB6FAFD892788BE34C569A4169B586BEBA7679796631137182F763F2E0765C0FC55E1A454948253273D5C8E2F9DEE392E79DC81F0ADCA0A411C551593C9E6564997CAF273CAE3BF234F61F45CA3C44D6F2D54CE25E4B5A48033B01F0B032E6792748F58D0F8A878FC0E593B7F9EC8C4A43BD240F94E1A00031D7DD036D665D8EDEE88C53764D28B8F6737932A94DED35B9920672BA93C21F16A02FF00C1D49DA46F26E71B1185CB15B4C704FBA0315DE582564B192C7B483B6DD0AB3862A4656AA52BE8BCBC5B70124B65C05445CC296A5DCF1CC01F4BC9C8DC2E92F077E2961A987FD1CD46D6BE299BC904F2E3041180013D3F545780DC44A3D5F6B759AE0E8DB58C8FF80E76339036C13DF2B993883C12A9B6559B6DCF30F2BFFD46B37009CFA0738FB775B10E0E772E3DD2E09778B1F0275D659DF5F6A63EA6DD292F1E537CC2C077C068CE42E73D276BA7A89807B5D0CCD3EA6E0F3123FC4CC7A57D39F0B3E2D27B6363B46A68FF000E0B43692BA41CD4D2C6766F338ED9231DD595C77F01166BE035D6E7B6DD5928F319534BCA62A9763239B190013ECA5972B829C5FA33F7A3E705C34C8743D305BB0C7FF95EC835B7870F735D91EA3D3DBEC55ADACB495CB4F4AFA7BDD13853FF002D640D2E865C7474AE03D24F54E74ECD4F53CA68EA61933825A5C03583D864E72B0753191D4E9258F2737457BA03503A9A614D5208613804FF00CD74A5AB4382CF32278E570CA1DA8BC35BAB216CED04B9A3398B719FB225C27B91A777E0AA8720079473E413D962E4C7C1BF8A493A04DF07943271B7503BA1B72B6F9D0992219DB7C750A61C4CD11253CC24E526193A771BA8A69FAE7DB2A1AF99A1D433901CE39C332AAA83B352A2E3D953DEB483DF9746097B7F9549384F3435C5D4150EF26A40C465DB64FB0CAEA27706E13CB5B03D829E401DCEF2397077F754D71D34259E6C49435323EE711CB1944398978EDB7B95A38F139706465C908BEC1B4BA364A77BE9A66169DC0931DBB3B3F2A2176E1B3AB6665242C321E7197B474DFDC2B4F861A67575EDACA6A9B7B28E28F0D3555239267B3EFDF0BADB4EF0FACDA5297F15709E28DED69739F3B9A399C06488F7C924F45AD874AD7261EABCA460B6C79621C32D1D4FA62CCF9EA1C19C9093CCE3BE797FBE5735F865D3325EAEF55789F763E57361247FE183B1486B4D6377D7B5629E8A37D2D8A1932F99E0B44ED69DF973D410AE7D49C4AB5697A1145486396B03391B146417F3631EB03A0CEEAF649C631E4A5A3865D44AA2AE4DFF00821DE32388CE798ED74EFC9FFC4E538F48EC405CEFA5F4CC91BF9C60068F4B4EFB8F7FAAC5FAFB235EFAF9FD7575077693B44D3D87D106A9D4B5153CB052825CFF00CCE6EE412B94CD39649D44FA1FC1687178ED26ECA926D72C29A928682AC384DCB49520ED21386B8FCFC2A92ED6B103F91E6171CFA5F1481E5FED903A2ECAE0DF81AFC606CF757BDCD207F08EC48562EBDF09BA3E3A7929DAFA6B6D5729E57994194B80D8905DDCAE9F4119C12DCCF17FAA33E9736593C3CBF9A3E6B5D6CC724B87E6E83D820D2D0B47B9FAAB5754690650C8F81D33AA395C79251821CDED9DD422BE00ECEEB726EFA380C4E3774462BAA397F28C6C874333894F2A299C4F5EF84E20A0C61556FF00069C16E92AE05E8F6EA71EE8D5BA66938C12A3F7163B603AF744B4FDB647B80077513566A472283A5D932A291DCC0F6459B71C9EB8012DA234B4924E2070F51E8ACABDF061F4E479AC20108B6177F72A67DD5BBE46FEE87D7533790B8752A5B7ED125A0860E9DD41AAA2737D39E88B69064CA31F296529CA5653515BD4673DB223EE927C2474D9108E16FBA4E685BEEA4DC608DE2A92C393B8528B45473B41E99516319381D4AB77813A1595B551C539C34B874FAA74491B6E88DBA9DE0EC323DD251349E8413DC2FA39AB3C175BA3A27543643B47CC4118ECBE7C6B111C33BE385A7D2E233F747C1364C52880EA24C76C7CA16EAF00E46DEF84E6B262E1B9CFC2093C583DF741C159CA61882ED9EE89D2CE4A8AD3C08BD1CD809E80F525F21E7003AA1D5530DCE4A46A6E2507A9B893909516164BEC7CE9C1FE629CD2568C752A3E1AE45681C46D8504A44F8E4AC925AEB0947E2667B21D67880C6CA450E1BD935A34E0B774366CAEE810DB84EE19CA3E2219FAA1D72B6876704A1DE839E29515C5F6EC7A027AF441DD71D80CFD9492EFA68E4A8CD6DA4B7A67F45229232B2AC89F06AFAB03A7FE8B22E5FF0065367D038245F4C4234D149E59C47CFB813ECA7EDE12550A2FC7E1BE51EC08CFE8AB5A6A624F55208750D40618BCE90C7FFC3E63CBFA744E0ACB7D8E286A9C7F2ED845237380F7CA6568733B9C05248E1880C839CA7A2552044B3728CE1079EEA7390083944AE1213DF64C238F7CA1A1DCA483B67D40EC8054F282505B924AAA7930E077561E96AFC868C64774DB4B38F2CC9050D76763D3E56E46FF001F0B4B95A47E607013379007A4FEA85C0D059DC57212047B220D6FA76C1F7F840A82524EFB846A3AA0DE8373D7E503545CC338C81D535A41E9B2716AAB7E7D23AFEA98543F25C7BFB229A74EDCDD0A877179454BA15E6392075EE99BB2E79C9C0F609C5654E1C5CDD89D894D6869DB9EBEACE50EE27FD2CAAD124A58006EC4FDD2F454BBFF00CD236E88F7DC291D1D11C83CB9F6526E437A3340EFDD249FF2EC9AC7A69C5C47291F45387C6DFE76F21F70B14351C8E2321D94CA489D6297C826DD62681B83B7B754E2E34ED2CF4139F9524A5A873067903B285D63D8F2798721FA277243AC4C0F6094B5C09036F6526BDD782C0E69DF0A2D4D6C2D7679B2133BE573A3D81C829B7879313DBC026F37A27397127D943ABEB09EB909E5E2AB27207A8F54C9AC711EA0894CC9969E6FB12A668EC8A42D4DE9E0C2780291644549699A140EC81EF94FE9D8DE5DFAA614F164257C93D11AC8808E0669534CD767201513BC53B58718D8FB7652B93EB9C7F44C26B33A5F4B5BE613D074FEA97A8065D1392E08A69AA40E9705D96E77257707862D3B4C1CD7F387741D360572FD9B4152538F36BA719ED0C677FA1215ADA278F0E89A21A38591443F99C3248FAFBA9E1329474EF1F67D2AB7C0D635A1BB6D9F840B8A3796C5492BC1C10D3827B1C7654370CBC5744D8F92A9DCC5A3FA7D504F123C61F3E884D49934E767EFD15C7254292A38E78CDABA79E77BA579700E2064ED8CAA56F2EC67D39CFB2B0B51DC44C5C7A8EB8502B94E36C6DBE3DD52C931A38D4BB21F594BCB970CFD16D4B5EEC6FF006446EF1E76694CA0A5C6CEEBD941760CA2E2EE249EC52730F51FB233534A3D867B6143A99DC8772A45417BCE33FD54725C1A587557ED98E60E66F5DC7B1454358F6EF805372E0E0865C252C191D1028B2D49ED57F02370A7201210BA7BAF29DFAA76FBC35CDDCA07748DA77077EC9DC1917A892B41DB8DB992B723776103A6A7746EC1C8297B25D8C7D7744EED1738E707054ABF057CB38EDDC890596E0481D063DD76EF87978A4B1564F8E5748080EE84E7D9706E970EE846492005DC5AE6B4D1E99A38BA3A6F6EBF75065F6AA23C39A32ECAD6C3790CF3A41EB1EA2E3EC4ABB3C2DD81966B7DCB52D642449207B295AEC07F31C86BDA0EFD71D1543C0BD1125D6B60A7887342CC4954F1B72B5BB92477E8AF9D6060D4176652465CCB2D8981F3C8D779714CF8FAB08D838E4745574F0AB931F532F55AC682DC10B44768A2ACD5B7B9636D6D6F33A983BF3861CF963077C9D86CA92A9BECD54EA8BD5683F88A92451C6FDC3223FCC01E991BA63C5CE243AFF706728FFD9944E11C10FE563830E065BD0E31D7092D5BA80CD33236802189A063E9D9BED8597AED5F1B51EA1F48FD39B5ACD91764335CEA17C74CF6177297824FFBD9EEB992EB3E7F5DCAEA2D6D6E6C8C1CEDCB0FA5AEF6F85CFF00ABB4B49038B48F43B769ED8FAAABA3CA9F7D9D07D51E3F228FB3A2314DEBCEDBA2F4D4440049EBDB0B7B25AF0E1B649EDECBA5787BC3E6C948EF3A26B891B3B9770AD66CABA4727E27C1CB27BE6579C3BD0F0D7B1D17308E5C7A49E84FB0F955E5EF876EA7AC34F56D730E70D71D81F63F756090FB65735CD38673F7DFBAE9BD5DC3BA6D4144C94111D435A396503A103BA0C59B69ABAEF1309C76A5C9C87FE805C6D32C55F48C9008C878923C9000DF7C765F4AF825C61B1EB3B6B68AE71C4EAB63390F380260E031CF113B8703BAE63E0AF1427B3D51B55CDAC969DE7918F959CC0E760724744B71C3866EB7D432EB693E417383F9A3F4B3277EDB6168435271DA9F06F27B570FF25B1C48F0F976B2C7242EA63A934F3C9FF5770E6B85233DE37751C83A60F6517E146B7AFB71CE92BA0AE81BBCDA7AE8EC5741FE28A13211D37030A61C26FDA233D1B62875051C90C6F01A2E1102E8DCDF77601CE7B8570DFF0082DA4B5786D751CAC8EAB198EAA82514B3F3F673DADC39F83D72375A58F25F2709A9D2E5D3C9C32AE3F2634AF8D4B0DC9A2DBA8290DA6ADDE9928AE719746F71D8963C8E5E527A6EA27C46FD98164AD0FAEB454BE86793D70BA2903A8F2770795B9F4FD146B8AFE1CF5353C0209E1A4D5D6F1E96C0636C171863EDFEB470E7380EF954E586EC6CA5D25157DCF49C8DF4BA92BA296E911F868C3800A597BBB28431C9F38993AB570C75FE9A70642D86F54DDDB4EC392DF8C8EA91D695D7BAD01F2E8DB98A8073E645B60A0B4BE38755B486D357D1DCC67F3C94ECA1E61F47B4632AC3B4F8E9D54D6665B2D24BB6E5B7385BFD32ABCB062668C7367C6BE3FC91AB7DEF5A4D10A58F4DCF1B00C364AB1CDCBF5FA2945A3815AEAAA134F2BACB153BFAB668497B73EDB750A0BAF3F6986A184802DB0C04F66D4C7507F46E72ABEACFDA59ABE53CB03391C7603F025E3E370D51AC18837A8D4BF95FE4EB8E1F78139E261177BACB3C637F26090C703477003B1B25B50F19B43E9563B90D34D5511DE28407D5970F9DF75C9EED27C44D58631593BE1A576332424D361A7DDA3949DBB2E85E18F801B0D9182BAEF28ACA860E774F50EF4B48EB90E3EA2A750C71E522BB793271393BFC22295DE3A7565FE4F2F4BD91F1D23BD2EA9AD8F76E76E6072303BE46516B2F82396A0FEF2D69777D7161F3594BE6114B091BF2961EA074C27BC44FDA0543460D15828FF12E6FA7CD89A238E33D32463D602E6FD6BA8EEF7BC4973B97246492208BF8631ECEC1195573EB6304747E2BE98D46B1A6D6D89797177C5B53C6C16AD38C88300E47CD1343628DA363CB8C7ABE5730C740F64CF9BCCF3AA0EF24B21E676FD464A7B43A3628C7246E059DDECF49CFB9F74C3565D63A78FCA85A6495E7943BB9CAE6736A659A5C1EF9E33C0E9BC661DCD73F91BB5F356D4369A2CBDCE3EAEF85F403C327862828A16D44ED697E398F3741DF273ECAB4F061E1C3958DADAA6FF15FEA19DF941DD49FC6B789575BE26596D879EBEABD1866E5AC3B1391D0ADAD169925BE4799FD51E7A59E5FA5C0E97CD7E08E78A1F1A4F8E7367B1012559F43E768CB63CED86E3A3828D7097F675CD756FE3751D6D539D2FAC08DEE128CEF8C8E837F656DF834F08F1D142DAFAD6096B25FE21320C904EFB93EC9B78D3F1C51D907E02DB2364B83860B800E6C39DB181ECB65C96DDC8F32CB979F4B1F7F245B8B9FB3DEC74B4FCD4D769A8A76B4F23EB65F362DBB39BD7F50B89355E9EFC373C46A21AB7464833C030C7FC80AD0F0D3AE659EEE66B9CB255CB56082C9DC5F00E6CFE5889C37F4503E26D99905D6BA16E18DF34B9AD68C340273CA3B611E2C9B885E99E2ADECABCC5B7B6531F3794F2E51ABD425CE3CA06C85C76A7B8E70A6DA58F5546921CD050731CF367EAA4D6FA5C1C83CB8EED40EDF4AE69C10A616569E81B9424D0954B7324DA2B50CB4B2B6667F11C0F5775574EA3E2DCD5AC6798DC380030154BA7F4EC8F3FE156369CB23231990E4FF009A6DACD4595314B7D1B1F1B8BF63D77554EB2B437248006F9DBBAB89D017BB1801A76517D61A79ADE9BFBA2DA47356524E80AF231594F871FAAF27A2A6C67283644B36A0262E27D9225E5151C92CCC331D581F7526D1BC439E8A464B4E305AE0725419D2EDF45B8B93BDC01EC95134750D7276DDC3C75CF5542695EEC3C33973D3B2E52BA6A432CAF73CE5C493950A8AB0E73FD56D255EE71FAA2DA48F57291247D7B7EFDD226AFDBA2062AFE164CE7E89B682B23ED873F149465C00182A3FF883EEB57559FAA6DA17AA1D92B33D3A26AF00FC215F893EEBCCA939DD33889640D41063E51AA2A9031E951C8AE20744F23BA3BDC2071268E42714779C630404562BEB4F53955DB2E43F9BFA2794D56DEDB21DA5C86A5C5705871DC86764BBAB72A214B5A411B1FAA24DA8250ED2E63D54DA1D56BC151DB9C67B61149187D8A1F7188809D41013CEDF645AB251DD3618C2CDD1D9F8C21F4EF46A08CF9661C42D1EF8DD3B8A61DD30706E719CFCAD0823BA2DB440F2071858065BB14B4754F3F44160C9DFBA74D9C8EF9460398FE49B23A6375BC44E46D85AC357903216F3B8E46E10D132984A8E50E383D4A94505298F18EA7A285D2839C807EAA7DA767E6039BA8E896D255209D2DD9A4E1F9DBAA4EE554C3EA681CA36C2615EE21C76D931F31A7380EFA764A89DCAD07A86B9A3046E1169676BC6DB614362AA711B631EDDD3A82E78763A65038D967064A1D4B561A70512B2DC3193D467A28DDC773FE69A5054188905D904E542E05E8EA69939BB5402DC80067AA4ACEC6EDB9CA1D47287B7A919EC516B453B8380183FDD44E06DE9F58BE49ADAA0738745208667346E91B1D33B00744665B3388504B19BD87510902AB6BFA65308EA70E45EEF6EC008236024EC143B1A2E6F8324905D881F9B0B7964128193F74323A318190729CBE1200DB64B7343FA719066874FE71CA798E141B5C5ADCD71CECA6F4B70E46E476FD557FABEB1D293B91F544A764593152E0834AE39CE3232B32676DB65ABA37B47DFAA7318777DC22AB331A698AC14ADC65A77EE96634F72B314006E3F44EFC8CF56908944096DF91B871FD1784B9DD39F2C0DBB2C1A61EE113743431419A369F1D3EE98575E1ED690DF437DC7FCD3A941CF7C7B843EE59E523F97E502992CB4FC70455CFC1EA5C09EAE39FEE8FD8EEFCA39738F6514BAD239C7032D03DBA2F51348C02727A0FAA9564284F032E5D355FCCD20B4B89EBFFAAB0F4D5F9AE8A5B7CA1A5B2B496027F2901551A1B54BE84112C61FCE3039BB26753A839A5F3DBF9DAECE3E3D829E394A3934EA444B59592485F21E4788D8E2D271E8F8DD4264A867C83DC615A5C55D5B3CD135AD3885FBBDA07F30E8AA3A8B690464BB71D7B7D13B9D9992C1B1D894D1877BA4CC7D96AE6F2F7252F14EDEE46E99113767A18FEEB00E4EDD92B353B86ECE85644BD06319EE887960B568734D772363D025A7AE6483AFD903B8B8B47BE501354E0764E88A739C38618ADA739F46C918A72D3870CADE96EFCDB3B6F958A87E3618722437A8A82B4F6EE7190709DFE19C01C94C6D0E73705C0E32A415641C61A774EACA929D86B405A3CD969D9BE5D2B7A7D575AF8B6B8791050523321CD89800EFCCE03180A89F0EDA64CB72A56E3A3C38FC007392BAA6AF41BAF1A8DD51291F82B6B1AF738FFB2CC633CA7B64E1439B924C4DC793DA2EDBFE8DD8A36878179BC911C059BC8C649FE26F618284712AB63B7D032C949279B3C9FC7BAC8DD887BB7702E1FD94AF546B0C3EAEFF00594F146620696D30BFA49FCA258DBEFEC42A5AF531A3A17CD51EAACAF2647BCFB3B7E5FD165EB32284291DD7D37E2BF599D649F4884C37368939633C8D60C003607E7EA563F1F97925D951AA6716EF8EBB9CFF009273155139385C7647B9D9F4D6931E3C38D4513FA1AD0F696119076FA21D3F0F9D334C2E1CCC3BB73D47DD476975016FE5EBD0852DB76AF7E00009775C84A32DA2D462C79E0E2F91A690E02363939E6C90D39015C71CD1C2C01BB37A10AAE9F8993E4E0B4F6230764D24D4B5329C6C73DB752EF723261E3E31E1D234E346926C91F9B1FA9C3D40FB7C239E16F88A08928A676091E8C9C6E82C35CFE531CCEC64E37FECAA5BD8345562489FFCC1C397AF55771339FF0027A658F954752F1B7437E369DC1A07E229FD51B875206F8CA19C09E274770A596CD5E00930636739C7A80C0DCA7FC38E2232BE3693FED1A00701D4EDDD53FC76D1D2505532BE9F2D05C1CEE5D807673BE15984AB830355816D4E3F04FB4DD63A8269AC5798C49433970A791EDE6F2B3F94B1C7AAAC746E8B8ED97C7533EE1536E25DCD455B113CBB9F402C1E9C740AFDD3F78A6D496D6093FF007AA703127F3023D8F5552F1F7474F25346F76F3D2ECD78EBC83DCFD95B8E4A672DA8F1FEB41CFB2FCABF193AA74E9F2EE14B15D698EF15735E5A648FB39C1BDF1EEAC8D39FB51F4E4F1835904B1CB81CEC1482501DDC0711BAE65E06713D974A236EACC17319CAC2EDCF4F9545EBDD3525BEADDC8360E247A47263DBA2B1FA969192BE97C59E3B92A3E8DD7710B406A52DFC5B2024F4129FC191F50C2C4F62F0ADC3523FD95BFF00FF00292FFF00F405C67C30AEB35D2330D75142D9718F319E971F9D934D7BE1B6CF1B79E2F3B03B35CE3FDF2861E43FF915727D1B3C9FF4E4FF00C9D9F370838716C709D90D0073370595AE988FFE5748ECA75278FAD21403C98F2437A08A95B27FF8585F3629F46DBA378FE1B8E0F491C77FB745615A751DB69F0451C65C3A1C03FAE420CDE4D47A36349F40CE6AA6DFF93AA35EFED46A46B0FEEBA09AA1DD0192331347D805C63C63F1137ABF3CFE2DEF869B3914ED25AC03DB3B67EEAD1A5D774F20C329A2C9F768E5FECA2DAB7CD9C16B29584760C1FD552FE20F270CE9F0FD198749CB7C954D9F59BA9DBC910CB47770E523EFDD2B26A2A99DDEA7B80FD027936829C1E79217B47B1C2635D388F6C3943396E37F4D83D08F7C122B4D5C8DEAF247D5593C0DD0CFB957B5CF6FF0D846011D77552E8D9DAE272739E80F65DD9E123487F122200C9C13F44DA5C4E5910DE6BC8C7168E4FF0062FED79AFA974E5964A87E184478899DDCF2361FAAE4EF07DC219EF7709AF77204BA490BE26BB7E56E72DC67A64277E34355FEF7BD52592139861707540FBF45D8FC31B34167B535D80C8E38B9B99DB60B47472EBF8BAFC1F37E5C928DE4F997FE483F8BCF116DD3F6B7B69B95D5D237CB822CEE3231CC40DF017C92D4F66B8B7FF6AD5B1F3BE7717C92005CD8C9DF95C7B00BAE6E3A4A6D41789AEB54E7494F13CB60847E57007638F6538BCEAD6DB0725550C4EB749E99622DCB434EC5C7D8E375427A9B96DF82CE1D1EC8FA8FB38F38117874B5F1548735D8237271D3B01F08E712AB8CB73A977A773FF7BAB6F5D785331817ED24595B4CEF5CD45904C44EE446D1BEDBF65CF349AA3CEA89BCF85D4F525D8962782D2D23AE32AFE28A5CA2A66C8E4E9832B2CAE2491EE9CDB680B7D2475EE8BBE039C3B383F97E53DB7D2B73BE76EC55E4AC816D4230D8F6DDBCCA43476BC7296EC4764EEDB3924318DDBE549A3B272E094AA8B518A66B692F3807FA292CD5CC1869241FF341A2AF0DF486FA89D93E669C7B9CD7C9CD82474ECA27C9B38A316168585C36CFBEC835F6D4FE5249C0F62ACEB6DB218F9047CCE1CBBE7B148DD6D31CBCCDC6FF00085449A6925473955D07A8E5654DEF1A5C36470E982B547C94B6A3811B4E9A4F0611B6479494F6E71CE02B14701647A47A6E4A2B3DB5C3B2652519F64A866C430B2CCAD8C256AD086C6498BB1A528E1EEB4645F2B62DF9CA6B24DCC45EB5CAD9E1244A435B3625642D16CC667A242523701644856CDA42B434E4249125B376CA427949703CC8790B68DDBEC9341C66D16459E7CE3D94BA9A105AA05A6652719E9DD4D69E5D9051A9824E8705BD821F5D4C70721108C774D6E8ECB4E4A0A2693E0AE2F4064A65140085ADF653CC70537A5A83845B4CC9CB914A9A6206C9AC3194E26AB38C7649D0EC77E8A4A443F23B8077E8B68DE09522A0A063DA08C269576376721A843516CCDB390ED9EE9FD5D0B7A8DD0A8690E7A613FA398E3A677EE86C962877439C63A29359C38610534DD09C00A5361941C346F94B71723116AD639C37D87BA15052F29CE72A74EB31E4CBBBA0F556D6E3D3D7D935971438015451BB036E51EE134AE8081907247752279259CA46FEC98494DB60FDF1BA16C921023ACB91FE63D53CA6602093D7B26EEB6F3389EC111A4A0071BA8DC8B0B0DB0F59830E067242995A683241380A0B4B6DE5CB81C7B29269EAD710DDC9DF750B99AB874D65A76799BB6FD14B60782011FA2AEE82AFA72B47CA925057637FE881C8D9C3A6AE83D57421DD76F851F968C0F8441F5CE3B9DBE1347CFCFD76FA21DC8BD1C7288F28A89A42706CE1D8DD0C8EA1ADD8128932E4001BA8DB4CB31DC84AAED61BB039F8508D454A003B299D75C40192A377B69734E004148925295745675271D77076C22B6E832D03085DCE808EBEFB290E9FA7F4004EEA448CD964A7C89B6000E71D138FC402B7AAA6233EDDD20F6340CE774FCD8124A4ACD6AA1CA6524806CB2FAC23AF4432A2A413D764ED11C5D04A0A8C7CFC2197B782DDF609B36A773BEDDB099DDABF2397AA8B693BD4323934ADCFA5C4FD4AD5F213BEC31BA19708D85D80E20FB765E31386DD7DB0A451457966B0D32EEE70CBE43B6C0129DC354DC805DD7BF6518346E77E61F708D4740E2C186EC3A92A58C4A32D457C062B6E60C66370C8EC547E070236DF1B60FF00759AA95C5C3B8E8B496C6EC6725B9E98DD16D20F554BB4255D696919E8546E7B6F5C0CE3BA90C81EDDB05DD96A6470C82D23EC8D1572414BA44464AC7B481938F9459B5AD734731C14FEAAD265E8D0845C34FB987D209F709CA72DF8F937AAB73C8E61B848CB42D70000C3BBADE0BABC0E5DC7C2711B4C98CFA7DF089039322947923D556AC1DCA4636E1E064952B96CA7A8F50F94E6DB686BB1868CE7BA96266CA0D2B1C58E81C40EF9525A5B296BB7D80F7442DB6E6B1A3DF6E8B35BCDE683FCA0677EEA74ECCD726997FF0083FD32E9AB5EE032E6B48611F3B2EC93A7A92DF452412CCCA5F30BA6AD92470CBD8372D00EF9236555F81FE1FC94B415373744E73E405B4ECC7E6776FB7CAA138A3A2AE775BD882B2471739FCF2C0C90F243103B03838391D8ACED5CA8E97C569BF54F6D933BDEA68AFB5B1CED63A2B3D11F2E9192749DED38E768EC09DD55BC79BE3A7AB6C3F95B1E0003A6CAEAAC9236CADA5A70194D46CC138C0E703FE7DD7356AB334F5B3181A6439C606E73F0B93D4647965B51EEFE1B4F0D0E1DD2E01E217F3F2B4E401EACF444F9E918D3CD20E6EFEB000FD5591C35F03D7EBB6249F14348704C84E1DCBEEE1B60615D34FE0EF455A59CD78BA435BCA32E11D4B79F23AE5AC7E73F1B2BB8FC7DA4D981AFFAD61A79B8C5DD1C8635551347E7E73ECC6F39FD422DA2F58C12CC218A37873B61CE394E7E015D3764F127C30B407FE0629A491A7663A99D235C47FBEE0463E729AF88DAAB55DADB4178A0A76D2D4CD335907234465D93B65A00524BC6248C8C3F5FCF24EB6D2FF9FB95EC9C21D4AF77350DA5950D23396F29CFB6724249FC10D6F26DFB91D19F70C031F70E2BAC35A71761D17618AAAA097D74F134B61F3092E7B87A4E3B0CE1734F878F131AE754DCCF93701416E8DDE6544861698E3886E5A1E5BEA7636EAADE0F190DB6CE7B5DF5C6BA79A5E8B5B7E0875FB841AB60666AED0397A025CC613F4CBB24FD945EB7C326ABAB673476199CD3B870209FD7982EC074B51ABEFECA56CB5125AED3812D5073A26D44CC3EAD8601DC7451FF001CFE3AE6B0BE3B4D8A60D9A36812CAE3CFE48036C839DD4D8F41152FD8A39FEADD64A0936B71CD3A53C366B6A2904B1D86A5A1BB9CE00207BFAD4BF55F14992C0FA1BDD3CD6C9F94871303E56938C6C5A08568785AE39EABADA0AABC5D2F01D45130B6284C4D63A67F6E5706B76FA2E93E1AEA8651D9A4BC6A0753BE290BA568969D923D91F600B864EC8B268A16A8AD8BEA6D4C60FD4767C9BD0FC4AFDD55B9A6A83343CD824B4C40B33DDAEEEBA4B506B18ABE26CB0E248E41891AC7025B91BE70AC1BFF00882E1A5F6A990D4D0CCE9A5939237414EE8839C4E07E4E5C6546388760D3D6EAF1476AF3299EF68E68DE4B861C36CE49DD67EAB4DB159D77D3FE716AF2FA32472A5EA39ACF7064ACC88DCE0F6FB166776FD574D5F6869EF340C9A20DCB9BEA23AB5F8DF2AADE3069A2F6BA0790E2D05F13FDFE144FC3D7143F0350EA69DC44321E570EB8767B055535923C1D4ADDA4CCE327ED97FD88E80FA0AB20120B5DDFB8CAEA2D277665753819F5F2EF8FA289F1B3434356CF3A9D8EF31A32086ECF1F555570AB5E49473F96F386F361D9ECA94E3BD7074DA4CAB13DAFA7D326FACF87EE617380CE0A8CDA29B99D87B71DB75D11525B3C61E3043C7555EEA1D012190796DDCF60A84F0F3C9D9E973C172C6BA4B4BB6790460F2FD02E92D21E14AAE78C1A7AE8E1C8FE7665531A12ECDB74F1BAAA29833232F6C65CD1F538D97D0DD23AAE136E1554DE5C8CE4E6CB4825A3FDE1D8FC2E8B43A58D3949714790FD61E7A78E5B303E6CE27E2CF832A9A68DD3D45E41FF007002013EC3EAB9075F6919A99F8764B7B3B3D7E7EEBBC7C5F71584D474E2370C49261DD3391D971DEBCA8120F51C8E5183955F3B8A9545163C14B3E4D2EFCEEDB211A31E5D2323030E7380C8EA775F533C3F59FF00016F92AE5DBCA80904EDB86E5703F85AE14BEB2B5B216931B1C0838F95D95E357580B5D8A2B744F2C9EB4B58DE5EB83B6F857B470E771CA7D4BAC96D5817C950F867B13AED7CACBABDA72F9DCD667A61AEEABA4FC6D6AF7416C8E922389272D6168F63B15AF82DE1E369A821C8CB9AD0F73B1D5C7AEEAB5F10F7635D7931B72E8E9DA7E81CAEE6C9B62DFC9C1625EB678C1FF299E185545052C3131C03E368E7C9EA7AAB024B9D256C6EA7AA646F63C72EE01F85C757A7D4C72BCB1CEC93D0159B6D7DD5E71003CFD86492B9BF59D9D84B02D9C9616A5E05DDB4F4CEB8E9BAA90C40F3CB48E71744E1D4B433A6E36E89B4B74B16B01E4D73058F50B4603DCDF2E29A41DC9C01B94119AE753D290D7C4E2CEC483FD477485D785F5F7FFF006D0791301964EC6F96EE6EDEA182B674DA892ECC0D4E922D5A20BACB81B7AB239CDAFA47D4528DA3AC801918E1D88E5CE36DD0CB2D34152018DC463AB4ECFCFCB7A8531B5719F56E8F95B4B700FACB6E7F86D9A3F3A223D9D2B810DDBE55976AA1B1EA72EA9A2F2ED5792DE6F21AE1E4543BD9BD8731F65B71CCBB6736F0C932B2B451066DE53B23BFBA354F4CE71C39A5B9F7E8B6A2AEABA49DD47718BC99984800B7D2EF62D777CF5466F25D21001C63E30ADFDCAD13E275D8F28A8606E0BF1B774629C40EDDAE27E145A9EDE1C793F31F93852BB2E996B06CE04F7092817E192BA6148656B1B9EE53196E01841EDDCA4258C027276FECA2DA82F446434120742A29BA34611DFD852E94F1BDE5D9EAB2ABE7EA193D96545EA13FA2709D249CC76522A2A2CFDD442D5518214FED53020642BC798ED1AD4DA9A3B211536A1D54BAA1A08CA095C474498A88AD7D00ECA3E62C152AB8C81476A5AA218CB02C12B309CACBC2438D657248A70E809DF1F749F95F2909D9AB7D949F4DE9FE6EBDD47E969C970015AFA4287D2DF7C2626C70B669068904744D6B3460C1D958F4ED0D1BA46AE20E1E9C0FAA56697A3C1CFD71B718DC411F44CA371CAB235CD972398750AB47C78297666CD34C99E9998A9B53D4602AFB4C8391B15358DDB0FEDEC9516B1E4A0CC55C08C610ABB4E7077185E6C806D83F543EEF5A394EC0FD93516253F6907BA7A9F80093DF09BBE3E5EA0B56B57505AE241232927CE5FB9767EA89233652E45AA5F8016914DB85A4D9C75CE1629399C40013500A5C92BB087139EDD8296D3C3263A0C269A56D45AD048C9EEA694B1B00C938F829517A1223F050076C5B825243489DC8527A4E52F191B22B71BBC51B400D27E899C4B116887D3D80E30ECA93582C422F51194C8DFD8F390319EC7AA2B0DF837943BD4DF840E25D84912496ADA63208ECA2424C124755288C326665991F08656594B371D7D90D13EE433652646718F70804B090E3CAED87BA99BE121B92324F60A2572B7B724EE4F6C76FAA6687DC348E1C75DC95991ED68F9F65A495A59DB2A3573BA664030477CF641B4159E4897B6A463638446D55CF68DC8E53D1466170733738C7F54CA4AD764004F2043E996E1AB9171DA6E030083952BB5D6973801D1563A3A22E1969FB1562E97711CC1FB11DD472C66DE9F5ED764A881DCF44CE3DCE5BFA2DE16E4E41CE53D82C323BD4D04FC00A1788D9C7AF4C16F760EFB94D2A2E406027F77B73E304E32E23A7B28DF9800CC8403EDDD47E9326FD7C6C3D156870F8514D4356FE7C0E89C415F9CE3A21D73BAB3076DD0FA6C39F90802EE4139B554B86308349545C7AFD918A0880032A549A28BD44243CAE9DC7A9439F29C754EA495B9230E287D540304E7EC9D82E5FFC4195D53B9CEE8256DD3B764F657119F4EC81DC62EE103146C5E1B90036CFDD68FB89EA533644E76091B7C2DE7807B14C902E5FB08543E376FB05EA3A6EBE5EFF0054C05B0F3772116A6FE174FD11A444E5FB062CB4A0FE76EFEE9CDCB03D20800A1ECBE3F18C6DEE825C2E437DC92A4499472668AF809563F95A7182562D972739BBED851590171CE5D8F6CA31A78B876DBA60F5525329FEA55F449192B4F6DD6266E77F4ACD64073D0608402AE9E48CE7777F6096D607EAE29F43814649241C2DA92227D2EC1DFAA134DA8FD587B4FD9157568EA0803D93EC60CB59093A62579B1B48CB704A8C3C729E9CB8EAA4F5D581CCCB73F65192F21DF949CFBA3516666A32C7E079475AF276DD9DD1DA4A889C766E1C81BD8797980C1F61D13D8D870D0460F5C8EEA64994D66E3925742E79D89C7FC9591C21D08FBA5C2968638FCC6991AE964C7E5603B827D95636BAC7138180D68C92E1D82EE2F097A7D96CB2D7DEDE47AD8E8E1CE03F246016E7E7D92778D58F0DB91A8A2EEE39F893A1D3B451DAA87927AFE411450458772388C73BC0E9BAA1B4A59A4B7534B5B58FE6B9D7E5D93B98C3B70D1ED8CA8EF073849E5BE6BEDCB32544CF73E9C49BB830925A4E7B2535D6B374AF32B87363F237B0FB2C0D5EA5B4ECF5AFA73C1D54BFC80EFD5C6082461766A27C9763BE5595E0E381D1F3495F5192C88191E1C3DB7EEAB3E1E5F6966A92CAA1CAE90E399FD1BF45D89A8E4A6B4E9AAB95B286B1D1B809474396F459DA1C5BE5B8D2FAB75D2D260F461DBE0E1BF137E352F777B8BECF617C90D3B1E611F8507CC9CE79487E3386841ACFFB25F55D4B1B5124B44C338E72259DC6405DBFA9BCBF9BE32A5DE03A929AD74B76D4957C8C313A47D2BE56E448E2491CB9EB93ECAEEF0E5C4DAFBAB6BF535DE7919474CD93C8A78896C63AF2BC8CE3D9758B854781C94B273238B6FBE0CAB2D779A1B44F2D3CD5B33DAE7B22E5737CAC8273B6DB7BAEBCBB6A8A597515B6CB1D207C56E647E6C6C1E8320C6FB6D9077501E005D992CF7DD5970E69A38C4ADA1989DD9D434027ECA69E04B4E13FBCF51D487498F3268DCFEA5BB90327E147276A8BD852841B66FF00B4CBC8AFAAB5D9E38DA2AE77B0365CE791991E8C7D364B71BF88234DDAE8B4B59A38E3ADAA8D82AE4DB9DA1C3D4F046F9FAA89787BB9FEF6BADE755D581351D0F9AD82398FFB27B73BB33DFDB0A03C23B73AE972ABBD5539D2F9F339B4A24C9730736006E7A0FA2094DC15136834CB34DBF85C9DD3E0B2A3F0B41240F633CB818659A71F9E49319739C7F55C3555C1F83596B6A96C3188E8A37E669DBBB65E43EA693D3B6174BF89FE249D33608A8E90B45C6E7E98C919C99362D23AF428470A2CF168CD2735C2AB6AFAF05E49FCEC96507768EB8C9EC9E12697253CD053CAD445B8AB7BB5CD5F43A6287D14944F61A834FF0094161196C98EEEF944FF00697B228F4FC1045349130B5B1C310D848DC60023E5407C12F0CA5A8AB75C6A8B5D254BCCF23C0FE4EA39FE708278A0D4326A9D594965A6773D251BDAE7399F9039A465AEC7F9A3C6ED583931EC6A0C67E013C240A183FD22BA867971C6E7430B9ADC0DB3CC723AF75CB1C60E211A9BDD656C4F73A333111BBB000FE51F1B2EC1F1ADC567B8C3A76DD298E1A689A2B043B13CA064647BAE37D496F8DF108E168688F3903F3647771EE4ACBD4E54DED3BEFA7FC7E4C4BF509745C7A4A7173A60F7B80923C63FE4A19C60E00D73396AE8E9269198E67989A4E31FCDB2927826D12FB8D6BE02FC363DF973B3B1EE17D48B469CA5B3D14B5357286C0C612F0EC169006E307DFA28347A6F735F06FF009AF3B058B6BFB8F965C1BE2F9A889B4955298CC5E93918F8C3B38394278C7C3B0C7FE269C65877716FBFBAB8F546BAE1FEA1AD99C1B359EA63710C981E5A7A8703F98B40EE47C2935AEC54C2334E2A60AA84ECC7371923B2AFAAC1E9375D1BBF4FF935AEC1B1FDCBA286E0F7160B39609492DE993D95FF0043109079AD90EDBB4377CAE66E3170AE5B6CC6A2204D3B9D9C8FE5EF82ACBE09EB913C5C80E08E8DCFABEBF459F923C59D960CEA4FD19BA65E9A6BC49D251BC52DCA943E093D25DC809F6F57B29FDFB51DB68ADD57596C9F104EC20D3B1D9635C4761D8FC2A0F59E908EAE1734BBF8B83838DCFDD51DA23564D433BA8E704C45F82C77E423FC582AE62D6B8C369CC6B3E9CC59B51BF77CF3F8663893AD64929E28DE4F3090C83E85456924355186E770E0A7BC53D281E3CD8865BD463B7C7D140B445B1FE7B5A3BB8647DD67FA9BA6756F47E862518AE123E817842B1C6C6431B1803B00B8E3AAAA7C58EA07DC354D3D17E68A9B071D402BA2FC345ABCA8DD2387E4889C8FF8573470EE3FDE3A9EBA77349025318277230E5D4E18ED823C1BCD657935727FFC4EF5D114E286CE64200E48DC7FA6CB932CF71F363ABAA763CC9A53C84F5C65748F894D41F80B149CA7AC6D663EA1720E93B8B45143E664E4E763EFEEAB6B655C147C463DF3965349ACEE7BB25B9C9575F08F44321C48E665C7A1F650EB34F09C61ED1DF07AA9A526AA3180304B474C7458BA7DB7C9D0EA77CA3C166EA1B17E2617379795C07A5C00CAAEF4157CD4F33E0A879F2CE435D8C11EC9DC3C676C40731CFF00BA83DE38E14F9F31B0B4BFE46CB49E6840CB8E1C9254C4F897AA1D49CD4B738057DA2A763CCDCBA3E6EE0F5185CC1C49F0ADF84736E1A7EA49849F3238F9B0E84F5E5DB7DBA2BCB5371D4D5C6619A1608CEC361903DC2ACA0BE3E949F224E68CF56139002A79B5DF82DE2F1D6B909E87E29457C89B6DBD34417384620AA70E52F236193DD6935AE5A49BF0D5632EE914A3F2BC76C9FA20D79D330DD23F3633E555C5EA6386C76EDB22FA335B7E36236FB80E5A98BD314C763B74395A5A3F216A999FA9F1DB1DA0D56581A41774C0D88F74069DCF6B5CE2F3B74089C57396277E1A6036D9AEECF1DB09CDDECA447E60201C7E4EEBA9C79135C190A1B183A96A799A49436E5102C3D13BD3AC7BDA4B8728F9539D23A11954E31F4F72547B6CBF8E527D147C96E767621655A5A9B85DE4CCF8F9C1E53D42CA876A2D7FA9F93E50DB24DC2B02CF26C15736E3EAC2B06C241C2B879A59219DBB28E5EB60A4D2E08EA80DD29F3948442AB8943BCA2A495145929A4944A3A1EC6223C04943013909DD4463DD6D4B16083EC90E8B9F825E162BEF51B8D3C25C077CA0BC5FF0C95B67FF00DE59C9F55D55E05FC5F5BECFCD4F55E80E1B483DD427F683F8898AEF331B01063ECE6F523E53B278D1C756B87D600DF7570E94A7DBECAAFD314BEAE9ECAD9D29160A8DB2E624AC7D747F2851986F7EBE5CA955F21D9555575AE64C360467BA6B2D6EAEC9D5C6DC2461FA2A8AEF672C90FB2BC2D11F3C63E4286EAED35924EF91EC959164C69F2889D9A2F62A4F1BF0324E09D8151AA067238076DDB254FEED6DA38E998E8EA4BEA1DF9A3FE56FDD3DB2BA490DAE56831B1B23A5C971FCA02097793D27A7D709C19CE065DCC3B03D904BC579C63AA5C8536A886D6FE62B3033E166A5DBE52B472E7AE004E517562AC66C56F6B8CF30FAAD6679ED8C7BA4682A4878C221BE4B9EC4CF40F7C25DF93B11BA17A6EE479467A8092BD5E9CD391B0F74B82E4692B61A8E99CC38933BF44F60A6775032DF95153AA7CC1EA774D81EEA5B62AC6BD81AE38CF4282CB31517D021F4EC73F2F05BEC4744E2360CE01C8ECA4335901D86E077F751FAC8C0CE00686F5C77424AF1B8F21AB16A2F2DE1846C76CA9939C09F4B8648C8CAA82790FE6E73B6E02B02DAE0F81A71BED939DF08878C98EFF15877A9C33EDD947EFDCBCDEC4F5C2B46FB7AB4BEDAD646CE5AC6F57F72A9AAE073CE493B6C99936EA01D7D4379B193B21DE5E5C09C387B0EAB356FC9273F658B54397038C7D375131D34C3419E9FCB81DB2998A7236466BA4CB4027299D2961387B88C20765C82892ED191B9BF955AB6660FE71D42AD745B72F6861C8255E35FA5CC71364DCECA36CD8D3618C8CD843038646D90BA0F4FB29D910218DE9B95CB11D73F3B6C0294D8389F2460C4F05C0A094A8E83160C511FF182F0C3211100DDBAAA327A191EFEB952CD7B5CE2E2EC9DFA041AD5740DEC09C289E41A7A74DFB460E99CCF490A3F7598F9831D3BA95D7D4EFCDCA1D9419B4A1CF3FF00784CB2832D16E1A9A3F5070E9DD18A4A40EDF7487938C81BA7B15439AD00046A68AB3D0CA22D345CAD1823E7284543B208DBEA95A8A839C386728654D41E80613EE40A8CA3C032E2797F9B28583CDD913ACA4CEDDD1ED1FA1A6AA26389A5CFF6010BA248B9223F454C3D92F57690517D41A5E5A37164EDE470DB07BA106E436C6E7FA2AF7C9A117168151DB37D8E12AEB59D8E33EFF44A3285FCD91D3AA752D7636CE08FEA895832DABB194B4206EDFD0A1B5B67320396E0F621127D49775528D3F6ACE0E4FD14C9B32E71C722111E92C341C1FAA3741690D2D18FBA9FC967059CAE3FD1318ED6DC82D3968F7526E68ABE8E3B065659399A48D800A21536971CF2BB6562CD21DC63D2507A5D39E6CCC85AE6465C7F338E1BF72A45320C9A785F05655565C6491BA175713B180A79AE6D7F8699D0F98D9397AB9A72146C51F3F5DBBEC8D65F831F3699FC01AD35CE6B831DD1482E9499196F64C26B582E1CBBE3BA9AD8E99862E4232E3DD4F17650C98DA21D45012D20A796FA639CB8E397A29256E9FE4C1C7549D1509E60C2075CE7E3D949C95DC6D50FADD689267C510C1F3246B761D89190BBBAF9C356D4B2DB6F0E7414B491B259636921B2BC0CE1D8EB9F95CAFC23B1092E30803F2169FD1778560DBA01E9033DFA2CBD666E291D8F87F1919352644F5FCE0B5AC60FE1B1A1A1BD9A00C61732EBEAA6B1EE6E771B8C2BD359D77287379F6DF65CD7A9EA3CD9B033BBB03DCFD572BA9C9BBDBF27BEF87C1E963BFC0DAC76F92A2A29E2032E9646818EA370AFDF1EDAAA5A5B65B34F533839D5A638EA00DDCDCE327DFBA1BE17B43367B9FE24B5BE5D130C8F39DB2D19C2A575278AFB749AD5D73B9C32BE828DE626C518E7C39871CC07D42DCF1B89A8F27897D6BE43D4D4EDF845C9C68E12D7328EC7A56862FC40903249E4637D2D690091211DC7CA93F8BBBBBAC964A0D356C7B05656724551101EA91A701C00FD5413893FB5A4F992C761B4C41B20E56D55465B3818C0E51F1D7051CF0AFC396D6BAA7565F6B3F7857D3B1CF8295C72DA776096B80F76AD84ABB3CD94A4DA8A227E20EDB15B2D567D3746F7364A831C9594D821DCCEC7303DF192558BE273537EE0D2F4564A4FE156D7863585BB121E065A71F555CF871A19F526A8A8BAD63CCACA695C41236644C3B371D360896BAAF1A9F5B3202E2EB75ABD6D906ED6BA3DF04FD944BBBF83433A4928FCFC80F8C548DB469FB558E26C90575716CB545B91E603BB8BB1D41F95787854D0F0BDCD90968A6A08BCC7E4603A46B738F9DC2E5AE2AF10AAAEBA9667B0F9F052114F4C4818686E06CBA2FC406B53A6F4AB606002AEE986B1ECFCCC2FDBB7D5556DCA7C746ACA51D369AE1DC886E95A876B2D632D4CBFFEAAB538E6377E58DD19FCEDEDD93CE39EB86EA5BF0A363716EB58E5043BF8731674040DBB2DB454A74A68F7CE794DDAE831CAFD8C824EFEE4EE92F0CBC26E76C14F822A6A9C2A2A88DF9413CC413D94D9A554915B45A75CE59748BF7FD2A874EE9EABB8B9A2399F1B99033B3B6C00DFAFC2A1BC255B5B6CB5DCF5556B0B65AE3218838FA9AE76705A0EFDFB24BC5F6A837ABC5BF4BDBDC5D4D0BE3F3CB770C7348C8763B1C775A78B5BEB04941A7E9898E2A1630D498B763CB40CF3636CA0CB9162C7C87A1D33D6EA924BE4ABDDE63A29ABA47033D6BDCE248CBFCB24E37EBD156D5546D1210D6901DF98FBAB3E3AD12E18DF5720E569EDCA3A65426FD91200319CFDBECB8A9E7729D9F50697C663C5A451AF81E702EF3259EFB4D33096C333DA1C3B10485DB3FB4438A127EEAA6B5D2379AAAE9CA226E7A877BAE5DD1DC2A96BAAADCD00E4CAD3B7B020A5BC476A898EB4B6D217973693CA68037C608CFD175FE3E7713E78FAB3143167DA80160FD9537E7528A991EC8E52DE7FC31DC9DB3B1CED9436E3A5AAA869FCA313E0ABA2761ECC9C380FE65D6DE2EBC595CA9EBA96D9687B43CC0C333C9F503CA36C2E56D07C45A99EE7511DE1DCD25435CCF5EC013B023DD47AD69F068FD271C98BDF5C16AF0C752437AA230CE039D8E57EDD0E3195406B4D115561ACE78DFF00C273F677FBB9E89FD1DCE6D3F74C7A85348FC8246C5A4F65D0BC48A2A6B8D1B5DCA2512372C70DF94E3BFB6163B55D9E9C9FAB3FDD0D784FAEA2AF8BD3233CC681CC0819FF00B2A0BE20F870656FE2E9C11233F381EC151D495D3DAAAB998E2035DD07F3007BAEA4D35ACD970804AD2398B7F8B1F63B6EAAED5766AC24E4E9F6539C3ABC7E2A2740E761ED18E53DD3ED2DA73CAAE89A460B9DBFEAA39C46B47E0AA9B554E486737AC0EDBEEAC7A01F8B14F5511C118E6C75ED9513854934684B57FE94B1CBBA3BB784F07974154E3FCB0B80FF00CA573FF847B00FC74F263264AC7EFF001CC55DBC3DBB1759AA9D8DDB091F5F49559F83D97F884E377553BEDBAEBB1BF6C4F9EB5B1BCB965FBFFE0957ED15D4BE4DBA1881DDEF68C7C2E568AEC5B044D0760D6EDF65777ED30AAE67D2459C65C0FE8B9165D4A410C27F280B37C8F32E083C3E45087B8B6A86FD9F838D8FCA791EB9AA8F6E7CB7D95514FA8CF63F644E0BF736C573CD34CEC71CE12E09A5CF5E48E1EAC0F9C20353AACE3AE547EAEE27A75084CB56738C61474DBE491ED8F4498EA079F729E52D693B8FB8515FC4169FB2294B5048F6514A3CB258CAFA26964ADF21E2569C67B27FAF2DAD9B92AA1F4CA30490A376D981D8EF8EC8B52DC080587F29FE8A2C7936325C98B7A08DBB59199AD130CCACC061F721592D63668439CE024C6ED542DC99E5BBD24F5D8FB290E84D5D20979646878F7CAEDBC6EA77F0CE3B59A6D858B2C333DA1AC686B47F32676ED69F819779B2EFF084FB52DF5E58393118C7654DDC2E5891CE3973B3B13D97432664C64E24DB50F18A69267B811827D97957A2A81DF2B0A2A449EACCE13A0B638BBA29CD969F9537B651677C29051DA49DCABF47006646929ACD1290C5403D9275B681EC70950E88CB62099D550E7384F2E70F264843A3B8E7A940C9288FD5D3609D934319522AE1CC3741660D084618BE32360707FAA786673DA39B723A653696B37ECB474E309828B253A71FCA327DD58760AEDF3EEAA4A0ABDC6EA6969BD0DBDD0B45BC53A658174A8CB554FAB1BFC4047BA9B4D782460F455EEA298977DD05162732C2D1376D9AD27D94AAFF00480B723FA2A734CDDCB48CB86C429FCBA9C16F5EA9D20D4D3442EF96EC3CBB6FA14DA26171C3180FBE01CA2D75BD35AE6BC81206904B4774EEA389E3CC12D242C88F2E1E1ED042348AB27C82398F539046D82805E25462BAF0642E7BB1CCE3938E9F651ABA54652219480F2BD66120F5FE8B5077446CB54C638978C83D122B59AF91CC320E00DB099C7260FD114AA68738968C0F6431CCC652112BB36A0E566566B6E6651CDD876516A793B0EFDD48F4BD8A69DDE5C6C73DDD834672916232DDC0D985C37EDECA6DA6AF8486B075C8FD16C782D5ED1CD2D3CAC07B969000522D39C346D3E1EF249FEC80B90C724C9352D78DC1F6406EB6B20920A91CB6B66C47448D7DAF3F94A45C9295105AF876C8533D20E3E4E5DD07F65EA4D105E3973B75F952CB3E972C85ECC76D921460C8CDEEBA12E6F96DC6DB9F950EAEB8BDBCC06E09DFE023B77B7966C7AA8D57D19DF7D8A7239B688B5D2AF7456D137284D2AEDE1A3208CFCA7B6A7978C3C6FD884CD10A930E360E7192E4D6A200D391B82A69A7B4F17479E5CA46A74D750061C33D7A21A45B8B905387748E716F2F52575E50D9A57D180E8C9C37AE1729F0E24F2646BA5E81C320770BE835AB8A14325B0319CAD788F1838E6E896C4CD0D3E69C4E37BD5318A4703B0CAD69AB587036CFBA29AF61E732480F73B2AF2D952F320C11D50B844BEF5791744A757D21E4073B6143AC472F391D14CB56DC81635BB67A14274CD0B06491F741E9C5917EBB28CAADC0BB03B26F6684F984108D8A001E5E3F37F4C25ACF1734876DD03C312DE1F2193E4405B37E9BADEB6CA40070A614F66077237FE888D55A096EE3609BD145F7E51D728A9AE36E38CFB28ECE3D4AD0BD5A70091B8EE157FA874DD442DF35F139B13FF2BFB21782F9441FC5217CA05BA304139DFD94B7879C4C92DD3092303755A9B91271D7E8B586EE438371D7DD44F0B2E63F2985F6583C49D5AFB8CFE6CBBE77C051D82D4D04761EC9F5BE9406979FCDD8761F642EE55F870CF541E9C8D08EBF033796E1BE1A3E10AA8A025D9598EB795D8246E9665D8027988F843B66473CDA797C9B52D064EEA6D651C98014469EB8388E5201F652CA2CFA71D54B18CCA8DE9DF5224D05A9D303821A40CA8F1FCC7B069C11EE510A990E7197038EA364329E73CFCA704633F752ED915651C49DA90466A7696E4E7E30A29A929B2D1D36E87BAB1AD9600E6F7DFA851CD61A71C061AD381D54CA2FF054CB960BE4A92ED1736E460E7B7529A3A9C86EDD51AAE606921C08C2675D2B1CC279B2E036036514B1C8A5EB42F966F61A1E6537B55183CA00DC7750CB04E7B74563D818EE5CE37C6DF1F552C21222965C4FE452BE0C8C9C7A5457CA2D9339476E6D3839C8F9514ABB972BC35DBF6089A9205C70CFE4BBFC3FBF356D3DF2375D67A92E41A3738D9726F01A273EA630DE9904FD17466B9BD805C36200E8B07592A47A67D3DA68CD2A2ADD75A8BAE0FBAAEACF0191CF91C061A0FA875DFA25B5CDD327391B9FCA138D036D334D4D4AC079A791B91F19DD73B8FDF90F4ED7E45A4D2B7D705D357718AC1A52AAA5EE10D5D707369F9BAC85DB068FAAA5BC357ECF1A7B950BEF5A92B1F434D2973C35AE0C70C9CF33B20EC7E0153EF1961D5B75B269A6B439AC313FAF42304EFD937F151A8EAAE375B5E97A6E66B295B136710BB0C781805AF0DEBB7BAEDB07B2347CB7E45CB539E5924F81DF113C1B687B65AEA2EF056D5CE2363840F2ECC324B8F4F2EC33BA88F0CEFAEB2E8DADA9AA8E412DCDEE65291FE171C33FA614C3C6BC2C8FF71E97A463453CAE8BF10C66E5AEDB989C74437C405A454DCACDA6E964F329E95B17998DC31DB6C40EEA49C8A5A7C36C9A786CB70D3DA42B6EF50DC4B2B1E0E7673B9C1C7F7557F04AE8EB2699BADF646733EEB24820E6FCED1213D33BF7564F8C56C9552D9F4A5BDFC92E62FC4C7D03E318C9C7D167C55F860BFD6B2DB6AB4DB1D1DBE8E36196A1D286C6F90019F413D33DF09945D050C8965F71CEFE13B869255DC29E40E90F99279F2B3B729397655A3E202B9BA8358505A6078750D196093B88DEDC64BBDBA2BBB849C37FF442D15770B9CB4DF8B8E27089AD958E3B83E9E50739548F84CAAFC3525FB56D444C70A932B626BF01C1CECE3933BF7EC83143BB2DEAF2C72C9423D0EFC505ED975BD535B99CAFA4B3B1ADE78FA39ED18C6DB67215E76EBC41A634FD55DAA086CF52C2C839BF337230C0A86F08BC25AAAE99D5060788AAE733CAF793E967367A9ED84AF8CABF49A8EFD43A6AD9FC48294B1B54C69CB406903271D50EDDD21B51351C6B1C5FF534F0716D34B4976D595F1FF1A512796D7F57F36795CCCFF92A01FA9E4749515F23DFCF5B338B43CE70C24EDEF85D45E329EDA682D3A669F20C42332F93DC0C7307F2FF009A5B4FF81FA0BDC1E653CD2D15442C0CE698910E40FCC01DBAAADA9839AA3A3F07AAC5A2ACF93A283D1AEF56C763D71F956F53A7C4F56D8DBD320923DBBA29C4AF0FDA8B4E3DCE96315D423FFADC032C2DFA0F61DD4B781B6C656466585A5EF790DDF62D27B6173BFA3719727B3FFEA9C39F4CE507F0747F87DD3B153C33DC262191D2C2EF2DC7A07069EEB983C26E977EA3D5D5B79A86F35352CB2733CF4E5693839FB2B9BC6FEB0FDC9A6E0B5C2EE49EE1864A01CBC17EDB6371D52DC1AB245A4B464B54F61355571904670E77983638EBDD757820B1633E77F23965AED537F97C1C3DE28B5C3BFD28AEA881E79639036220EDCADE8149EDB54DBEC6D747CB15C6000B7B7998FEE866ACE1F452D18949C554EF32B8B86F87124054C505D67A0A80F8DCE6C91B8608DB38FF00259F95ACBC2ECEFB478F278FC6B727B4E9FB95F9971A5343726886B29C72C72B872F4181B9EA98F87CE258A59DF6DAD77F09E4B5927303B9D811F5533E1FF1DB4DDF990D2DFEDF3432B0069ADA6CE5DFF1060CAB0F88BE02EC7536F92E1A66A2A7CD81BE67F1CBDDCFCBBE1A1C0107EC81695B893E4F38B1E58D292FEDC150716787DFC47B018C737A98E7F5703D305557A23574F6AA83907933870EC47BAB32D31CD5F6F3CC1C2AE8F2D7B5C72FF4EC4E3A81B28D1823AE84B1C409A3C8E98391EEB167719ED67A969E0B538E338BE6AC9E6B0A08ABA9BCEA7707091BEB67F84E10CF0D955FC57D1BCFADA4E1A7EAAB6D317F96DF3797267CB71C1F6FB29A68BBC0A6BCC328E93E3A74DF0A483529A443AB92D8DBE1A47D0BD15445968AE6637F2DDFD8AA93C23D772CAC6FFF00BD1FFF00195D9C3F70968AB9BFFDC3891FFCA57377864B9F25563B36B5C3FF00C25D037D24786677BE7950E7F69AD41159438EE5710DFABF964272BB97F693D3174B4327F85703EA789AE91FFE201479E3BA48C7D3371C63FA0D43F2A636AB8038DD527495E5AE393F4539D377D69C67AAA3974DF26AE9F52DC8B4617657A5B7E4A6764AE6BBA295414D9C6173F9AE2CEA317BC194F69C8CA7915BC847E1A7DB60B634E5519E466AC30D0C2DEC20A28015AC34DD729C88881B2A8E45A58D832F3092CE898DB617B5CD7337C119520349CC0E728137D2E2DCE0656DF8FD4EC9518DE474F71B45815D5C648C176C76E8A217CA5C764734B87B8B9AF20C6DE9EFFAA0F7A3CF2100E0745E858A7BA36718A0EC8D3A982F23CCB21F70BC8C976BFC1C916491A51F8E7C2AF6D9703DB6FA29143761EEAF59E704A637EE94AFAC18C7751B3763B6E93ABB8E475FBA7B10C352D47A4A83C35BBA906A3A8C37AE542FF11BFB28EC2E497B65CB501B8754B53DC86133AE973BA17C881D2396BCCBD9598D3210E59291844A8AE45A7AA16E2912526EC7522751DF723AA0771ACC9DCA0CCAAC2D99267E53512B9D8A475982709F50DD243B67F54C39709F5AA9F2EFAA5D0F16C74039DD320FF74ACF4C76CECA6968B30C024657AF56D6E3A224C936B2BE9DE59DF210CA99F29EDCE1C38A1522620999C744E20C6774D0A75487E89110480277036C26720072881FCB92EC76C04C2AD83B1C2489935437A7E5041276EFF2AFCF0C7C4FA5B6D7B26A801EC046C4670A828F194F62E5EC4FD927C0787876CFA97C60F14F6FADA1F2E9A18F2E1D5AD19195CC94A3CCEA339DFE8AACD08F7361D8EDECE560592E0ED86707DFE101B916A415AFB535A061338E99A0EC7FE888D43091B0252F66B1979DC75EA913BFC04F48DA0B8E40C8538BC5035B09C0C397ADB6A113406023DF0B7D4556434737E89ACBB182AB29AD5D400E4F7C6CABAAB8CF2E0F556BEA19812491F40AABBB1CBDDDBD87B25666654AC8BDD22C0F5239A3ED448249CFB7D104BAE40CB8E51ED115A0919E9DD3030512D7D3B55CAD0323097B986E79933B5C2D27D3B8FEC89DCE8401E939CF64CD33531A80C28E0683CFD7E14DAD1772D00E4807B7650683A63041F84669EACE1A00281B64F0F4E2C90EA1BA3790823A8508B7C5BE47CEEA755B43E640463D5EFDD43E9E20C786F41DD576A6CBB1962F912958F7BB0EE9EEA42E2D64381D71D533BA3C37D20F5487E14F96E27381DD07B916A11C2CDADD3E41DF74EEDCE703CC835A68B71839CA90C74E3219BA06E6FA34B162D3B5C87696F47A1FB25E4D40EF7DBD932A4B491B252A2DAEC7443BA68B5FA6D2C8197CBD1E423A77CA866A5D79575108A795F9859F95B8DD1FADA276E0E5432E430EC75C23596650CDA0D2F64729691DCD80C07D9D9FE8891D3C010E7633DB09C44D6939E9F09ECF52D2064631DD17A92FC14A3A0C1F0C45B91EE99D4D8DD29CF444A3AB6F639FAA7F4F599E98CA3595FE069E861F0C8F3B4B8FBFBA6EFD2C01E63EAF6014E3CB73B7185ACAC18031845EAD7C14A5E3AFA9101A4B511267042B16C30E30EF6EC864F43970C7FEA8B51C6F1DB1ECA78E5AF82A3F1ED2FB83173959CBF247550DB7C83CC3BF7EBFE48F5761ECC64872136AD3E41C9F7CFDD4AB25FC1425A79297DC5C7A2699A5BD32709C6A5B3F3B1DB21BA3ABCB3608F5C2A0923D8F656A2CA19A2EFB39EB54E849399DC8D2E410F0EA4319CB704ED90BA623B039FBB425E2D2AE6EDC8D20FBA371B2ABBF9205E1ABC3745709DB0CF2F94DEE5DB6549F8ADC3486D156EA585E65076C8DD1B6524D03C3A37161EC5BB11FA26D75B7C8F904B2B8BCF773B728944AD3BF82A2B8DA89240EC54622D0CE7C9CCEE80E57473B4446F6991BDD44AFF660CC81907094A2AB91B1B94A556493C34D83FD61CEECD08A718AF46291E01C672A65E1CB4F361A596677539C12AB2E36C9CEF76D9C6570BE4E4A32A3E83FA430B515653125719A66B37273D5757F854D2B0BAAE4AD99988696271E6FF0B80EAB9F3871A2C4EF2FF5039C003AE4FB2E86E31EAF8B49E979984B4D5DC5A58D61DA401E31CC3E8AB68306E96E27FADFC9AC783D25DD10DF0C9A4E6BDEA6BCDD2461A9653798CA024F570C86807F456A708B812CD3B2DC351EA29E18EB647C9253C3248090CDF95ADC9DCF6C2E05E03F8F3BBE9FB7CD6FA18298BAA1CE7FE26504CED2FCFE4C7B676CF74E34B70C7576B3AC8FF1AEAF9A073FFDB4FCEDA76349DF97200D8745D838C523E78F5B234740F87FBB3AF77DBAEA89E3E7A3A46C9E5B1C7219CB9E57341F7F853FF04BA61B70BADC6F32004CAE91D035DB96F267976EDD1427C475452698B445A6EDB293593006AE48B7776C87E3B289785FF1611D864647594EFF002B1CAE9183739D893F55432E58EE3ADD2F8ECD3C2E704513E2478C3731A9AAEB4540A6AAA598B217E4878603B6060E7F443AFBE39355D537924BDD4483180C612DF8E818DC95F4135FF882E1D5538D5D55961AD99C32E718F9A53DF7190A136DF14BC3885C1D0E95735C3A1640323FFC356BD7C75DA30E5E3359BADE397FDBFF00D3903827C06BFEA7AE8D8FFC6BA273C3A59A77C822E4CE5C40760745D73C7EB553D4CF6CD21691E9A62CFC6C90BB21CE18E6F300DB3F54E38A7FB48A9FF08EA4D3F6D9A91B234B0C924618630762632DCEE3B6E88781ED73A568C49513563A0BA4E4BAAA7B89C173CF5E427B03D145EBC1BA4CB8BC6668437B8BFF0077FF006279E2C78D63465860B751806AAA23F2DB20187372DC1E9BAE4DF047E2EACB64A9967BC52BCD55439C4DC1999256171DFD3B9C6EBA17C44F822A8D5554EB8DB2F9055380FE142F901859F41BAE2EE2BF826D4B6A98C7536C7568233E75137CC601DCE437AE3E14D1AECC59A96E69F7FF003FB9DDCDE0ED86FF005C2F96DD50C8E494F37E1EA5F1838CE4B487BC3867FDD6951EF1FDE2063B65B29EC76D9E296AA7E56CB253387334F4C87337CE57CBAB8DA4D3C9CAD13534CC387472F3472877C740AFCF0A3C1896E777A4F3CBA43E635C4B9C5F86839DC9CEE9DC576146529476B7C7E0ED3D1B7EB8D8B46C9557AAD7D6FE2630CA6A691BCCE84386C46772774E3C10D8607442A678CB0303E7767D2D1D5C33D828DF8C9D475172BC5058AD51F98688304D13BFD91E5C6EEEDD94EFC456AA934D69795B3B61656D630445B06DC99181CBF4CAAD38A93548D4867783138DF651B3C875A6B220F37E0E864E50DEAD2587A8EDD959FE316FECADB950D92094C71D1B5BE7003D25AD1D08E9D906FD9DDA745AECD5D7BAC3CBCCC796BDFF0098B9C090550176E24C825AAB94AF123EA65735A491CE22C9C72AAFAB9D436AECDEFA6F4B1CDA9539F487BC6BFF0068D6C670C60E4046D9E55485FA10E079DA1CE3DC765D116C8E3BAD28F2F94CCC048191CDFF00CDF2A93AEB29150E85F963C1C1C8EAB9AC729C1DB3DE3538B065C349AE839E1BA96B29EE303E089AF6BDE016BD81ED209F62085F43FC4B788B6E9FA6B7C4CF261A8AA7304B1B1AD0DE57E39B61F05549E12EC70C714B5B334323A2617974830D7168CE32571B6BDE2D4DA8753B657C6EA88BF11E5C34E325AD6B5D8CB47CE174DA452AB678279CCA9667087C1D11C6DB78B25DA9AF14F936EBA319E7BBFF000CB9E3D4076EA54778B5C2E7C41B71A03CF04C0485ACDC341DC8D975C789CD376D9EC1496AA9E58AA9D1B4D1D36DCED7E36DBAF55C51C2BE2BD4592A1F67BBB5DE5E797120DB90EC1CD27B6154D5E04F94753F4E79BC98528E47C107B9578A98C876CE6A1115EDF1D5521CFE473707EEAD6E3EF0B5B062E144E1252CC39B11EE1B9DFD585CF0FBBF3BDA5C7D4D70C7C6EB2F162DAED9DAF91D6C678F7AF93EB87878BDF9B4556FCE734CECFF00E52B947815AB796B6666718AF77FF8C55DBE10AF7E65A2ACFE577E1DC3E4FA4EEB88B86F7F732E5503988E5AD39FFCE56E423C23CA722ACB37F93B7BC7FD20753D04A4E73C9B7D70B80B8CFA64D3D43246FE491ADFECBB63C7E5D88B150CC3AB44679BBF65C99AC6E8CAFA38482399AC6EFDF609648B72DC8A38F6C538B2909E3EA7AA7D61B9869C1F7494D438C819E6CEFF004491A0C74C83F293E63C95A1719F05C7A62E20E31F0ACDB34F80095CE562BCBA3201247F9AB734E6AC0E00176573FA9C3C9D4E8F3F345A114E30B26A1028AEA31B2C1AF2B06789D9D3C72F1D87E39BAA794A410A3305C7DCA296FB882AABC6D16E19107628C0519BED1E1D90A4F0BC63FCD0BBBC1B67AA589D4D31B3A4E0D31AD9E72CC8CFE64B4D4046FF0075BDBE83999CDD8753EC510830EC00493DFE9F0BD2B45977412385CD1D93073318EEB2A5747691CA3D39FAAC2D4A0793E63DB2E45BB152282BDB8FAFCA82F32CF987DCAB3679693F7D50DB7FEAB2EA8071BFF55011507DCFEA9D503F99C064FEA8AC4482EAEE6180A3AFA5214E6D56605AB6ABB184D415903101597742A442D6015936D052A11100B6605267D987C2DA2B20C20092238E4892A506C27B6135974E1CF54216CB01088A396CB5E53BA2D3A477522A3B7809EC92388035167095B6D18040F652BFC137085C96F0D3B2664BB36929B4D50E501277AA8F49D94561BD061C2CD45FB986027436E2337B9727A7740642A4B5B45CDBF743A6B49EE9C827CB05347C2DE33F54EFF773938A7A121223A314750C0E05C0903B256F3231EE0E60207B25696DCECF452BD3DA48C8E0480989F1E2DC462C7A79D29FCA71F4533B6E85E53BB71F556A697D1A001B0E9EC8BD659D8DEB8437669C74D45734F6FE46F2839DFB295D9DC300938C2D257C63618CADA9C13D0244F1FD83D45791900156169EE5001C8CF655CD0DBB948C8EAA6564ADC39ADC245D8AE392D5B50C8C3B1B8EA83EA4A56B7A9C8EC9CD05760040F58DE4009516377B4866A0A66E49215577CB4873C9E8AC0379E724109C52DB9926411D3E12A33A4B71475F2CA4B36DFEC93D3B4AF8C63976CE5740BB49C6E611CA3F4423FD0168DC04E02C5223FA62A9C0803A1EAA7CDB682D25BB90A35369C7B1D966C9F596BA46919D87B25B8923193E0DE8A8C79D8703BA46E16E746F3871C1390A4EF803C8777F85EB8D1646E36C754DBD127A3362149CFF008773C3FA28AD3CBEBCB8E73BA93E9ECB43998CB4F642B5551069CB1BCA9F7C49969B208C2D64B2E4EDCAAC88ECC5D07231990475C2A8B4E3899373DD74AE8FB84629C34E33851B9C4B18F4F94A821D2422765C7041E88D8A5248F4EC3BA91DFE68F9F18CA8FD7DD9B9E9D147EAC5173F499FE0915898D27184F6EB4AD6F6406C1A8C6D81D138ACD40D24E4144B2C06FD26A57C91BBF3400EC752AA2D470F21249EAAEFBBD54262DC60954F6B2A66B9E394EDF29F7C0A99B4FA9443E47B811839EF95BDE6E8E0C1CA3253C95800E50420B536A713B1E88D4A0662C3AA4FB60DA4BC4B9F56CA4F4372711EDF2A3CEB2BF20A3D6B80B7AA7DD889561D6BF92C9D2F034B77729551D818E0ABDB3D739AE18536A2BF068C919296FC44AB4FADFDC7151A7830120670B14D69F3305C71EC984B78E627723E13A82EE1B838E8929E3255A7D4BEC75FB91A3F30FA14BD058DA4E5DD3B25E0BC35C325A9EC97E8DAD1B7752A9C3E0AD93499FE4756FA46B4EC53930F31383D10517F19E6012316A3F5E7A292334527A79A7C963E9DDB00952E9E81A59F2A29A62EAD7007652F6347293956239132B64C72B22B5B48CC1E67E30A3DF8A0E3C9CDCD9E88D5DAA00E618CA87084F981C36C1CA2DC8ACF1C8206B9F0E5A79B0815CDED91E3776E47744F546A319047B60A8D514CD925606F52F1FDD41965EDB24D3C1AC88E98B74629ED8C0DEAE6E7FA2E5DD6BAABCC9F901FE6C15D1BC52AD305BE36B7FF008633F70B8EA285F24E1C77E5767EA32BCE75D273C87D47F4B69D2D3EF7F83A9B81FA173340720373CEEF8037509E2F703EE9AEAFEF8A32296D56E023359282237E3AB5BDB9B6232AF0E0DEBAA082944D50F6B046DF5071009C0EC3BAE78F10BE34AAEB049416768A2A325CD7C91001D3E763D3A1F95ADA3CB1C78EFE4F34FA8BC7EA7C86ADC5274BE7E0B4E8B40682D160F9DC972B831BEA866C4DCCF1FF00C32416B77E8ABCE227ED24B854C4EA5B0D036DD0105B8735B900ED96F28183F4C2A034570B4D4B9BE773F31DCF99991CEF73CE727ECBB23C3FF83964EF6C9230B206EE5EE1F980ED83DBE54EB552C8E918F97C3E9F418F7657725FF3A386E96E156D924ABAFA4AA9E491C4BE72D73BA9F7DF6539B06A7B2543796573A379ED28E5DFEA57D25D5DE23745E9F73282B2AA01201CA58C844E06363CE5AD763EF84266E1D683D50DF35A689F9DDAE6CACA57EFEC016947934AE688B4DF54AC0F6A87B51C2CCD056C203E38BCCF6746F1FD91BA0D334E07A5AD1FEEE3D5F738DD7446AEFD96B4521325A6EB2D201D1AC71999F0321DFE6A90E21F860D49680712B2BA066F9C72B881DCF758DA8D164C6AD33D1FC57D55A2D4D42714BFB02A7D3F03F239007636040C0FFAAADF587079A72E6C7CDCDBFAB27FF2E3A0520B1714721D1CB106CAC3870CEE31D54A28789F4DD1E47D0F6F85991792077FE9E97530A51545111596BE90814F575706370C8647B40F8D9C063EAAF2E1DFED02D496911C1558ABA56EC5AF683396FB798727708A1BAD0CE31CED19E876C8FBA1D57C2E8E51E991AE69FA655E86BE71397D77D2BA3CE9B495974D1F183436B285D4F75A265AEA9CE01AEC35951238F76CAD6FBEFB93F553CE19F867A1D1F156DC29AB639E91D0B8C0D91C1F34791E93CDD33F45C23AA7C3FBD8496923BB5C07A87D1DD90FD27AF6B2CD2B63AEF36AEDEF70F3695F29773B7DC124E07C2D7C5E437F0CF2DF23F4964D34B741F0768F831D224BEE7A9AB9DCC39A473048795C58DC904177518F65C9DC51E340D63A89B1D75CA1B6DBA197920F31A4B1FCAEC61DDB271D4AEFCD1F7ED3BAB6CFFBBA8EA7F08D31F2F96D779524271F971905F83FAAF9ABE2AFC145CB4DBCBC07565039C4B6AD8CE6733276E60376FF00C4B671D4959E7FA884E327192E8EF9F15DA5AA6934A434765805753720F3A6A721C3931BBF0DF8DF0B95BC26F87AB55F7F835155236761E53017F2BC63AE1A4E7EF8558784BF1CF5FA764104C5D576D7BBF8B4F2B8BF00EC4B79B3B01FCABBEE8AF1A19F4F51AB681CD82B7C976489447CB296EEC14F91BE76CE3D942F0A94B92F68FC9CB4B16A3DB2A4E3D7813ABB0B5B72D38F96A19160D45297F9926DB9271FCA3D8AE6CD77C50A7AF7C33BA134D708C86CD96F2B090707D27BFCABC3C04F17350D75DEB1D4F21A8A0A895EFA88A771706C79382D2EE831FCA10CF1572D15FAEB534B6AA00DABA4CF9B2C4301CE1D7D2DF9EEAA6A7491ED1D078BF33995C723E0B7F8C94130D04E7D18DE466657463D476DFA6EB8E3C0E71AECD6BAF88DD295CE793CACA9C8E589C4ECE78F8EAAF2F0A7E3569E8219B4FEA388FE18931739192CCFA7047B7CA11E20FF00673B6689D75D2B511DC29A4CCAFA463C192307D44800E7FF0097E168E18A8C28E575939CF3B9FC05BC6668DB953DC697534753FBCADC5CC7C3240799B133638206CDE51EEAF8D6DC33B7EBBD3F1D5D2189972863044800E72F6B7F2BF1BE3B6EB887C337899A8B24B259EF30C935B2A098A7A6A869CC24FA4BA3E6E81BF0AF08750CFA12E5157D138D5E9DB991200DDFCA0FDCB08FE5212704EEC7C1A895A51FC94BE82D6B556B9A7B35D5A636FA9844A0E3B80E6E7B1ED8554EB1B3886A1DCBFECCBB2D70F62765DEDE35347516A6B5C57DB43A392689A1CF6331E6600C96B80DFD3EE5707B2EBF8A8BCB99BCB2C6319E9823B10B232638FC1DD697599258F6E54CEFBF02B51E65BEA583BC4E6EFF0042B8D5F4EDA4BCD546E3FF00D68BBDBF9D5F3FB3D789AD86B0D14C7F382D693B0F650BF1B7C2A9682F8671B4550799840C0E63BA9E0A9229EA6694F8F93A6BC57E9415FA521963DC451349C6FD02F96563D7B514DE96104648E570CEC17D50F081C498AF16BA8B454E3CE630B003DC63008CAF9CDE26F8432D9AEB3C2E6FF0DCF2587181827A057E293472FAB7284B74408CD6CC9DC1CF8C87743CBB04763A6C8E607987B77557DBAA795D81F97AE158BA5A6764100F2FCAAD9924F82CE9B2395363D86D65DBF4C22D6C91CC70DCA93D15A9B20CF43EC969F4F8C6164E4499D3E1C76AD0F6DDA9700349DD19174C8EAA05536FE42B68AEBCA31959CF0A6CBCF238A27D4D567AE517B7D61CECAB5B7DE37EBB2354577DF62AB65D316316A3F72DDB65C7230E4F6A1DB6DDFA2815A6EEA4F4172CF558B931B8B36619949136E183C07BA29DA0B1FB1F8CF74A5FB4CC94757E572F3412FF00B293B0F82530B0CC1C437A1CE73F2AF38ED9F8DA4F29F805ADC34F718E982BACF1B9A924CE635D1F75A2BF65BB1B73616508ABBCC94CE30BF7730E338EDD961751BCCEF511F27F2BCBCBCAD9E667938A39795C0A6E16CD09EC45BB64AA69637A271739DB8D956F65BB48072B5AE763B3413FAE13AABD52F70DC631B6076FAA913B10FAB2B80250C9AF38285D45C1CEEA536925EC85B1C38CBEA51978F828150D3F33805307E9AC3739C6DD10B258B18B2F0976DD028FD5C1877BAD9A50D0EE4C918BA84FE0BA851463979B212950719B44C8DE9BEE107B95E86F8230A3754EC7F3262E793D52A1B26461092E59CEDBAF435C52968B1BE623947DD16B868C7B06DBA43462DAB36A1B8B4ECE08BB04646F85096D49077EDB27B4F751BE4A707757649590479E9B15B4B4518DD661B3934EFA813330DFE4EE547FF7BB8819C22A0B7225147031C40E8ACED296361C60AA6E8AFA0119EDB7FD55C5C3CBBB4E3285A2F699A6CB36869046CCE33B2ADF5B6A6209C6D8567D44C0464E7B74543EBF7E5C77C03D90A89A39726D5C0019AA1FE67B8CAB63431329195469A37641674574708AA49731AEDB1848874F2DCF92DA874F7376E8B47D2F21E9BFF6561D1DBFD19FECA31ACE888031D4FF0087AA0DC6CCF1D2B36B754EC3740B591DB23743C553A3FCD96FC3BBAF5C2E41CD1DCE36469D95672A890B754163B390A61A6EB01C64633EEA0B748F0E25DF64E6D17620804F42932BE39F365C2C876380B14B445C3A213A7EF59C67A2975B705DB742828D3C725204C764E7243BED841EE3A7F97AF5ECAD3A2B50CA5EEBA343DBCD829B692B82ED14BD39735C33F652EA7A22E665C47D3BA7D36990D3923E9944E86CC48CB9BD3D9271B142693E4853288C7282CDC77081EBBABE73CBB67D8755723348B48E6E8A95D6B4FC939C0DFDD46F1B2FACF08A00696B7012E73DFA2B82D4FC37E157FA568799F970C13DD5A3416E01A028DE264D8F5B08BE81D3B013D0FD547EEF4F97600563535A18EF4E7ECB6BAE880E039532C0D977F8940ADACAD2C2E1B74E89CD71701F9775258F4EB6370C8C9CEFF0A431582393AF4F74FE83239794822AAAD90168E61D02ADF53D212723380BA1B5058A26023191EEA8BD77E9CF2ECD4BF4EFF255C9E5A0D744165A707707A764D7CEC774C2289C5C70E5B4F458DDC7749607F933BF8B413E8212427621C374F68BAEE428954C879B032DC6DF545ED34AF716F61DD33D3D84BCC7FF005269455C739182884753BE4BBAF60820A00C1B2520A839D824B4C49FC63FFA92981E76C007FBA790529EE8141700CC12708AC9A91BCB86F5F746B00F1F2EDFF28FA7AAE51CA911547193F4431957BE4FABE16D513170F608FD2A227E45C9F3108CB72206010B7A491DDC75E884D250F36C4EFEEA5169A403D2E39F629E30FDC825A88B7CA0F69CB93C10370A770DEDC000738F7ECA156F6341197651E8EFA1A3180E68F75228D3229EA21F809C92927B143AE30B9BEB0323BE120FD4CC691B019ECBA43815C2BA7B9C2E2FD863B2B4A3FB99F93510FC1C71A86721D92D3CA4A7FA2E8C49550F2823D436575F8A2E18D3DAF9403CD9E81533C32AE7CB718300B0337C7C28733A8B25D138E6CAA297C973F19E53E508BAE1A3FB7455769AD0600123863B8CFB237AF35219AE063270D69DFEC9A6A8E22430B080ECED80B80D4352933E9AF118A58F0452E8AAF8C9752E2216370C1D7048518E1A68A75454358D1CA3239B1DC774DB50EA4F3A42E3D73B37DD5E5E1EACC3924A8734E40C371F3D955C5B9CD2F82D795962C381C92E68EAEE05F09E8DED6FF05A19000E73CE3D5819393ECB9E3C6EF8FE9223259AC0E1196663A8A98FAB00D8B58477579F11F5936C5A5AA6692431CF54D70833B1CB86C17C7EBC544A0978697CB3B8CB21682E39273DBEABB5D3E28C6299F2E791D53CF9E5B9F160AB83DAF7BA4A891EF95E72F73BD45C4F5273D329111004189E587A82247331FA2CD240C7BBF89298CE77E78DFF00F2D93FA9D181C7F8244A3AF3820347D89CAB7B8C4DAA5F6964E82F14FA9AD61ACA4BB5408811FC2079D8EF8248271F75F457C2678CDFF48986DD7586165472F287F36F21E993F2BE4648D7C2EE52E248ECDE9F756B7023573E9EAE1A88880F8E46927A6D9DD4591368B789A8B55D9D1FE2EB81C6DD733244D2C8A624870E84FCAE78B8C72B5C79BB2FAAFC65D1715FEC9154B0E641107023AF335BBAF9F37BD241ECE98742EE493E71B6EB97D4C5459EE1F4D6AE7AAC7B13E57054ACBD48D39048FEDF646ADFC49AA88E5AF27E328E3F45798F11B0127B342B074E78529EA435AECE1C47A583F8833F2AB638A9FC1B7ADD664D1A7BE446ACBE296A21C09A1648DEFCFD71ECA7D6DE3DE99B88F22BA0103E4F4F9801E5613B673D02BFB863FB31EDED0DAAAE92525803BCB95D861EFEBCED8524D4767E1E349B7D5CF678A71E83E5B473B7B6EE03F32DAC5A25D9E71ADFAA1E5F6A67265EFC3054D33C5CB4D57B2A5ACF586C320F3477C7203BFDC2E81E0378E66CE3F73EA9A711B9E3C92F99BBC99F4FAF230DFAA4E9BC095A9CE351A72FD344F71CB5AC9C08FE982770A2BC61F0E7AAD94E5B352DBEE6D68DA58199AC2077E603F32B694B1B3167934DAB8FB9D3229E2BFF006737921F78D3D8ACA471323E95BB96B4EE7C9033CCB8FB4DF0EBCE73DBFC46BD8EFE251925AF69F67336FECBAD7831E2EAF3A51C21BA505636889C164CD739D1B7BF26760174A53E8CD15ACA482BA92A99475E1CD91F1D3B84333CE7389C1C673DD5ADCE47299A0B14AAAD7C15D70BDB0E94D2B555F230C53D630C74E46CE6B88C0F9EA80700EB5BA62CD3EA3B845CF70B83C989AF1FED58F3B75F82AD0F189A0E4A8AEB35ADED77EEF6BE30F0DDDA7948DDC46D92A0DE36B42C725CAD16BAE99F0598363646F61C7238E00F847F14C29C92A7D5910F17DC2FB45D2CB06A4862750553DB99636B472CAE3BEFFAE72A3FFB3D2A04752E7C15F5513638DCF962C9746703A63A61750F888F0A91334B368EDD2545547135AF6973B9DCF6E3F3023B63B2A4BC2AF045F6EA5AFA98666CF13A99E246B7FDA432729CB5C3AEC506E2DC231941C8E64E21BE6D4DAAA58810E69A90C639AD03D21C32703DF75D19E34F565350D15169DA70D2F8E36F9CE3BE0E3E7A7D9575FB3DF4F79F7FAD9DCD1885D33F9BDB9492A1BC5DBE7EF0BCDC677EE6391CC6E7D812141AAC951A347C169965CBCAE2C5B829AFAA2D3300C773534A39656672D734F5DBA04E3C41F0C638DCDBA507AA9E6F548C1FC8E3D738ED9507B26D90EFB0572F0935630892DD5839A1A805AD3D9A4F4C7D1735FA97BA8F66FE118E7A77B57250B63BDCB493415D4EE21D1B9AE7E361B15F45759D960D6BA644B0B9A2BA9E3C820FA8B9A37F9ECB83758688FDD9572534BBC1213E538FE5E577F9A997871E39CBA6AE4CE72E750CEE00B49CB795C7A8ECB730E4BA3CC7C969278F8AE480F0BB8AD5961B9B65DDAE82411D430EC4869C1247CAED8F187C39A6D4D628AF144019D8C0F979773B0C9070A39E34FC2BC372A61A8ACD878918249E28F7E60464EC3B854B782CF1292DAEA1D6EAD709286A731B99274889D88C1E9857DBA395C96F86549C34E099AC0DE5638BF3870C74C7BFCAB1753F0A27A40D647192E68DC01BAEC2BB5D6D54464A7B546D9259DDE63A468C86736FB15ADAB46891A4CAFF00E23BAB8F609D63DC8D28638A8A48E30B75248DF539A43BB8445D5C08CF7F657B710B852D8BD4C703CDD48545EA4D38FA67648E66BBA15979F0EDE8DED34AA34C115D2B49C91DBAA8BDD1CD051AAE79C63EEA3D717676552081CEDFC0DBF79E36089DAEF20752146EA660D484370C3BF2853BC7B9198B338B2DBB25DF1DD4DAD95E4E080A95B45C89563586EE40032B1B3E0F936F4B9DCB82D5B3D51C8DF94E72BA0B425E018C7BE30B9BEC4C0FE5DD5DBA52A1B1B46FBE157D3CF6C916B558EE24E2BB4BC1338C9234171EAB6418DF3E565749FA939CFD333E2BAF271F865EFC32E9E8F381BAC8296FC32D7C84A8449343710E6A073DD088DC6405AEF3181DB1F6CA075F585F239E772F7171006064FC7B26CE896A1A535D08721D9DB6D937EE97A7613818EAB69E8CB5D8C7D12418534B4439F255893CADE5C63270A1DA1F4FBA673887C6CE5ECF7633F4521E5382D3B60919F7FA2764B1442AFF0080F384398FEDDD13BD5390EF7435B1EF94226870C056C21FBAF31C9568486E8653C1F099B22DF1D5139C2618C6E90DD96E687803231E9EBDD49EB200E6EC339EAA15A0EEC0B307B29732AF3B048BB04B695CEB6D23C87CC6EE33BA8A00074007D55CB7BA1E78C82AA9AFB772B88F94E569413E46D0D3E06EE38F6EC9B4EE24E3A8ED8EC9E8181FD924D1970C0DCF64D644B1D89534449CFD959BA32A0C783BA42C1A307282E1D775605BECC033A01848B98A2E2C4AA755B9A3F364770A077DBD891D923609C6B0AEE4247450B92B874CE4A44F9661275DFB7E53DBE42B5B85B5A72D27A82A9CA385A777ED8530D19AAC31DCAD3800A8DA0B0E451676559EF40B3AFEA985D6BF948931BB4E7077CAAC6C1AE9A400E3BFC27B7AD581CDC03F4511BFEBA711A71335AF9F2077286728C6028FD86FEE90E3B0513D537A1CC73D5674757B89DBA29A266CF226E8B1AAAD3CE013D3B7CA0D5945CA73CB8FF2533B5CC0B40EE985EEDE1FF09D8508F347AC7504F281D3DD5ADA719E91839C7555B69FA5E4C770A5F477B6B5DE9C838DD017A0922D2B13399C3D95E9A774746E872EC6E172E58F58C71EEF76E0AB874371B612DE47BB0074DD0C9B35716D7D8E789BA3A18981CE2063718553FF00A5407A5981BE067BA31C6DE2409006B1D969DB2150B4BA8B95E413DF62994D95F2E38DF05F34F76F41E6F6F7555DF2CA2791C5AEDC650CADD6AE0D2327750D935AC81FE83D7AA93D420F46FE4B2AD6C1100D775CE14A28AE61B9CF45565B2B5F2E0B8A3F4913B380E42F21247497F24FE8AB72EE66EE7D95896BBAB4B00206556566B73F037526A7A2206EEC289E577C1A78B4116BDCC217A81A77181EE81B6EA23D89D91BA4B4079C7374DCA097BA06B1FEE023591839B438D223BAAEEA1ED001C6CA97D65267D255C979E5C138550EABA76BC93EC94B248A3FA7C642C5ADB9247B248801CD796F3729C91F445E963EC3A2197390B4E00512C92227A6C48DAFD551D43816C623C7B775BD0C05B81DBBA634B50323DFBA3F0B41EA0A2F70DE8E35F2855CFC8C00B30D3F2E4FC27B4B4848CF44AC6CCFB1C27F709CB1C41B454C5C7D6D45A8ADFF00EEE027515230EE3AA3B4AC1B0D803DD3D486866C4FA070A3006405AC76A2EC23F131A4600FBA214D438C23A6349C6C05590B6266DD5210576C3DD13B933D5877441277B5AECFB29A28CFC938D845B71E51EE53737479DF380994D5BDC77EC9AD5D401D4EFEC8E8AD26A42F5DAABCB3B82EF956C7023C5B4F6C9394B3311FEDEEA88AA05E0EC8100E07738C29132ACD47A3A838E1C61FDE950D981E68CF41EC7DB098F06A31F8A7CA772D6123E36550680AA0F7F23CE40E8AE0E1C55864D2E3182D207E8A8EADFF00A6CDCF0581BD4AA205A96F8E35334A720B9CE0D3EE32AB2D457D2490E2763B2B635BD208C381C672E3FAAA52FD0BBAE30BCE9F3919F56422E1A554BE06ACAD0E91809C6E013EDF2BE84F85FE1CBDF0443CA6CD03B0EE763C13F700E57CDAAD8DC370397DCFBA9370FB8D377B4BF9A82BA585BB65B92E1F38695AB82314ED9E6BE6B2EA32C1E287C9F427F684F877D417BA4A5A7B5528A8A7808261E711B8E3DB25B9FA65724F032CD73D3B738A3B9581DFC47063BCC679ED1BE3AE1C07EAAD3D03FB4675046C1CD4ADAEC7F33DE6307EB8565D8FF6A25293CB74B68A739DCC4CF3B07E1C42DF8EAA0E3499E399BC0EB314F74E3699D11C45D61A52869A1377A7B75236A580B5A6923E73CC3DC3320EFDD5377AFD9F1A42FB13AA6D323E09241CCD9629BF8609DC7F08741F185CA9C62E26B7575D99246D90D142408DAE6609FA8ECBB97C27F0CA2B553C955CAE8A311970E771E5D867A1D829314F7BA2B6A341FA786EBE7F07CD6F163E0DE5D365ACFDE715687F489ADC48D1EC4F554B70AACAF7CA5DBB5AC3BFD55D5E2978A725EEF35B39772454EE742CDFD2E20FE61D945F83BA6DC70D68F5CAF0DCFBEE8E5979DA50C307DB3E9AF871BBBA0D3734B36EC646EE507E8B8BEB6E00C5555046F5339F2DBEDBF50BAD78F17F168D2D4D086E1F50D6C671EEE185CAB590095F6EA568D9A017FC93BEEB9FD7F747AD7D1F7894B29797877E10C2444E99BCD2498276DF07D9759EACBDD9B4D50BEB6ACB226B5B968760BDCEC6C077DD571C02B3175531A3A42D1FD17147ED3CE2BFEF1BBC76F8E4708E947F1980FA4FD4745A3A2C0946D9C97D4DE4F36AF50E09D2443FC52FED10BA5FCBA9288BA8680123D0796495A0EC79C104023B2E5382969DDBC927F109CB9EFCB9C4FD73B9F94C6F53729313360D4CAD94CD79E52E0D27B9F75B6A92384A7164F6CF055348FC25754003702395ECC7E8E03FA2BBF877E2FF0057DB1A1B056B5D1B36E49DA2473C7B64E772A91D3DA6E660CB1D27FF002B763F7527A5748EF4B890E1DBBFD4AAD335314774793AF34F7ED422F1E55F2C10D613B3E62D610077382D231F4534B77067476AA8DD5166965B65C9C0B8B69DE610D775C60119DD70754DB9FF0095E3981FE62A47C13D5535BAB592C4E73035E3F2EC319FEAA0732DE3C119F0748E9DE395CF4AD6B2D7A8E37575087E20A97E5D2346701C643BF4DFAABD7C6BF0D9BAB34FC35B67904C69B96463587D64019E5DB7047BA29C6DE1DD36A8B0891C009DB187364C6FCC067AAE4EF0CDC53BA692AA6B2A87E22D723FCA93949708B271970EC9E32E6D8D9B4D2CBF6AE86BE193C755CF4F4CDB55F1AF9A85DE8736424C9034FA77272703D9750F12F53D92CD6AAFBCDBABA3962B9C44369D8F190F78FF00003B1C9F6555F8F8F0AB1DD6946A2B201302CE79A28864969192401DC7B2E09E0DE87A8B9D753DBC3A42D74AD1244E73B0C19C1CB4EC0FD9598A8BE4C99396396D7FDCED9F023607D15A6ED7B9C7961ED94B1C76E60F07A7BAE6D8AA83E4A89FA79F2B9DF505DD574778C8E2045414D45A66DF88A38D8D351234E32EC0C877FD5733B6B62680D6F50304F627DD626BDF1C1E99F4DE2AF735C18CEFCDD31D3E519B5D5971043B91C371F27E3D9017C83391D168CAC735C0B7B2E6E507767AE69F550C7ED65FB494F0DF290D25410CAB8DB885E7AE47404F7CAA32E16331BDF415CD2D7464863BE9D083ECA4B65BB3839B2C6E2D7B483B77C76560710A862BB5109DA032B211BE3ABB1EEAC61D56C74CA5E4FC52D443D4C6823E0FFC444D6AA9FDDB52F3350CE7939643CC003B6D9E811CF103E17638EF3156D210692AC891D1B1B8009DF031D17305303CF19DDB346E193F42BE8EF07B531ADB6462701EF8DA035C46E301741833EF74798EB7C3FA5EE97669A5B4B4549135AC8034F20DDDBBBA77298DCAE323C91B01EC3645AED5DCA72D767B63D90490171CE3AADF852464C7053B43486DCD9BD0F761B839CAAF75C68564C1D031D9C64B5D8EBF0ACD647164024FCADEF6221111181CFD89557345489142567105C6DCF8257C328C39A7033DC7BA07554B9385D0DC55E1F8AA84CF1E04F08CB80EAEC2A269BF8AD39F4C83623BECB0F2436B2E4A29C68895D694F4032815540E077042B269ADDCC704744B5C34239EDC86A68E64B83327A493E8ADADF71E538248539D3375CB80CA8ADDF4ECB19DD87DB3845B4851163813EE8334A12883A78E484B93A8F86F0B5C1B9569B9AD68C854F70F2E21A065590FBA87003DD73736A32E0EC210DF1E425FBC7FEF2B0A3F2CE01EEBC9BD77F903F4E8F987E5ADB917B996D95EAA7851A722D1EC4A858454212FC3FD16194849D8276D8B380A6DA72C0300B86C876A6242BC2CE15495B3C513886F3387DC12BE945B7F6645049451CEF931218F988FB2E22D2BAA5D48F63E060748D20B7E30BB8743FED022684D25546D13F965AD76DD71844A2896AB93E7AF1A38794F6DAE969E305FC8E2339DB6510A390E06776FF5531E2E6A37D5D6CD348304BCF4EE32A2F474FEA031B2548923234B85879DB96E3EEA2971B2BD9D5B9FA2B6EDB4C0ED8442A6C4C70DC7540D22651BE8A1636E3AEC9563958BA874581BB42AFEE54A5850D91CB1B434A8726724833F44B484A68E625642E2D128D1731C9F6565DBCF755BE8CA6390A79E786377721B34312F6F21C8BBE7A2826ACA0F51211666AC66719CACD556C720456038595F88F6DFA8529D1B62697073B0531ADA3033B29668C60C0D930D0C2FE0B0ECF6C6BB000456ED6B1CB8CE10FB655728E6013B9AB4C80A635238382A5E225909C104281C146D07E42BAF52D087C78237F755ADC2CFC8425653CB8981AB6AD8077418CF83CC323E88BD7D367B24DB4AD0DDD36E2B2C6EFB1E5A7594B1F7CA3A7888F23A1CA8635806C966BF1F44368B49BAEC7359A9A491C7FCD4BB879717730CE47D540CD4B41DD12B66A3E5781D024AC18B5BB93A8ECF7005A33EDD966BAAC6DBE3FCD46346DC04918C1EC96BCDC03739DF1D12E4D45388626D50D6743D3D945EE7C47903B1D33B823DBE7E541ABF51173886A03577171C8277F74B6B2BE4CF4CB329359973BA9FAF652EB65EDCE0795FDB6DD513A7EB0B73BE429B69DD4007C27DA4B0D516F51DD5D2C458E04B9BDD44AE1398DC09DC076FEF84E6D5A9DAD3F9BAA4AEF56D73F206C774A9137EA1337BC5D43C8E4040C0EA86DBA9817FABBF4C26776ABE500E7E13FD274DCEE0ECF442E17D051D413CA1B1E1ADE5277527B459C9FAA5AC91B5CD1F0A79A56D2D272502859A58B3D08D96D320037529A7D3F23C6FB04662B735B8C6148A8F9401CD8C2956245D5AA957000B16996E70339EFF00443B57697033FE6A7115535AE25B842358D434C44923242994522A65CF392292B9C41A0B4E3A2A975301CFCA31EAE8AC0BCD781CFDCE7655CDD29CB9C5D8DC744CF698B2F52F821F74A42C71DC8FA7441EAE12E390490A557A8DCE686B8610E82DE40E8A075F028E2CB3ED8C68E830438A95DBEAC0E83F54C61A4C0E8BD24F84DBC9FF004F5F2C7B5D5C4EC011F44A59A8C75DF7DB0930FE846EA4369A376321BF44DB99621861F26ACA32DE8DFD524EA7713EA381F0ACCB370C2A2A630F634938DD06BBE8E9217064AD20E50AB27F4F1C7A430B71C330067E5399AA1DCBE9D8FCA314F471C4DF9284573812403B2994594E72560B95EE76E77C7B219241F1FAA2E4728D8A45B9237532B466E456C19FB9CB864103DF287DCA168F938DD488D2EC82D75BFD8A9382BCEC092D4646020F570348EBBF745AAE9B0700E1222841FE5FBA18A2BA8736C5F45420481E3A0EB956F68D80BA62E6FE577F755AE99A46B038957A70EECE3C8F3B1F9412B2F5EDEC677BF4B457AE9B2AEE29CFFC72CDC91ECAB7BA51E77EDF2A47AB6EA64AA95DFCB938FB28ED8EAC4B5018E3E92EFF0035E7FF00CCD9F503CB058545FE01F15933B39AE703DF1B04E28787AF99D86C6E3ED80BB2B4AF0F29BC860F2D8ECB46FB294D9B4FD3C21CEF2DAC6B013CD803A2BF0C5292E0E4753A8C10BB5C9CC567D2A6DB4A5D2C6D7B8F46C9D132D1FC3EFDEB301E496873B611B72D2AD2AFD3735FEBD94F034BA063FD4E68C3460F7F75D6705AED1A4ADE6A6B64899CADE600E39DC71F95A0EF95A1834136ED9C279CFA83163C7B235630E0AF859A3B742DA9A90C8F95BCCFE6C35AD00672FCAE6FF19FE3EE37B24B1D8791ED20C751563FD934743E591DC2E7AF157E3CAE17F73A9E95EFA2B682400D716C928E9EA208383ECB961D72240647E91DCF727DCFC95D063C7E92A3C6B53A89E7C9BA6FBFF01FAF94B1A21649E6B89CC8EEA724E4E7EEBACBC25694351574ACE42EE5734BB1D005C9FA26C324B2B228A27CCF791F9013B9F7C2FAEFE0D3C3F9B6538AAAA6F2CCE67360F468C67750C9FBAD934557040FC725F8BEAADF6D63439ADE57BC7601AA96E14D2FE26ED296B4C8D8F0181BD41030A45C73E211AABE55CADC165331CC047424E46C5527A3EAAE34B39A9B7B8F98E717169E9D7A15CF6AB22793BE0F6FF07E2F2C744E51EDA3E9E686A275BE8A7AB104934C58E2C8A207CC271B01F395F1F78FDA56F7357D65C2A6D15F4C2791DCAF92376030138CEDEDBF55DB5A1BC7E5F28472D7D9DF56D67F341E938F7CAB8B48FED19B0570F2AE903A849FFC3AC679ADFA7E55D060CB0514ACF21F2BE3757EB49B83EFE0F907A02DD472D4C6DA878682E01ED91A413EF8CAFA9BC2CFD9F5A5AE742C94B1F97B07F12323638EA08EEAE7ADE1968DD451831D3D04808FCF4E2386419EE3001CFD917B3F0BA8B4F5054368A69C42D8DCE635EF32729C6D83D30A7F522BB673D0C1372D924D499CC7ABFF0064342CF55AAEF551E7A32A0E5A3E98ECA8DE26780CD5B6B89CF8A3A5B9463FFB30CD411F20F745F4DF8D7D4F056CCD8668E681D339A19330B9C1A0F6F6D97D15E05F1624B8D1F9AF6F24AD6664E5181CD8F62A2864591B34B3E8351A48EE9747C4DA9BABE17FE16BA967A5A81F9992021DF3D538B3D535B2031648CEC1DDD4E7C586A435DA86BA577489CE8F9B6EB9507E195A7CDA968C9C0C21C91A5C0F824DFF0053E9BF822D44EAAA2969E7887206F53D318DD7137888D531D9EFF531531F3E96524CF4F2EEC073FCB9E8BBEFC32508A3B4D4CEEC002371CF4E817CF7E246813707D7DC065EE333B97E003D956CB9364793A2F07A59EA32CABA45D7E147C6052D1C869A62451CC70637EEC67375001FE55D5FA2385BA5D95925E682383CD782E788CB79012325D8FF0012F8ED1358CF4B98EE769EB9C63EAA5FA735DD4C1FEC6A658F3FC81E430FD46540B59B5746DEA7E9EC79B26E7C33A57C4DF860375AD9EE36F986EE396C8763BF46AE54ADD235340F7B6AA178C1C7310794FC83ECACFB5788AB9C586B5CC23DFB235378809E71CB570C12B4EC4960C8FA2CDCBA9DDDA3B4F1DE2238A351673E555C013E8DBE16904C7E5591A8B4FD34CEF3226F267B0E83E8103A9D321AAB3CD17C17E5E3B2479B19D9AE25847D559B64BA060C8CE5C307D955120E5207CA9CE9C7FA5676A23FCC759E23371E9C8F5C6D0DF3798377272BBB7C33595A2DE4B86DCBFE4B906DD6732BE3C0EE1771F0BAB994D44C6923F28CADBF14A4DDC8E3BEAC8C62EA0472EF64607BDC33DF01276DB6BCE3D240F9457506B18C13CAC04E5308F54B9CCCB40C8EC17629D9E5DEE4FF0063174B2C7182F23ECA0B70C4AEC03CBCAA68C6492EEFCFD1452B69B0E761BCA938D934B3714442EB2329DE1C398B1FB3C7BE7FC951BC52D23F879FF1118C452EF91D067DD5E1A9A1691B9E89B8A0656D2C948F68E668258EEFF0167EA7171C1162CBEEA6734C55A410EC803FBAB3F48D60900181F5ECAB3BB58CC523A29010584803E88CE90BC161C670015CDE44D1AD069BFD8BB6A743C1333760271ECAAFD4DC39F20F3346DF0AE1D157A6BDA9F6ADA26BD9B01D1673C8FA2D4B127F0531A7EA4B7014E282F3B77D9452AE8FCB725686AF270A9CA37C9363B5C13965613BE7AAF21F4FD02F280B947CED76CBC1EB3295A357B19F3CD0A732F31DBAD39D7B990D8A82B66A6E670565DB720001575A6E4F50563D3D4800611261C5120A2A368DFA14857530CF36FF004CF53EE928EE184FFCE6B8611136DB405BB520700EE8EEE8653D1E0A925551E4612715AB74D6490821D59E203B23AE63703DFBFC21518E54CEBEE98E9F5CA07C9722D447F5B0F312DEDEEAA2D736BE43D4EE76C8C655B763A796A1C1B1B0C926DCAC1BE527E20ACF50D86212D11A77346EE2DC67E50343CDA68E7D7443A0FD56868BB2C97E3AAC4753F2868A3648ECF2F963A650EBD5E9CFC8E9F74953BDC48032B3556279DF050D1613F681E3791B83BA2967BA39A7AE508A9A673362BD4F3E023A29BC8D704D6AEE61CD1D949F44D4E76CAACA37123AAB0B878464652DA5BC394B56D4EC7A48E647E9ED7CC36D9236BA66EC54A290B4048D684EC8A57D80E0606545AE7A11EFDF97ECADFA5982CBDB193D7EC906F1B91CEB76D0EFC6318F9C2885DB4E966DBB9759D75A2323703755C6B8D1231CCC0970549E99A39AA4791B72A4195449C2975F6CFC8E390A3D246CCE7D92E0A12C6D3168ACA1C325DBFB2DED74203BD5BA51950060F65ABEAC76EA4A6B1431ADDCB2EDD01072B41CEC8C5F2C33CAD7989AD76064827181EEA07A1F52F2B70EE813ABD6B5764F952104EC40F649BFC1ABB60970F921B550B98F764E77C1C76285161773124EC512A9AA6E7DB277CFBA776DA5E639036FEE853650C914C8FD156169C34673DCF645A1B93FF2FF0050BDA82020FA5BCB8EA87DBD8EC870C9CA3E4854689450DCC9C0C9C852CB6DCCB8007B7FDE1442DD42E763D38522B35ADFE600916B1C6CDEB4991DBED8524D2D2B9981D49EC9FD569D0D6648DD0EA3B6BBDF0424D9A38F125D96C69AAD3B0270ACED3F78E8D03EEA92D3529D8677569699CE428B7346C62C512D18EE040F72B7A9BAB88C6530A8A77363E6EFB219054B916E6CB0E114834DBC1186E7BEE569A9AA0BA2CF54185BDCE206F9254AEFBA7B929324EE12A9319BC691436A0A719246C3A9F941E2E570E61B9F6476E95AD05CD3BE4A60CA7601909F63F933326582E88ADC6D6E767233FF007D1274F6C05B8C60A98B98D716FCA7CED3F18C9CF64FB48239DFC10D7D8FD03E88154DA319CEC7B053B7B40F4F5CF44CA5A7E6DB1B8E896D4139B6466C56639DFA0FEAA6F6EA80D237C01D936B750F2FE6DB2B51479712DC9C22F68E948EA5E08714A92385D1C85A081D4E153BC67D6ED9AA5E63C63B63BAAF5B13E3208C8CF55EBE4C5F80C1EA1DD326879B6296AAB71780FDF3FD14AE4D34DC649EDD42AFE0AF2D70CF5EFF000AD2B0D6F347D7391DD4E9A2A256C894D6D6B01CE4A12E8B392096E3A0F752CBBC6402060A08E84606E323B27EC83270C6460240FA2682946F9DCA92DBE846093DCECB171B6B09043B0E1D825452CB32BCABA205DB8F7FB26EF81C3A7A9A8E57B5B923AEE727D923413349C76524782B49B17B6D07A3A75202BF6A256D1DA0E47A9EC38CEDD42A96D9073490C43F99E33FAA937893D4ED1E45130FE56379B1F45CDF94CB513D5BE8DD1B9CF7339DE595C5AF2763977DC1286E9C8C97E5A3273B6F844EF84B7D247A71D7DD5B3C00E0B7E31E2590111839C2E3F0477B3DDF5928E186E7F08B4F8397F95F186BE3761BB64F4C7D54D6AACD577891B41451E23CFF001A5CE303B8CF7538A3D231B7CAA3A7602E7E1A71D70857898F11345A2EDDF85A5635F739DA434F769237271ECBA8D2E9AD59E13F5079C49B8E3F917E267176CDA12DDE5FA26B83DB8644DC179931D5F8DC0CAF951C71F11D71BF553AA2E1239CCC9F2E00486463B0E5E876F850EE20F106AAE555255D64CF9A791C4E5C721B939C007A610EB1589F5520634127B9F61EEB6D2514796E4CD932BB7C9B52C2E9B018DDF3B0EDFF004578F013C2BD5DDEA591C60B8120C8F1F9583BEFEEAC4F0D9E1525BA4ED869D8440DC7E22A5E3031DC34AEB9E2B71D2D5A3A91B6CB44714D702CE573D983876305D211D1DECA9E5C9C1A7A5D3CB249412B64D34A70C34DE8CA46CF54E8DD53CA09380F99C7D991EE4EFDC054FF00177C65575C237B2863FC0D23B204EEDA59187FDCEADD9523A5EF4EAE95F5B71A87D455C992CF38ED003DA369D8E3E89F5DB44BF3E639EF91877CB860FD80DB0B9ED4EB7F951ECBE0FE928DACBA8E590BB8EB26359E5B32F793CCF94F5793EE86B354D60F54471F409DEA2B4B5BEA6B3185A5875A3237005A31DD616FDEECF67C7A7862C5B170A8672F1AAE6C1CAE25C3A1F490835C7882EA9DA48A369F72C04FEA55FD60BBDBEA9B8746C048EB81D54535C70821397C38F7D95C8E6A47239FC6A736FBFEC54FA6995124A19486664D9F408E5731A4FD015D174BAAB5EDB6987E229CD55BC8F544079B2167D7739C217E1D3413639BCD907A81F492BE896A8E2432CB65371923E76C6CCB9A4676C76056EE8A1EB76CF20FA9678F4934E31E6CF9F3A538AD6B9E4689E8EA2DF519DDAF80805DEF9217727079C296D359564831BA271611D8729EA1517A63F685E8ABB48C657D1BE29C9C73CB0B5B175EBCC318FBE55A3C75F103A7E1D3F58CB75CADFCCF81C2382295A5F9734EDCA0E723E8B4B169364AD3388D779796AB1A8B5D1F25B89FAA43EA6BE66EFE6D538824EE7753BF0BD6E7544C72DDF9801F4CAE66ABBC4921DFA9739C4FBE4E577CFECF5D07E7C91BC8270E04E7EAA7CB13234F377676C7156E31DB74E3DBF91D2441A3B6490B8CB4CDCC53D235AE196C9973F3DC9EEBA97C7F13F80A681BB0E76671EC30B88357EA70D7F97BF2B1AD18FB2E5BC96471748F78FA1746A707924BB1B6B5E19C1525D353BB95C7723DD53179D212C44E41DBBAB05FAB5E3F238B47B26359AA4B861E03BDCACEC39E4BB3D0B5FE371CD70B92B782E7230E3AFD51B8751BC8196EFEE9F4F4513CE79483F0B63A5F6C8CEEAE4F2424B9398878FD4E2771E8796FBA6772EC27977B9E075ECA3150D31A675375CF52ABC70DBB4067F24F12DB317964E63B1EEACBE1FD86599ED6B01713855BD8697CD780DF70BE83787AE12C5152B2A241BE01C90AE7E91E4E0C78F97F45EE8B22DA6F869242D0F9184E37E88FD7DE4B0728E61DB0AFD89D0B8720E520A80EBED3D14597868CADCC181635466E7D7BD4CB7642BCA07388E679DBE512B55F23638F2EE7E5422F3A8B0E23381ECA3B57AA5AD3B1C157E2E8CDCCA2FA3A0AC97F05C738DBB7B28F6ABD52C2E2390023FAAABB4EEBD2D7124A5AAB52365739C54AA6644F13B19EA3ACEA7A827F450E1A8E58256B9A7D39DCFB0F64F751561C673B74C28E8A80E690EDD2B4CCFCC9C790D717F4EB646475F16E1C073803BAA7A7696B838743B91ECAF8E1ADC5B3B64A19BFD9B810C27B1ECAA7D79A564A5A87407F282707E1616A70ED766BE9B26E812BD03A9CB76C7F55683EFE1CCFB2E6FB35CCC6EC2B1ED1A90B800B9DC98A8DBC79548217E66507B7BB95D8FEA8AD65402107A69FD4557DBC06E54C9753CDB0DD793682B0E06CB2A0D84BBCF9FE5D9585AF32C172F5B3C08F172D3CC58739252393318256CB972B94DA96FC7008C7CAAC112B655BB980CEDDD2424D96E32A4C8CC8DDDF1D309EDBAA8823B8EFF542343F319037B3F6528BCE939E138F29DCA776B803B8F7536DE0953612865C8CEDF44F8001B91B1F951DA00E8FB124F629E48F711971E5F8281AA2C266972ADC75C7D9446E1761929EDF6AB036765422AAA1CE77C214D03295176F0038BF4F6FAE8E69C65AD2158BE39BC4BD0DDE9E28E89B8D873938CE7BF4ECB919D9DF6C7CA0D70AEC92D49B42DCE81A2539F74E58E27B04DA21EC9FD0B3708191A4EC97E99B5870048FD14ED9676F20D94674F4A000A5F0DC00685133531C55159EB5B5721381B284794ACFD7F521C156CF7FF74C9B20CB8E3639A1676EDDD4D74BBC34820FEAA0B4D55828E5057E0EC8B902148B92DDADB97638C8F6E9847E9F88231D951ADAF773641D93F8AEAECE329532CC6745E106BD04744FA8756677202A72965763F323D415E3971CC91723A868B60DF43C75093AB773B304ED855D4775E4206F84E59AAB7E5EC86895C9C88EEBEB137720AA8E380F3382BBAE61B2646EABA9F4FF002BCFCA54539E36C8E431978E423F446A8B463CF2BB076D91FD33656F3E48CAB4ADB646F2E71B764AC68692522A29EDAE8F0D19C2673E46E07A95B378B1340CF72AB9BF5396B80184AC3961D9CB23AF764E1C09DF6FAA90595A5A7705BED9E8824B504BB946C4743EE8C1BBBA4003F00B463EA8AC8A90FF0050339F1DC9F64774DE9C6F2838FB28A8BB0680075CF7561E8EA91E927BF6443A8A6C5C5BB9770DFE88869DA2CBC388EFBA9832D41EDE6C2429A8033231D774C5CF4D25C056A68048DE51D004067D3C49D810A4FA79AE1D475522FC002318DD227826442C14847A71BF62AE7D0D630794B81CFC2885AECED07E55B3A530D684D48BB0BF824D70B4B7936EB8DB3D142BCB21FDBEBD94CAEF58397AED850C756839C0D91F08371937D872D00738764123B0E88CEB3B9C6EA57F31DF1D0285D2DC991B4B9B9C9EB9511D51A8090E39D8F64FB869E3E0AD6E75D9738F66BB64C1D5E4BB6D827751002491FA21F244E2303644998D38D30CDBAE27003B1B1D91615CD70C970F651099A7946E93152000093D530F06913392167F2B87C2D61A371DCF41D71D5236C861E5E639E61FD512B53F3BF46A1A2E2682905B7A728EDDD17B7E991CA4B8609F65A596327D4E386A9147796BBD206C3BA8DC4B30641EEB62763940C37DCF5403F738076774EBEEAE5BFDF619226C6D600E0372ABB9ED9871C04FC2F8164890B6E9B7731738EDD517B6EA1E470681E91D512B85AA4C7B26749A74F30DC64FF7522666B4D3EC7972A8749BB5A50D92DC4EF9C7C1EAA57FB93947E701D8510BA798DCB5D8DF38214898128D884313DAEC389C7647B4B5DA2824E7918246EE30775039AEF283DDC075450DE1BCA0ED93D91D945C15F221AB628A4964731DE5B5C721A81D1C619EA1B8CE14F6C56486AA27C92CCD63980F2B703750A9E94025A3F2F321B14716E64D745D633F191920F2B4737DF0A117BBB1ADB854CC776B0968F6002334D50F8DB24ADFE48CFF006513E1A49CCCA977771738FDD713E566EE8FA13E8BD2A8C53630A4A4351501A776F30C01F55D8FA2AA59454CC070D271B7D9728F0D697FD6813D03892A75C43D785F570431BB6046402B174B2E4ECFCFC2B1B4773F87AE59679AA9FF00F84C2E07B0C0EABE4BF8D8D78FAEBFD73CB8C8C8DE5B1E4E7977DF0BEAAF0AEB453D92B6A3A1FC3BBFFC55F16B595C8D4D5D44A7FF00127783FF0098AEF3056C47CB1AF86ECF3FEA08D2BA3A6AA7FA1871DCE3FB7CAEE7F0B7E03AA6E0E8E4983A9A90105EF76CF93DC03EC99783AD334E2464B3C7CD144039E037989C6FD3BAB4FC497ED0CA811496CB2DAEAE0C0F2CD636076397A12C01BD7E54928EE33A11DBF24A3C517896A2D2D48DB1D918D354E6964923073BA3DB05CF2DDF2BE7F59EF90C8F7CD3543A49A47174864690E2E272465DECBA97C23DF68290CD5F5B4D3CF52417CF2D5D3BA4E6CEE701E0E30BA029751F0FF5337CA79A76D48243D8D8DB4B877FC581FDD433D33947837F43E4169269B5670CD8AFD1820B5CDCE7F9C83B7C615C761E2046E606CB235DD867B2B4B59FECD8B64B992DB5FF00866F501B279E31F504AE73E25785DADB538E2ADB52074C65A48FA125733ABD0ECF733DABC2FD411CED46ACB06EDA4A0A90E31B81C8CEC42A8357F0DA688E591B8B7DC289516B0A8A3933CCF691D41270AEBD11E22A9250D86AC3413B731202CC869E55C1DBE4F2B8F1AA9B28F8EE72C0EEED565687E23194B6291C394EDF2AD8BCF0B2DF726934D2C61C464608CAA6350F00AB69651C81CF19D880A4DAD2A28FF118BB717C1D43C3BB48E689A0643DED208FA853FF00DA31AD05269D8A933CBE786B36EA729A785FD0F532880CCDE5F2F049775D953BFB55F56BEA2A28E9E2A7A992381C1CE7470B9CCDBDC8185D2E821B61FB9F3D7D53ABF575470ED65A69F9238E667460C39BB1FBE1462FBA2E20418776FB1273FD51DB8DC1B29001731DED334C7F6DC225146DE5E6900C8E9C872081F45A519B5D9C94B129F25776ED2B34B288E38DEF39C0E5693FA2FAFDFB3C383353474E26A989CC6B80C736CB95BC2C7880B6D1D544C9EDD1BC643448E03AFBEEBE9CEA0E36D2525BFF0019130BD8E6E5B1C4DC81B671B26C92F77249185FB21DB296F1A11B669A920CEFCD9C2E6BB8F06A292691D235DD8263ABFC547EF1AF351246E6089C43184608DFD913A3E38079248182772B92D6494F2F27D11F4C69751A6D3469187705E958DF4C5CDF51BA0374D0D4F1F581A00ED85665A78950BF1B8CFCA9145353D482D708C8C7F886556F462FA675D93579A1F7AE0E64AFA4A56F46B07E8A2B797300240DBB2E8FD53E1DE9EA8130BC44EF70ECAA6B5A784CBAC4D261779EDED838DBF551FE9395C9265F2F8BD2714BDC73E6A8BC80481B28BD3557392549F5770F2A29891511BC3BB8C1FEE80DBADFBEFB2DD84618E1FB9E37AE86A35399A4897E80772CCCCF4E6057D34E1E6B760B73226B76E51927E9D97CCBB3D0F23D8E047507AAED8D297A2DA089D9C0206EAE6924A4CCCD569E7892DDD9608D4A627F307606760A0FC41E29F9C4C60F4EA995D350C6EC7AB3855E711A3C72CD11D8F55A1B5A761A9C5A48D6BAF63A83D76F528D5D6BF3BE46524E9BCC00A0D7538DF74ACA99A528728506A27B08DC29051EA4C8C9200FEAAACAFB8E1DCDD82D69B54000876F9E8864AFA1B0EAE2D548B0AE77E2ECF29E9EFD1634152C934E23047ACE37FF00255F8BD179FF0008567708753D3525432599C1DB8DBD90C6EC7C91C735D96F57F06EA299CD78C8C60823A211C59D2AE9E0130C191830F215A5AEB8CF14F086C241E6031EE142F48DC83F9A194E43FF00CD16A23BA2538648E375672FDC69CB4F4DC04F6C9703B107EB953EE2AE817412B9C1BE83D3E8AABF20B0E7380B9BC90E4D48C9BE6258D05CB986E4264E9B0EDBA1EAA354773202730DCF2A09E1E382759AC9A4372D86EBCA3D0D68C2CAA9E9937AA71CC6565C16610B2F0BD30F14117849909C3C24244CFA1083D12B442491819DD0F014934C520272E77281BFD7E134478A3A27C3E6848AAAAE189E08CB874FB2FACDA7FC36DB24A685B242D796C78C90339C2F913C33E2D7E01EC7C0D0E7B48DCFC2FA03C36F1FF4EEA76C551CAC9B930DF93856E2CB0B8399FC61D8692D358E6411B79B7DBD97275C357492125CE3FF000AB3FC4D712DF71AE9647F5E6383F0B9FA49C971C1CF650647C8FBD054D7973BE116A6A1CEF8432D148E71DC297D0D3606146A23CAA4B823572A1DBE1412BDB872B5EE308C6155F7D8F0EFBA6A2BB743179C27B4136E87BCA52093050851916459EA0602342B76DFECA0B6EAFC0088D45D32DD922DC720DB5256E73939512C8DF28A5C09764A1B1C3942D0D2B9188481B94468EA80E81378213D00CE5158A80E06D8FB20DF4143136265EE3D3644E929F183DD23047EFD9398AA73B26DE5B585AEC394B2FCA7D4D5833B1C28B32E05B9F629ABEF78381DD2DC4C9C5764F6BEEE001BE4A460ACC918D94067B99046E8B59EF45EF0106D6491CA8B063AA2373D504BAD53773DD17A5A7E61D501BE50F518EA9E9853CAAB814B05E5B9EAACDB2DFC600E65CFD03CC7272AB034ED793D7B2928AF8F51344F753D7B48CE7A2AA352540765C3F9548EF939F7EAA3069493CA373DD350F39CE64698F738E7A2754ADF5125C5C476528A3D324EE0648EC88D268524F316E1111AC6C8B42FE6232DDC2B2348C2016E4E16B43A636C06E4FBA95D9B477E5276444D1C4ECB12D4E063000FBAD26B43B9B39EC95B73446C03B27D14C5D8C743D123416274696FA770E5C95218086BB253482D8E253AA8B4BF97210B6588E3A4255576009C6CA71A37520F4E770AA1ADA490380F72AD9D29A34792D717633BA564EB826575AA0E6E7B151D6C64E403D3B22374C088B01E9DFE88259676FA89724C9A3242173E62DC01DD432FF40E0C249FBA9BC93171E56F72A27AFAB391BE577488B364A442616373BFEA9A5446324F363D9271D4920B5C3007743BF7872BB948CB4F42A68F473F9A76C205A0B46F94DA6B4E7D59DBD93292E983B0EE89525593D475480C5C929B444D73067AE36F84628A8F1B636EE3DD6DA5E963E5048C1521AAA201BB753D13A45D48652877206B766FB0452D344F68C0CFD31D53AD35420BB0EDF1BA9839EC03200D91ED13C94415F48F073CA9B4D13C91867EAA51595433CD91FE4917D635FBE467E137029646C87DDE9E523AF4FE8A2D4CC7F99E97E7DD4F6E36E393CC700FF54CEDBA5E32FEBCA8B82ACA4D1AD2D1ED976F9F9422F94B9FCADE8AC1A7B3B183739432E16819247743B49A2F7229E0D7349046DEC86D5307718C7B7B29E5E2CFB9511B9445A71D53153247903D2CA79DBCB9E5270E0AECD57C3CA08ADD154327066760BA3C8C83ECA8CA999CDC90434F609165DA4186B8B9C091DF643263E1B4C9ACF19FDDB5AF1B7A080542F842F1E4CDFF0006EA6F2CB9B4D6E761C870AB1E1556F2B5E3FC4D2B87F25CC99F43FD27936E3885B465CCB6690F61CC9B69671A8B98237C1DBE02110D6BA37CA077CAB1BC34E9074F5324B8CF2B4ACCD347DC6BF9FD5DC1A3B3AE174F2B4B571EE222DCFD97C61BB569E67E36FE23893DF7257D83E3E38D0E8DAA90EDCC48CFD765F206A2DA5E016EE5DEA3EFBE5777855451F326B5B9669D7E4B63805E2DABAC5287C50C554D1D5937423F42BB83407ED78B6485ADB9DA63A76FF31A7844873DC81823FA2F97068A461DE327FE209F9BB44472BA3E53EF81B7D15C8B319EEB3ED2D8BC64E8EBB433369AA5B4CF746E05B530B21C920EDBAF917C75B5B21B8D53A1958E8DF2B9CC740E00104F62D502A9A38BAB5DCC7E4E31FA21E653D3B0D87FD149B8937F14CEA9F081C59AFA4AFA589B592F9133C0746E7178DFB7AB2BA5FC43EA0E7BCB22248063CE33B1247B2E32F0D74E4DCA840CED23763EF95D21E252B1CCD4500EE58C047E8B235FEE89E8FF004BE6F4E5EE241C2CE06C5532996B6312B4BCF2B1DB0209D97555FF00C18E969A95A6AA9E9A85EE6ED33E40C20FB8C900A8AE8FB5FAE919CBF9B949F9E8A29FB59EE860B550C31BB0F7BD809048207D952D061DC9D8FF0053F9397A8A306D323F7AFD9AB5509754582F2E999D5A399A583D802090428E0B6EB5B2B73556E86E51B4EC47AA42D1EC00EAB8D34271C7515B9C0D1DC6A8B63C7F043DC6223D882575C707FF006826B59CB2065BE96A7240E77C643FEB9E6DFEEB49E9F1FC9CCE0F37A9C6B6DDFF0052C7D0DFB41FF0C715F64ACA303673BC970E9D71968D95D3A5BF689E99AC7085DE6B1EE182D9E9872EFEEE70552788FF001335B454B17EF9B5C6E96768C48C8816333EE71D9515A1AE366BA3C39CF89B29FE41CAD3FF00355B23F49D236316970EB62E799D4BFA9F44AF3C05D2B7BA7333EDF4B3B5CD2EF31986169C75F4918FD17C76E3FE9EA6A2BCD4D2D09E5A685E5A1A0E4019E995F55785423A0B35748D7623642FE524EDF97B15F21753DD3F11515751D7CD95FBFB804EEAD495C548E5678FD2CB2827681B0577FAC31AC3B0C74F75F56BC2079D2592A0D43B998D638B43C640DBB657CC3E116981354B4F51CC3FBAFACF0D4456AD2B2C8EC34BA123DB396A8B273C96302945C78E6CF9B3AD6A18FB856BDA406B6470181B6C4F451B9B528070D247BFD50BD4B7F6F2E59BB9F23DEE3F0492147E9EFC3AF2EFF45CDE6D3EF9367BDE8FCBCF0E28C3F62C18355CC06D215876A4A81BB66783FF001150796F0E7FE5184CAA6E520DB25430D3B4FB3473795728DB45A741C45AF67E4AB7B7EE4A7551E202E8C1835D21C6D854CB6F327BA4DB3BE43856D614972623F24E4F6C63C9625EB891575E431EF2F276CF28CAB27865C0B1261F330107070545B855C3F9399B23DBB6CBAAB43D9DC5CDC9C018D9539BB7499D369F4EA18BD5CABDC57DAB3C3ED3988BE26889CC19D8FB765AE88BC8A8A5928C9F5C20F27D42B638B5746C1453388E5F4919FB2E3CE1EEB474156240799AF760FDCAE8B43A76B93CABCEEB54E7483B3EA7918F731C48E525B8FA23166BD7E22374523B38DC129B71434BF2540A866EC987311EC4A13A6E10C3971D95D9A69D19B82374C7D47296B8B33B741FF34D2EEFC6413D1129E36F387B7A67A7C7BA5F56D87998D91A3D246E556B68D58C632E19515E65F332D6F451A98866D9DC29F54595CD70731BB7750DBD595DE612475ECA584CC4D66969FB06135D5D91EAD91AB2E5DB8241F751CAAB716EE7646AC1710D5731D185EE8369B2E2E1D4AFC80E25DF52AF3D2D40D239B3CAF6F45CD5A5352F21CE707B2B76CFAB03983D5CA7DD4AAA4E885644D974DF2D31D7D2B9A306568C67BECB93F56E9B746F31BC63949DD5E3A175E8A6A91CC7F86FD89F7CA7BC6ED0ED762A621963C676593AAD3EDE4DAD26A2FDA72D35F8240DC26F1DC08247447AFB6BE51FE150D9E3C1F759D4BA2E65B8724961BA6DD42F285CB5F838DD6C97A28AFEB14E0582BC4AC6575967991B35AB76D0E56631BA915B2946C9585400168DF1F9491D319CAB1B82BA5EDB2CCF65CA6313434F263BBB1B24E3B682D23237EFDD06ACB472118F5676251A1F9095C3CA8E691903B9A20E21AEF8EC539A238C1E624839FA28E52D1E32D39EBD919A684920F60308AC3E5F01BD52CF3A31281BB460FCFD5420DBF2761853DA59C72969E853036E0370106E1D4581688F2EC9EB6E9CBDD34BB3797750FB85D5D9EA87712C5161C15BCC3B1519D4769CE4E020F417E703D5169AEBCC10F6151151438EAB7117C27F52FDD22D6207C09248D636A59CFD97B952594A896D09CC7D3DD2718DF1BEE957754EECD4E5F20D93EC1B75744DF446946BBD4EFB29A56DA9A36E56F2E319C261A7EA794B46361D54A2BC876C7A25B0B31CAD1576AAB018FD6DE877516ADC91B6DF4564EA068730B77D8A811A501C426D884E4E447E790E3193B77480694764B60009431F1EF84A9222716867BA3BA4A13CE999A3E8A55A5284673B21B26C58CB434D528C0C8CA5AFF6805A48002C5899B0F576EC885C64C37DD351A3B5245377CB472BB9B209FEA8C6969F9B00EC12BAAA849C9C63FBA196085C373D3FAA2A2AACBCF44D2ED6C696120EF8504A77398FDFB9D8F7561089A631B950FAF83F8980950A726D93FD274CD3871564D05A6378C9E836C2AEB48ED8042B3281F91B7609D517A09ED17669D60196E004E228D8395BDC24FF001ADC609DFE13CB7440BBA24E482C785C989D73DA0FC2756D9812364D2ECDDCE0273648CF335076686CDA4DED54DBA3715182133A33803A744E995871EC9EA89AED0F5D628B1CC40C8DD03BE6BA744035ADD91875CBD3BE156BAC6773F21BEFD91591B8929A2BCC926F9EA3A27D450000FBA0164A57321049C3BE764629C8C677CA01D63E062FD45E53C8DB2145B545479839C9C9257B524EDE73BE0942269091F0022B2A64740ABAD2F2B09DF70A280BCE31DBDD4A6BAE2E70031B744C79061C3A6CA68331B3BE40AEA83CBB63394FA8A73B139C84C24A5EB8CA756D27A6D952B2AE395172E8767386976C14CAFEE60031855D69AAAE48C6E361D8A7B75BD3B972131762C394D757093D3D11D7D7900F7C8DD416DD3FA410724A90064AE008E9DD2264C6770ACCE77C2636EB8127AE004CF52D3C8D04EF81ECA3D6BD46D3904E0FCA0480C93A2CC8F501270EC1002776CA9638155CC1A840381D4FE8A6963BA3030E700E14D5C1594D36487F10DC601FD536ACAD1CB827A0ECA1776BD127D27F45BDADAF3B939E6F7405D84A342574BDB7F281BA885E012E04EC14B2BADF87940EE3419C172447368875CE989EDB7BA1913017007380A5B511E03B0A3EC84B8920637EEA29A022BA25151567F7655818C72955368BAA2CC6E0642B32EB86514CDCE4B9BBE15416E93940DB2B86F20EE67BDFD3F358F045B0DEA9610FC83D77385D61E0823A4E522491A0BDDD09036FA95CA320E71CC4740ACAA0BAB28AD81DE5B992CCEC31C09042CFC52D924CDCF21A07AAC7251F93E92F1FB81D1EA1B3BAD5155C54B1BFF9C61FFD02E0AD53FB222F34F87525D69EA801E9688DCD3B741B9C2ADEDFC5EBC518CD257BD806FCAE717E7F52AC0D1FFB42F52536D306D606F62033FA85D4E2D745AA3C335DF4C6A304DB8CACAAF58F819D5B460BA5B6FE258DEF1B81247BE02A56F3A3DF4CF2DADA1AAA778D8830BDC3F5C617D26D25FB575BB36BAD9E4FF89CD7978FD0AB6F4DF8EFD29731E5CAE8839DB39B353331BFFBCE1FD55E5A883ED9CDE5D06A23F747FE7F43E34545AA89E30D0E6BBFDFF47F42824BA6F9376B83F07B7ABFA0EABEDF5D7C3A688BC34BDD051B9D26E1F1CCD63C13DF941FF25516A9FD92B679CF996EB9CF4641CB4359E637E06E7A238CD3E9F054F4DE37738BFF000728F835E18BE6B951C858EC798D3BB4B7EFBF6527F1C19A7D4B139C766960DB6E9EEBB67C3F785BADB34CD35552CAD8A2DA3939431E00F80B8AFC7AB5B35E6620FAE3190A966952E4E8FC5DCB2DC1D1DDBE1E6CB1D5C74D504FE5637F5002E6FF00DAE65EDFC039C3F87CED00E36EBDD25E00BC43160FC1CE7259B0C9DFE1753F8BBE0945A92CB235A333C6C3242476206703E5168E6919BE5B1E479774FA3E2CD64CF8C8306C09049ED95D27E1E7C73515A24632BEDFE6F2E0192300118EFD173056C6F8A496867E68E585C63F50C125A719FA24F4FDBD81C7CE05D8DB71D568EDBE4C8516F8F83EB3B7F682E89BBC7E4D7BA385A46396A22E7C67D8E0E14387850D0F769854DA6E0C8A6279806CE236177C34918FD17CEDABB2DB9ED19606BBB61A33FAA173E95863F542E9A3C6FCCC95CCFD3052B4FB2784B243ED67D24F175AD9F65D3A6DCC74723E4FE187C5235E4B7A64E0AF9AB5F667B2263999391977D4F544ECCF7B88124F34ECEC267B9C1BFF0098A92D755B3CAC3467E7FC93495A0E12537EEEC9BF855B007D442D73777C8DFEEBB9FC765C441618281870E9C35AD03A93B6CB9C7C12E94FC4D740797D2C21C76F6565F8E7E2553FEF6A3A6790594C79DED27D87B2A39E350373C7C37EA629BB48A4747F875A42D8DF5CEE57063496E7191F2885D6D9A729799A23F34B7B7B1FAF7557F13B8F9255C8E8E004479E56F2E79B036DB0B4D09C20AFB891CAD7C71939739E3047EBD57372DC91EE9A79E069268D355DDA81E48A3A621C7EFF00D10CB070CDD390E9B2C613D39775D27A7F825454001399A61D5CE1B02A6F69D20C7EF8601F6D9449CBF26C4961DBF69CABABF810FE561A484B8773EE8059B83B52256B5CCC6FBFC2ED0D49708A9DA22661EF3B00DEA3EC94D1FC39E6FE348092EDFE7F4532526525FA787FA94910BE1EF0F5CC8C0776C75568515A84606074EEA636DD22C00760B6B859CB58E23185247134ECCED6F945978473478C1D4063A38E307F3F6FF9AE44B554E08C6C7E15D7E2F351F3CCD8DA73C9FA2E6DA2BC0691BEF9EA5745866F69E4DE4A71F5AD9D55A46E82B290C2FC73463A9FCDB211259F03A6E0F4506E1E6A6F2E46907F36CE563CB507CDF876E3DB74726CB1A792B4E3D0D9919C608C637560E8BA16CD13A27E371B6500A7B0B865CE19C8D8F6527D21172919CF5551B7675D871E3C91B8914BC68EF2DC5B8DB751ABA685696389C7C1EEBA79FA4639B0F3D0F642753686858DC9FCB851A93B1B2E9EF867126A5D2E5BEE47B7751C6E9C7E413E86FCAE92D66D821C96B039DD9503AAA49DEFCBC6187A00AEC3234725AED1256D0D23B83233CAD3CC7DD4AEC77CDB771C0ECABF7D386E7620FB8DD2F6FAA2C1DCE7B95754ACE466B632CA1AA03B6C9C83B6EBA4381DC418EBA1341504640C3493BFC2E3186AF7CE7AA31A6359494D3B668C905A467E7746E3B90D0CBB2568E89E20F0FDD14924781D4E36EDF0A91BFE9DE4240072BB2B4FD64378A064CCC79EC68E71FCC76F654C6BDD225BCC0B4E7B9C2E7F2E3DB23A7C599678D1CE1FBBFDFAAF296D5594071FAAF20B17A07339724F2B195A3DEBA6B3CC90BC077526B5ED82A2F45D54BADF1EC913AA241453EC951B9435AFC04D85C70762890568342893B820D933A1B834F529EBAA063AA2094D2362FC2DA2ADC12106ABB937DD336DC467AEE85A13C88DAFD039D921422B681D93EFDD5A3416EE71BA6373D219C909944173B2B5862C754B36746AAACA58771943A5A2C267C0D6C4D92254C899BF64AC681F22A6C58313C653E424226A3346077EA9593E3C77D89D369F246C8E586C5CA7AA7567AD6838EBB614B6DB4ACEA9F7B2F2C49210B751F29CE51599DF2B1C8D09BBE609F731F6A405BDD572E77ECA1DDCB949B517423BFB285CB2387641CB01C947A15A8941432B0E0EC9795B9FCBB9EE97A4B439E771B25B08DE56FE0670CA5DB614CAC7400346C9BD069C24E40D8299DA2C9D33B24E24B893B0ADAC35AD0004FAE531230DF649B281C3031B7BA78CA2383BE7641669A83A2177AA671C775BDAE9181A72307DD1FA9B2B8F649CFA7C86E4FE88ECAD2824C1721DBAEC9A55D134E083BADAB72DD834A6B1C9820E362864F8248A564E749D2FA7AEEA5DF8FE469DF7517D2B2818276CA3F5A18EE8546A268A9248656EB917BF6DB7EAAD8D376F0E6839ECABC81D1067A47A87552CD2FA9406F29D8A7712C619721DBF50318C27B943F4E001C323E8B3A9AF8C6B01FCDF087D06A46B882072E3AA240669964B07A7D932E73D49D90F8AFED2CFCC0FC266FD40C2719FB294684D5764A2969C3B1BEC93AAA28233CCFC7C2091DEF97F2EFF000A39A935179840CF4EA10012CB449B515F18F2D0CE8111B1485C07B2A72BAFF820670A79A575010C1DCA914408E7E2865C418035C1CA354F7404729EE8FEB495D20FCAABBAD90E463A83D1128A29659B63BD42E70C01D027F65A86491E31EB098D54C4B41C7642A82EA63939891CBDC24B865492B44AA5B631DBE71EF85159A8792524125AAC1A2B8534ECE68C86388C107DFDD45AF3060FD0F51D148CAB490BD0EA0E46918EA76F856AE9EA182A29802E05FECB9F2F15D9231E91EFEEA43A1F59989DCA32E7764E491916452513DB372B4618D564D2B89686FBA8E596B7CD6021B879EA3BA93D25239BF9872E1397214C8FEB86F2C4E03AAE78BFCBC879B9BBABDB5B5C41C827AF65CF3AEEA5B921A3273B84C9153552AE891DAEBDF2347C775378EABF86067755CE9490960DFEA3D948EAEBB970074C6EA748C7F55856DF5879C349CEFD15896BA7E991D46C55396FB9343F981C9ECACDB0DC1CE0C3CC3E9EC96D4491C920D57DBDBD4EE428D5CE23B9C0014BEBAE91B410064E3AFCA83DE2B8F360EEDC764CE28B319B23D3D6B738C64A0B7C94F53B0F844AE4D1D5BFA7741EE00F9630D3F750645C17B1CBA1B57D71F21E0770A06E94728F7539AB8898CE4750A15556C38E9F45E7BACE72BB3DE3C2294B4AA827A60BA57319EEE0A51C5BBC3BF854C0FA636827EA9A70874BBE6A804024460B9DEC31EE85EAF97CD9EA09ECED8FD36541AE4EE2A52C5717D7E08BC958720A4E4D42E6F500A175CE76F8FF00B0867E28FCAD4C305479FF0090C9921277648DBAD233B3E1047BE17A9EEB4EF3FECF947BF4FECA3277FE60B56536DDCE7BAB0E09A395F51B95B2DCD2C226383E2A97C6E1DD8F7730FA0CAB8AC7C55B9D300FA6BBD738B77F2DDF94E3B7D1729D9A431B811DBFEF756AE9ED4A767677DB6ECB3F33CB8DDC5F076FE374FA5D6C36648AB3A32DBFB47AEB4E3CA9E9A3908DB9DD9E723DD7387183894FBA54495AE01923CEED1ECAD9659A8AE1000F606C80756801D9FAAAB75C70CCC41C599C37F5FBA8FF005726D29334B27D31830294F1452FE8417406AF9292ADB51112D2D20BB1DC6775F5F3C2971D21B8D2B40765C00E669E836DD7C616C5CAE39DC83D4743F0AD1E187192AED12B27A4931B82E8CF4FA10B56191AE8F37F25A05920E12ECED6F1DFFB3E5D7579BAD983455F596103024F903DD7CF7BC70B6FF6E2E8EAAD15BE9EB2189DCB81EC40231F52BE81F0FF00F6A653B431970A294386019E33860FB2E80D2BE38F4C5C5A1B2574209DBCA9DA0F5EC765B70CEB6F679A66D066C2DAA7FD8F8A6FD7710716CF0185DECE6B81FBEC8ADBB5C503800FE63F0361FD57DBBA9D29A4EE808FC35B27C8DDCD646D76FF0060AA6D71FB32B4957F33A38A6A77BBA1824C341FA0FF009AB1BA3F92B6EC905CA7FE0F92176D5F09DA3E639380D6EFFAE15B5C0CF0AD7ABF48CF2A37C34D904C8F04371F75F423861FB2DF4EDBA6150FFC454169CB5B2125BB7B82AFAE20713ECFA76979A6960A489ADC3226F282FC0D8728DF25472C897C878AF23A51B6575C22E0751E94A19269240F99B192F91D8C7301D0657CF6D61A324D4576ABB9544869E89AE2DF32438CB413F933D4233E26BC6CBEF5218618E765335F9631808F330762EC7507D9507A9754DDEAE311F952B606ECD8D8C735A47CE3AAA3972A9707A0F88D1AC1EFC89B97EC7405A788DA5ED43CA8E9FF0016F67FE338024B87B263A9BC66BDED2CA4819133A02061C07D02E5CA2D17592C8236C12171380D0D395D23A03C33D351C42B6F73089830F6C39C3DD8DF047CAA52C699D8E2D5CAFEDA5FB80B4D6A9BCDD26688FCD2DCEE403C807FBC55C172E2036D51083CCFC455BC6395A73CAE3EF8F655EEB7F151961A2B353B29603E8F3034798F1D320F5DD29C32D24CA51FBC2E04C8F76EC0E3939F959D92318B3AED1679E78EDA2F8E0EF0F24762B2ADC5D249EA0C3D5A0FC157E52D201838C0ED8546681E288A8774E5FF0008F857159EFF009EFB7CF453E17131BC8E0CA8934528F6417564A3CA781FE13FD909D47ACD918FCE020943AA84F1C9B82435DFD95E5922DD230DE09E38EF92670471C83A5AA947604E5527596E01C010AFAE20425D573ED9F51FEEABAABB50C9247D96B62E11C06BAA796D82B4A17C6F1EC55D343742F8DA4E072FEAAADA3A32D20B4649E8159DA4ED31B5A0CB2804FF0021FEC8E4C974AF64BF62D9D01A859272C6E05DDB0AE0AED1819107801A08CECB987FD28303F1100DDB677C2B2B4B716647303257F3646C140EBE4EB30CBD37ECE89547AB8C27941C8CA71A8EF1E643927391D1412F95DB8786EC535A8D6E2366EDC823F454A52A67531DB971DDF247F5344246918E8155976B5F37C29F497CE77920FA5C815FDAD61DFA15623354729AA837699053A780FBAF3F4E0C72FBA386404E729C51B398E55D86438BD4E9773E0AE2BF4EBDAE00744E3F7796E32AD03A6C1697A015F6E046EACB75D1912C6F1F0C93F87BE283EDB56D04F345210DC676DD763EB7D3F05543E63006F98D0E03DC95F38E4A9F2E618D831C31FAAEE1D2DAD0C96EA67672F000C7B7D552D446D59A7A193B4503AAB4ABA39DED03A1585675EF91F2B9CEC64F55E58B6CEB383E6CB1252AF2F2EB0F1D5D0EE83A8530B7F45E5E443B1EC9D102A89082BCBC9C48734531456694E16179223F923D5731CAF52487982CAF243AECB0ACAFF4FD9137FE55E5E48B58C8C5D62080D4403D9797946C92606AA847B2691AC2F2882FC0F187A27B14872B2BC912447304E474F753BD39392161791C49D12194EC85543F7595E46FA1A40EB8333B9519AF8460AC2F2144236B4C4327653AB151348DC2C2F2261C09CDBE859CBF94744EE3A06E06CB0BC8245DC7D8F444309D50C033D16579468D6F809BE8DBEC92ACA36E3A2C2F23451C842EFD46D00ECA25246161790C858FB2456D988013C9EA0E7AAC2F288B68CD34E71D51EB7CE4637595E4E5C80A5EAADC5BB9EE84475CE0EC03B12BCBCA4894737649AD55EEE7033B6C9A6A9AE736A00070365E5E5314D7649A9AADDCBD7B2133BBA9EEBCBCA35D8EC1551103B91D0A9B68E66700AC2F2902C7D857510C3B1F0A0F5510C9D82F2F243E43D2B01628B56C237D9657937C95240E82A4B5E794E14C291FCD19277D965794E8A3221D7566E96D2F18FC43565792123A9F4152B4869C6FB2926B13CAD38DB6585E445D8146DEAA4B9E7273D55317FDE623E561793233B57D92ED2100C1D911D47180DD965794EBA3318CA9A301A080328B58EB9E0ECE2B2BC8193E22490D5B8839290ABDFAACAF24FA2D2005C7607083412921C09CAF2F2AF90B78FB42AC19D8F4C21171A5697B63C7A49DC2C2F2F3CD7FFD647D1FF4F7FEC4EA5B0E91A7A4B0CB34118648E8CE5FFCC76F7EAB9459273C24BB04B89C9EE77595E51EA3A4743E19DACBFD7FF0462A6DEDF56DD945A78064AF2F29B0BE0C0F32BDAC18DEA53B8BA2F2F2D2F83CD25D989DF8230A51A6E7381BACAF2A79FED3AFF07FF5116B68DAF787B70719560EA3883A239DF21657973DFCC7B14FFE89CB9AD200C91E1A31BA8B52D5BBDD657974BA7FFA6787F93FFDC309C321230771EC7A241D6E607821A01F8D961794907D9CFE6FB890D9EE73C6098EA276107F96578FEC5595A2FC505F28CB5B0D7CC00FF1B8BFFB95E5E534083518E35D23B0F86BE292F5534E5D355733837AF281FE6B5A6E17D1DE7FD6AE4C754CA1DB73BC968DFB34E42C2F21C8C1D162826A92FF0004DD9C38A0A4606C349000D1B6636B8FEA42E6DE3F7162AE95EC8A0F263639F82044DE8BCBCAB3E8ED74A8B134606C56C7563238C541613E6720CE71D42E0DE286BEABAD9E47544EF9395E5AD049E5033EDD165794F881D674C5F84F40C7CEDE619C1185D07AA1997C4C3BB303D3D97979656ABEF3B8FA7FFE987349C41AFF004EDB81B2BDADF50446307B2CAF22C3F6B2C7935EF4555C46BBC9BFA96386D74796CDEA3F94FF006595E47A6FBCC3F2EBFF00E6FEC519AA87F1A53DF25422A63049585E5D82E91E1DA8FBBFB8C6ACF28C8D884D197593987A8F5595E4E491E89F5CDE7C963BBF4CAD6D75EE0E6E0AC2F2A597B3A8D07DA58F455AE747EA24E132BEB01809EE1797946FED36F49DB2B59AA08DC1C6E8ADEDE4D3B5C773B6EBCBCA1C7D90EB3A60289F908AD917979687C1C87F3325913BF845446E7D161795D818FADFB8AF6FDDCF7CAE9CE0F5539D6E6E4F4E8B55E5165E86D17DC495D48D3B91BACAF2F2C33AA3FFD9, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (3, N'febrero', N'febrero', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (4, N'marzo', N'marzo', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (5, N'abril', N'abril', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (6, N'mayo', N'mayo', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (7, N'junio', N'junio', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (8, N'julio', N'julio', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (9, N'agosto', N'agosto', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (10, N'septiembre', N'septiembre', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (11, N'octubre', N'ocutbre', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (12, N'noviembre', N'noviembre', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (13, N'diciembre', N'diciembre', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (14, N'pepe', N'pepe', NULL, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (15, N'Marcelo', N'123', N'agustinjretamozo@gmail.com', NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Usuario] ([id], [nombre], [contraseña], [email], [avatar], [fechaAlta], [fechaBaja], [intentos], [bloqueado]) VALUES (16, N'Marcelo2', N'123', N'mliberatori@gmail.com', NULL, NULL, NULL, 3, 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[UsuariosPorEncuentroDeportivo] ON 

INSERT [dbo].[UsuariosPorEncuentroDeportivo] ([id], [idUsuarioEquipoA], [idEncuentro], [idUsuarioEquipoB]) VALUES (1, 6, 11, NULL)
INSERT [dbo].[UsuariosPorEncuentroDeportivo] ([id], [idUsuarioEquipoA], [idEncuentro], [idUsuarioEquipoB]) VALUES (14, 6, 5, NULL)
INSERT [dbo].[UsuariosPorEncuentroDeportivo] ([id], [idUsuarioEquipoA], [idEncuentro], [idUsuarioEquipoB]) VALUES (15, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[UsuariosPorEncuentroDeportivo] OFF
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
SET IDENTITY_INSERT [dbo].[ZonasPorDeportistas] ON 

INSERT [dbo].[ZonasPorDeportistas] ([id], [idZona], [idDeportista]) VALUES (1, 5, 1)
SET IDENTITY_INSERT [dbo].[ZonasPorDeportistas] OFF
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((3)) FOR [intentos]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [bloqueado]
GO
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
ALTER TABLE [dbo].[Cancha]  WITH CHECK ADD  CONSTRAINT [FK_Cancha_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[Cancha] CHECK CONSTRAINT [FK_Cancha_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[Cancha]  WITH CHECK ADD  CONSTRAINT [FK_Cancha_TipoCancha] FOREIGN KEY([idTipoCancha])
REFERENCES [dbo].[TipoCancha] ([id])
GO
ALTER TABLE [dbo].[Cancha] CHECK CONSTRAINT [FK_Cancha_TipoCancha]
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
ALTER TABLE [dbo].[FotosComplejo]  WITH CHECK ADD  CONSTRAINT [FK_FotosComplejo_ComplejoDeportivo] FOREIGN KEY([idComplejo])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[FotosComplejo] CHECK CONSTRAINT [FK_FotosComplejo_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[FotosDeportista]  WITH CHECK ADD  CONSTRAINT [FK_FotosDeportista_Deportista] FOREIGN KEY([idDeportista])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[FotosDeportista] CHECK CONSTRAINT [FK_FotosDeportista_Deportista]
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
ALTER TABLE [dbo].[ReseñaComplejo]  WITH CHECK ADD  CONSTRAINT [FK_ReseñaComplejo_Usuario] FOREIGN KEY([idUsuarioValorador])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[ReseñaComplejo] CHECK CONSTRAINT [FK_ReseñaComplejo_Usuario]
GO
ALTER TABLE [dbo].[Responsable]  WITH CHECK ADD  CONSTRAINT [FK_Responsable_TipoDocumento] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Responsable] CHECK CONSTRAINT [FK_Responsable_TipoDocumento]
GO
ALTER TABLE [dbo].[Responsable]  WITH CHECK ADD  CONSTRAINT [FK_Responsable_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Responsable] CHECK CONSTRAINT [FK_Responsable_Usuario]
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
ALTER TABLE [dbo].[TipoCancha]  WITH CHECK ADD  CONSTRAINT [FK_TipoCancha_Deporte] FOREIGN KEY([idDeporte])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[TipoCancha] CHECK CONSTRAINT [FK_TipoCancha_Deporte]
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
ALTER TABLE [dbo].[TipoValoracion]  WITH CHECK ADD  CONSTRAINT [FK_TipoValoracion_TipoValoracion] FOREIGN KEY([id])
REFERENCES [dbo].[TipoValoracion] ([id])
GO
ALTER TABLE [dbo].[TipoValoracion] CHECK CONSTRAINT [FK_TipoValoracion_TipoValoracion]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_ComplejoDeportivo] FOREIGN KEY([idComplejoValorado])
REFERENCES [dbo].[ComplejoDeportivo] ([id])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_ComplejoDeportivo]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_Deportista] FOREIGN KEY([idDeportistaValorado])
REFERENCES [dbo].[Deportista] ([id])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_Deportista]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_TipoValoracion] FOREIGN KEY([idTipoValoracion])
REFERENCES [dbo].[TipoValoracion] ([id])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_TipoValoracion]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_Usuario] FOREIGN KEY([idUsuarioValorador])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_Usuario]
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
/****** Object:  StoredProcedure [dbo].[sp_AgendaDao_ObtenerAgendaComplejo]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgendaDao_ObtenerAgendaComplejo]
	
	@idComplejo int,@idDeporte int
AS
BEGIN


SELECT DISTINCT c.id as idCancha, c.nombre as nombreCancha, tc.nombre as tipoCancha, 
c.precio, tc.capacidad, cd.horaApertura, cd.horaCierre
FROM ComplejoDeportivo cd, Cancha c,TipoCancha tc, Deporte d
WHERE cd.id = @idComplejo AND c.idComplejo = @idComplejo AND c.idTipoCancha = tc.id AND
d.id = @idDeporte AND tc.idDeporte = d.id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgendaDao_ObtenerHorariosReservados]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgendaDao_ObtenerHorariosReservados]
	
	@idComplejo int, @fecha smalldatetime 
AS
BEGIN


SELECT DISTINCT c.id as idCancha, h.fecha, h.horaInicio, h.idEstado
FROM ComplejoDeportivo cd, Cancha c,TipoCancha tc, Deporte d, Horario h,
CanchasPorHorarios cph
WHERE cd.id =@idComplejo AND h.fecha = @fecha AND h.fecha is not NULL AND h.horaInicio is not null
AND c.id = cph.idCancha AND cph.idHorario = h.id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_idEncuentroCreado]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoDao_idEncuentroCreado]
	
	@usuario int
AS
BEGIN
	SELECT ed.id FROM EncuentroDeportivo ed WHERE ed.idUsuario = @usuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentro]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentro]
	@idUsuario int, 
	@idEncuentro  int
AS
BEGIN
	INSERT INTO UsuariosPorEncuentroDeportivo (idUsuarioEquipoA, idEncuentro)
	VALUES (@idUsuario,@idEncuentro)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA]
	@idUsuario int, 
	@idEncuentro  int
AS
BEGIN
	INSERT INTO UsuariosPorEncuentroDeportivo (idUsuarioEquipoA, idEncuentro)
	VALUES (@idUsuario,@idEncuentro)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoB]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoB]
	@idUsuario int, 
	@idEncuentro  int
AS
BEGIN
	INSERT INTO UsuariosPorEncuentroDeportivo (idEncuentro, idUsuarioEquipoB)
	VALUES (@idEncuentro,@idUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPrivado]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoDao_insertarUsuarioPrivado]
	
	 @idEnc int 
AS
BEGIN

SELECT DISTINCT  ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte, 
    e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
    ed.tipoEncuentro, ed.accesibilidad, ed.clave
    FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e 
    WHERE ed.id = @idEnc AND ed.idUsuario = u.id AND ed.idDeporte = d.id 
    AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Privado'
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoA]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoA]
	@idUsuario int ,@idEncuentro int
AS
BEGIN
	DELETE FROM UsuariosPorEncuentroDeportivo 
	WHERE idUsuarioEquipoA = @idUsuario AND idEncuentro = @idEncuentro
END

GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoB]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoB]
	@idUsuario int ,@idEncuentro int
AS
BEGIN
	DELETE FROM UsuariosPorEncuentroDeportivo 
	WHERE idUsuarioEquipoB = @idUsuario AND idEncuentro = @idEncuentro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoQUeryDao_BuscarEncuentroPrivado]
	@idEnc int
AS
BEGIN

SELECT DISTINCT ed.id, u.nombre as Usuario, u.id as idUsuario, ed.fechaInicioEncuentro,d.nombre as Deporte, 
e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
cd.nroTelefono,ed.tipoEncuentro, ed.accesibilidad, ed.clave
FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
WHERE ed.id = @idEnc AND ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id
AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico]

	 @idEnc int 
AS
BEGIN

SELECT DISTINCT  ed.id , u.nombre as Usuario, u.id as idUsuario, ed.fechaInicioEncuentro,d.nombre as Deporte, 
    e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
    ed.tipoEncuentro, ed.accesibilidad, ed.clave, ed.capacidad
    FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e 
    WHERE ed.id = @idEnc AND ed.idUsuario = u.id AND ed.idDeporte = d.id 
    AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MensajeDao_InsertarMensaje]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MensajeDao_InsertarMensaje]
	-- Add the parameters for the stored procedure her
	@idEncuentro int, @fechaHora smalldatetime,
	@texto nvarchar(50), @idUsuario int
AS
BEGIN
INSERT INTO Mensaje (idEncuentro,texto,fechaHora,idUsuario)
VALUES (@idEncuentro,@texto,@fechaHora,@idUsuario)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_MensajeQueryDao_MostrarMensajes]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MensajeQueryDao_MostrarMensajes]
	
	@idEncuentro int	
AS
BEGIN
 SELECT u.nombre as nombreUsuario, m.fechaHora, m.texto, m.id as idMensaje
 FROM Mensaje m, Usuario u
 WHERE m.idEncuentro = @idEncuentro AND m.idUsuario = u.id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_PermisoUsuario]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PermisoUsuario]
	@usuario nvarchar(50)
AS
BEGIN
SELECT r.nombre as nombrePermiso
FROM Usuario u, Rol r, RolesPorUsuarios rpu
WHERE u.id = rpu.idUsuario AND r.id = rpu.idRol
AND u.nombre = @usuario
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ReservaDao_InsertarRerserva]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ReservaDao_InsertarRerserva]
	
	@fecha smalldatetime, @idEncuentro int, @idEstado int
AS
BEGIN
	INSERT INTO Reserva (fechaReserva,idEncuentroDeportivo,idEstado)
	VALUES (@fecha,@idEncuentro,@idEstado)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentro]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentro]
	@idEncuentro int
AS
BEGIN
	SELECT u.nombre as nombreUsuario  FROM Usuario u, EncuentroDeportivo ed, UsuariosPorEncuentroDeportivo upe
	WHERE u.id = upe.idUsuarioEquipoA AND  upe.idEncuentro = @idEncuentro AND ed.id =  @idEncuentro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA]
	@idEncuentro int
AS
BEGIN
	SELECT u.nombre as nombreUsuario , u.id as idUsuario FROM Usuario u, EncuentroDeportivo ed, UsuariosPorEncuentroDeportivo upe
	WHERE u.id = upe.idUsuarioEquipoA AND  upe.idEncuentro = @idEncuentro AND ed.id =  @idEncuentro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB]
	@idEncuentro int
AS
BEGIN
	SELECT u.nombre as nombreUsuario , u.id as idUsuario  FROM Usuario u, EncuentroDeportivo ed, UsuariosPorEncuentroDeportivo upe
	WHERE u.id = upe.idUsuarioEquipoB AND  upe.idEncuentro = @idEncuentro 
	AND ed.id =  @idEncuentro
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioID]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UsuarioID] 
	 @usuario nvarchar(50)
	
AS
BEGIN
SELECT u.id as id
FROM Usuario u
WHERE  u.nombre = @usuario
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarImagen]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarImagen] 
AS
BEGIN
update ComplejoDeportivo 
set avatar = (select * from OpenRowset(Bulk 'C:\Users\linov\Documents\GitHub\desarrollo\HayEquipo\Imágenes\cs_avatar.jpg', Single_Blob) As avatar)
where id=1 
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerCanchasPorComplejos]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <06,09,19>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerCanchasPorComplejos]
	@idComp int
AS
BEGIN
	SELECT c.id as ID, d.nombre as Deporte, tc.nombre as Tipo, c.nombre as Nombre, c.descripcion as Descripcion
	  FROM Cancha c
INNER JOIN ComplejoDeportivo cd ON cd.id=c.idComplejo
INNER JOIN TipoCancha tc ON tc.id=c.idTipoCancha
INNER JOIN Deporte d ON d.id=tc.idDeporte
	 WHERE c.idComplejo=@idComp
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerComplejosJoin]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerComplejosJoin] 
AS
BEGIN
		 SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, z.nombre as Zona, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
				cd.promedioEstrellas as Valoracion, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Responsable r ON r.id=cd.idResponsable
		   LEFT JOIN Estado e ON e.id=cd.idEstado
		   LEFT JOIN Zona z ON z.id=b.idZona
		   LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		   LEFT JOIN Deportista de ON de.id=zpd.idDeportista
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerComplejosOrdenValor]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <18,09,19>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerComplejosOrdenValor] 
AS
BEGIN
SELECT DISTINCT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
				cd.promedioEstrellas as Valoracion, e.nombre as Estado
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Responsable r ON r.id=cd.idResponsable
		   LEFT JOIN Estado e ON e.id=cd.idEstado
	   ORDER BY cd.promedioEstrellas DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerComplejosPorNomb]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <18,09,19>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerComplejosPorNomb] 
			    @nomb nvarchar
AS
BEGIN
SELECT DISTINCT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
				cd.promedioEstrellas as Valoracion, e.nombre as Estado
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Responsable r ON r.id=cd.idResponsable
		   LEFT JOIN Estado e ON e.id=cd.idEstado
WHERE cd.nombre LIKE '%'+ @nomb +'%'
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerServiciosPorComplejos]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Retamozo, Agustín J>
-- Create date: <11,09,19>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerServiciosPorComplejos]
	@idComp int
AS
BEGIN
	SELECT spc.id as ID, s.nombre as Servicio
	  FROM ServiciosPorComplejos spc
INNER JOIN ServicioExtra s ON s.id=spc.idServicio
	 WHERE spc.idComplejo=@idComp
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
( @prmNombre varchar(50),
  @prmEmail varchar(50),
  @prmContraseña varchar(50)
)
AS
 BEGIN
   declare @idUsuario int;

  
   BEGIN TRY
   INSERT INTO Usuario(nombre,email,contraseña)
   VALUES(@prmNombre,@prmEmail,@prmContraseña);

   set @idUsuario = (select U.id from Usuario U where U.id = SCOPE_IDENTITY());
   INSERT INTO RolesPorUsuarios(idRol,idUsuario)
   VALUES(2,@idUsuario);
   END TRY
   BEGIN CATCH
     ROLLBACK;
   END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuarioEstablecimiento]    Script Date: 27/09/2019 18:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuarioEstablecimiento]
( @prmNombre varchar(50),
  @prmEmail varchar(50),
  @prmContraseña varchar(50)
)
AS
 BEGIN
   declare @idUsuario int;

  
   BEGIN TRY
   INSERT INTO Usuario(nombre,email,contraseña)
   VALUES(@prmNombre,@prmEmail,@prmContraseña);

   set @idUsuario = (select U.id from Usuario U where U.id = SCOPE_IDENTITY());
   INSERT INTO RolesPorUsuarios(idRol,idUsuario)
   VALUES(3,@idUsuario);
   END TRY
   BEGIN CATCH
     ROLLBACK;
   END CATCH
END

GO
USE [master]
GO
ALTER DATABASE [HayEquipo] SET  READ_WRITE 
GO
