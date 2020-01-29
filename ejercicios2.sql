
-- Obtener a todos los usuarios que han realizado un préstamo en los últimos diez días.
SELECT
    CONCAT(usuarios.nombre, ' ', usuarios.apellidos) AS nombre_usuario,
    COUNT(usuarios.usuario_id) AS total_prestado
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
            AND libros_usuarios.fecha_creacion >= CURDATE() - INTERVAL 10 DAY
GROUP BY usuarios.usuario_id;


-- Obtener a todos los usuarios que no ha realizado ningún préstamo.
SELECT
    usuarios.username
FROM usuarios
    INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.usuario_id IS NULL;


-- Listar de forma descendente a los cinco usuarios con más préstamos.
SELECT
    COUNT(libros_usuarios.usuario_id) AS prestamos,
    usuarios.username
FROM usuarios
    INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
GROUP BY usuarios.usuario_id
ORDER BY prestamos DESC LIMIT 3;


-- Listar 5 títulos con más préstamos en los últimos 30 días.
SELECT
    libros_usuarios.usuario_id,
    libros.titulo,
    COUNT(libros_usuarios.libro_id) AS prestamos
FROM libros
    INNER JOIN libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
                AND libros_usuarios.fecha_creacion >= CURDATE() - INTERVAL 30 DAY
GROUP BY libros.titulo
ORDER BY prestamos DESC LIMIT 5;

-- Obtener el título de todos los libros que no han sido prestados.

-- Obtener la cantidad de libros prestados el día de hoy.

-- Obtener la cantidad de libros prestados por el autor con id 1.

-- Obtener el nombre completo de los cinco autores con más préstamos.

-- Obtener el título del libro con más préstamos esta semana.
