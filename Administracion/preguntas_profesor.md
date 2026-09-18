# 50 Posibles Preguntas de Examen - Administración de Bases de Datos

## Transacciones
1. **¿Qué significa ACID en el contexto de bases de datos relacionales?**
   *Respuesta:* Significa Atomicidad, Consistencia, Aislamiento (Isolation) y Durabilidad. Son los 4 principios que garantizan la confiabilidad en bases de datos relacionales.
2. **Explique el concepto de Atomicidad.**
   *Respuesta:* Evitar operaciones "a medias". Es todo o nada. Si una transacción tiene varias operaciones, todas se ejecutan correctamente o ninguna lo hace.
3. **Dé un ejemplo de la vida real de una transacción.**
   *Respuesta:* Una transferencia bancaria. Se debe descontar dinero de una cuenta y sumarlo a otra; si una de las dos falla, ninguna debe aplicarse para no perder ni crear dinero de la nada.
4. **¿Qué significa BASE en bases de datos no relacionales?**
   *Respuesta:* BAsically available, Soft state, Eventually consistent. Prioriza la disponibilidad sobre la consistencia estricta.
5. **¿Cuál es la diferencia principal entre ACID y BASE en cuanto a consistencia?**
   *Respuesta:* ACID garantiza una consistencia muy alta y fuerte en todo momento, mientras que BASE ofrece una consistencia eventual (los cambios pueden tardar en reflejarse en todos los nodos).
6. **¿Para qué se utiliza el comando COMMIT?**
   *Respuesta:* Para finalizar una transacción, confirmando y guardando permanentemente todos los cambios realizados durante la misma.
7. **¿Para qué se utiliza el comando ROLLBACK?**
   *Respuesta:* Para finalizar una transacción deshaciendo todos los cambios realizados desde que inició, volviendo al estado original.
8. **¿Qué es un Savepoint y para qué sirve?**
   *Respuesta:* Es un punto de guardado temporal dentro de una transacción que permite dividirla en sub-transacciones. Sirve para poder hacer rollback hasta ese punto específico sin deshacer toda la transacción completa.
9. **¿Qué hace la variable auto_commit en MariaDB/MySQL?**
   *Respuesta:* Indica si las operaciones de modificación de datos (INSERT, UPDATE, DELETE) se confirman automáticamente apenas se ejecutan o si requieren un COMMIT explícito.
10. **¿Las transacciones aplican para operaciones DDL (como CREATE o ALTER)?**
    *Respuesta:* No, las transacciones solo aplican para operaciones CRUD o DML (datos). Los cambios DDL no se pueden deshacer con ROLLBACK en MariaDB/MySQL.

## Concurrencia
11. **¿Qué es la concurrencia en bases de datos?**
    *Respuesta:* Se refiere a la capacidad del sistema para manejar múltiples usuarios o procesos interactuando (leyendo o modificando) con los mismos datos al mismo tiempo.
12. **Explique el problema de la "Lectura sucia" (dirty read).**
    *Respuesta:* Ocurre cuando una transacción lee datos que han sido modificados por otra transacción que aún no ha hecho COMMIT, y si esa segunda transacción hace ROLLBACK, la primera leyó datos que nunca existieron oficialmente.
13. **Explique el problema de la "Actualización perdida" (lost update).**
    *Respuesta:* Sucede cuando dos transacciones leen el mismo dato y luego ambas lo modifican basándose en lo que leyeron, provocando que la actualización de una sobrescriba a la otra sin tenerla en cuenta.
14. **Explique el problema de la "Lectura no repetible" (non repeatable read).**
    *Respuesta:* Pasa cuando una transacción lee el mismo registro dos veces y obtiene resultados diferentes, porque otra transacción modificó y confirmó cambios en ese registro entre ambas lecturas.
15. **Explique el problema de la "Lectura fantasma" (phantom read).**
    *Respuesta:* Ocurre cuando una transacción ejecuta una consulta buscando registros que cumplan cierta condición, y al repetirla, aparecen o desaparecen registros porque otra transacción insertó o borró filas en ese intervalo.
16. **¿Qué significa el nivel de aislamiento "read uncommitted"?**
    *Respuesta:* Es el nivel más bajo, donde las transacciones pueden ver cambios no confirmados de otras transacciones, lo que permite las "lecturas sucias".
