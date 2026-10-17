package com.lumina.backend.controllers;

import com.lumina.backend.dto.ReservaRequestDTO;
import com.lumina.backend.models.Reserva;
import com.lumina.backend.services.ReservaService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/reservas")
@CrossOrigin(origins = "*")
public class ReservaController {

    private final ReservaService reservaService;

    public ReservaController(ReservaService reservaService) {
        this.reservaService = reservaService;
    }

    // Endpoint: POST /api/reservas
    @PostMapping
    public ResponseEntity<?> crearReserva(@RequestBody ReservaRequestDTO request) {
        try {
            Reserva reserva = reservaService.crearReserva(
                    request.getHabitacionId(),
                    request.getUsuarioId(),
                    request.getFechaInicio(),
                    request.getFechaFin()
            );
            return ResponseEntity.status(HttpStatus.CREATED).body(reserva);
        } catch (IllegalArgumentException | IllegalStateException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al procesar la reserva: " + e.getMessage());
        }
    }
}
