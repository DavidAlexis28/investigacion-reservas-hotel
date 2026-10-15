USE [master]
GO
/****** Objeto: Database [lumina_hotel_and_resorts] Fecha de script: 15/10/2026 15:07:27 ******/
CREATE DATABASE [lumina_hotel_and_resorts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lumina_hotel_and_resorts', FILENAME = N'C:\Users\Hector Moreno\Desktop\MSSQL17.MSSQLSERVER\MSSQL\DATA\lumina_hotel_and_resorts.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lumina_hotel_and_resorts_log', FILENAME = N'C:\Users\Hector Moreno\Desktop\MSSQL17.MSSQLSERVER\MSSQL\DATA\lumina_hotel_and_resorts_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lumina_hotel_and_resorts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ARITHABORT OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET RECOVERY FULL 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET  MULTI_USER 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET QUERY_STORE = ON
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [lumina_hotel_and_resorts]
GO
/****** Objeto: Table [dbo].[Cliente] Fecha de script: 15/10/2026 15:07:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](80) NOT NULL,
	[Apellidos] [nvarchar](80) NOT NULL,
	[Documento] [nvarchar](30) NOT NULL,
	[Telefono] [nvarchar](25) NULL,
	[Correo] [nvarchar](254) NULL,
	[FechaNacimiento] [date] NULL,
	[FechaRegistro] [datetime2](0) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Cliente_Documento] UNIQUE NONCLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[TipoHabitacion] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[TipoHabitacionID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Capacidad] [int] NOT NULL,
	[PrecioPorNoche] [decimal](10, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[TipoHabitacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TipoHabitacion_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Habitacion] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[HabitacionID] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](10) NOT NULL,
	[TipoHabitacionID] [int] NOT NULL,
	[Piso] [int] NOT NULL,
	[Estado] [nvarchar](20) NOT NULL,
	[Observaciones] [nvarchar](300) NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[HabitacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Habitacion_Numero] UNIQUE NONCLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Reserva] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[ReservaID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoReserva]  AS ('RES-'+right('00000000'+CONVERT([varchar](8),[ReservaID]),(8))) PERSISTED,
	[ClienteID] [int] NOT NULL,
	[HabitacionID] [int] NOT NULL,
	[UsuarioID] [int] NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NOT NULL,
	[CantidadHuespedes] [int] NOT NULL,
	[Estado] [nvarchar](20) NOT NULL,
	[PrecioPorNoche] [decimal](10, 2) NOT NULL,
	[Observaciones] [nvarchar](500) NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
	[FechaActualizacion] [datetime2](0) NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[ReservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: View [dbo].[vw_ReservasDetalle] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/* ==========================
   VISTA
========================== */

CREATE   VIEW [dbo].[vw_ReservasDetalle]
AS
SELECT
    r.ReservaID,
    r.CodigoReserva,
    r.ClienteID,
    CONCAT(c.Nombres,' ',c.Apellidos)
        AS NombreCliente,
    c.Documento,
    c.Telefono,
    c.Correo,
    r.HabitacionID,
    h.Numero AS NumeroHabitacion,
    th.Nombre AS TipoHabitacion,
    r.FechaEntrada,
    r.FechaSalida,
    DATEDIFF(
        DAY,
        r.FechaEntrada,
        r.FechaSalida
    ) AS Noches,
    r.CantidadHuespedes,
    r.PrecioPorNoche,
    CAST(
        DATEDIFF(
            DAY,
            r.FechaEntrada,
            r.FechaSalida
        )
        *
        r.PrecioPorNoche
        AS DECIMAL(10,2)
    ) AS TotalEstimado,
    r.Estado,
    r.Observaciones,
    r.FechaCreacion
FROM Reserva r
INNER JOIN Cliente c
ON c.ClienteID=r.ClienteID
INNER JOIN Habitacion h
ON h.HabitacionID=r.HabitacionID
INNER JOIN TipoHabitacion th
ON th.TipoHabitacionID=h.TipoHabitacionID;
GO
/****** Objeto: Table [dbo].[Pago] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[PagoID] [int] IDENTITY(1,1) NOT NULL,
	[ReservaID] [int] NOT NULL,
	[FechaPago] [datetime2](0) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[MetodoPago] [nvarchar](20) NOT NULL,
	[Estado] [nvarchar](20) NOT NULL,
	[Referencia] [nvarchar](100) NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[PagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Usuario] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[NombreCompleto] [nvarchar](160) NOT NULL,
	[Correo] [nvarchar](254) NOT NULL,
	[PasswordHash] [nvarchar](500) NOT NULL,
	[Rol] [nvarchar](20) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Usuario_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Usuario_NombreUsuario] UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Index [IX_Pago_Reserva] Fecha de script: 15/10/2026 15:07:28 ******/
CREATE NONCLUSTERED INDEX [IX_Pago_Reserva] ON [dbo].[Pago]
(
	[ReservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto: Index [IX_Reserva_Cliente] Fecha de script: 15/10/2026 15:07:28 ******/
CREATE NONCLUSTERED INDEX [IX_Reserva_Cliente] ON [dbo].[Reserva]
(
	[ClienteID] ASC,
	[FechaEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Objeto: Index [IX_Reserva_FechasEstado] Fecha de script: 15/10/2026 15:07:28 ******/
CREATE NONCLUSTERED INDEX [IX_Reserva_FechasEstado] ON [dbo].[Reserva]
(
	[FechaEntrada] ASC,
	[FechaSalida] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Objeto: Index [IX_Reserva_Habitacion] Fecha de script: 15/10/2026 15:07:28 ******/
CREATE NONCLUSTERED INDEX [IX_Reserva_Habitacion] ON [dbo].[Reserva]
(
	[HabitacionID] ASC,
	[FechaEntrada] ASC,
	[FechaSalida] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_FechaRegistro]  DEFAULT (sysdatetime()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Habitacion] ADD  CONSTRAINT [DF_Habitacion_Estado]  DEFAULT (N'DISPONIBLE') FOR [Estado]
GO
ALTER TABLE [dbo].[Pago] ADD  CONSTRAINT [DF_Pago_FechaPago]  DEFAULT (sysdatetime()) FOR [FechaPago]
GO
ALTER TABLE [dbo].[Pago] ADD  CONSTRAINT [DF_Pago_Estado]  DEFAULT (N'REGISTRADO') FOR [Estado]
GO
ALTER TABLE [dbo].[Reserva] ADD  CONSTRAINT [DF_Reserva_Estado]  DEFAULT (N'PENDIENTE') FOR [Estado]
GO
ALTER TABLE [dbo].[Reserva] ADD  CONSTRAINT [DF_Reserva_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[TipoHabitacion] ADD  CONSTRAINT [DF_TipoHabitacion_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Rol]  DEFAULT (N'RECEPCION') FOR [Rol]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoHabitacion] FOREIGN KEY([TipoHabitacionID])
REFERENCES [dbo].[TipoHabitacion] ([TipoHabitacionID])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoHabitacion]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Reserva] FOREIGN KEY([ReservaID])
REFERENCES [dbo].[Reserva] ([ReservaID])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Reserva]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ClienteID])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY([HabitacionID])
REFERENCES [dbo].[Habitacion] ([HabitacionID])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Usuario]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_Cliente_Correo] CHECK  (([Correo] IS NULL OR [Correo] like '%@%.%'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_Cliente_Correo]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [CK_Habitacion_Estado] CHECK  (([Estado]=N'FUERA_SERVICIO' OR [Estado]=N'MANTENIMIENTO' OR [Estado]=N'DISPONIBLE'))
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [CK_Habitacion_Estado]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [CK_Habitacion_NumeroNumerico] CHECK  ((TRY_CAST([Numero] AS [int]) IS NOT NULL AND TRY_CAST([Numero] AS [int])>(0)))
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [CK_Habitacion_NumeroNumerico]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [CK_Habitacion_Piso] CHECK  (([Piso]>=(0)))
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [CK_Habitacion_Piso]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [CK_Pago_Estado] CHECK  (([Estado]=N'ANULADO' OR [Estado]=N'REEMBOLSADO' OR [Estado]=N'REGISTRADO'))
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [CK_Pago_Estado]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [CK_Pago_Metodo] CHECK  (([MetodoPago]=N'OTRO' OR [MetodoPago]=N'TRANSFERENCIA' OR [MetodoPago]=N'TARJETA' OR [MetodoPago]=N'EFECTIVO'))
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [CK_Pago_Metodo]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [CK_Pago_Monto] CHECK  (([Monto]>(0)))
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [CK_Pago_Monto]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_Reserva_Estado] CHECK  (([Estado]=N'COMPLETADA' OR [Estado]=N'CANCELADA' OR [Estado]=N'CONFIRMADA' OR [Estado]=N'PENDIENTE'))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_Reserva_Estado]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_Reserva_Fechas] CHECK  (([FechaSalida]>[FechaEntrada]))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_Reserva_Fechas]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_Reserva_Huespedes] CHECK  (([CantidadHuespedes]>(0)))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_Reserva_Huespedes]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [CK_Reserva_Precio] CHECK  (([PrecioPorNoche]>=(0)))
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [CK_Reserva_Precio]
GO
ALTER TABLE [dbo].[TipoHabitacion]  WITH CHECK ADD  CONSTRAINT [CK_TipoHabitacion_Capacidad] CHECK  (([Capacidad]>(0)))
GO
ALTER TABLE [dbo].[TipoHabitacion] CHECK CONSTRAINT [CK_TipoHabitacion_Capacidad]
GO
ALTER TABLE [dbo].[TipoHabitacion]  WITH CHECK ADD  CONSTRAINT [CK_TipoHabitacion_Precio] CHECK  (([PrecioPorNoche]>=(0)))
GO
ALTER TABLE [dbo].[TipoHabitacion] CHECK CONSTRAINT [CK_TipoHabitacion_Precio]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [CK_Usuario_Rol] CHECK  (([Rol]=N'GERENCIA' OR [Rol]=N'RECEPCION' OR [Rol]=N'ADMIN'))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [CK_Usuario_Rol]
GO
/****** Objeto: StoredProcedure [dbo].[sp_HabitacionesDisponibles] Fecha de script: 15/10/2026 15:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/* ==========================
   PROCEDIMIENTO DISPONIBLES
========================== */