17. **¿Qué es un abrazo mortal (deadlock)?**
    *Respuesta:* Es una situación donde dos o más transacciones se bloquean mutuamente, ya que cada una tiene bloqueado un recurso que la otra necesita para continuar, provocando que ninguna pueda avanzar.
18. **¿Qué es la inanición (starvation) en el control de concurrencia?**
    *Respuesta:* Es cuando un proceso queda en espera indefinida intentando acceder a un recurso porque el sistema constantemente le da prioridad a otros procesos.
19. **¿Cuál es la sintaxis en MariaDB para bloquear una tabla para escritura por parte de otros?**
    *Respuesta:* `LOCK TABLES nombre_tabla WRITE;` (bloquea la tabla permitiendo que solo la sesión actual pueda leer/escribir).
20. **¿Qué hace el comando UNLOCK TABLES?**
    *Respuesta:* Libera y finaliza todos los bloqueos de tablas iniciados por el comando `LOCK TABLES` en la sesión actual.

## Usuarios y Roles
21. **¿Qué es un usuario en MariaDB y de qué partes se compone su identificación?**
    *Respuesta:* Es una cuenta que permite conectarse a la base de datos. Se compone de un nombre de usuario (login) y una dirección IP o rango de red desde donde se permite la conexión (en formato CIDR o %), unidos por una arroba, ej: `usuario@192.168.1.10`.
22. **¿Por qué es importante tener usuarios diferentes en lugar de usar todos la misma cuenta?**
    *Respuesta:* Por seguridad, control de acceso y trazabilidad, para saber quién hizo qué, cuándo, y poder definir límites y permisos específicos para cada persona o aplicación.
23. **¿Qué es un rol en bases de datos y para qué sirve?**
    *Respuesta:* Es una forma de agrupar permisos bajo un nombre. Sirve para facilitar la administración asignando el rol a múltiples usuarios, en lugar de asignar los permisos uno por uno a cada usuario.
24. **¿Por qué no se debe usar el usuario "root" en un sistema en producción?**
    *Respuesta:* Porque "root" tiene acceso completo y sin restricciones. Si sus credenciales se ven comprometidas o si ocurre un error humano, el impacto puede ser catastrófico para toda la base de datos.
25. **¿Cómo se crea un usuario en MariaDB que solo puede conectarse desde la IP 192.168.1.10?**
    *Respuesta:* `CREATE USER 'nombre'@'192.168.1.10' IDENTIFIED BY 'contraseña';`
26. **Escriba el comando para cambiar la contraseña de un usuario de forma segura.**
    *Respuesta:* Generar primero el hash con `SELECT PASSWORD('nueva_clave');` y luego usar: `ALTER USER nombre IDENTIFIED BY PASSWORD '*hash_generado';`
27. **Escriba el comando para eliminar un usuario.**
    *Respuesta:* `DROP USER nombre@'ip';`
28. **¿Cómo se crea un rol y se asigna a un usuario?**
    *Respuesta:* `CREATE ROLE nombre_rol;` seguido de `GRANT nombre_rol TO usuario@'ip';`
29. **Mencione dos límites de ejecución que se pueden configurar para un usuario.**
    *Respuesta:* `MAX_QUERIES_PER_HOUR` (consultas por hora) y `MAX_CONNECTIONS_PER_HOUR` (conexiones por hora).
30. **¿Qué hace el comando SET SESSION AUTHORIZATION?**
    *Respuesta:* Permite a un usuario ejecutar operaciones asumiendo temporalmente los permisos de otro usuario o rol, útil para delegación temporal o simular condiciones de seguridad.

## Permisos y Privilegios
31. **Defina qué es un privilegio en bases de datos.**
    *Respuesta:* Es la definición o permiso que dicta qué operaciones puede realizar o no un usuario una vez se ha conectado a la base de datos.
32. **¿Cuál es la diferencia entre Autenticación y Autorización?**
    *Respuesta:* Autenticación es verificar quién es el usuario que se conecta (login). Autorización es definir qué puede hacer ese usuario una vez dentro (privilegios).
