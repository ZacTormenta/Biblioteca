USE Biblioteca;

-- VISITANTES
CREATE TABLE IF NOT EXISTS Visiante (
    ID_visitante INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tiempo_visita INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMENT = 'Tabla de prueba para registrar visitantes y su tiempo de visita a la biblioteca.';

-- ALTER 1
ALTER TABLE Visiante
    ADD COLUMN Fecha_visita DATE NOT NULL
    COMMENT 'Fecha de la visita del visitante.';

-- ALTER 2
ALTER TABLE Visiante
    ADD COLUMN Comentarios TEXT NULL
    COMMENT 'Comentarios adicionales sobre la visita del visitante.';

-- ALTER 3
ALTER TABLE Empleado
    ADD COLUMN Doc_identidad VARCHAR(20) NULL
    COMMENT 'Número de documento de identidad del empleado (columna de prueba).';

-- ALTER 4
ALTER TABLE Empleado
    DROP COLUMN Doc_identidad;
    COMMENT 'Eliminación de la columna de prueba Doc_identidad de la tabla Empleado.';

-- CREATE INDEX
CREATE INDEX idx_titulo_libro ON Libros (Titulo);

-- DROP
DROP TABLE IF EXISTS Visiante;