# Lumina Hotels and Resorts

[![Entrega 1](https://img.shields.io/badge/Entrega-v0.1--perfil-blue.svg)](#estado-del-proyecto)
[![Licencia](https://img.shields.io/badge/Licencia-MIT-green.svg)](LICENSE)
[![Java](https://img.shields.io/badge/Java-21%20LTS-orange.svg)](https://openjdk.org/)
[![Maven](https://img.shields.io/badge/Maven-Build-blue.svg)](https://maven.apache.org/)
[![Database](https://img.shields.io/badge/SQL%20Server-2022-red.svg)](https://www.microsoft.com/sql-server)
[![Android](https://img.shields.io/badge/Android-Gradle-blueviolet.svg)](https://developer.android.com/)

> Proyecto de desarrollo de software e investigación formativa para la asignatura **Programación 3 (Sección 03)**, Facultad de Informática y Ciencias Aplicadas.

---

## Integrantes del Equipo

| Nº | Carnet | Nombre Completo | Usuario GitHub |
| :-: | :-: | :--- | :--- |
| 1 | 27-4135-2022 | AGUILAR ASCENCIO DAVID ALEXIS | `@DavidAlexis28` |
| 2 | 25-2531-2022 | AMAYA HERNANDEZ ANGEL OTONIEL | `?` |
| 3 | 25-0574-2024 | LARA LOPEZ CESAR GONZALO | `@cesarlaralopezlaralopez-prog` |
| 4 | 17-0613-2024 | MENJIVAR CHAVEZ RICARDO FABIO | `@Fabio-Menjivar` |
| 5 | 25-4222-2024 | MIRANDA GUZMAN ERICK ARMANDO | `?` |
| 6 | 25-4370-2023 | MORENO MEJIA HECTOR ANTONIO | `@hector-more` |
| 7 | 17-2696-2024 | REYES RODRIGUEZ SILVIA ARELY | `@SilviaReyes05` |

- **Docente:** Eliseo Ernesto Hernández Díaz  
- **Institución:** Facultad de Informática y Ciencias Aplicadas  
- **Fecha:** 18 de Septiembre de 2026  

---

## Descripción del Proyecto
**Lumina Hotels and Resorts** es una plataforma integral diseñada para la gestión automatizada de operaciones hoteleras. El sistema permite administrar de forma centralizada la disponibilidad de habitaciones, el registro de clientes, la ejecución de transacciones de reserva y el control administrativo. 

Para garantizar un rendimiento óptimo bajo procesamiento transaccional en línea (OLTP), la arquitectura está compuesta por un **Backend modular en Java 21 con Maven y JDBC sobre SQL Server 2022**, acoplado a una **Aplicación Móvil nativa en Android Studio**, integrando buenas prácticas de ingeniería de software y control estricto de calidad y rendimiento.

---

## Características Principales del Sistema
* **Gestión de Habitaciones y Tipologías:** Consulta en tiempo real de habitaciones disponibles, filtrado por características y tarifas.
* **Motor de Reservas Transaccionales:** Creación, modificación, consulta y cancelación segura de reservas mediante sentencias preparadas en JDBC (`PreparedStatement`).
* **Arquitectura Monorepo Escalable:** Estructura modular dividida claramente entre la lógica del backend (`backend/`) y el cliente móvil (`mobile/`).
* **Monitoreo y Calidad:** Integración continua mediante GitHub Actions, pruebas automatizadas y registros de decisiones arquitectónicas (ADRs).

---

## Delimitación Tecnológica

| Componente | Tecnología / Especificación | Propósito |
| :--- | :--- | :--- |
| **Backend / Lógica** | Java 21 (LTS) / Maven | Lógica de negocio y gestión de dependencias del servidor |
| **Persistencia / Conexión** | JDBC (`mssql-jdbc`) | Comunicación estandarizada de alto rendimiento con la base de datos |
| **Motor de Base de Datos** | Microsoft SQL Server 2022 | Almacenamiento relacional de reservas, usuarios e inventario |
| **Cliente Móvil** | Android Studio (Gradle / Kotlin) | Interfaz de usuario para clientes y gestión de reservas en dispositivos móviles |
| **Entorno de Desarrollo** | IntelliJ IDEA / Android Studio | Compilación, despliegue y pruebas locales |
| **Control de Versiones** | Git / GitHub (CI/CD) | Gestión colaborativa de código y pipelines automatizados |

---

## Estructura del Repositorio

```text
investigacion-reservas-hotel/
│
├── .github/
│   └── workflows/
│       └── ci.yml                      # Flujo de Integración Continua (GitHub Actions)
│
├── docs/                               # Documentación formal y entregables académicos
│   ├── entrega1-perfil.md              # Perfil de investigación
│   ├── adr/                            # Registros de decisiones arquitectónicas
│   └── entorno.md                      # Especificaciones del entorno reproducible
│
├── backend/                            # Proyecto Java Maven (IntelliJ IDEA)
│   ├── pom.xml                         # Configuración de Maven y dependencias JDBC
│   └── src/                            # Código fuente del backend y pruebas unitarias
│
├── mobile/                             # Aplicación Móvil (Android Studio / Gradle)
│   ├── app/                            # Módulo principal de la app
│   └── build.gradle                    # Configuración de compilación móvil
│
├── README.md                           # Portada general y metadatos del proyecto
├── LICENSE                             # Licencia de código abierto
└── .gitignore                          # Exclusiones de archivos del sistema e IDEs
