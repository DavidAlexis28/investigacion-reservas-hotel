# **Plan de análisis estadístico, amenazas a la validez y consideraciones éticas**



## **1. Plan de análisis estadístico**



El análisis estadístico permitirá evaluar el comportamiento y el rendimiento de las consultas a la base de datos del sistema de automatización de un hotel, desarrollado en Java 21 y conectado a SQL Server 2022 mediante JDBC. El propósito será determinar cómo influye el aumento de la cantidad de registros en el tiempo de respuesta de las consultas relacionadas con la gestión de clientes, habitaciones y reservas.



#### **Recolección de datos**

Se realizarán pruebas con diferentes cantidades de registros almacenados en la base de datos, manteniendo las mismas condiciones de ejecución siempre que sea posible. Se registrará el tiempo de respuesta de cada consulta en milisegundos (ms). Las pruebas incluirán consultas para registrar, buscar, actualizar y eliminar información, según corresponda.



#### **Medidas estadísticas**

Los datos obtenidos se analizarán utilizando las siguientes medidas:

•Media: permitirá calcular el tiempo promedio de respuesta de las consultas.

•Mediana: permitirá identificar el tiempo central de las mediciones y reducir la influencia de valores excepcionalmente altos.



•Mínimo y máximo: mostrarán los tiempos de respuesta más bajo y más alto registrados.



•Desviación estándar: permitirá conocer cuánto varían los tiempos obtenidos entre las diferentes ejecuciones.



•Porcentaje de variación: permitirá comparar el cambio del tiempo de respuesta entre distintos tamaños de la base de datos.





**Procedimiento de análisis**

Las pruebas se ejecutarán varias veces para cada cantidad de registros. Se calculará el promedio de los tiempos obtenidos y se compararán los resultados mediante tablas y gráficos. En los gráficos se utilizará la cantidad de registros como variable independiente y el tiempo de respuesta como variable dependiente.



Se analizará si el tiempo de respuesta aumenta a medida que crece la cantidad de información almacenada. También se identificarán las consultas que presenten mayores tiempos de ejecución y se examinará si la utilización de índices u otras técnicas de optimización produce diferencias en el rendimiento.



Los resultados permitirán describir el comportamiento del sistema bajo las condiciones evaluadas. Las conclusiones se limitarán a las consultas, cantidades de registros y condiciones de prueba utilizadas.



## **2. Amenazas a la validez**



Durante el desarrollo de la investigación pueden presentarse factores que afecten la precisión y confiabilidad de los resultados.



**Amenazas internas:** las mediciones pueden verse afectadas por otros programas que se estén ejecutando en la computadora, el uso de memoria RAM, la carga del procesador, la caché de SQL Server y la conexión entre Java y la base de datos.



**Amenazas de medición:** pueden producirse diferencias entre las mediciones debido a la precisión del método utilizado para calcular el tiempo, a la ejecución simultánea de otras tareas o a que algunas consultas se ejecuten por primera vez y otras ya tengan información almacenada en caché.



**Amenazas de validez externa:** los resultados obtenidos en una computadora y con una cantidad específica de registros no necesariamente representan el rendimiento que tendría el sistema en un hotel real con más usuarios, equipos diferentes o mayor volumen de información.



M**edidas para reducir las amenazas:** se realizarán varias repeticiones de cada prueba, se mantendrán constantes las condiciones de ejecución en la medida de lo posible y se documentarán las características del equipo y la configuración de SQL Server. Además, se utilizarán los mismos datos y consultas en las comparaciones, evitando modificar varias condiciones al mismo tiempo.



## **3. Consideraciones éticas**



El desarrollo de la investigación se realizará respetando los principios de responsabilidad, privacidad, integridad y uso adecuado de la información.



**Protección de datos personales:** para las pruebas se utilizarán datos ficticios de clientes, habitaciones y reservas, evitando el uso de información personal real que pueda comprometer la privacidad de las personas.



**Confidencialidad:** si durante el desarrollo se llegara a utilizar información real, esta deberá contar con la autorización correspondiente y manejarse con las medidas de protección necesarias. No se divulgarán datos personales ni credenciales de acceso a la base de datos.



**Integridad de los resultados:** las mediciones y los resultados se registrarán de manera objetiva, sin alterar los datos para favorecer una conclusión determinada. Se informarán tanto los resultados esperados como los inesperados.



**Uso responsable de los recursos:** las pruebas se realizarán en un entorno controlado, evitando afectar sistemas de producción o servicios que estén siendo utilizados por otras personas.



**Responsabilidad académica:** el código, los procedimientos, las mediciones y las conclusiones se documentarán de manera clara. Se reconocerán las fuentes de información consultadas y se respetarán las normas académicas establecidas por la institución.



En conclusión, estos criterios permitirán realizar una evaluación ordenada del rendimiento de la base de datos, reconocer las limitaciones de los resultados y desarrollar el sistema de automatización del hotel de manera responsable.





