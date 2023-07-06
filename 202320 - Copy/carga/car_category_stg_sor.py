import traceback
from util.db_conn import Db_Connection
import pandas as pd
from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, text
def cargar_cat_stg_sor ():
    try:
        type = 'postgres'
        host = '10.10.10.2'
        port = '5432'
        user = 'postgres'
        pwd = 'postgres'
        db = 'stg_dvdrental'

        con_db_stg = Db_Connection(type, host, port, user, pwd, db)
        ses_db_stg = con_db_stg.start()
        if ses_db_stg == -1:
            raise Exception("El tipo de base de datos " + type + " no es válido")
        elif ses_db_stg == -2:
            raise Exception("Error al establecer la conexión de pruebas")          
       
        metadata = MetaData()
        
       
        temp_table = Table('temp_dim_categoria', metadata,
            Column('CATEGORIA_ID', Integer, primary_key=True),
            Column('CAT_BUS_ID', Integer, nullable=False),
            Column('NOMBRE', String(100), nullable=False)
        )
        temp_table.drop(ses_db_stg)
        temp_table.create(ses_db_stg)
        
        sql_sentece = text('MERGE INTO public.temp_dim_categoria USING (SELECT category_id, name FROM public.ext_category) AS ext_ca ON "CATEGORIA_ID" = ext_ca.category_id WHEN MATCHED THEN UPDATE SET "NOMBRE" = ext_ca.name WHEN NOT MATCHED THEN INSERT ("CAT_BUS_ID","NOMBRE") VALUES (ext_ca.category_id, ext_ca.name)')
        with ses_db_stg.begin() as conn:
             conn.execute(sql_sentece)



    except:
        traceback.print_exc()
    finally:
        con_db_stg.stop()