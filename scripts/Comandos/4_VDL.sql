USE `Biblioteca`;

-- Vista 1
CREATE OR REPLACE VIEW `vistas_catalogo` AS
SELECT
    l.`ISBN`,
    l.`Titulo` AS `Titulo_libro`,
    GROUP_CONCAT(DISTINCT a.`Nombre` ORDER BY a.`Nombre` SEPARATOR ', ') AS `Autores`,
    l.`Editorial`,
    l.`anio_publicacion` AS `Anio_publicacion`,
    l.`Idioma`
FROM `Libros` l
LEFT JOIN `Libro_Autor` la ON la.`ISBN` = l.`ISBN`
LEFT JOIN `Autor` a ON a.`ID_autor` = la.`ID_autor`
GROUP BY
    l.`ISBN`,
    l.`Titulo`,
    l.`Editorial`,
    l.`anio_publicacion`,
    l.`Idioma`;

-- Vista 2
CREATE OR REPLACE VIEW `vista_prestamos_activos` AS
SELECT
    p.`ID_Prestamo`,
    u.`ID_usuario`,
    u.`Nombre` AS `Usuario`,
    l.`Titulo` AS `Libro`,
    e.`Codigo_barras`,
    p.`fecha_prestamo`,
    em.`Nombre` AS `Empleado`
FROM `Prestamos` p
INNER JOIN `Usuario` u ON u.`ID_usuario` = p.`ID_usuario`
INNER JOIN `Ejemplar` e ON e.`ID_ejemplar` = p.`ID_ejemplar`
INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
INNER JOIN `Empleado` em ON em.`ID_empleado` = p.`ID_empleado`
WHERE p.`fecha_devolucion` IS NULL;

-- Vista 3
CREATE OR REPLACE VIEW `vista_reservas_activas` AS
SELECT
    r.`ID_reserva`,
    u.`ID_usuario`,
    u.`Nombre` AS `Usuario`,
    l.`Titulo` AS `Libro`,
    e.`Codigo_barras`,
    r.`Fecha_reserva`,
    em.`Nombre` AS `Empleado`
FROM `Reserva` r
INNER JOIN `Usuario` u ON u.`ID_usuario` = r.`ID_usuario`
INNER JOIN `Ejemplar` e ON e.`ID_ejemplar` = r.`ID_ejemplar`
INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
INNER JOIN `Empleado` em ON em.`ID_empleado` = r.`ID_empleado`
WHERE r.`Estado` = 'Activa';