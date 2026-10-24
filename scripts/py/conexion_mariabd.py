import sys
import mariadb

try:
    # Establecer la conexión con la base de datos
    conexion = mariadb.connect(
        user="root",
        password="",
        host="127.0.0.1",
        port=3306,
        database="Biblioteca"
    )
except mariadb.Error as e:
    print(f"Error al conectar a MariaDB: {e}")
    sys.exit(1)

# Crear un cursor para ejecutar sentencias SQL
cursor = conexion.cursor()

# Ejecutar una consulta de ejemplo
cursor.execute("SELECT ISBN, Titulo FROM Libros")

# Recorrer los resultados
for (ISBN, Titulo) in cursor:
    print(f"ID: {ISBN}, Nombre: {Titulo}")

# Cerrar cursor y conexión
cursor.close()
conexion.close()