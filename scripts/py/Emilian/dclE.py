"""DCL (Data Control Language) — equivalente a sql/mariadb/commands/05_DCL.sql.

CREATE USER / GRANT / REVOKE / FLUSH PRIVILEGES / SHOW GRANTS. Requiere una cuenta
administrativa (por defecto root de XAMPP). Es repetible: CREATE USER usa IF NOT EXISTS.

Las contraseñas de las cuentas de ejemplo se pueden cambiar con las variables de
entorno GLOB_GUSTERS_PASS_REPORTES y GLOB_GUSTERS_PASS_MOSTRADOR; los valores por
defecto son los mismos del .sql.
"""

import os

import mariadb

conexion = mariadb.connect(
    host="127.0.0.1",
    port=3307,
    user="root",
    password="",
    database="Biblioteca"
)

cursor = conexion.cursor()

# Crear a un usuario
sql = """
CREATE USER IF NOT EXISTS 'bibliotecario'@'localhost'
IDENTIFIED BY '1234567890';
"""

try:
    cursor.execute(sql)
    conexion.commit()
    print("Usuario creado o ya existente.")

    # Otorgar permisos a un usuario
    sql="""GRANT SELECT ON Biblioteca.Libros
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    # Otorgar permisos a un usuario
    sql="""GRANT SELECT ON Biblioteca.Usuario
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    # Otorgar permisos a un usuario
    sql="""GRANT SELECT ON Biblioteca.Multa
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    # Otorgar permisos a un usuario
    sql="""GRANT SELECT ON Biblioteca.Reserva
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    # Otorgar permisos a un usuario
    sql="""GRANT SELECT ON Biblioteca.Prestamos
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    sql="""GRANT SELECT ON Biblioteca.Libros
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    sql="""GRANT SELECT ON Biblioteca.Autor
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    sql="""GRANT SELECT ON Biblioteca.Reserva
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    sql="""GRANT SELECT ON Biblioteca.Prestamos
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()

    sql="""GRANT SELECT ON Biblioteca.Usuario
    TO 'bibliotecario'@'localhost';"""

    cursor.execute(sql)
    conexion.commit()


    cursor.close()
    conexion.close()

except mariadb.Error as error:
    print("Código del error:", error.errno)
    print("Mensaje:", error.msg)
    conexion.rollback()

finally:
    cursor.close()
    conexion.close()


