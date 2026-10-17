package com.lumina.backend.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reserva {
    private Integer reservaID;
    private String codigoReserva;   // Generado automáticamente por SQL Server (ej: RES-00000001)
    private Integer clienteID;
    private Integer habitacionID;
    private Integer usuarioID;
    private LocalDate fechaEntrada;
    private LocalDate fechaSalida;
    private Integer cantidadHuespedes;
    private String estado;          // 'PENDIENTE', 'CONFIRMADA', 'CANCELADA', 'COMPLETADA'
    private BigDecimal precioPorNoche;
    private String observaciones;
    private LocalDateTime fechaCreacion;
}