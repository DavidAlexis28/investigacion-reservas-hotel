IF DB_ID(N'lumina_hotel_and_resorts') IS NULL
BEGIN
    CREATE DATABASE lumina_hotel_and_resorts
END;
GO

USE lumina_hotel_and_resorts;
GO

/* ==========================
   TABLA CLIENTE
========================== */

IF OBJECT_ID(N'Cliente', N'U') IS NULL
BEGIN
    CREATE TABLE Cliente
    (
        ClienteID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Cliente PRIMARY KEY,
        Nombres NVARCHAR(80) NOT NULL,
        Apellidos NVARCHAR(80) NOT NULL,
        Documento NVARCHAR(30) NOT NULL,
        Telefono NVARCHAR(25) NULL,
        Correo NVARCHAR(254) NULL,
        FechaNacimiento DATE NULL,
        FechaRegistro DATETIME2(0) NOT NULL
            CONSTRAINT DF_Cliente_FechaRegistro DEFAULT SYSDATETIME(),
        Activo BIT NOT NULL
            CONSTRAINT DF_Cliente_Activo
            DEFAULT 1,
        CONSTRAINT UQ_Cliente_Documento
            UNIQUE (Documento),
        CONSTRAINT CK_Cliente_Correo
           /*Es para aceptar un patron basico en el coreo, no obliga a una direccion de correo especifica solo un patron que sigue cualquier correo */
           CHECK
            (
                Correo IS NULL
                OR Correo LIKE '%@%.%'
            )
    );
END;
GO


/* ==========================
   TABLA USUARIO
========================== */

IF OBJECT_ID(N'Usuario', N'U') IS NULL
BEGIN
    CREATE TABLE Usuario
    (
        UsuarioID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Usuario PRIMARY KEY,
        NombreUsuario NVARCHAR(50) NOT NULL,
        NombreCompleto NVARCHAR(160) NOT NULL,
        Correo NVARCHAR(254) NOT NULL,
        PasswordHash NVARCHAR(500) NOT NULL,
        Rol NVARCHAR(20)
            NOT NULL
            CONSTRAINT DF_Usuario_Rol
            DEFAULT N'RECEPCION',
        Activo BIT
            NOT NULL
            CONSTRAINT DF_Usuario_Activo
            DEFAULT 1,
        FechaCreacion DATETIME2(0)
            NOT NULL
            CONSTRAINT DF_Usuario_FechaCreacion
            DEFAULT SYSDATETIME(),
        CONSTRAINT UQ_Usuario_NombreUsuario
            UNIQUE (NombreUsuario),
        CONSTRAINT UQ_Usuario_Correo
            UNIQUE (Correo),
        CONSTRAINT CK_Usuario_Rol
            CHECK (
                Rol IN
                (
                    N'ADMIN',
                    N'RECEPCION',
                    N'GERENCIA'
                )
            )
    );
END;
GO


/* ==========================
   TABLA TIPO HABITACION
========================== */

IF OBJECT_ID(N'TipoHabitacion', N'U') IS NULL
BEGIN
    CREATE TABLE TipoHabitacion
    (
        TipoHabitacionID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_TipoHabitacion PRIMARY KEY,
        Nombre NVARCHAR(50) NOT NULL,
        Descripcion NVARCHAR(500) NULL,
        Capacidad INT NOT NULL,
        PrecioPorNoche DECIMAL(10,2) NOT NULL,
        Activo BIT NOT NULL
            CONSTRAINT DF_TipoHabitacion_Activo DEFAULT 1,
        CONSTRAINT UQ_TipoHabitacion_Nombre
            UNIQUE (Nombre),
        CONSTRAINT CK_TipoHabitacion_Capacidad
            CHECK (Capacidad > 0),
        CONSTRAINT CK_TipoHabitacion_Precio
            CHECK (PrecioPorNoche >= 0)
    );
END;
GO


/* ==========================
   TABLA HABITACION
========================== */