33. **¿Qué establece el principio de mínimo privilegio?**
    *Respuesta:* Nunca se le deben dar a un usuario más permisos o accesos de los que estrictamente necesita para cumplir sus funciones.
34. **Mencione las 4 clases de privilegios según su alcance.**
    *Respuesta:* Globales (instancia completa, `*.*`), Nivel de Base de Datos (`bd.*`), Nivel de Tablas/Rutinas (`bd.tabla`), Nivel de Columnas.
35. **¿Cómo se otorga el permiso de consultar la tabla "cities" de la bd "world" al usuario "juan"?**
    *Respuesta:* `GRANT SELECT ON world.cities TO juan;`
36. **¿Cómo se quita el permiso de insertar en la tabla "cities" al usuario "juan"?**
    *Respuesta:* `REVOKE INSERT ON world.cities FROM juan;`
37. **¿Por qué es peligroso otorgar privilegios con "WITH GRANT OPTION"?**
    *Respuesta:* Porque permite que el usuario al que se le da el privilegio pueda a su vez dárselo a otros usuarios, perdiendo el control del administrador sobre quién tiene acceso y creando dependencias.
38. **¿Qué significa el privilegio "USAGE"?**
    *Respuesta:* Es un privilegio básico que solo permite la conexión al servidor de base de datos, pero no da acceso real a leer o modificar ninguna tabla.
39. **¿Por qué no se debe otorgar "ALL PRIVILEGES" a un usuario regular?**
    *Respuesta:* Porque rompe el principio de mínimo privilegio y le da al usuario capacidad destructiva que probablemente no necesite para sus tareas, aumentando el riesgo de errores graves.
40. **¿Qué comando se utiliza para consultar los privilegios de un usuario?**
    *Respuesta:* `SHOW GRANTS FOR usuario@'ip';`

## Vistas
41. **¿Qué es una vista en bases de datos?**
    *Respuesta:* Es una consulta SQL predefinida que se comporta y se consulta como si fuera una tabla normal, aunque no guarda datos físicos directamente (es una "tabla virtual").
42. **Mencione dos ventajas de usar vistas.**
    *Respuesta:* Evitan repetir código SQL complejo (principio DRY) y ocultan información sensible o lógica compleja de los usuarios finales (Seguridad y Abstracción).
43. **¿Cuál es la principal diferencia entre una vista normal y una vista materializada?**
    *Respuesta:* Una vista normal calcula los datos en tiempo de ejecución cada vez que se consulta. Una vista materializada sí guarda los datos físicamente en disco y se actualiza periódicamente para mejorar el rendimiento.
44. **¿Se pueden realizar operaciones INSERT, UPDATE o DELETE en cualquier vista?**
    *Respuesta:* No, solo algunas vistas simples son actualizables. La mayoría son de solo lectura si involucran operaciones complejas.
45. **Mencione dos condiciones que hacen que una vista NO sea modificable.**
    *Respuesta:* Si la consulta base utiliza funciones de agregación (SUM, MAX), cláusulas GROUP BY, o utiliza UNION.
46. **¿Por qué es una mala práctica usar "SELECT *" al crear una vista?**
    *Respuesta:* Porque si la estructura de la tabla original cambia (se añaden o eliminan columnas), la vista no se actualiza correctamente y puede romperse o causar impacto en el backend.
47. **¿Las vistas en MariaDB tienen clave primaria o foránea?**
    *Respuesta:* No, las vistas no tienen claves primarias ni foráneas, son solo representaciones de datos.
48. **Escriba un ejemplo de sintaxis para crear una vista llamada "v_empleados" que muestre id y nombre.**
    *Respuesta:* `CREATE VIEW v_empleados AS SELECT id, nombre FROM empleados;`
49. **¿Qué sucede con los permisos al crear una vista?**
    *Respuesta:* Se pueden revocar los permisos de las tablas base y otorgar permisos solo sobre la vista, protegiendo así las tablas originales y limitando qué datos puede ver el usuario.
50. **Si se modifica la estructura de la tabla base de una vista, ¿la vista mejora el rendimiento de la consulta SQL?**
    *Respuesta:* No, una vista normal no mejora el rendimiento ni hace que la consulta sea más rápida, ya que ejecuta la consulta subyacente cada vez que se llama.