CREATE   PROCEDURE [dbo].[sp_HabitacionesDisponibles]
(
    @FechaEntrada DATE,
    @FechaSalida DATE,
    @Huespedes INT = 1
)
AS
BEGIN
    SET NOCOUNT ON;
    IF @FechaEntrada IS NULL
       OR @FechaSalida IS NULL
       OR @FechaSalida <= @FechaEntrada
    BEGIN
        ;THROW 50010,
            'Las fechas de entrada y salida no son validas.',
            1;
    END;
    IF @Huespedes IS NULL OR @Huespedes <= 0
    BEGIN
        ;THROW 50011,
            'La cantidad de huespedes debe ser mayor que cero.',
            1;
    END;
    SELECT
        h.HabitacionID,
        h.Numero,
        h.Piso,
        h.Estado,
        th.TipoHabitacionID,
        th.Nombre,
        th.Capacidad,
        th.PrecioPorNoche
    FROM dbo.Habitacion h
    INNER JOIN dbo.TipoHabitacion th
        ON th.TipoHabitacionID = h.TipoHabitacionID
    WHERE h.Estado = N'DISPONIBLE'
      AND th.Activo = 1
      AND th.Capacidad >= @Huespedes
      AND NOT EXISTS
      (
          SELECT 1
          FROM dbo.Reserva r
          WHERE r.HabitacionID = h.HabitacionID
            AND r.Estado IN
                (N'PENDIENTE', N'CONFIRMADA')
            AND r.FechaEntrada < @FechaSalida
            AND r.FechaSalida > @FechaEntrada
      )
    ORDER BY th.PrecioPorNoche;
END;
GO
USE [master]
GO
ALTER DATABASE [lumina_hotel_and_resorts] SET  READ_WRITE 
GO
