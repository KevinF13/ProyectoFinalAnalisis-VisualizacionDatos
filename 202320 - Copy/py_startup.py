# this file is a kind of python startup module used for manual unit testing

import traceback
from faker import Faker

import pandas as pd
from extraccion.ext_Calificaciones import extraer_calificaciones
from extraccion.ext_CostosProyecto import extraer_costosProyecto
from extraccion.ext_DetallePedido import extraer_detallePedido, persistir_detallePedido
from extraccion.ext_Material import extraer_material
from extraccion.ext_Oferta import extraer_oferta
from extraccion.ext_Pedido import extraer_pedido
from extraccion.ext_Proveedor import extraer_proveedor
from extraccion.ext_Proyecto import extraer_proyecto
from extraccion.ext_SeguimientoProyecto import extraer_seguimientoProyecto
from extraccion.ext_Utilizacion import extraer_utilizacion
from extraccion.per_Utilizacion import persistir_utilizacion
from extraccion.per_calificaciones import persistir_calificaciones
from extraccion.per_costosProyecto import persistir_costosProyecto
from extraccion.per_material import persistir_material
from extraccion.per_oferta import persistir_oferta
from extraccion.per_pedido import persistir_pedido
from extraccion.per_proveedor import persistir_proveedor
from extraccion.per_proyecto import persistir_proyecto
from extraccion.per_seguimientoProyecto import persistir_seguimientoProyecto

import rutas.rutas as r


try:
     #####################################################
#     INSERTAR DATOS FALSO EN TABLA CLIENTE
     print ("Ingreso de datos falsos a base de datos")
    # city= r.insertarClientesFaker()
     #proyectos = r.insertarProyectosFaker()
     #material = r.insertarMaterialFaker()

    ######################################################
     print ("Extraccion de Clientes")
     clientes = r.extraer_clientes()
     print(clientes)
     print ("Extraccion de Proyectos")
     proyectos = extraer_proyecto()
     print(proyectos)
     print ("Extraccion de Calificaciones")
     calificaciones = extraer_calificaciones()
     print(calificaciones)
     print ("Extraccion de CostosProyecto")
     costosProyecto = extraer_costosProyecto()
     print(costosProyecto)
     print ("Extraccion de DetallePedido")
     detallePedido = extraer_detallePedido()
     print(detallePedido)
     print ("Extraccion de Material")
     material = extraer_material()
     print(material)
     print ("Extraccion de Oferta")
     oferta = extraer_oferta()
     print(oferta)
     print ("Extraccion de Pedido")
     pedido = extraer_pedido()
     print(pedido)
     print ("Extraccion de Proveedor")
     proveedor = extraer_proveedor()
     print(proveedor)
     print ("Extraccion de SeguimientoProyecto")
     segproyecto = extraer_seguimientoProyecto()
     print(segproyecto)
     print ("Extraccion de Utilizacion")
     utilizacion = extraer_utilizacion()
     print(utilizacion)

    #####################################################
     print ("Persistencia de Clientes")
     r.persistir_clientes(clientes)
     print ("Persistencia de Calificaciones")
     persistir_calificaciones(calificaciones)
     print ("Persistencia de costosProyecto")
     persistir_costosProyecto(costosProyecto)
     print ("Persistencia de DetallePEdido")
     persistir_detallePedido(detallePedido)
     print ("Persistencia de Material")
     persistir_material(material)
     print ("Persistencia de Oferta")
     persistir_oferta(oferta)
     print ("Persistencia de Pedido")
     persistir_pedido(pedido)
     print ("Persistencia de Proveedor")
     persistir_proveedor(proveedor)
     print ("Persistencia de Proyecto")
     persistir_proyecto(proyectos)
     print ("Persistencia de Seguimiento Proyecto")
     persistir_seguimientoProyecto(segproyecto)
     print ("Persistencia de Utilizacion")
     persistir_utilizacion(utilizacion)
except:
    traceback.print_exc()
finally:
    pass