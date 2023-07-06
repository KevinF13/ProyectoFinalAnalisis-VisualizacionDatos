import traceback
from util.db_conn import Db_Connection
import pandas as pd
from sqlalchemy import text

def cargar_category ():
    try:
        type = 'postgres'
        host = '10.10.10.2'
        port = '5432'
        user = 'postgres'
        pwd = 'postgres'
        db = 'stg_dvdrental'

        con_db_stg = Db_Connection(type, host, port, user, pwd, db)
        ses_db_stg= con_db_stg.start()
        if ses_db_stg == -1:
            raise Exception("El tipo de base de datos " + type + " no es válido")
        elif ses_db_stg == -2:
            raise Exception("Error al establecer la conexión de pruebas")    
        
        sql_sentence = "MERGE INTO public.dim_categoria car_ca USING (SELECT category_id, name FROM public.ext_category) AS ext_ca ON car_ca.category_id = ext_ca.category_id WHEN MATCHED THEN UPDATE SET name = ext_ca.name WHEN NOT MATCHED THEN INSERT (category_id, name) VALUES (ext_ca.category_id, ext_ca.name)"
        with ses_db_stg.begin() as conn:
            conn.execute(text(sql_sentence))

    except:
        traceback.print_exc()
    finally:
        con_db_stg.stop()