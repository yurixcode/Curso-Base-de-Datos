EJEMPLOS
Para este tutorial me apoyaré de mi tabla test.

CREATE TABLE test(
 evento VARCHAR(50),
 fecha DATETIME 
); 
Lo primero que debemos de hacer es habilitar nuestro servidor para que pueda ejecutar eventos.

SET GLOBAL event_scheduler = ON;
Posteriormente creamos nuestro evento; En mi caso, tendrá el nombre de insertion event. Este evento se ejecutará dentro de 1 min, y lo que hará, será insertar un registro en mi tabla.

CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO INSERT INTO test VALUES ('Evento 1', NOW());
El nombre del evento no debe de poseer más de 64 caracteres.

Si queremos que el evento se ejecute en una fecha en concreto, únicamente debemos de especificarlo en ON SCHEDULE AT. Recuerda, el formato es año-mes-día hora:minuto:segundo.

ON SCHEDULE AT '2018-12-31 12:00:00'
Si nuestro evento ejecutará más de una sentencia SQL debemos de apoyarnos de BEGIN y END.

DELIMITER //

CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
 INSERT INTO test VALUES ('Evento 1', NOW());
 INSERT INTO test VALUES ('Evento 2', NOW());
 INSERT INTO test VALUES ('Evento 3', NOW());
END //

DELIMITER ;
Una vez el evento se haya creado, nosotros podemos listarlo.

SHOW events\G;
Si queremos eliminar un evento haremos uso de DROP.

DROP EVENT nombre_evento;
Es importante mencionar que una vez el evento haya expirado, este, será eliminado de forma automática. Si nosotros no queremos que esto ocurra debemos de apoyarnos de ON COMPLETION

ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
...
Algo común con los eventos es trabajar con store procedures.

CREATE EVENT nombre_evento
ON SCHEDULE AT 'fecha de ejeución' 
DO
CALL store_procedure();
EVENTOS PERIÓDICOS.
Los eventos los podemos programar para que se ejecuten de forma periódica.

CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());
En esta ocasión, el evento se ejecuta cada minuto después de las 6:30 PM. Podemos programar la ejecución para cada segundo, minuto, hora, semana, mes o año.

Si nosotros queremos que el evento se ejecute entre un rango de fechas debemos de apoyarnos de ENDS.

CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
ENDS '2018-07-07 19:00:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());
Ahora, el evento se ejecuta durante un periodo de 30 minutos (De 6:30 PM a 7:00 PM).

EDITAR EVENTOS
Si por alguna razón necesitamos detener un evento, lo que debemos de hacer es deshabilitarlo.

ALTER EVENT nombre_evento
DISABLE;
Para habilitar nuevamente un evento colocamos ENABLE.

ALTER EVENT nombre_evento
ENABLE;
DETENER EVENTOS
Para detener completamente todos los eventos, debemos de ejecutar la siguiente sentencia.

SET GLOBAL event_scheduler = OFF;
ESTRUCTURA DE UN EVENTO
Los eventos en MySQL pueden ser tan complejos como nosotros los deseemos.

CREATE
    [DEFINER = { user | CURRENT_USER }]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT 'string']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval] ...
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval] ...]
    [ENDS timestamp [+ INTERVAL interval] ...]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}