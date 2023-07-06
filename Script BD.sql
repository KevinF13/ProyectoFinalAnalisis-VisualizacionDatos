CREATE DATABASE Constructora;
USE Constructora;
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre_cliente VARCHAR(100) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  telefono CHAR(10) NOT NULL
);

CREATE TABLE Proyectos (
  id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  nombre_proyecto VARCHAR(100),
  descripcion TEXT,
  fecha_inicio DATE,
  fecha_finalizacion DATE,
  estado_proyecto VARCHAR(50),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE Calificaciones (
  id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
  id_proyecto INT NOT NULL,
  calificacion INT NOT NULL,
  comentario VARCHAR(100),
  fecha DATE NOT NULL,
  FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE Proveedor (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre_proveedor VARCHAR(60),
  direccion VARCHAR(60),
  telefono VARCHAR(10),
  correo_electronico VARCHAR(60)
);

CREATE TABLE Pedido (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  fecha_pedido DATE,
  valor_total_pedido DECIMAL(10,2)
);

CREATE TABLE Material (
  id_material INT PRIMARY KEY AUTO_INCREMENT,
  nombre_material VARCHAR(100),
  descripcion TEXT,
  unidad_medida VARCHAR(50)
);

CREATE TABLE Utilizacion (
  id_utilizacion INT PRIMARY KEY AUTO_INCREMENT,
  id_material INT,
  id_proyecto INT,
  cantidad_utilizada DECIMAL(10,2),
  fecha_utilizacion DATE,
  FOREIGN KEY (id_material) REFERENCES Material(id_material),
  FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE Oferta (
  id_oferta INT PRIMARY KEY AUTO_INCREMENT,
  id_proveedor INT,
  id_material INT,
  precio DECIMAL(10,2),
  calidad INT,
  plazo_entrega INT,
  condiciones_pago VARCHAR(100),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
  FOREIGN KEY (id_material) REFERENCES Material(id_material)
);

CREATE TABLE `detallepedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_oferta` int DEFAULT NULL,
  `cantidad_solicitada` decimal(10,2) DEFAULT NULL,
  `valor_oferta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_oferta` (`id_oferta`),
  CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`id_pedido`),
  CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`id_oferta`) REFERENCES `Oferta` (`id_oferta`)
);

CREATE TABLE CostosProyecto (
  costo_id INT PRIMARY KEY AUTO_INCREMENT,
  proyecto_id INT,
  logistica DECIMAL(10, 2),
  mano_obra DECIMAL(10, 2),
  equipos DECIMAL(10, 2),
  total DECIMAL(10, 2),
  FOREIGN KEY (proyecto_id) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE SeguimientoProyecto (
  seguimiento_id INT PRIMARY KEY AUTO_INCREMENT,
  proyecto_id INT,
  fecha_inicio DATE,
  fecha_finalizacion DATE,
  plazo_estimado INT,
  plazo_real INT,
  estado VARCHAR(50),
  problemas TEXT,
  acciones_correctivas TEXT,
  FOREIGN KEY (proyecto_id) REFERENCES Proyectos(id_proyecto)
);

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Luis García', 'luis@example.com', '555-1111');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('María Torres', 'maria@example.com', '555-2222');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Carlos Martínez', 'carlos@example.com', '555-3333');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Ana Ramírez', 'ana@example.com', '555-4444');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Pedro Gómez', 'pedro@example.com', '555-5555');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Laura Sánchez', 'laura@example.com', '555-6666');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Javier Castro', 'javier@example.com', '555-7777');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Sofía Rodríguez', 'sofia@example.com', '555-8888');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Juanita López', 'juanita@example.com', '555-9999');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Roberto Morales', 'roberto@example.com', '555-1010');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Marcela Hernández', 'marcela@example.com', '555-1212');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Diego Núñez', 'diego@example.com', '555-1313');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Carmen Fuentes', 'carmen@example.com', '555-1414');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Ricardo Castro', 'ricardo@example.com', '555-1515');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Valeria Jiménez', 'valeria@example.com', '555-1616');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Andrés Silva', 'andres@example.com', '555-1717');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Isabel Vargas', 'isabel@example.com', '555-1818');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Hugo Peralta', 'hugo@example.com', '555-1919');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('Daniela Ríos', 'daniela@example.com', '555-2020');

