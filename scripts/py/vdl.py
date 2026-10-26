"""VDL (View Definition Language) — equivalente a scripts/Comandos/4_VDL.sql.

CREATE OR REPLACE VIEW de las tres vistas del proyecto y consulta de cada una.
Con --drop elimina las vistas en lugar de crearlas:
    python scripts/py/vdl.py --drop
"""

import sys

from conexion import conexion, consultar, ejecutar, imprimir

VISTAS = {
    "vistas_catalogo": (
        """CREATE OR REPLACE VIEW `vistas_catalogo` AS
           SELECT l.`ISBN`,
                  l.`Titulo` AS `Titulo_libro`,
                  GROUP_CONCAT(DISTINCT a.`Nombre` ORDER BY a.`Nombre` SEPARATOR ', ') AS `Autores`,
                  l.`Editorial`,
                  l.`anio_publicacion` AS `Anio_publicacion`,
                  l.`Idioma`
           FROM `Libros` l
           LEFT JOIN `Libro_Autor` la ON la.`ISBN` = l.`ISBN`
           LEFT JOIN `Autor` a ON a.`ID_autor` = la.`ID_autor`
           GROUP BY l.`ISBN`, l.`Titulo`, l.`Editorial`, l.`anio_publicacion`, l.`Idioma`""",
        "SELECT * FROM `vistas_catalogo` ORDER BY `Titulo_libro`",
    ),
    "vista_prestamos_activos": (
        """CREATE OR REPLACE VIEW `vista_prestamos_activos` AS
           SELECT p.`ID_Prestamo`,
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
           WHERE p.`fecha_devolucion` IS NULL""",
        "SELECT * FROM `vista_prestamos_activos` ORDER BY `fecha_prestamo`",
    ),
    "vista_reservas_activas": (
        """CREATE OR REPLACE VIEW `vista_reservas_activas` AS
           SELECT r.`ID_reserva`,
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
           WHERE r.`Estado` = 'Activa'""",
        "SELECT * FROM `vista_reservas_activas` ORDER BY `Fecha_reserva`",
    ),
}


def main(argv):
    with conexion() as con:
        if "--drop" in argv:
            for nombre in VISTAS:
                ejecutar(con, f"DROP VIEW IF EXISTS `{nombre}`")
                print(f"Vista eliminada: {nombre}")
            con.commit()
            return
        for nombre, (crear, consulta) in VISTAS.items():
            ejecutar(con, crear)
            imprimir(nombre, consultar(con, consulta))
        con.commit()


if __name__ == "__main__":
    main(sys.argv[1:])
