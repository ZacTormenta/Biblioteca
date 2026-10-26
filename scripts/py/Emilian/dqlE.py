"""DQL (Data Query Language) — equivalente a scripts/Comandos/3_DQL.sql.

Consultas de solo lectura: SELECT, JOIN y GROUP BY.
Sin argumentos ejecuta todas; con uno o más nombres ejecuta las seleccionadas:
    python scripts/py/dql.py disponibles prestamos_activos
"""

import sys

from conexionE import conexion, consultar, imprimir

CONSULTAS = {
    "disponibles": (
        "Ejemplares disponibles",
        """SELECT e.`ID_ejemplar`, e.`Codigo_barras`, l.`Titulo`, e.`Ubicacion`
           FROM `Ejemplar` e
           INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
           WHERE e.`Estado` = 'Disponible'
           ORDER BY l.`Titulo`""",
    ),
    "prestamos_activos": (
        "Préstamos activos (sin fecha de devolución)",
        """SELECT u.`Nombre` AS Usuario, p.`ID_Prestamo`, p.`fecha_prestamo`,
                  l.`Titulo` AS Libro, e.`Codigo_barras`, em.`Nombre` AS Empleado
           FROM `Prestamos` p
           INNER JOIN `Usuario` u ON u.`ID_usuario` = p.`ID_usuario`
           INNER JOIN `Ejemplar` e ON e.`ID_ejemplar` = p.`ID_ejemplar`
           INNER JOIN `Libros` l ON l.`ISBN` = e.`ISBN`
           INNER JOIN `Empleado` em ON em.`ID_empleado` = p.`ID_empleado`
           WHERE p.`fecha_devolucion` IS NULL
           ORDER BY p.`fecha_prestamo`""",
    ),
    "libros_por_nacionalidad": (
        "Libros por nacionalidad de autor",
        """SELECT a.`Nacionalidad`, COUNT(DISTINCT la.`ISBN`) AS Total_Libros
           FROM `Autor` a
           LEFT JOIN `Libro_Autor` la ON la.`ID_autor` = a.`ID_autor`
           GROUP BY a.`Nacionalidad`
           ORDER BY Total_Libros DESC, a.`Nacionalidad`""",
    ),
    "ejemplares_por_estado": (
        "Ejemplares por estado",
        """SELECT e.`Estado`, COUNT(*) AS Total_Ejemplares
           FROM `Ejemplar` e
           GROUP BY e.`Estado`
           ORDER BY Total_Ejemplares DESC""",
    ),
}


def main(argv):
    nombres = argv or list(CONSULTAS)
    desconocidas = [n for n in nombres if n not in CONSULTAS]
    if desconocidas:
        sys.exit(f"Consulta desconocida: {', '.join(desconocidas)}. Opciones: {', '.join(CONSULTAS)}")
    with conexion() as con:
        for nombre in nombres:
            titulo, sql = CONSULTAS[nombre]
            imprimir(titulo, consultar(con, sql))


if __name__ == "__main__":
    main(sys.argv[1:])
