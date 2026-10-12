--BIBLIOTECARIO
--Crear bibliotecario
CREATE USER 'bibliotecario'@'localhost'
IDENTIFIED BY '1234567890';

--Dar permiso para consultar libros, usuarios, multas y reservas
GRANT SELECT ON Biblioteca.Libros
TO 'bibliotecario'@'localhost';

GRANT SELECT ON Biblioteca.Usuario
TO 'bibliotecario'@'localhost';

GRANT SELECT ON Biblioteca.Multa
TO 'bibliotecario'@'localhost';

GRANT SELECT ON Biblioteca.Reserva
TO 'bibliotecario'@'localhost';

GRANT SELECT ON Biblioteca.Prestamos
TO 'bibliotecario'@'localhost';

--Dar permiso para insertar libros, autores, reservas, préstamos y usuarios
GRANT INSERT ON Biblioteca.Libros
TO 'bibliotecario'@'localhost';

GRANT INSERT ON Biblioteca.Autores
TO 'bibliotecario'@'localhost';

GRANT INSERT ON Biblioteca.Reserva
TO 'bibliotecario'@'localhost';

GRANT INSERT ON Biblioteca.Prestamos
TO 'bibliotecario'@'localhost';

GRANT INSERT ON Biblioteca.Usuario
TO 'bibliotecario'@'localhost';

--USUARIO
--Crear usuario
CREATE USER 'usuario'@'localhost'
IDENTIFIED BY '0987654321';

--Dar permiso para consultar libros
GRANT SELECT ON Biblioteca.Libros
TO 'usuario'@'localhost';