INSERT INTO clientes (nombre_cliente, correo, telefono)
VALUES ('José Mendoza', 'jose@example.com', '555-2121');



INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (2, 'Centro Comercial Libertad', 'Construcción de un centro comercial en Guayaquil', '2019-09-15', '2020-06-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (3, 'Hotel Costa del Sol', 'Construcción de un hotel en Salinas', '2017-08-20', '2018-12-15', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (4, 'Puente del Guayas', 'Construcción de un puente sobre el río Guayas en Guayaquil', '2016-07-10', '2018-03-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (5, 'Torres del Sol', 'Construcción de un complejo residencial en Quito', '2019-02-15', '2020-09-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (6, 'Hospital San Gabriel', 'Construcción de un hospital en Cuenca', '2017-10-20', '2019-06-15', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (7, 'Centro Educativo Soluciones', 'Construcción de un centro educativo en Quito', '2016-09-10', '2018-05-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (8, 'Edificio Torres del Norte', 'Construcción de un edificio residencial en Guayaquil', '2019-07-15', '2020-04-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (9, 'Complejo Deportivo Ciudadela', 'Construcción de un complejo deportivo en Quito', '2017-06-20', '2018-12-15', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (10, 'Centro Comercial Plaza del Sol', 'Construcción de un centro comercial en Cuenca', '2018-09-10', '2020-05-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (11, 'Edificio Vista Hermosa', 'Construcción de un edificio residencial en Guayaquil', '2019-05-15', '2020-12-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (1, 'Ampliación Aeropuerto Internacional', 'Construcción de la ampliación del aeropuerto en Quito', '2017-11-20', '2019-07-15', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (13, 'Condominio Los Alamos', 'Construcción de un condominio en Cuenca', '2016-08-10', '2018-04-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (4, 'Hospital La Pradera', 'Construcción de un hospital en Guayaquil', '2019-03-15', '2020-10-30', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (15, 'Centro Comercial Mall del Sol', 'Construcción de un centro comercial en Guayaquil', '2018-10-10', '2020-06-30', 'Finalizado');


INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (1, 'Centro Comercial El Dorado', 'Construcción de un centro comercial en Quito', '2022-02-01', '2023-07-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (2, 'Edificio Residencial Los Pinos', 'Construcción de un edificio residencial en Guayaquil', '2021-08-15', '2022-11-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (3, 'Hospital de la Sierra', 'Construcción de un hospital en Cuenca', '2021-05-20', '2022-10-15', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (4, 'Torres del Parque', 'Construcción de un complejo residencial en Quito', '2021-10-10', '2023-03-31', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (5, 'Centro Comercial La Estación', 'Construcción de un centro comercial en Guayaquil', '2021-09-15', '2022-12-31', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (6, 'Ampliación Hospital San Juan', 'Ampliación de un hospital en Cuenca', '2020-07-01', '2021-12-31', 'Finalizado');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (7, 'Complejo Residencial La Cascada', 'Construcción de un complejo residencial en Quito', '2020-11-15', '2022-06-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (8, 'Centro Comercial Mall del Norte', 'Construcción de un centro comercial en Ibarra', '2022-03-01', '2023-09-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (9, 'Edificio Residencial El Parque', 'Construcción de un edificio residencial en Guayaquil', '2021-07-10', '2022-12-15', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (10, 'Hospital de la Costa', 'Construcción de un hospital en Manta', '2021-04-20', '2022-09-15', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (15, 'Ampliación Terminal Aeropuerto Mariscal Sucre', 'Ampliación de la terminal del aeropuerto en Quito', '2022-01-15', '2023-06-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (12, 'Edificio Corporativo La Torre', 'Construcción de un edificio corporativo en Guayaquil', '2021-06-20', '2022-11-15', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (13, 'Hospital del Valle', 'Construcción de un hospital en Ambato', '2021-03-10', '2022-08-31', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (14, 'Centro Comercial Mall del Este', 'Construcción de un centro comercial en Cuenca', '2022-02-15', '2023-07-30', 'En Proceso');

INSERT INTO Proyectos (id_cliente, nombre_proyecto, descripcion, fecha_inicio, fecha_finalizacion, estado_proyecto)
VALUES (15, 'Edificio Residencial Vista Azul', 'Construcción de un edificio residencial en Guayaquil', '2021-07-01', '2022-12-31', 'En Proceso');



-- Material: Cemento
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Cemento', 'Cemento Portland tipo I', 'Bolsa');

-- Material: Arena
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Arena', 'Arena fina para construcción', 'Metro cúbico');

-- Material: Grava
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Grava', 'Grava para mezclas de concreto', 'Metro cúbico');

-- Material: Ladrillos
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Ladrillos', 'Ladrillos de arcilla', 'Unidad');

-- Material: Bloques de hormigón
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Bloques de hormigón', 'Bloques para construcción', 'Unidad');


-- Material: Acero corrugado
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Acero corrugado', 'Varillas de acero corrugado para refuerzo', 'Kilogramo');

-- Material: Alambre galvanizado
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Alambre galvanizado', 'Alambre de acero galvanizado', 'Rollo');

-- Material: Malla de refuerzo
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Malla de refuerzo', 'Malla de acero para refuerzo estructural', 'Metro cuadrado');

-- Material: Vidrio templado
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Vidrio templado', 'Vidrios templados para ventanas', 'Metro cuadrado');

-- Material: Tablero OSB
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Tablero OSB', 'Tablero OSB para estructuras', 'Metro cuadrado');

-- Material: Fibra de vidrio
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Fibra de vidrio', 'Fibra de vidrio para aislamiento térmico', 'Rollo');

-- Material: Pintura
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Pintura', 'Pintura para interiores', 'Galón');

-- Material: Varillas de acero
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Varillas de acero', 'Varillas de acero corrugado', 'Kilogramo');

-- Material: Tubos PVC
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Tubos PVC', 'Tubos de PVC para conducción de agua', 'Metro');


-- Material: Yeso
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Yeso', 'Yeso para revestimientos', 'Bolsa');

-- Material: Acero estructural
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Acero estructural', 'Perfiles de acero para estructuras', 'Kilogramo');

-- Material: Cerámica
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Cerámica', 'Pisos de cerámica', 'Metro cuadrado');

-- Material: Cable eléctrico
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Cable eléctrico', 'Cable para instalaciones eléctricas', 'Metro');

-- Material: Arena gruesa
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Arena gruesa', 'Arena gruesa para construcción', 'Metro cúbico');

-- Material: Piedra
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES('Piedra', 'Piedras para cimientos', 'Metro cúbico');

-- Material: Tejas
INSERT INTO Material (nombre_material, descripcion, unidad_medida)
VALUES ('Tejas', 'Tejas para techos', 'Unidad');



INSERT INTO Utilizacion (id_material, id_proyecto, cantidad_utilizada, fecha_utilizacion) VALUES
(1, 1, 10.5, '2023-01-01'),
(2, 1, 15.2, '2023-01-05'),
(3, 2, 8.7, '2023-01-07'),
(4, 3, 20.0, '2023-01-10'),
(5, 4, 12.3, '2023-01-12'),
(6, 4, 18.6, '2023-01-15'),
(7, 5, 25.8, '2023-01-18'),
(8, 6, 30.2, '2023-01-20'),
(9, 6, 9.1, '2023-01-23'),
(10, 7, 16.9, '2023-01-25'),
(11, 8, 22.4, '2023-01-28'),
(12, 8, 11.7, '2023-01-31'),
(13, 9, 14.8, '2023-02-03'),
(14, 9, 19.3, '2023-02-06'),
(15, 10, 7.6, '2023-02-09'),
(16, 11, 28.5, '2023-02-12'),
(17, 11, 13.2, '2023-02-15'),
(18, 12, 9.9, '2023-02-18'),
(19, 12, 17.4, '2023-02-21'),
(20, 13, 23.7, '2023-02-24'),
(16, 25, 13.8, '2023-04-16'),
(17, 26, 19.2, '2023-04-19'),
(18, 1, 11.9, '2023-04-22'),
(19, 2, 14.3, '2023-04-25'),
(20, 2, 16.7, '2023-04-28'),
(21, 3, 9.5, '2023-05-01'),
(1, 4, 12.8, '2023-05-04'),
(2, 4, 15.6, '2023-05-07'),
(3, 5, 18.3, '2023-05-10'),
(4, 6, 10.7, '2023-05-13'),
(5, 6, 13.9, '2023-05-16'),
(6, 7, 16.2, '2023-05-19'),
(7, 8, 20.5, '2023-05-22'),
(8, 8, 9.3, '2023-05-25'),
(9, 9, 11.6, '2023-05-28'),
(10, 10, 14.4, '2023-05-31'),
(11, 10, 17.1, '2023-06-03'),
(12, 11, 8.9, '2023-06-06'),
(13, 12, 12.1, '2023-06-09'),
(14, 12, 14.8, '2023-06-12'),
(15, 13, 17.6, '2023-06-15'),
(1, 18, 13.4, '2023-07-03'),
(2, 19, 16.2, '2023-07-06'),
(3, 20, 9.7, '2023-07-09'),
(4, 21, 11.9, '2023-07-12'),
(5, 21, 14.7, '2023-07-15'),
(6, 22, 17.5, '2023-07-18'),
(7, 23, 20.3, '2023-07-21'),
(8, 23, 11.8, '2023-07-24'),
(9, 24, 13.6, '2023-07-27'),
(10, 25, 16.4, '2023-07-30'),
(11, 25, 19.2, '2023-08-02'),
(12, 26, 10.9, '2023-08-05'),
(13, 1, 13.1, '2023-08-08'),
(14, 1, 15.9, '2023-08-11'),
(15, 2, 18.7, '2023-08-14')
;




INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Ecuacor', 'Av. de los Granados 123, Quito', '02-5551111', 'ventas@ecuacor.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('ConstruMateriales', 'Calle del Acero 456, Guayaquil', '04-5552222', 'info@construmateriales.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Maderplast', 'Av. de las Maderas 789, Cuenca', '07-5553333', 'ventas@maderplast.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Ferretería El Constructor', 'Av. de los Herrajes 012, Quito', '02-5554444', 'info@elconstructor.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Materiales Ecuador', 'Calle de los Bloques 456, Guayaquil', '04-5555555', 'ventas@materiales-ecuador.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Tubos y Conexiones S.A.', 'Av. de las Tuberías 789, Quito', '02-5556666', 'info@tubosyconexiones.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Materiales San Juan', 'Calle de los Acabados 012, Guayaquil', '04-5557777', 'ventas@materialessanjuan.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Bloques del Valle', 'Av. de las Construcciones 345, Quito', '02-5558888', 'info@bloquesdelvalle.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Ferretería El Constructor', 'Calle de las Herramientas 678, Cuenca', '07-5559999', 'ventas@elconstructor.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Construmax', 'Av. de los Materiales 901, Quito', '02-5551010', 'info@construmax.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Distribuidora de Hierros', 'Calle del Acero 234, Guayaquil', '04-5551111', 'ventas@distribuidorahierros.com.ec');

INSERT INTO Proveedor (nombre_proveedor, direccion, telefono, correo_electronico)
VALUES ('Ladrillera del Sur', 'Av. de los Ladrillos 567, Cuenca', '07-5551212', 'info@ladrilleradelsur.com.ec');



-- Ofertas para el material "Cemento"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 1, 25.50, 4, 7, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 1, 24.75, 5, 5, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 1, 26.00, 3, 10, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 1, 25.00, 4, 8, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 1, 26.50, 5, 6, 'Pago a 15 días');

-- Ofertas para el material "Arena"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 2, 35.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 2, 34.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 2, 36.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 2, 35.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 2, 36.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Grava"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 3, 45.25, 4, 6, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 3, 44.50, 5, 4, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 3, 46.00, 3, 8, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 3, 45.75, 4, 7, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 3, 46.50, 5, 5, 'Pago a 15 días');

-- Ofertas para el material "Ladrillos"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 4, 0.50, 4, 3, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 4, 0.45, 5, 2, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 4, 0.55, 3, 4, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 4, 0.52, 4, 5, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 4, 0.58, 5, 3, 'Pago a 15 días');

-- Ofertas para el material "Bloques de hormigón"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 5, 1.25, 4, 4, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 5, 1.20, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 5, 1.30, 3, 5, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 5, 1.28, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 5, 1.35, 5, 4, 'Pago a 15 días');



-- Agrega las demás ofertas para los otros materiales y proveedores

-- Ofertas para el material "Acero corrugado"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 6, 45.50, 4, 7, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 6, 44.75, 5, 5, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 6, 46.00, 3, 10, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 6, 45.00, 4, 8, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 6, 46.50, 5, 6, 'Pago a 15 días');


-- Ofertas para el material "Alambre galvanizado"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 7, 12.50, 4, 7, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 7, 11.75, 5, 5, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 7, 13.00, 3, 10, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 7, 12.00, 4, 8, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 7, 13.50, 5, 6, 'Pago a 15 días');

-- Ofertas para el material "Malla de refuerzo"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 8, 18.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 8, 17.50, 5, 3, 'Pago anticipado del 50%');



INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 8, 19.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 8, 18.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 8, 19.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Vidrio Templado"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 9, 85.25, 4, 6, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 9, 84.50, 5, 4, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 9, 86.00, 3, 8, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 9, 85.75, 4, 7, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 9, 86.50, 5, 5, 'Pago a 15 días');

-- Ofertas para el material "Tablero OSB"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 10, 15.50, 4, 7, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 10, 14.75, 5, 5, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 10, 16.00, 3, 10, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 10, 15.00, 4, 8, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 10, 16.50, 5, 6, 'Pago a 15 días');


-- Ofertas para el material "fibra de vidrio"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 11, 25.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 11, 24.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 11, 26.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 11, 25.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 11, 26.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Pintura"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 12, 32.25, 4, 6, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 12, 31.50, 5, 4, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 12, 33.00, 3, 8, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 12, 32.75, 4, 7, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 12, 33.50, 5, 5, 'Pago a 15 días');

-- Ofertas para el material "Varillas de acero"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 13, 55.25, 4, 6, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 13, 54.50, 5, 4, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 13, 56.00, 3, 8, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 13, 55.75, 4, 7, 'Pago a 60 días');


INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 13, 56.50, 5, 5, 'Pago a 15 días');

-- Ofertas para el material "Tuberías PVC"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 14, 8.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 14, 7.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 14, 9.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 14, 8.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 14, 9.50, 5, 4, 'Pago a 15 días');

-- Agrega las demás ofertas para los otros materiales y proveedores

-- Ofertas para el material "Yeso"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 15, 8.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 15, 8.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 15, 9.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 15, 8.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 15, 9.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Acero estructural"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 16, 55.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 16, 54.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 16, 56.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 16, 55.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 16, 56.50, 5, 4, 'Pago a 15 días');


-- Ofertas para el material "Cerámica"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 17, 16.25, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 17, 15.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 17, 17.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 17, 16.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 17, 17.50, 5, 4, 'Pago a15 días');

-- Ofertas para el material "Cable eléctrico"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 18, 4.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (11, 18, 4.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 18, 5.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 18, 4.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 18, 5.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Arena gruesa"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 19, 25.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 19, 24.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 19, 26.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (1, 19, 25.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 19, 26.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Piedra"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (2, 20, 35.25, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (4, 20, 34.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (6, 20, 36.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (3, 20, 35.25, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (9, 20, 36.50, 5, 4, 'Pago a 15 días');

-- Ofertas para el material "Tejas"
INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (7, 21, 1.75, 4, 5, 'Pago a 30 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (10, 21, 1.50, 5, 3, 'Pago anticipado del 50%');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (8, 21, 2.00, 3, 7, 'Pago a la entrega');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (5, 21, 1.75, 4, 6, 'Pago a 60 días');

INSERT INTO Oferta (id_proveedor, id_material, precio, calidad, plazo_entrega, condiciones_pago)
VALUES (12, 21, 2.50, 5, 4, 'Pago a 15 días');




INSERT INTO Pedido (fecha_pedido, valor_total_pedido) VALUES
('2023-06-01', 1250.00),
('2023-06-05', 1850.75),
('2023-06-10', 2200.50),
('2023-06-15', 1500.25),
('2023-06-20', 1980.80),
('2023-06-25', 1750.60),
('2023-06-30', 2400.00),
('2023-07-05', 2100.50),
('2023-07-10', 1890.25),
('2023-07-15', 2250.80),
('2015-08-10', 1800.50),
('2016-03-22', 2150.25),
('2017-01-05', 1890.75),
('2018-06-18', 1750.00),
('2019-09-30', 1980.50),
('2020-11-12', 1650.80),
('2021-04-03', 2250.60),
('2022-09-26', 1920.25),
('2023-01-15', 2100.80),
('2023-04-20', 2450.00),
('2023-05-10', 2200.50),
('2023-06-05', 1850.75),
('2023-07-01', 1950.25),
('2015-02-14', 1850.00),
('2015-06-27', 1950.25),
('2015-09-10', 2100.50),
('2015-12-03', 2250.75),
('2016-03-18', 2350.80),
('2016-06-21', 2450.00),
('2016-09-05', 2150.50),
('2016-12-19', 1980.75),
('2017-02-22', 2050.25),
('2017-05-15', 2200.60),
('2017-08-08', 1920.80),
('2017-11-11', 2100.25),
('2018-03-04', 2280.50),
('2018-06-07', 2450.75),
('2018-09-20', 2350.80),
('2018-12-13', 2180.00),
('2019-03-26', 1980.25),
('2019-07-09', 2050.50),
('2019-10-22', 2150.75),
('2020-02-04', 2280.80),
('2020-02-14', 1850.00),
('2020-03-27', 1950.25),
('2020-05-10', 2100.50),
('2020-06-23', 2250.75),
('2020-08-06', 2350.80),
('2020-09-19', 2450.00),
('2020-11-02', 2150.50),
('2020-12-15', 1980.75),
('2021-01-28', 2050.25),
('2021-03-13', 2200.60),
('2021-04-26', 1920.80),
('2021-06-09', 2100.25),
('2021-07-22', 2280.50),
('2021-09-04', 2450.75),
('2021-10-17', 2350.80),
('2021-11-30', 2180.00),
('2022-01-12', 1980.25),
('2022-02-25', 2050.50),
('2022-04-10', 2150.75),
('2022-05-23', 2280.80);


INSERT INTO detallepedido (id_pedido, id_oferta, cantidad_solicitada, valor_oferta) VALUES
(1, 45, 5.00, 50.00),
(1, 87, 8.00, 80.00),
(2, 22, 10.00, 100.00),
(3, 56, 15.00, 150.00),
(4, 73, 20.00, 200.00),
(5, 32, 25.00, 250.00),
(6, 91, 30.00, 300.00),
(7, 16, 35.00, 350.00),
(8, 40, 40.00, 400.00),
(9, 68, 45.00, 450.00),
(10, 9, 50.00, 500.00),
(11, 76, 55.00, 550.00),
(12, 26, 60.00, 600.00),
(13, 99, 65.00, 650.00),
(14, 52, 70.00, 700.00),
(15, 84, 75.00, 750.00),
(16, 37, 80.00, 800.00),
(17, 64, 85.00, 850.00),
(18, 14, 90.00, 900.00),
(19, 78, 95.00, 950.00),
(20, 29, 100.00, 1000.00),
(21, 92, 5.00, 50.00),
(21, 68, 8.00, 80.00),
(22, 14, 10.00, 100.00),
(23, 37, 15.00, 150.00),
(24, 54, 20.00, 200.00),
(25, 26, 25.00, 250.00),
(26, 82, 30.00, 300.00),
(27, 47, 35.00, 350.00),
(28, 71, 40.00, 400.00),
(29, 9, 45.00, 450.00),
(30, 64, 50.00, 500.00),
(31, 33, 55.00, 550.00),
(32, 87, 60.00, 600.00),
(33, 94, 65.00, 650.00),
(34, 51, 70.00, 700.00),
(35, 76, 75.00, 750.00),
(36, 19, 80.00, 800.00),
(37, 43, 85.00, 850.00),
(38, 69, 90.00, 900.00),
(39, 26, 95.00, 950.00),
(40, 58, 100.00, 1000.00),
(41, 102, 5.00, 50.00),
(41, 59, 8.00, 80.00),
(42, 40, 10.00, 100.00),
(43, 16, 15.00, 150.00),
(44, 95, 20.00, 200.00),
(45, 7, 25.00, 250.00),
(46, 85, 30.00, 300.00),
(47, 49, 35.00, 350.00),
(48, 73, 40.00, 400.00),
(49, 5, 45.00, 450.00),
(50, 99, 50.00, 500.00),
(51, 28, 55.00, 550.00),
(52, 89, 60.00, 600.00),
(53, 96, 65.00, 650.00),
(54, 45, 70.00, 700.00),
(55, 78, 75.00, 750.00),
(56, 21, 80.00, 800.00),
(57, 46, 85.00, 850.00),
(58, 72, 90.00, 900.00),
(59, 28, 95.00, 950.00),
(60, 62, 100.00, 1000.00),
(47, 92, 8.00, 80.00),
(48, 50, 12.00, 120.00),
(49, 79, 15.00, 150.00),
(50, 61, 20.00, 200.00),
(51, 35, 25.00, 250.00),
(52, 94, 30.00, 300.00),
(53, 77, 35.00, 350.00),
(54, 70, 40.00, 400.00),
(55, 40, 45.00, 450.00),
(56, 98, 50.00, 500.00),
(57, 47, 55.00, 550.00),
(58, 102, 60.00, 600.00),
(59, 55, 65.00, 650.00),
(60, 29, 70.00, 500.00),
(61, 86, 75.00, 250.00),
(62, 59, 80.00, 400.00),
(63, 83, 85.00, 550.00),
(47, 73, 90.00, 400.00),
(48, 43, 95.00, 350.00),
(49, 95, 100.00, 200.00),
(50, 90, 8.50, 85.00),
(51, 61, 12.50, 125.00),
(52, 84, 15.50, 155.00),
(53, 35, 20.50, 205.00),
(54, 98, 25.50, 255.00),
(55, 73, 30.50, 305.00),
(56, 47, 35.50, 355.00),
(57, 101, 40.50, 405.00),
(58, 76, 45.50, 455.00),
(59, 40, 50.50, 505.00),
(60, 82, 55.50, 555.00),
(61, 53, 60.50, 105.00),
(62, 29, 65.50, 355.00),
(63, 92, 70.50, 205.00),
(50, 60, 75.50, 455.00),
(51, 45, 80.50, 305.00),
(52, 94, 85.50, 755.00),
(53, 68, 90.50, 405.00),
(54, 36, 95.50, 555.00),
(55, 83, 100.50, 305.00),
(1, 67, 8.50, 85.00),
(2, 91, 12.50, 125.00),
(3, 83, 15.50, 155.00),
(4, 39, 20.50, 205.00),
(5, 54, 25.50, 255.00),
(6, 79, 30.50, 305.00),
(7, 57, 35.50, 355.00),
(8, 64, 40.50, 405.00),
(9, 78, 45.50, 455.00),
(10, 41, 50.50, 505.00),
(11, 86, 55.50, 455.00),
(12, 51, 60.50, 505.00),
(13, 30, 65.50, 455.00),
(14, 72, 70.50, 305.00),
(15, 69, 75.50, 455.00),
(16, 77, 80.50, 205.00),
(17, 95, 85.50, 555.00),
(18, 97, 90.50, 605.00),
(19, 100, 95.50, 555.00),
(20, 104, 100.50, 505.00),
(2, 78, 8.75, 87.50),
(3, 101, 10.25, 102.50),
(4, 95, 12.50, 125.00),
(5, 103, 14.75, 147.50),
(6, 84, 17.25, 172.50),
(7, 93, 20.00, 200.00),
(8, 99, 22.50, 225.00),
(9, 85, 24.75, 247.50),
(10, 80, 27.00, 270.00),
(11, 100, 29.25, 292.50),
(12, 88, 31.50, 315.00),
(13, 90, 33.75, 337.50),
(14, 97, 36.00, 360.00),
(15, 105, 38.25, 382.50),
(16, 98, 40.50, 405.00),
(17, 96, 42.75, 427.50),
(18, 82, 45.00, 450.00),
(19, 105, 47.25, 472.50),
(20, 92, 49.50, 495.00),
(1, 81, 51.75, 517.50);

-- Inserción de datos en la tabla CostosProyecto
INSERT INTO CostosProyecto (proyecto_id, logistica, mano_obra, equipos, total) VALUES
  (1, 15000.00, 25000.00, 10000.00, 50000.00),
  (2, 20000.00, 30000.00, 15000.00, 65000.00),
  (3, 18000.00, 28000.00, 12000.00, 58000.00),
  (4, 25000.00, 35000.00, 20000.00, 80000.00),
  (5, 22000.00, 32000.00, 18000.00, 72000.00),
  (6, 19000.00, 29000.00, 14000.00, 62000.00);

-- Inserción de datos en la tabla SeguimientoProyecto
INSERT INTO SeguimientoProyecto (proyecto_id, fecha_inicio, fecha_finalizacion, plazo_estimado, plazo_real, estado, problemas, acciones_correctivas) VALUES
  (1, '2023-01-01', '2023-02-15', 45, 46, 'Concluido', 'Ninguno', 'N/A'),
  (2, '2023-02-01', '2023-05-30', 120, 115, 'Concluido', 'Ninguno', 'N/A'),
  (3, '2023-03-15', '2023-09-30', 200, 195, 'En progreso', 'Retraso en la entrega de materiales', 'Reasignación de recursos'),
  (4, '2023-04-01', '2023-07-15', 105, 100, 'Concluido', 'Ninguno', 'N/A'),
  (5, '2023-05-01', '2023-11-30', 180, 185, 'En progreso', 'Variaciones en el diseño', 'Ajuste en los planos'),
  (6, '2023-06-15', '2023-10-31', 140, 135, 'Concluido', 'Ninguno', 'N/A');

