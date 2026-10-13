USE `Biblioteca`;

-- SELECT
SELECT
    e.`ID_ejemplar`,
    e.`Codigo_barras`,
    l.`Titulo`,
    e.`Ubicacion`
FROM `Ejemplar` e
INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
WHERE e.`Estado` = 'Disponible'
ORDER BY l.`Titulo`;

-- JOIN
SELECT
    u.`Nombre` AS Usuario,
    p.`ID_Prestamo`,
    p.`fecha_prestamo`,
    l.`Titulo` AS Libro,
    e.`Codigo_barras`,
    em.`Nombre` AS Empleado
FROM `Prestamos` p
INNER JOIN `Usuario` u ON u.`ID_usuario` = p.`ID_usuario`
INNER JOIN `Ejemplar` e ON e.`ID_ejemplar` = p.`ID_ejemplar`
INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
INNER JOIN `Empleado` em ON em.`ID_empleado` = p.`ID_empleado`
WHERE p.`fecha_devolucion` IS NULL
ORDER BY p.`fecha_prestamo`;

-- GROUP BY
SELECT
    a.`Nacionalidad`,
    COUNT(DISTINCT la.`ISBN`) AS Total_Libros
FROM `Autor` a
LEFT JOIN `Libro_Autor` la ON la.`ID_autor` = a.`ID_autor`
GROUP BY a.`Nacionalidad`
ORDER BY Total_Libros DESC, a.`Nacionalidad`;

-- GROUP BY adicional
SELECT
    e.`Estado`,
    COUNT(*) AS Total_Ejemplares
FROM `Ejemplar` e
GROUP BY e.`Estado`
ORDER BY Total_Ejemplares DESC;