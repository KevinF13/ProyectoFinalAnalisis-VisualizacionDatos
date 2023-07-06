import traceback
import pandas as pd

def extraer_Clientes ():

    try: 
        
        filename = '"C:/Users/Kevin/Desktop/Septimo Semestre Udla/Analisis y Visualización de datos/Proyecto Final/csv de tablas/clientes.csv"'

        categories = pd.read_csv(filename)

        return categories

    except:
        traceback.print_exc()
    finally:
        pass