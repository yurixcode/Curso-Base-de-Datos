DROP PROCEDURE IF EXISTS libros_azar;

DELIMITER //

CREATE PROCEDURE libros_azar()
BEGIN
    SET @iteracion = 0;

    WHILE @iteracion < 5 DO

        SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iteracion = @iteracion + 1;

    END WHILE;

END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE libros_azar()
BEGIN
    SET @iteracion = 0;

    REPEAT

        SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iteracion = @iteracion + 1;

        UNTIL  @iteracion >= 5
    END REPEAT;

END//

DELIMITER ;