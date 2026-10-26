"""TCL (Transaction Control Language) — equivalente a scripts/Comandos/6_TCL.sql.

Registra un libro, un ejemplar, un autor y su relación dentro de una transacción,
y luego demuestra una transacción descartada con ROLLBACK.
"""

from conexionE import conexion


def main():
    with conexion() as con:
        try:
            con.begin()
            with con.cursor() as cur:
                cur.execute(
                    """INSERT INTO `Libros`
                       (`ISBN`, `Titulo`, `Editorial`, `anio_publicacion`, `Idioma`)
                       VALUES (%s, %s, %s, %s, %s)
                       ON DUPLICATE KEY UPDATE
                           `Titulo` = VALUES(`Titulo`),
                           `Editorial` = VALUES(`Editorial`),
                           `anio_publicacion` = VALUES(`anio_publicacion`),
                           `Idioma` = VALUES(`Idioma`)""",
                    ("9274381749132", "La historia de Pepo", "Editorial_123", 2026, "Español"),
                )
                cur.execute("SAVEPOINT `sp_libro_insertado`")

                cur.execute(
                    """INSERT INTO `Ejemplar`
                       (`ISBN`, `Codigo_barras`, `Estado`, `Ubicacion`)
                       VALUES (%s, %s, %s, %s)
                       ON DUPLICATE KEY UPDATE
                           `ISBN` = VALUES(`ISBN`),
                           `Estado` = VALUES(`Estado`),
                           `Ubicacion` = VALUES(`Ubicacion`)""",
                    ("9274381749132", "CB000012", "Disponible", "Estante A3"),
                )
                cur.execute("SAVEPOINT `sp_ejemplar_insertado`")

                cur.execute(
                    """SELECT `ID_autor` FROM `Autor`
                       WHERE `Nombre` = %s AND `Nacionalidad` = %s
                       ORDER BY `ID_autor`
                       LIMIT 1""",
                    ("Pepito Pepo", "Colombiana"),
                )
                autor = cur.fetchone()
                if autor is None:
                    cur.execute(
                        "INSERT INTO `Autor` (`Nombre`, `Nacionalidad`) VALUES (%s, %s)",
                        ("Pepito Pepo", "Colombiana"),
                    )
                    id_autor = cur.lastrowid
                else:
                    id_autor = autor["ID_autor"]
                cur.execute("SAVEPOINT `sp_autor_insertado`")

                cur.execute(
                    """INSERT INTO `Libro_Autor` (`ISBN`, `ID_autor`) VALUES (%s, %s)
                       ON DUPLICATE KEY UPDATE `ISBN` = VALUES(`ISBN`)""",
                    ("9274381749132", id_autor),
                )
            con.commit()
            print("COMMIT: libro, ejemplar, autor y relación registrados.")
        except Exception:
            con.rollback()
            raise

        try:
            con.begin()
            with con.cursor() as cur:
                filas_afectadas = cur.execute(
                    """UPDATE `Ejemplar`
                       SET `Estado` = %s
                       WHERE `Codigo_barras` = %s""",
                    ("Prestado", "CB000012#"),
                )
            con.rollback()
            print(
                "ROLLBACK: cambio descartado "
                f"({filas_afectadas} fila(s) coincidieron antes del rollback)."
            )
        except Exception:
            con.rollback()
            raise


if __name__ == "__main__":
    main()
