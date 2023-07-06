
from transformacion.ext_ClientesCsv import extraer_Clientes
from transformacion.tra_category import transformar_category
#
from extraccion.ext_Clientes import extraer_clientes
from extraccion.ins_clientes import insertarClientesFaker
from carga.car_category import cargar_category
from carga.car_category_stg_sor import cargar_cat_stg_sor
from extraccion.ins_material import insertarMaterialFaker
from extraccion.per_clientes import persistir_clientes

################################
from extraccion.ins_proyectos import insertarProyectosFaker