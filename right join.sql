libros_usuarios = a
ususarios = b


SELECT
    CONCAT(nombre, ' ', apellidos),
    libros_usuarios.libro_id
FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;
