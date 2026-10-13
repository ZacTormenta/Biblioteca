USE Biblioteca;

-- INSERT
INSERT INTO Ejemplar (ISBN, Codigo_barras, Estado, Ubicacion) VALUES
('9786070023456', 'CB000011', 'Dañado', 'Estante A2');

-- UPDATE
UPDATE Ejemplar
SET Estado = 'Reservado',
    Ubicacion = 'Estante B1'
WHERE Codigo_barras = 'CB000011'
  AND Estado = 'Dañado';

-- UPDATE 2
UPDATE Ejemplar
SET Estado = 'Dañado',
    Ubicacion = 'Área de mantenimiento'
WHERE Codigo_barras = 'CB000001';

-- DELETE
DELETE FROM Ejemplar
WHERE Codigo_barras = 'CB000011';