DELIMITER //

CREATE TRIGGER after_update_books
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN
    IF(NEW.autor_id != OLD.autor_id) THEN
        UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
        UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
        
    END IF;
END;
//


CREATE TRIGGER after_insert_update_books
AFTER INSERT ON libros
FOR EACH ROW
BEGIN
    UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
END;
//



CREATE TRIGGER after_delete_update_books
AFTER DELETE ON libros
FOR EACH ROW
BEGIN
    UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;

END;
//


DELIMITER ;