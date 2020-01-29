DROP PROCEDURE IF EXISTS prestamo;
DROP PROCEDURE IF EXISTS tipo_lector;

DELIMITER //

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN
    SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);

    IF cantidad > 0 THEN
        INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
        UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;

        SET cantidad = cantidad - 1;
    
    ELSE

        SELECT "No es posible realizar el prestámo" AS mensaje_error;

    END IF;

END//

CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN
    SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios
                    WHERE libros_usuarios.usuario_id = usuario_id);

    CASE
        WHEN @cantidad >= 20 THEN
            SELECT "FANATICO" AS mensaje;

        WHEN @cantidad >= 10 AND @cantidad < 20 THEN
            SELECT "AFICIONADO" AS mensaje;

        WHEN @cantidad > 5 AND @cantidad < 10 THEN
            SELECT "PROMEDIO" AS mensaje;

        ELSE
            SELECT "NUEVO" AS mensaje;

    END CASE;

END//

DELIMITER ;