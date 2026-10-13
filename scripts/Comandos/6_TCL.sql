USE Biblioteca;

-- START TRANSACTION
START TRANSACTION;

-- INSERT
INSERT INTO Libros (ISBN, Titulo, Editorial, anio_publicacion, Idioma) VALUES
('9274381749132', 'La historia de Pepo', 'Editorial_123', 2026, 'Español');

-- SAVEPOINT
SAVEPOINT sp_libro_insertado;

-- INSERT 2
INSERT INTO Ejemplar (ISBN, Codigo_barras, Estado, Ubicacion) VALUES
('9274381749132', 'CB000012', 'Disponible', 'Estante A3');

-- SAVEPOINT 2
SAVEPOINT sp_ejemplar_insertado;

-- INSERT 3
INSERT INTO Autor (Nombre, Nacionalidad) VALUES
('Pepito Pepo', 'Colombiana');

-- SAVEPOINT 3
SAVEPOINT sp_autor_insertado;

-- INSERT 4
INSERT INTO Libro_Autor (ISBN, ID_autor) VALUES
('9274381749132', LAST_INSERT_ID());

-- COMMIT
COMMIT;

-- START TRANSACTION FALLIDO
START TRANSACTION;

-- UPDATE
UPDATE Ejemplar
SET Estado = 'Prestado'
WHERE Codigo_barras = 'CB000012#';

-- ROLLBACK
ROLLBACK;