IF OBJECT_ID(N'Habitacion', N'U') IS NULL
BEGIN
    CREATE TABLE Habitacion
    (
        HabitacionID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Habitacion PRIMARY KEY,
        Numero NVARCHAR(10) NOT NULL,
        TipoHabitacionID INT NOT NULL,
        Piso INT NOT NULL,
        Estado NVARCHAR(20)
            NOT NULL
            CONSTRAINT DF_Habitacion_Estado
            DEFAULT N'DISPONIBLE',
        Observaciones NVARCHAR(300) NULL,
        CONSTRAINT UQ_Habitacion_Numero
            UNIQUE (Numero),
        CONSTRAINT FK_Habitacion_TipoHabitacion
            FOREIGN KEY (TipoHabitacionID)
            REFERENCES TipoHabitacion(TipoHabitacionID),
        CONSTRAINT CK_Habitacion_Estado
            CHECK (
                Estado IN
                (
                    N'DISPONIBLE',
                    N'MANTENIMIENTO',
                    N'FUERA_SERVICIO'
                )
                ),
        CONSTRAINT CK_Habitacion_Piso
            CHECK (Piso >= 0),
        CONSTRAINT CK_Habitacion_NumeroNumerico
        CHECK (
        TRY_CONVERT(INT, Numero) IS NOT NULL
        AND TRY_CONVERT(INT, Numero) > 0
                )
    );
END;
GO


/* ==========================
   TABLA RESERVA
========================== */

IF OBJECT_ID(N'Reserva', N'U') IS NULL
BEGIN
    CREATE TABLE Reserva
    (
        ReservaID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Reserva PRIMARY KEY,
            /* "CodigoReserva" Sirve para hacer un codigo de confirmacion de la reserva al cliente */
        CodigoReserva AS
        (
            'RES-' +
            RIGHT('00000000' +
            CAST(ReservaID AS VARCHAR(8)),8)
        ) PERSISTED,
        ClienteID INT NOT NULL,
        HabitacionID INT NOT NULL,
        UsuarioID INT NULL,
        FechaEntrada DATE NOT NULL,
        FechaSalida DATE NOT NULL,
        CantidadHuespedes INT NOT NULL,
        Estado NVARCHAR(20)
            NOT NULL
            CONSTRAINT DF_Reserva_Estado
            DEFAULT N'PENDIENTE',
        PrecioPorNoche DECIMAL(10,2) NOT NULL,
        Observaciones NVARCHAR(500) NULL,
        FechaCreacion DATETIME2(0)
            NOT NULL
            CONSTRAINT DF_Reserva_FechaCreacion
            DEFAULT SYSDATETIME(),
        FechaActualizacion DATETIME2(0) NULL,
        CONSTRAINT FK_Reserva_Cliente
            FOREIGN KEY (ClienteID)
            REFERENCES Cliente(ClienteID),
        CONSTRAINT FK_Reserva_Habitacion
            FOREIGN KEY (HabitacionID)
            REFERENCES Habitacion(HabitacionID),
        CONSTRAINT FK_Reserva_Usuario
            FOREIGN KEY (UsuarioID)
            REFERENCES Usuario(UsuarioID),
        CONSTRAINT CK_Reserva_Fechas
            CHECK (FechaSalida > FechaEntrada),
        CONSTRAINT CK_Reserva_Huespedes
            CHECK (CantidadHuespedes > 0),
        CONSTRAINT CK_Reserva_Precio
            CHECK (PrecioPorNoche >= 0),
        CONSTRAINT CK_Reserva_Estado
            CHECK (
                Estado IN
                (
                    N'PENDIENTE',
                    N'CONFIRMADA',
                    N'CANCELADA',
                    N'COMPLETADA'
                )
            )
    );
END;
GO


/* ==========================
   TABLA PAGO
========================== */

