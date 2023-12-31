USE [master]
GO
/****** Object:  Database [Colegio02]    Script Date: 4/11/2023 11:53:06 PM ******/
CREATE DATABASE [Colegio02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Colegio02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Colegio02.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Colegio02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Colegio02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Colegio02] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Colegio02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Colegio02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Colegio02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Colegio02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Colegio02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Colegio02] SET ARITHABORT OFF 
GO
ALTER DATABASE [Colegio02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Colegio02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Colegio02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Colegio02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Colegio02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Colegio02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Colegio02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Colegio02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Colegio02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Colegio02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Colegio02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Colegio02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Colegio02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Colegio02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Colegio02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Colegio02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Colegio02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Colegio02] SET RECOVERY FULL 
GO
ALTER DATABASE [Colegio02] SET  MULTI_USER 
GO
ALTER DATABASE [Colegio02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Colegio02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Colegio02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Colegio02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Colegio02] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Colegio02] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Colegio02', N'ON'
GO
ALTER DATABASE [Colegio02] SET QUERY_STORE = OFF
GO
USE [Colegio02]
GO
/****** Object:  Table [dbo].[Acudiente]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acudiente](
	[AcudienteIdA] [uniqueidentifier] NOT NULL,
	[Apellidos] [nvarchar](256) NULL,
	[Nombres] [nvarchar](256) NULL,
	[NumeroIdentificacion] [nvarchar](32) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Acudiente] PRIMARY KEY CLUSTERED 
(
	[AcudienteIdA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcudienteEstudiante]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcudienteEstudiante](
	[AcudienteId] [uniqueidentifier] NOT NULL,
	[EstudianteId] [uniqueidentifier] NOT NULL,
	[FechaCreacion] [date] NULL,
 CONSTRAINT [PK_AcudienteEstudiante] PRIMARY KEY CLUSTERED 
(
	[AcudienteId] ASC,
	[EstudianteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidatoEstudiante]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidatoEstudiante](
	[EstudianteId] [uniqueidentifier] NOT NULL,
	[Apellidos] [nvarchar](256) NOT NULL,
	[Nombres] [nvarchar](256) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[TipoPersona] [int] NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[EstudianteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[CargoId] [int] NOT NULL,
	[NombreCargo] [nvarchar](64) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CargosEmpleado]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargosEmpleado](
	[CargoId] [int] NOT NULL,
	[EmpleadoId] [uniqueidentifier] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[Evaluación] [int] NULL,
	[Observaciones] [nvarchar](256) NULL,
	[NumeroContrato] [nvarchar](50) NULL,
 CONSTRAINT [PK_CargosEmpleado] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC,
	[EmpleadoId] ASC,
	[FechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cupo]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cupo](
	[Cupoid] [int] NOT NULL,
	[FechaSolicitud] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Curso] [nchar](10) NULL,
	[EstudianteId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Cupo] PRIMARY KEY CLUSTERED 
(
	[Cupoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[CursoId] [int] NOT NULL,
	[Nombre] [nvarchar](32) NOT NULL,
	[Abreviatura] [nvarchar](8) NOT NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePlanEstudios]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePlanEstudios](
	[PlanDeEstudios] [int] NULL,
	[MateriaId] [int] NULL,
	[Version] [nvarchar](16) NULL,
	[Estado] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionAcudiente]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionAcudiente](
	[DireccionAcudienteid] [int] IDENTITY(1,1) NOT NULL,
	[CoordenadasA] [nvarchar](50) NULL,
	[BarrioA] [nvarchar](50) NULL,
	[LocalidadA] [nvarchar](50) NULL,
	[CiudadA] [nvarchar](50) NULL,
	[PaisA] [nchar](10) NULL,
	[AcudienteidA] [uniqueidentifier] NULL,
	[FechacreacionA] [date] NULL,
	[EstadoA] [bit] NULL,
 CONSTRAINT [PK_DireccionAcudiente] PRIMARY KEY CLUSTERED 
(
	[DireccionAcudienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionResidencia]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionResidencia](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Coordenada] [nvarchar](250) NULL,
	[Barrio] [nvarchar](250) NULL,
	[Localidad] [nvarchar](250) NULL,
	[Ciudad] [nvarchar](250) NULL,
	[Pais] [nchar](10) NULL,
	[EstudianteId] [uniqueidentifier] NULL,
	[FechaCreacion] [date] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_DireccionResidencia] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentosCupo]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentosCupo](
	[DocumentoCupoId] [int] NOT NULL,
	[NombreDocumento] [nvarchar](128) NOT NULL,
	[Documento] [image] NOT NULL,
	[CupoId] [int] NULL,
 CONSTRAINT [PK_DocumentosCupo] PRIMARY KEY CLUSTERED 
(
	[DocumentoCupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EdicionCurso]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdicionCurso](
	[EdicionCursoId] [int] NOT NULL,
	[CursoId] [int] NULL,
	[Año] [int] NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_EdicionCurso] PRIMARY KEY CLUSTERED 
(
	[EdicionCursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[EmpleadoId] [uniqueidentifier] NOT NULL,
	[Apellidos] [nvarchar](128) NOT NULL,
	[Nombres] [nvarchar](128) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudianteDocumentos]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudianteDocumentos](
	[DocumentosId] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [int] NULL,
	[NumeroDocumento] [nvarchar](32) NULL,
	[Estado] [bit] NULL,
	[Observaciones] [nvarchar](256) NULL,
	[EstudianteId] [uniqueidentifier] NULL,
	[FechaActualizacion] [date] NULL,
 CONSTRAINT [PK_EstudianteDocumentos] PRIMARY KEY CLUSTERED 
(
	[DocumentosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstitucionEducativa]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstitucionEducativa](
	[InstitucionEducativaID] [int] NOT NULL,
	[Nombre] [nvarchar](256) NOT NULL,
	[Direccion] [nvarchar](256) NOT NULL,
	[NivelEducativo] [nvarchar](64) NOT NULL,
	[Telefono] [nvarchar](32) NOT NULL,
	[Correo] [nvarchar](32) NULL,
 CONSTRAINT [PK_InstitucionEducativa] PRIMARY KEY CLUSTERED 
(
	[InstitucionEducativaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[MateriaId] [int] NOT NULL,
	[NombreMateria] [nvarchar](50) NULL,
	[Estado] [bit] NULL,
	[Version] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[MateriaId] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[MatriculaId] [uniqueidentifier] NULL,
	[EstudianteId] [uniqueidentifier] NULL,
	[EdicionCurso] [int] NULL,
	[Fecha] [date] NULL,
	[Estado] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanEstudios]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanEstudios](
	[PlanEstudiosId] [int] NOT NULL,
	[CursoId] [int] NOT NULL,
	[VigenciaInicio] [date] NOT NULL,
	[VigenciaFinalizacion] [nchar](10) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_PlanEstudios] PRIMARY KEY CLUSTERED 
(
	[PlanEstudiosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prematricula]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prematricula](
	[PreMatriculaId] [int] NOT NULL,
	[FechadeRegistro] [date] NULL,
	[FechaFinalizacion] [date] NULL,
	[CursoId] [int] NOT NULL,
	[Cupoid] [int] NOT NULL,
 CONSTRAINT [PK_MatriculaEstudiante] PRIMARY KEY CLUSTERED 
(
	[PreMatriculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestaCupo]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestaCupo](
	[RespuestaCupoId] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [int] NOT NULL,
	[Observaciones] [nvarchar](256) NULL,
	[FechaRespuesta] [date] NULL,
	[EmpleadoId] [uniqueidentifier] NOT NULL,
	[CupoId] [int] NOT NULL,
 CONSTRAINT [PK_RespuestaCupo] PRIMARY KEY CLUSTERED 
(
	[RespuestaCupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoportesAcademicosEmpleado]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoportesAcademicosEmpleado](
	[SoporteAcademicoId] [int] NOT NULL,
	[NivelAcademico] [nvarchar](64) NOT NULL,
	[Modalidad] [nvarchar](50) NOT NULL,
	[FechaGraduacion] [date] NULL,
	[TituloObtenido] [nvarchar](128) NULL,
	[Institucion] [nvarchar](256) NOT NULL,
	[EmpleadoId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SoportesAcademicosEmpleado] PRIMARY KEY CLUSTERED 
(
	[SoporteAcademicoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoportesLaboralesEmpleado]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoportesLaboralesEmpleado](
	[SooporteLaboralId] [int] NOT NULL,
	[Nombre] [nvarchar](64) NULL,
	[FechaInicio] [date] NULL,
	[FechaFinalizacion] [date] NULL,
	[FuncionesDesarrolladas] [nvarchar](max) NULL,
	[EmpleadoId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SoportesLaboralesEmpleado] PRIMARY KEY CLUSTERED 
(
	[SooporteLaboralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBCURSOS]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBCURSOS](
	[SubcursoId] [int] NOT NULL,
	[Nombre] [nvarchar](32) NOT NULL,
	[Abreviatura] [nvarchar](32) NOT NULL,
	[Estado] [bit] NOT NULL,
	[CursoId] [int] NOT NULL,
 CONSTRAINT [PK_SUBCURSOS] PRIMARY KEY CLUSTERED 
(
	[SubcursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefonoAcudiente]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefonoAcudiente](
	[TelefonoAcudienteid] [int] IDENTITY(1,1) NOT NULL,
	[NumeroA] [nvarchar](50) NOT NULL,
	[IndicativoA] [nvarchar](50) NULL,
	[TipoTelefonoA] [int] NULL,
	[AcudienteidA] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TelefonoAcudiente] PRIMARY KEY CLUSTERED 
(
	[TelefonoAcudienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefonosEstudiante]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefonosEstudiante](
	[TelefonoId] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](16) NOT NULL,
	[Indicativo] [nvarchar](4) NULL,
	[TipoTelefono] [int] NULL,
	[EstudianteId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TelefonosEstudiante] PRIMARY KEY CLUSTERED 
(
	[TelefonoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 4/11/2023 11:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[TipoDocumentoId] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [nvarchar](256) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_TiposDocumento] PRIMARY KEY CLUSTERED 
(
	[TipoDocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DireccionResidencia] ADD  CONSTRAINT [DF_DireccionResidencia_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[DireccionResidencia] ADD  CONSTRAINT [DF_DireccionResidencia_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[EstudianteDocumentos] ADD  CONSTRAINT [DF_EstudianteDocumentos_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[EstudianteDocumentos] ADD  CONSTRAINT [DF_EstudianteDocumentos_FechaActualizacion]  DEFAULT (getdate()) FOR [FechaActualizacion]
GO
ALTER TABLE [dbo].[AcudienteEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_AcudienteEstudiante_Acudiente] FOREIGN KEY([AcudienteId])
REFERENCES [dbo].[Acudiente] ([AcudienteIdA])
GO
ALTER TABLE [dbo].[AcudienteEstudiante] CHECK CONSTRAINT [FK_AcudienteEstudiante_Acudiente]
GO
ALTER TABLE [dbo].[AcudienteEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_AcudienteEstudiante_Estudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[AcudienteEstudiante] CHECK CONSTRAINT [FK_AcudienteEstudiante_Estudiante]
GO
ALTER TABLE [dbo].[CargosEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_CargosEmpleado_Cargos] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargos] ([CargoId])
GO
ALTER TABLE [dbo].[CargosEmpleado] CHECK CONSTRAINT [FK_CargosEmpleado_Cargos]
GO
ALTER TABLE [dbo].[CargosEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_CargosEmpleado_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[CargosEmpleado] CHECK CONSTRAINT [FK_CargosEmpleado_Empleados]
GO
ALTER TABLE [dbo].[Cupo]  WITH CHECK ADD  CONSTRAINT [FK_Cupo_CandidatoEstudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[Cupo] CHECK CONSTRAINT [FK_Cupo_CandidatoEstudiante]
GO
ALTER TABLE [dbo].[DetallePlanEstudios]  WITH CHECK ADD  CONSTRAINT [FK_DetallePlanEstudios_Materias] FOREIGN KEY([MateriaId], [Version])
REFERENCES [dbo].[Materias] ([MateriaId], [Version])
GO
ALTER TABLE [dbo].[DetallePlanEstudios] CHECK CONSTRAINT [FK_DetallePlanEstudios_Materias]
GO
ALTER TABLE [dbo].[DetallePlanEstudios]  WITH CHECK ADD  CONSTRAINT [FK_DetallePlanEstudios_PlanEstudios] FOREIGN KEY([PlanDeEstudios])
REFERENCES [dbo].[PlanEstudios] ([PlanEstudiosId])
GO
ALTER TABLE [dbo].[DetallePlanEstudios] CHECK CONSTRAINT [FK_DetallePlanEstudios_PlanEstudios]
GO
ALTER TABLE [dbo].[DireccionAcudiente]  WITH CHECK ADD  CONSTRAINT [FK_DireccionAcudiente_Acudiente] FOREIGN KEY([AcudienteidA])
REFERENCES [dbo].[Acudiente] ([AcudienteIdA])
GO
ALTER TABLE [dbo].[DireccionAcudiente] CHECK CONSTRAINT [FK_DireccionAcudiente_Acudiente]
GO
ALTER TABLE [dbo].[DireccionResidencia]  WITH CHECK ADD  CONSTRAINT [FK_DireccionResidencia_Estudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[DireccionResidencia] CHECK CONSTRAINT [FK_DireccionResidencia_Estudiante]
GO
ALTER TABLE [dbo].[DocumentosCupo]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosCupo_Cupo] FOREIGN KEY([CupoId])
REFERENCES [dbo].[Cupo] ([Cupoid])
GO
ALTER TABLE [dbo].[DocumentosCupo] CHECK CONSTRAINT [FK_DocumentosCupo_Cupo]
GO
ALTER TABLE [dbo].[EdicionCurso]  WITH CHECK ADD  CONSTRAINT [FK_EdicionCurso_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[EdicionCurso] CHECK CONSTRAINT [FK_EdicionCurso_Cursos]
GO
ALTER TABLE [dbo].[EstudianteDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_EstudianteDocumentos_Estudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[EstudianteDocumentos] CHECK CONSTRAINT [FK_EstudianteDocumentos_Estudiante]
GO
ALTER TABLE [dbo].[EstudianteDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_EstudianteDocumentos_TiposDocumento] FOREIGN KEY([TipoDocumento])
REFERENCES [dbo].[TiposDocumento] ([TipoDocumentoId])
GO
ALTER TABLE [dbo].[EstudianteDocumentos] CHECK CONSTRAINT [FK_EstudianteDocumentos_TiposDocumento]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_CandidatoEstudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_CandidatoEstudiante]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_EdicionCurso] FOREIGN KEY([EdicionCurso])
REFERENCES [dbo].[EdicionCurso] ([EdicionCursoId])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_EdicionCurso]
GO
ALTER TABLE [dbo].[PlanEstudios]  WITH CHECK ADD  CONSTRAINT [FK_PlanEstudios_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[PlanEstudios] CHECK CONSTRAINT [FK_PlanEstudios_Cursos]
GO
ALTER TABLE [dbo].[Prematricula]  WITH CHECK ADD  CONSTRAINT [FK_Prematricula_Cupo] FOREIGN KEY([Cupoid])
REFERENCES [dbo].[Cupo] ([Cupoid])
GO
ALTER TABLE [dbo].[Prematricula] CHECK CONSTRAINT [FK_Prematricula_Cupo]
GO
ALTER TABLE [dbo].[Prematricula]  WITH CHECK ADD  CONSTRAINT [FK_Prematricula_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[Prematricula] CHECK CONSTRAINT [FK_Prematricula_Cursos]
GO
ALTER TABLE [dbo].[RespuestaCupo]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCupo_Cupo] FOREIGN KEY([CupoId])
REFERENCES [dbo].[Cupo] ([Cupoid])
GO
ALTER TABLE [dbo].[RespuestaCupo] CHECK CONSTRAINT [FK_RespuestaCupo_Cupo]
GO
ALTER TABLE [dbo].[RespuestaCupo]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCupo_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[RespuestaCupo] CHECK CONSTRAINT [FK_RespuestaCupo_Empleados]
GO
ALTER TABLE [dbo].[SoportesAcademicosEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_SoportesAcademicosEmpleado_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[SoportesAcademicosEmpleado] CHECK CONSTRAINT [FK_SoportesAcademicosEmpleado_Empleados]
GO
ALTER TABLE [dbo].[SoportesLaboralesEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_SoportesLaboralesEmpleado_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[SoportesLaboralesEmpleado] CHECK CONSTRAINT [FK_SoportesLaboralesEmpleado_Empleados]
GO
ALTER TABLE [dbo].[SUBCURSOS]  WITH CHECK ADD  CONSTRAINT [FK_SUBCURSOS_Cursos] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Cursos] ([CursoId])
GO
ALTER TABLE [dbo].[SUBCURSOS] CHECK CONSTRAINT [FK_SUBCURSOS_Cursos]
GO
ALTER TABLE [dbo].[TelefonoAcudiente]  WITH CHECK ADD  CONSTRAINT [FK_TelefonoAcudiente_Acudiente] FOREIGN KEY([AcudienteidA])
REFERENCES [dbo].[Acudiente] ([AcudienteIdA])
GO
ALTER TABLE [dbo].[TelefonoAcudiente] CHECK CONSTRAINT [FK_TelefonoAcudiente_Acudiente]
GO
ALTER TABLE [dbo].[TelefonosEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_TelefonosEstudiante_Estudiante] FOREIGN KEY([EstudianteId])
REFERENCES [dbo].[CandidatoEstudiante] ([EstudianteId])
GO
ALTER TABLE [dbo].[TelefonosEstudiante] CHECK CONSTRAINT [FK_TelefonosEstudiante_Estudiante]
GO
USE [master]
GO
ALTER DATABASE [Colegio02] SET  READ_WRITE 
GO
