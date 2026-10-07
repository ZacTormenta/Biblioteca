USE Biblioteca;

--AUTOR
INSERT INTO Autor (Nombre, Nacionalidad)
VALUES ('Autor1', 'Colombia');

--LIBRO
INSERT INTO Libros (ISBN, Titulo, Editorial, anio_publicacion, Idioma)
VALUES (1234, 'Titulo1', 'Editorial1', 2023, 'Español');

--EMPLEADO
INSERT INTO Empleado (Nombre, Cargo, Fecha_contratacion, Direccion, Telefono, Email, Turno)
VALUES ('Empleado1', 'Bibliotecario', '2023-01-01', 'Direccion1', 1234, 'correo1@example.com', 'Mañana');

--USUARIO
INSERT INTO Usuario (Nombre, Email, Telefono, Direccion, Fecha_registro, Tipo_usuario)
VALUES ('Usuario1', 'correo2@example.com', 1234, 'Direccion2', '2023-01-01', 'Estudiante');

--LIBRO_AUTOR
INSERT INTO Libro_Autor (ISBN, ID_autor)
VALUES (1234, 1);

--EJEMPLAR
INSERT INTO Ejemplar (ISBN, Codigo_barras, Estado, Ubicacion)
VALUES (1234, 'CB001', 'Disponible', 'Estantería A');

--RESERVA
INSERT INTO Reserva (ID_usuario, ID_ejemplar, ID_empleado, Fecha_reserva, Estado)
VALUES (1, 1, 1, '2023-01-01', 'Activa');

--PRÉSTAMO
INSERT INTO Prestamos (ID_usuario, ID_ejemplar, ID_empleado, fecha_prestamo, fecha_devolucion)
VALUES (1, 1, 1, '2023-01-01', '2023-01-15');

--MULTA
INSERT INTO Multa (ID_usuario, Fecha_sancion, Monto, Estado_pago)
VALUES (1, '2023-01-01', 1.99, 'Pendiente');