IF OBJECT_ID(N'Pago', N'U') IS NULL
BEGIN
    CREATE TABLE Pago
    (
        PagoID INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_Pago PRIMARY KEY,
        ReservaID INT NOT NULL,
        FechaPago DATETIME2(0)
            NOT NULL
            CONSTRAINT DF_Pago_FechaPago
            DEFAULT SYSDATETIME(),
        Monto DECIMAL(10,2) NOT NULL,
        MetodoPago NVARCHAR(20) NOT NULL,
        Estado NVARCHAR(20)
            NOT NULL
            CONSTRAINT DF_Pago_Estado
            DEFAULT N'REGISTRADO',
        Referencia NVARCHAR(100),
        CONSTRAINT FK_Pago_Reserva
            FOREIGN KEY (ReservaID)
            REFERENCES Reserva(ReservaID),
        CONSTRAINT CK_Pago_Monto
            CHECK (Monto > 0),
        CONSTRAINT CK_Pago_Metodo
            CHECK (
                MetodoPago IN
                (
                    N'EFECTIVO',
                    N'TARJETA',
                    N'TRANSFERENCIA',
                    N'OTRO'
                )
            ),
        CONSTRAINT CK_Pago_Estado
            CHECK (
                Estado IN
                (
                    N'REGISTRADO',
                    N'REEMBOLSADO',
                    N'ANULADO'
                )
            )
    );
END;
GO



/* ==========================
   INDICES
========================== */

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_Reserva_FechasEstado'
      AND object_id = OBJECT_ID(N'dbo.Reserva')
)
BEGIN
    CREATE INDEX IX_Reserva_FechasEstado
    ON dbo.Reserva(FechaEntrada, FechaSalida, Estado);
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_Reserva_Cliente'
      AND object_id = OBJECT_ID(N'dbo.Reserva')
)
BEGIN
    CREATE INDEX IX_Reserva_Cliente
    ON dbo.Reserva(ClienteID, FechaEntrada);
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_Reserva_Habitacion'
      AND object_id = OBJECT_ID(N'dbo.Reserva')
)
BEGIN
    CREATE INDEX IX_Reserva_Habitacion
    ON dbo.Reserva(
        HabitacionID,
        FechaEntrada,
        FechaSalida,
        Estado
    );
END;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_Pago_Reserva'
      AND object_id = OBJECT_ID(N'dbo.Pago')
)
BEGIN
    CREATE INDEX IX_Pago_Reserva
    ON dbo.Pago(ReservaID);
END;
GO



/* ==========================
   VISTA
========================== */

CREATE OR ALTER VIEW vw_ReservasDetalle
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


/* ==========================
   TRIGGER FECHA ACTUALIZACION
========================== */


CREATE OR ALTER TRIGGER TR_Reserva_FechaActualizacion
ON dbo.Reserva
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Evita que el trigger se vuelva a ejecutar
    -- por su propia actualización.
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE r
    SET FechaActualizacion = SYSDATETIME()
    FROM dbo.Reserva r
    INNER JOIN inserted i
        ON r.ReservaID = i.ReservaID;
END;
GO


/* ==========================
   VALIDAR CAPACIDAD
========================== */


CREATE OR ALTER TRIGGER TR_Reserva_Capacidad
ON Reserva
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        INNER JOIN Habitacion h
            ON i.HabitacionID = h.HabitacionID
        INNER JOIN TipoHabitacion th
            ON th.TipoHabitacionID = h.TipoHabitacionID
        WHERE i.CantidadHuespedes > th.Capacidad
    )
    BEGIN
        ;THROW 50005,
            'La cantidad de huespedes supera la capacidad de la habitacion.',
            1;
    END;
END;
GO



/* ==========================
   VALIDAR SOLAPAMIENTO
========================== */


CREATE OR ALTER TRIGGER TR_Reserva_NoSolapamiento
ON Reserva
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        INNER JOIN Reserva r
            ON r.HabitacionID = i.HabitacionID
           AND r.ReservaID <> i.ReservaID
           AND r.Estado IN
               (N'PENDIENTE', N'CONFIRMADA')
           AND i.Estado IN
               (N'PENDIENTE', N'CONFIRMADA')
           AND r.FechaEntrada < i.FechaSalida
           AND r.FechaSalida > i.FechaEntrada
    )
    BEGIN
        ;THROW 50006,
            'Existe una reserva que se superpone para esta habitacion.',
            1;
    END;
END;
GO




/* ==========================
   PROCEDIMIENTO DISPONIBLES
========================== */


CREATE OR ALTER PROCEDURE sp_HabitacionesDisponibles
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
