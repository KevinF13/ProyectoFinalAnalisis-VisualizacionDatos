
import datetime
import random
import traceback

from faker import Faker
from util.db_conn import Db_Connection
import pandas as pd

def insertarMaterialFaker():
    try:
        type = 'mysql'
        host = '10.10.10.2'
        port = '3306'
        user = 'kevin'
        pwd = '13Demayo!'
        db = 'Constructora'

        con_db_trx = Db_Connection(type, host, port, user, pwd, db)
        ses_db_trx = con_db_trx.start()
        if ses_db_trx == -1:
            raise Exception("El tipo de base de datos " + type + " no es válido")
        elif ses_db_trx == -2:
            raise Exception("Error al establecer la conexión de pruebas")        
        
        fake = Faker()
        
                # Iniciar el bucle for
        for i in range(50):  # Aquí puedes ajustar el rango según tus necesidades
            # Obtener los datos del cliente a insertar
            mi_lista = ['Cemento', 'Arena', 'grava', 'ladrillos']
            mi_lista2 = ['Bolsa', 'Metros', 'Unidad', 'Kilogramos']

            elemento_seleccionado = random.choice(mi_lista)
            elemento_seleccionado2 = random.choice(mi_lista2)

            nombre_material = elemento_seleccionado
            descripcion = fake.sentence(nb_words=10)
            unidad_medida = elemento_seleccionado2
            # Crear un DataFrame con los datos del cliente a insertar
            data = {'nombre_material': [nombre_material], 'descripcion': [descripcion],
                     'unidad_medida': [unidad_medida]}
            df = pd.DataFrame(data)

            # Insertar los datos del DataFrame en la tabla 'clientes'
            df.to_sql('Material', con=ses_db_trx, if_exists='append', index=False)

            # Realizar la consulta para obtener los datos de la tabla 'clientes'
            proyectos = pd.read_sql('SELECT * FROM Material', ses_db_trx)
        print(proyectos)
        return proyectos

    except:
        traceback.print_exc()
    finally:
        pass

# import mysql.connector
# from faker import Faker
# import random
# import decimal
# from datetime import timedelta

# fake = Faker(['es_CO', 'es_MX'])

# # Conexión a la base de datos
# connection_mysql = mysql.connector.connect(
#     host="10.10.10.2",
#     user="kevin",
#     password="13Demayo",
#     database="'Constructora"
# )
# cursor = connection_mysql.cursor()

# # Generación de datos falsos y llenado de tablas

# categorias = ["Televisores", "Celulares", "Computadoras", "Electrodomésticos", "Accesorios", "Salud", "Deporte", "Tablets", "Muebles", "Camaras"]

# # Tabla "Categoria"
# for _ in range(10):
#     nombre_cliente = fake.name()
#     correo = fake.email()
#     telefono = fake.phone_number()

#     sql = "INSERT INTO Categoria (nombre_cliente, correo, telefono) VALUES (%s, %s, %s)"
#     val = (nombre_cliente, correo, telefono)
#     cursor.execute(sql, val)

# connection_mysql.commit()
# cursor.close()
# connection_mysql.close()