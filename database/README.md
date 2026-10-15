\# Lumina Hotel and Resorts — Base de Datos



\## Descripción del proyecto



Esta base de datos fue desarrollada para el sistema de gestión de reservaciones del hotel \*\*Lumina Hotel and Resorts\*\*, utilizando Microsoft SQL Server 2022.



Su objetivo es organizar y administrar la información de los clientes, usuarios del sistema, habitaciones, tipos de habitación, reservas y pagos. También permite consultar la disponibilidad de habitaciones y validar que las reservaciones cumplan con las reglas establecidas.



\## Tecnologías utilizadas



\- \*\*Gestor de base de datos:\*\* Microsoft SQL Server 2022.

\- \*\*Lenguaje:\*\* Transact-SQL (T-SQL).

\- \*\*Entorno de desarrollo:\*\* SQL Server Management Studio (SSMS).

\- \*\*Integración prevista:\*\* Java 21 mediante JDBC.



\## Estructura de la base de datos



La base de datos se llama `lumina\_hotel\_and\_resorts` y está compuesta por seis tablas principales.



| Tabla | Descripción |

|---|---|

| `Cliente` | Almacena los datos personales y de contacto de los clientes. |

| `Usuario` | Registra a los usuarios que administran el sistema y sus roles. |

| `TipoHabitacion` | Define los tipos de habitación, su capacidad y precio por noche. |

| `Habitacion` | Almacena el número, piso, tipo y estado de cada habitación. |

| `Reserva` | Registra las reservaciones, sus fechas, huéspedes, precios y estados. |

| `Pago` | Guarda los pagos relacionados con las reservaciones. |



\## Objetos de la base de datos



\### Índices



Se crearon índices para facilitar las consultas relacionadas con las reservas y los pagos.



\- `IX\_Reserva\_FechasEstado`: ayuda a consultar reservas por fechas y estado.

\- `IX\_Reserva\_Cliente`: facilita la búsqueda de reservas de un cliente.

\- `IX\_Reserva\_Habitacion`: ayuda a consultar las reservas de una habitación.

\- `IX\_Pago\_Reserva`: facilita la búsqueda de pagos asociados a una reserva.



\### Vista



\*\*`vw\_ReservasDetalle`\*\*



Permite consultar información detallada de las reservaciones, incluyendo:



\- Código de reserva.

\- Nombre y datos de contacto del cliente.

\- Número y tipo de habitación.

\- Fechas de entrada y salida.

\- Cantidad de noches.

\- Precio por noche y total estimado.

\- Estado de la reserva.



\### Triggers



Se implementaron tres triggers para mantener las reglas de negocio:



\- \*\*`TR\_Reserva\_FechaActualizacion`\*\*: actualiza la fecha de modificación cuando se actualiza una reserva.

\- \*\*`TR\_Reserva\_Capacidad`\*\*: evita que una reserva supere la capacidad de la habitación.

\- \*\*`TR\_Reserva\_NoSolapamiento`\*\*: impide que existan reservas pendientes o confirmadas que se superpongan para la misma habitación.



\### Procedimiento almacenado



\*\*`sp\_HabitacionesDisponibles`\*\*



Permite consultar las habitaciones disponibles según la fecha de entrada, la fecha de salida y la cantidad de huéspedes.



El procedimiento valida las fechas y la cantidad de huéspedes, considera la capacidad de las habitaciones y excluye aquellas que tienen reservas pendientes o confirmadas durante el período solicitado.



\## Reglas y validaciones



La base de datos incluye restricciones para proteger la integridad de la información:



\- Los documentos de los clientes no pueden repetirse.

\- Los nombres de usuario y correos de los usuarios deben ser únicos.

\- La capacidad de una habitación debe ser mayor que cero.

\- Los precios no pueden ser negativos.

\- La fecha de salida debe ser posterior a la fecha de entrada.

\- La cantidad de huéspedes debe ser mayor que cero.

\- Los estados de habitaciones, reservas y pagos están limitados a valores permitidos.

\- Los pagos deben tener un monto mayor que cero.

\- Las relaciones entre tablas se controlan mediante claves foráneas.



\## Instalación y ejecución



1\. Instalar Microsoft SQL Server 2022.

2\. Abrir SQL Server Management Studio (SSMS) y conectarse a la instancia de SQL Server.

3\. Abrir el archivo `.sql` que contiene el script de la base de datos.

4\. Ejecutar el script completo.

5\. Verificar que se hayan creado las seis tablas, los índices, la vista, los triggers y el procedimiento almacenado.



El script crea la base de datos `lumina\_hotel\_and\_resorts` si todavía no existe y utiliza esa base para crear sus objetos.



\*\*Importante:\*\* el script está diseñado para crear los objetos que aún no existen y actualizar la definición de la vista, los triggers y el procedimiento almacenado. No elimina ni reconstruye automáticamente las tablas existentes.



\## Ejemplo de consulta



Para consultar las reservas con sus datos relacionados:



```sql

USE lumina\_hotel\_and\_resorts;

GO



SELECT \*

FROM dbo.vw\_ReservasDetalle;

GO

```



Para consultar habitaciones disponibles para dos huéspedes:



```sql

EXEC dbo.sp\_HabitacionesDisponibles

&#x20;   @FechaEntrada = '2026-11-01',

&#x20;   @FechaSalida = '2026-11-03',

&#x20;   @Huespedes = 2;

GO

```



Las fechas del ejemplo pueden modificarse según las necesidades de la consulta.



\## Integración con el backend



La base de datos está preparada para servir como componente de almacenamiento del sistema de reservaciones del hotel. Su integración con el backend está prevista mediante Java 21 y JDBC, para que la aplicación pueda registrar clientes, administrar habitaciones, gestionar reservaciones y consultar su disponibilidad.



\## Autoría



Proyecto académico: \*\*Lumina Hotel and Resorts\*\*



Componente: Diseño y desarrollo de la base de datos.





