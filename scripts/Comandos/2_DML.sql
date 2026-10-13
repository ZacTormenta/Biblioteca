USE Biblioteca;

-- INSERT
INSERT INTO Ejemplar (ISBN, Codigo_barras, Estado, Ubicacion) VALUES
('9786070023456', 'CB000011', 'Dañado', 'Estante A2');

-- UPDATE
UPDATE Ejemplar
SET Estado = 'Reservado' AND Ubicacion = 'Estante B1'
WHERE Estado = 'Dañado';

-- UPDATE 2
UPDATE Ejemplar
SET Estado = 'Dañado' AND Ubicacion = 'Área de mantenimiento'
WHERE Codigo_barras = 'CB000001';

-- DELETE
DELETE FROM Ejemplar
WHERE Codigo_barras = 'CB000002';