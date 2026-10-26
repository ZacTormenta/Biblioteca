"""DML (Data Manipulation Language) — equivalente a scripts/Comandos/2_DML.sql.

Inserta un ejemplar de prueba, actualiza su estado dos veces y lo elimina.
Requiere haber ejecutado scripts/crear_tablas_database.sql y contar con los
libros y ejemplares referenciados por las sentencias.
"""

from conexion import conexion, ejecutar


SENTENCIAS = [
    (
        """INSERT INTO `Ejemplar` (`ISBN`, `Codigo_barras`, `Estado`, `Ubicacion`)
           VALUES (%s, %s, %s, %s)
           ON DUPLICATE KEY UPDATE
               `ISBN` = VALUES(`ISBN`),
               `Estado` = VALUES(`Estado`),
               `Ubicacion` = VALUES(`Ubicacion`)""",
        ("9786070023456", "CB000011", "Dañado", "Estante A2"),
        "INSERT",
    ),
    (
        """UPDATE `Ejemplar`
           SET `Estado` = %s, `Ubicacion` = %s
           WHERE `Codigo_barras` = %s AND `Estado` = %s""",
        ("Reservado", "Estante B1", "CB000011", "Dañado"),
        "UPDATE 1",
    ),
    (
        """UPDATE `Ejemplar`
           SET `Estado` = %s, `Ubicacion` = %s
           WHERE `Codigo_barras` = %s""",
        ("Dañado", "Área de mantenimiento", "CB000001"),
        "UPDATE 2",
    ),
    (
        "DELETE FROM `Ejemplar` WHERE `Codigo_barras` = %s",
        ("CB000011",),
        "DELETE",
    ),
]


def main():
    with conexion() as con:
        for sql, parametros, operacion in SENTENCIAS:
            filas_afectadas = ejecutar(con, sql, parametros)
            print(f"{operacion}: {filas_afectadas} fila(s) afectada(s)")
        con.commit()


if __name__ == "__main__":
    main()
