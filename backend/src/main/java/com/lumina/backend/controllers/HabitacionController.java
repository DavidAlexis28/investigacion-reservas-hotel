package com.lumina.backend.controllers;

import com.lumina.backend.models.Habitacion;
import com.lumina.backend.repositories.HabitacionRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/habitaciones")
@CrossOrigin(origins = "*")
public class HabitacionController {

    private final HabitacionRepository habitacionRepository;

    public HabitacionController(HabitacionRepository habitacionRepository) {
        this.habitacionRepository = habitacionRepository;
    }

    // Endpoint: GET /api/habitaciones
    @GetMapping
    public ResponseEntity<List<Habitacion>> obtenerDisponibles() {
        List<Habitacion> disponibles = habitacionRepository.findDisponibles();
        return ResponseEntity.ok(disponibles);
    }
}
