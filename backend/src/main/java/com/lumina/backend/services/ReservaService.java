package com.lumina.backend.services;

import com.lumina.backend.models.Habitacion;
import com.lumina.backend.models.Reserva;
import com.lumina.backend.repositories.HabitacionRepository;
import com.lumina.backend.repositories.ReservaRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class ReservaService {

    private final ReservaRepository reservaRepository;
    private final HabitacionRepository habitacionRepository;

    public ReservaService(ReservaRepository reservaRepository, HabitacionRepository habitacionRepository) {
        this.reservaRepository = reservaRepository;
        this.habitacionRepository = habitacionRepository;
    }

    // Algoritmo principal para crear una reserva validando disponibilidad y precio
    public Reserva crearReserva(Long habitacionId, String usuarioId, LocalDate fechaInicio, LocalDate fechaFin) {

        // 1. Validar que las fechas sean coherentes
        if (fechaFin.isBefore(fechaInicio) || fechaFin.isEqual(fechaInicio)) {
            throw new IllegalArgumentException("La fecha de fin debe ser posterior a la fecha de inicio.");
        }

        // 2. Verificar que la habitación exista
        Habitacion habitacion = habitacionRepository.findById(habitacionId)
                .orElseThrow(() -> new IllegalArgumentException("La habitación solicitada no existe."));

        // 3. Algoritmo de Disponibilidad: Buscar traslapes de fechas
        List<Reserva> traslapes = reservaRepository.findReservasTraslapadas(habitacionId, fechaInicio, fechaFin);
        if (!traslapes.isEmpty()) {
            throw new IllegalStateException("La habitación no está disponible en el rango de fechas seleccionado.");
        }

        // 4. Calcular el precio total según el número de noches
        long noches = ChronoUnit.DAYS.between(fechaInicio, fechaFin);
        BigDecimal precioTotal = habitacion.getPrecioNoche().multiply(BigDecimal.valueOf(noches));

        // 5. Construir y guardar el objeto Reserva
        Reserva nuevaReserva = new Reserva(
                null, // El ID se genera en SQL Server
                habitacionId,
                usuarioId,
                fechaInicio,
                fechaFin,
                precioTotal,
                "CONFIRMADA"
        );

        reservaRepository.save(nuevaReserva);
        return nuevaReserva;
    }
}
