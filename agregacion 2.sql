SELECT IF(
    EXISTS(SELECT libro_id FROM libros WHERE titulo = 'El Hobbit'),
    'Disponible',
    'No disponible'
) AS existencia;