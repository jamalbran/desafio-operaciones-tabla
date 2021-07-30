\echo 'Parte 1'
\echo '1. Crear una base de datos con nombre “Posts”.'

DROP DATABASE posts;
CREATE DATABASE posts;

\c posts;

\echo '2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.'

CREATE TABLE post(
  id INT,
  nombre_usuario VARCHAR,
  fecha_creacion DATE,
  contenido VARCHAR,
  descripcion VARCHAR,
  PRIMARY KEY (id)
);

\echo '3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".'

INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion) VALUES (1, 'Pamela', '2021-07-19', 'Contenido 1', 'Descipcion 1');
INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion) VALUES (2, 'Pamela', '2021-07-19', 'Contenido 2', 'Descipcion 2');
INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion) VALUES (3, 'Carlos', '2021-07-19', 'Contenido 3', 'Descipcion 3');

\echo '4. Modificar la tabla post, agregando la columna título.'

ALTER TABLE post ADD titulo VARCHAR;

\echo '5. Agregar título a las publicaciones ya ingresadas.'

UPDATE post SET titulo = 'Titulo 1' WHERE id = 1;
UPDATE post SET titulo = 'Titulo 2' WHERE id = 2;
UPDATE post SET titulo = 'Titulo 3' WHERE id = 3;

\echo '6. Insertar 2 post para el usuario "Pedro".'

INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES (4, 'Pedro', '2021-07-19', 'Contenido 4', 'Descipcion 4', 'Titulo 4');
INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES (5, 'Pedro', '2021-07-19', 'Contenido 5', 'Descipcion 5', 'Titulo 5');

\echo '7. Eliminar el post de Carlos.'

DELETE FROM post WHERE nombre_usuario = 'Carlos';

\echo '8. Ingresar un nuevo post para el usuario "Carlos".'

INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES (6, 'Carlos', '2021-07-19', 'Contenido 6', 'Descipcion 6', 'Titulo 6');

\echo 'Parte 2'
\echo '1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.'

CREATE TABLE comentarios(
  id INT,
  fecha DATE,
  hora TIME,
  contenido VARCHAR,
  FOREIGN KEY (id) REFERENCES post(id)
);

\echo '2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".'

INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (1, '2021-07-19', '21:30:26', 'Contenido 1');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (1, '2021-07-19', '21:35:26', 'Contenido 2');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (6, '2021-07-19', '21:30:26', 'Contenido 1');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (6, '2021-07-19', '21:32:26', 'Contenido 2');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (6, '2021-07-19', '21:34:26', 'Contenido 3');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (6, '2021-07-19', '21:36:26', 'Contenido 4');

\echo '3. Crear un nuevo post para "Margarita".'

INSERT INTO post (id, nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES (7, 'Margarita', '2021-07-19', 'Contenido 7', 'Descipcion 7', 'Titulo 7');

\echo '4. Ingresar 5 comentarios para el post de Margarita.'

INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (7, '2021-07-19', '21:30:26', 'Contenido 1');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (7, '2021-07-19', '21:32:26', 'Contenido 2');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (7, '2021-07-19', '21:33:26', 'Contenido 3');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (7, '2021-07-19', '21:35:26', 'Contenido 4');
INSERT INTO comentarios (id, fecha, hora, contenido) VALUES (7, '2021-07-19', '21:37:26', 'Contenido 5');
