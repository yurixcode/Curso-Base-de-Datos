ususarios = a
libros_usuarios = b


SELECT
    CONCAT(nombre, ' ', apellidos),
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;


