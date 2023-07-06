import traceback
from util.db_conn import Db_Connection
import pandas as pd

def extraer_detallePedido ():

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
        
        address = pd.read_sql('SELECT * FROM detallepedido',ses_db_trx)

        return address

    except:
        traceback.print_exc()
    finally:
        pass

def persistir_detallePedido (detallePedido):

    try:
        type = 'mysql'
        host = '10.10.10.2'
        port = '3306'
        user = 'kevin'
        pwd = '13Demayo!'
        db = 'stg_Constructora'

        con_db_stg = Db_Connection(type, host, port, user, pwd, db)
        ses_db_stg = con_db_stg.start()
        if ses_db_stg == -1:
            raise Exception("El tipo de base de datos " + type + " no es válido")
        elif ses_db_stg == -2:
            raise Exception("Error al establecer la conexión de pruebas")             
        
        detallePedido.to_sql('ext_detallePedido', ses_db_stg, if_exists='replace', index=False)

    except:
        traceback.print_exc()
    finally:
        pass