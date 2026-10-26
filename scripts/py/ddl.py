"""DDL (Data Definition Language) — equivalente a scripts/Comandos/1_DDL.sql.

CREATE / ALTER / CREATE INDEX / DROP. Idempotente: todo usa IF [NOT] EXISTS.
Requiere haber ejecutado antes scripts/crear_tablas_database.sql.
"""

from conexion import conexion, consultar, ejecutar, imprimir

SENTENCIAS = [
    # CREATE: tabla temporal para demostrar CREATE TABLE.
    """CREATE TABLE IF NOT EXISTS `Visiante` (
        `ID_visitante` INT NOT NULL AUTO_INCREMENT,
        `Nombre` VARCHAR(100) NOT NULL,
        `Tiempo_visita` INT NOT NULL,
        PRIMARY KEY (`ID_visitante`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
      COMMENT='Tabla de prueba para registrar visitantes y su tiempo de visita a la biblioteca.'""",
    # ALTER: columnas de prueba en Usuario y Empleado.
    """ALTER TABLE `Usuario`
        ADD COLUMN IF NOT EXISTS `Cant_prestamos` INT NULL
        COMMENT 'Cantidad de préstamos realizados por el cliente.'""",
    """ALTER TABLE `Empleado`
        ADD COLUMN IF NOT EXISTS `Horas_extras` TIME NULL
        COMMENT 'Cantidad de horas extras trabajadas por el empleado.'""",
    """ALTER TABLE `Empleado`
        ADD COLUMN IF NOT EXISTS `Doc_identidad` VARCHAR(20) NULL
        COMMENT 'Número de documento de identidad del empleado (columna de prueba).'""",
    # DROP: elimina la columna temporal añadida en la sentencia anterior.
    "ALTER TABLE `Empleado` DROP COLUMN IF EXISTS `Doc_identidad`",
    # CREATE INDEX: búsquedas por título del libro.
    "CREATE INDEX IF NOT EXISTS `idx_titulo_libro` ON `Libros` (`Titulo`)",
    # DROP: elimina la tabla de prueba.
    "DROP TABLE IF EXISTS `Visiante`",
]


def main():
    with conexion() as con:
        for sql in SENTENCIAS:
            ejecutar(con, sql)
            print("OK:", " ".join(sql.split())[:90])
        con.commit()

        imprimir(
            "Columnas agregadas",
            consultar(
                con,
                """SELECT table_name AS tabla, column_name AS columna, column_type AS tipo
                   FROM information_schema.columns
                   WHERE table_schema = DATABASE()
                     AND ((table_name = 'Usuario' AND column_name = 'Cant_prestamos')
                       OR (table_name = 'Empleado' AND column_name = 'Horas_extras'))
                   ORDER BY table_name, column_name""",
            ),
        )
        imprimir(
            "Índice creado",
            consultar(
                con,
                """SELECT table_name AS tabla, index_name AS indice, column_name AS columna
                   FROM information_schema.statistics
                   WHERE table_schema = DATABASE()
                     AND table_name = 'Libros'
                     AND index_name = 'idx_titulo_libro'""",
            ),
        )


if __name__ == "__main__":
    main()
