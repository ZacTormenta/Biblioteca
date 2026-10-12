USE Biblioteca;

--AUTOR
INSERT INTO Autor (Nombre, Nacionalidad)
VALUES
('Gabriel García Márquez', 'Colombiana'),
('Sofía Ramírez', 'Mexicana'),
('Mateo Fernández', 'Argentina'),
('Lucía Martínez', 'Española'),
('Tomás González', 'Chilena'),
('Valentina Torres', 'Peruana'),
('Antoine Dubois', 'Francesa'),
('Giulia Romano', 'Italiana'),
('Lucas Oliveira', 'Brasileña'),
('Emma Thompson', 'Canadiense');

--LIBRO
INSERT INTO Libros (ISBN, Titulo, Editorial, anio_publicacion, Idioma)
VALUES 
('9789580012345', 'El misterio de la montaña', 'Planeta', 2018, 'Español'),
('9786070023456', 'Las sombras del pasado', 'Alfaguara', 2020, 'Español'),
('9788490034567', 'El jardín de los secretos', 'Anagrama', 2015, 'Español'),
('9780300045678', 'The Lost Kingdom', 'Penguin Books', 2019, 'Inglés'),
('9788800056789', 'Il segreto del mare', 'Mondadori', 2021, 'Italiano'),
('9782210067890', 'Le voyage oublié', 'Gallimard', 2017, 'Francés'),
('9788500078901', 'A cidade escondida', 'Record', 2022, 'Portugués'),
('9789500089012', 'El último viajero', 'Sudamericana', 2016, 'Español'),
('9780300090123', 'Beyond the Stars', 'HarperCollins', 2023, 'Inglés'),
('9789580001234', 'La llave del tiempo', 'Norma', 2024, 'Español');

--EMPLEADO
INSERT INTO Empleado (Nombre, Cargo, Fecha_contratacion, Direccion, Telefono, Email, Turno)
VALUES
('Laura Martínez', 'Bibliotecaria', '2021-03-15', 'Calle 10 #15-20', '3001234567', 'laura.martinez@example.com', 'Mañana'),
('Carlos Rodríguez', 'Administrador', '2020-07-10', 'Carrera 12 #20-35', '3012345678', 'carlos.rodriguez@example.com', 'Tarde'),
('Sofía Hernández', 'Auxiliar de biblioteca', '2022-01-20', 'Calle 25 #8-14', '3023456789', 'sofia.hernandez@example.com', 'Mañana'),
('Andrés Gómez', 'Archivista', '2019-11-05', 'Carrera 7 #18-42', '3034567890', 'andres.gomez@example.com', 'Noche'),
('Valentina Torres', 'Bibliotecaria', '2023-06-12', 'Calle 40 #16-28', '3045678901', 'valentina.torres@example.com', 'Tarde'),
('Daniel Ramírez', 'Auxiliar administrativo', '2021-09-01', 'Carrera 15 #30-10', '3056789012', 'daniel.ramirez@example.com', 'Mañana'),
('Camila Pérez', 'Catalogadora', '2022-04-18', 'Calle 22 #11-50', '3067890123', 'camila.perez@example.com', 'Tarde'),
('Juan Sebastián López', 'Coordinador', '2018-02-26', 'Carrera 9 #45-16', '3078901234', 'juan.lopez@example.com', 'Mañana'),
('Mariana Castro', 'Recepcionista', '2024-01-08', 'Calle 18 #6-32', '3089012345', 'mariana.castro@example.com', 'Tarde'),
('Felipe Moreno', 'Técnico de sistemas', '2020-10-14', 'Carrera 20 #12-25', '3090123456', 'felipe.moreno@example.com', 'Noche');

--USUARIO
INSERT INTO Usuario (Nombre, Email, Telefono, Direccion, Fecha_registro, Tipo_usuario)
VALUES
('María Fernanda López', 'maria.lopez@example.com', '3101234567', 'Calle 12 #15-30', '2024-01-15', 'Estudiante'),
('Juan David Pérez', 'juan.perez@example.com', '3112345678', 'Carrera 8 #20-45', '2024-02-20', 'Docente'),
('Camila Rodríguez', 'camila.rodriguez@example.com', '3123456789', 'Calle 25 #10-18', '2024-03-10', 'Estudiante'),
('Andrés Felipe Gómez', 'andres.gomez@example.com', '3134567890', 'Carrera 15 #30-22', '2024-04-05', 'Investigador'),
('Valentina Torres', 'valentina.torres@example.com', '3145678901', 'Calle 40 #18-12', '2024-05-12', 'Estudiante'),
('Sebastián Martínez', 'sebastian.martinez@example.com', '3156789012', 'Carrera 7 #12-50', '2024-06-18', 'Docente'),
('Laura Sofía Ramírez', 'laura.ramirez@example.com', '3167890123', 'Calle 32 #9-14', '2024-07-22', 'Investigador'),
('Daniel Castro', 'daniel.castro@example.com', '3178901234', 'Carrera 20 #45-16', '2024-08-08', 'Estudiante'),
('Isabella Moreno', 'isabella.moreno@example.com', '3189012345', 'Calle 18 #6-35', '2024-09-14', 'Docente'),
('Nicolás Herrera', 'nicolas.herrera@example.com', '3190123456', 'Carrera 11 #25-40', '2024-10-25', 'Investigador');

