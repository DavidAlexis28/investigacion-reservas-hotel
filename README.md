# Sistema de Gestión y Reservas de Hotel (Java 21, JDBC y SQL Server 2022)

## 1. Justificación y Objetivos del Proyecto
### Justificación Técnica
Esta investigación permite conocer cómo funciona el sistema de reservas del hotel desarrollado con Java 21, JDBC y SQL Server 2022, especialmente cuando aumenta la cantidad de datos almacenados. Se comprobará el rendimiento de las operaciones registrando los tiempos de respuesta bajo diferentes volúmenes de datos para proponer mejoras basadas en evidencia y no en suposiciones.

### Objetivo General
Desarrollar e implementar un sistema de gestión de reservas de hotel para optimizar el control de disponibilidad, registro de clientes y procesamiento de transacciones utilizando Java y bases de datos relacionales.

### Objetivos Específicos
1. **Implementar** una arquitectura robusta mediante Java y SQL Server 2022 para la persistencia eficiente de reservas y huéspedes.
2. **Medir** los tiempos de respuesta del sistema en la ejecución de transacciones bajo diferentes cargas de prueba.
3. **Comparar** el rendimiento y estabilidad de las consultas en escenarios de 100, 500, 1,000 y 1,500 registros simultáneos.

---

## 2. Búsqueda Documentada y Matriz de Antecedentes
### Criterios de Búsqueda
* **Fuentes consultadas:** IEEE Xplore, Google Scholar, repositorios académicos y GitHub.
* **Palabras clave:** *Hotel reservation system*, *Java JDBC performance*, *SQL Server transaction optimization*, *relational database benchmarking*.
* **Rango temporal:** Investigaciones publicadas entre 2021 y 2026.

### Matriz de Antecedentes
| Autor(es) y Año | Título del Proyecto / Artículo | Objetivo Principal | Tecnologías | Resultados Destacados | Aporte al Proyecto |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Pérez et al. (2024)** | Sistema web de reservas con arquitectura distribuida | Optimizar procesos y control de habitaciones. | Java, SQL Server, JDBC | Reducción de latencia en un 30% con consultas indexadas. | Referencia para el diseño de la capa de datos en SQL Server. |
| **Gómez & Silva (2023)** | Evaluación de rendimiento en arquitecturas de gestión | Comparar la latencia bajo alta concurrencia. | Java, SQL Server, JMeter | Mantiene la latencia por debajo de 500 ms en pruebas de estrés. | Metodología para el banco de pruebas de rendimiento. |
| **Rodríguez (2025)** | Implementación de conectividad JDBC para sincronización | Garantizar consistencia de datos y transacciones. | Java JDBC, SQL Server | Coherencia de inventarios en transacciones concurrentes. | Soporte metodológico para el control en tiempo real. |

---

## 3. Evidencia Técnica y Banco de Pruebas (Test Bank)
Evaluación proyectada del comportamiento del sistema frente al incremento progresivo de volumen de datos y peticiones concurrentes:

| Escenario | Carga de Transacciones | Tiempo de Respuesta Esperado | Consumo Estimado (CPU/Memoria) | Estado / Diagnóstico |
| :--- | :--- | :--- | :--- | :--- |
| **Escenario 1** | 100 registros | 45 ms | Básico (~5%) | **Óptimo:** Operación fluida sin latencia perceptible. |
| **Escenario 2** | 500 registros | 120 ms | Estable (~15%) | **Normal:** Carga controlada estándar. |
| **Escenario 3** | 1,000 registros | 280 ms | Moderado (~30%) | **Aceptable:** Desempeño adecuado y tiempo razonable. |
| **Escenario 4** | 1,500 registros | 480 ms | Elevado (~55%) | **Requiere Monitoreo:** Límite operativo recomendado. |
