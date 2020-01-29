START TRANSACTION;

SET @libro_id = 19, @usuario_id = 300;

UPDATE libros SET stock = stock - 1 WHERE libro_id = @libro_id;
SELECT stock FROM libros WHERE libro_id = @libro_id;

INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(@libro_id, @usuario_id);
SELECT * FROM libros_usuarios;

-- COMMIT;
-- o
-- ROLLBACK;