--LIBRO_AUTOR
INSERT INTO Libro_Autor (ISBN, ID_autor)
VALUES
('9789580012345', 1),
('9786070023456', 2),
('9788490034567', 3),
('9780300045678', 4),
('9788800056789', 5),
('9782210067890', 6),
('9788500078901', 7),
('9789500089012', 8),
('9780300090123', 9),
('9789580001234', 10);

--EJEMPLAR
INSERT INTO Ejemplar (ISBN, Codigo_barras, Estado, Ubicacion)
VALUES 
('9789580012345', 'CB000001', 'Disponible', 'Estante A1'),
('9786070023456', 'CB000002', 'Prestado', 'Estante B2'),
('9788490034567', 'CB000003', 'Disponible', 'Estante A3'),
('9780300045678', 'CB000004', 'En reparación', 'Área de mantenimiento'),
('9788800056789', 'CB000005', 'Disponible', 'Estante C1'),
('9782210067890', 'CB000006', 'Prestado', 'Estante B4'),
('9788500078901', 'CB000007', 'Disponible', 'Estante D2'),
('9789500089012', 'CB000008', 'Reservado', 'Estante A5'),
('9780300090123', 'CB000009', 'Disponible', 'Estante C3'),
('9789580001234', 'CB000010', 'Prestado', 'Estante D1');

--RESERVA
INSERT INTO Reserva (ID_usuario, ID_ejemplar, ID_empleado, Fecha_reserva, Estado)
VALUES
(1, 2, 1, '2024-01-10', 'Pendiente'),
(2, 4, 2, '2024-01-12', 'Confirmada'),
(3, 1, 3, '2024-01-15', 'Cancelada'),
(4, 6, 4, '2024-01-18', 'Pendiente'),
(5, 3, 5, '2024-01-20', 'Confirmada'),
(6, 8, 6, '2024-02-02', 'Pendiente'),
(7, 5, 7, '2024-02-05', 'Completada'),
(8, 10, 8, '2024-02-08', 'Cancelada'),
(9, 7, 9, '2024-02-12', 'Confirmada'),
(10, 9, 10, '2024-02-15', 'Pendiente');

--PRÉSTAMO
INSERT INTO Prestamos (ID_usuario, ID_ejemplar, ID_empleado, fecha_prestamo, fecha_devolucion)
VALUES 
(1, 1, 1, '2024-01-10', '2024-01-24'),
(2, 2, 2, '2024-01-12', '2024-01-26'),
(3, 3, 3, '2024-01-15', '2024-01-29'),
(4, 4, 4, '2024-01-18', '2024-02-01'),
(5, 5, 5, '2024-01-20', '2024-02-03'),
(6, 6, 6, '2024-02-02', '2024-02-16'),
(7, 7, 7, '2024-02-05', '2024-02-19'),
(8, 8, 8, '2024-02-08', '2024-02-22'),
(9, 9, 9, '2024-02-12', '2024-02-26'),
(10, 10, 10, '2024-02-15', '2024-02-29');

--MULTA
INSERT INTO Multa (ID_usuario, Fecha_sancion, Monto, Estado_pago)
VALUES
(1, '2024-01-25', 5000.00, 'Pendiente'),
(2, '2024-01-28', 3000.00, 'Pagado'),
(3, '2024-02-02', 7500.00, 'Pendiente'),
(4, '2024-02-05', 2000.00, 'Pagado'),
(5, '2024-02-10', 10000.00, 'Pendiente'),
(6, '2024-02-15', 4500.00, 'Pagado'),
(7, '2024-02-20', 6000.00, 'Pendiente'),
(8, '2024-02-25', 3500.00, 'Pagado'),
(9, '2024-03-01', 8000.00, 'Pendiente'),
(10, '2024-03-05', 2500.00, 'Pagado');


