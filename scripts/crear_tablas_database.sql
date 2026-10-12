DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE IF NOT EXISTS Libros (
    ISBN VARCHAR(13) PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Editorial VARCHAR(255) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    Idioma VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Autor (
    ID_autor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Nacionalidad VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Libro_Autor (
    ISBN VARCHAR(13),
    ID_autor INT,
    PRIMARY KEY (ISBN, ID_autor),
    FOREIGN KEY (ISBN) REFERENCES Libros(ISBN),
    FOREIGN KEY (ID_autor) REFERENCES Autor(ID_autor)
);
CREATE TABLE IF NOT EXISTS Usuario (
    ID_usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefono INT,
    Direccion VARCHAR(255) NOT NULL,
    Fecha_registro DATE NOT NULL,
    Tipo_usuario ENUM('Estudiante', 'Profesor', 'Externo', 'Administrador') NOT NULL
);
CREATE TABLE IF NOT EXISTS Empleado (
    ID_empleado INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Fecha_contratacion DATE NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Telefono INT,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Turno ENUM('Mañana', 'Tarde', 'Noche') NOT NULL
);
CREATE TABLE IF NOT EXISTS Multa (
    ID_multa INT PRIMARY KEY AUTO_INCREMENT,
    ID_usuario INT,
    Fecha_sancion DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Estado_pago ENUM('Pendiente', 'Pagada') NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario)
);
CREATE TABLE IF NOT EXISTS Ejemplar (
    ID_ejemplar INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(13),
    Codigo_barras VARCHAR(100) UNIQUE NOT NULL,
    Estado ENUM('Disponible', 'Prestado', 'Reservado', 'Dañado') NOT NULL,
    Ubicacion VARCHAR(255) NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Libros(ISBN)
);
CREATE TABLE IF NOT EXISTS Reserva (
    ID_reserva INT PRIMARY KEY AUTO_INCREMENT,
    ID_usuario INT,
    ID_ejemplar INT,
    ID_empleado INT,
    Fecha_reserva DATE NOT NULL,
    Estado ENUM('Activa', 'Cancelada', 'Cumplida') NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_ejemplar) REFERENCES Ejemplar(ID_ejemplar),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado)
);
CREATE TABLE IF NOT EXISTS Prestamos (
    ID_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
    ID_usuario INT,
    ID_ejemplar INT,
    ID_empleado INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (ID_ejemplar) REFERENCES Ejemplar(ID_ejemplar),
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado)
);