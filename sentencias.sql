/* 
¿Qué tipo de entidades? autores
Nombre : autores
*/

DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    pseudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'), -- M o F
    fecha_nacimiento DATE NOT NULL,-- DATE va con formato AÑOS-MES-DIA
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS libros(
    libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250) NOT NULL DEFAULT '',
    paginas INTEGER UNSIGNED NOT NULL DEFAULT 0,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25),
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE libros ADD libros INT UNSIGNED DEFAULT 10;


INSERT INTO usuarios (nombre, apellidos, username, email)
VALUES  ('Usuario 1', 'Apellidos del Usuario 1', 'usuario1', 'usuario@primero.com'),
        ('Usuario 2', 'Apellidos del Usuario 2', 'usuario2', 'usuario@segundo.com');


INSERT INTO autores (nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES  ('Autor 1', 'Apellidos del autor', 'M', '2003-02-27', 'Chile'),
        ('Autor 2', 'Apellidos del autor', 'M', '2003-02-27', 'Chile'),
        ('Autor 3', 'Apellidos del autor', 'M', '2003-02-27', 'Chile'),
        ('Autor 4', 'Apellidos del autor', 'M', '2003-02-27', 'Chile'),
        ('Autor 5', 'Apellidos del autor', 'M', '2003-02-27', 'Chile');

INSERT INTO autores (autor_id, nombre, apellido, pseudonimo, genero, fecha_nacimiento, pais_origen)
VALUES (10, 'Autor 7', 'Apellidos del autor 7', 'Bhamma', 2, '2004-12-05', 'Argentina');


INSERT INTO libros (autor_id, titulo, fecha_publicacion)
VALUES  (1, 'Nombre del libro', '2003-02-27'),
        (1, 'Nombre del libro 2', '2003-02-27'),
        (1, 'Nombre del libro 3', '2003-02-27'),

        (2, 'Titulo del libro', '2003-02-27'),
        (2, 'Titulo del libro 2', '2003-02-27'),
        (2, 'Titulo del libro 3', '2003-02-27'),
        (2, 'Titulo del libro 4', '2003-02-27'),
        (2, 'Titulo del libro 4', '2003-02-27'),
        (2, 'Titulo del libro 4', '2003-02-27'),
        (2, 'Titulo del libro 4', '2003-02-27'),
        (2, 'Titulo del libro 4', '2003-02-27');
        

DESC autores;
DESC libros;

SELECT titulo, fecha_publicacion FROM libros 
WHERE fecha_publicacion BETWEEN '1995-01-01' AND '2015-01-31';

