
-- SUCURSAL
INSERT INTO SUCURSAL (ID_SUCURSAL, NOMBRE_SUCURSAL, PRESUPUESTO_SUCURSAL, DIRECCION_SUCURSAL, TELEFONO_SUCURSAL, ESTADO_SUCURSAL) VALUES
(1, 'ElectroHogar - Sucursal San Salvador', 150000.00, 'Centro Comercial Galerías, Paseo General Escalón, San Salvador', '2298-1000', 'Activa'),
(2, 'ElectroHogar - Sucursal Santa Ana', 90000.00, 'Metrocentro Santa Ana, Local 45, Santa Ana', '2441-2000', 'Activa'),
(3, 'ElectroHogar - Sucursal San Miguel', 100000.00, 'Plaza Caimito, Carretera Panamericana, San Miguel', '2661-3000', 'Activa');
-- CATEGORIA
INSERT INTO CATEGORIA (ID_CATEGORIA, NOMBRE_CATEGORIA, ESTADO_CATEGORIA) VALUES
(1, 'Refrigeración', 'Activo'),
(2, 'Línea Blanca', 'Activo'),
(3, 'Electrónica', 'Activo'),
(4, 'Climatización', 'Activo'),
(5, 'Audio y Video', 'Activo'),
(6, 'Pequeños Electrodomésticos', 'Activo'),
(7, 'Cómputo y Tecnología', 'Activo'),
(8, 'Cocina y Repostería', 'Activo'),
(9, 'Lavado y Secado', 'Activo'),
(10, 'Cuidado Personal', 'Activo'),
(11, 'Iluminación y Hogar', 'Activo'),
(12, 'Herramientas y Jardín', 'Activo'),
(13, 'Muebles de Oficina', 'Activo'),
(14, 'Smart Home', 'Activo'),
(15, 'Accesorios de Audio', 'Activo');
-- PROVEEDOR
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, ESTADO_PROVEEDOR) VALUES
(1, 'Mabe El Salvador, S.A.', '2250-4000', 'Activo'),
(2, 'LG Electronics Centroamérica', '2231-5000', 'Activo'),
(3, 'Samsung Electronics de C.A.', '2209-6000', 'Activo'),
(4, 'Whirlpool Centroamérica', '2275-7000', 'Activo'),
(5, 'Cetron El Salvador', '2222-8100', 'Activo'),
(6, 'Sony Interamericana', '2293-1200', 'Activo'),
(7, 'Oster de Centroamérica', '2246-3300', 'Activo'),
(8, 'Black & Decker El Salvador', '2281-9000', 'Activo'),
(9, 'Panasonic de El Salvador', '2260-1100', 'Activo'),
(10, 'Bosch El Salvador', '2212-4400', 'Activo'),
(11, 'Philips Centroamérica', '2239-5500', 'Activo'),
(12, 'Imaco Comercial', '2224-6600', 'Activo'),
(13, 'Challenger del Caribe', '2278-8800', 'Activo'),
(14, 'Frigidaire Latinoamérica', '2205-9900', 'Activo'),
(15, 'Daikin Air Conditioning', '2299-1010', 'Activo'),
(16, 'Carrier El Salvador', '2233-2020', 'Activo'),
(17, 'Midea Central America', '2288-3030', 'Activo'),
(18, 'TCL Electronics CA', '2211-4040', 'Activo'),
(19, 'Distribuidora Electrolux', '2255-6060', 'Activo'),
(20, 'Importadora Osteria', '2266-7070', 'Activo');

-- Usuario
INSERT INTO USUARIO (ID_USUARIO, NOMBRE_USUARIO, CLAVE, ESTADO_USUARIO, INTENTOS_INGRESO) VALUES
(1, 'jsanchez', '123456', 'Activo', 0),
(2, 'mhernandez', '123456', 'Activo', 0),
(3, 'lmartinez', '123456', 'Activo', 0),
(4, 'cflores', '123456', 'Activo', 0),
(5, 'arapirez', '123456', 'Activo', 0),
(6, 'kgomez', '123456', 'Activo', 0),
(7, 'dcastillo', '123456', 'Activo', 0),
(8, 'nortiz', '123456', 'Activo', 0),
(9, 'pmendoza', '123456', 'Activo', 0),
(10, 'hsuarez', '123456', 'Activo', 0),
(11, 'jrivas', '123456', 'Activo', 0),
(12, 'cmorales', '123456', 'Activo', 0),
(13, 'esilva', '123456', 'Activo', 0),
(14, 'fgaitan', '123456', 'Activo', 0),
(15, 'vaguilar', '123456', 'Activo', 0),
(16, 'bportillo', '123456', 'Activo', 0),
(17, 'mcoreas', '123456', 'Activo', 0),
(18, 'sorellana', '123456', 'Activo', 0),
(19, 'jmelendez', '123456', 'Activo', 0),
(20, 'aescobar', '123456', 'Activo', 0),
(21, 'rvelasquez', '123456', 'Activo', 0),
(22, 'lquinteros', '123456', 'Activo', 0),
(23, 'eperez', '123456', 'Activo', 0),
(24, 'nramirez', '123456', 'Activo', 0),
(25, 'dromero', '123456', 'Activo', 0),
(26, 'csosa', '123456', 'Activo', 0),
(27, 'mamezquita', '123456', 'Activo', 0),
(28, 'fguevara', '123456', 'Activo', 0),
(29, 'jarevalo', '123456', 'Activo', 0),
(30, 'oadmin', '123456', 'Activo', 0);

-- PROMOCION
INSERT INTO PROMOCION (ID_PROMOCION, FECHA_INICIO, FECHA_FIN, PORCENTAJE_DESCUENTO, ESTADO_PROMOCION) VALUES
(1, '2026-01-01', '2026-01-31', 15.00, 'Inactiva'),
(2, '2026-02-01', '2026-02-28', 10.00, 'Inactiva'),
(3, '2026-03-01', '2026-03-31', 20.00, 'Inactiva'),
(4, '2026-04-01', '2026-04-30', 25.00, 'Inactiva'),
(5, '2026-05-01', '2026-05-15', 30.00, 'Inactiva'),
(6, '2026-05-16', '2026-05-31', 12.50, 'Inactiva'),
(7, '2026-06-01', '2026-06-30', 10.00, 'Inactiva'),
(8, '2026-07-01', '2026-07-31', 5.00, 'Inactiva'),
(9, '2026-08-01', '2026-08-31', 18.00, 'Inactiva'),
(10, '2026-09-01', '2026-09-30', 22.00, 'Inactiva'),
(11, '2026-10-01', '2026-10-31', 15.00, 'Inactiva'),
(12, '2026-11-01', '2026-11-30', 35.00, 'Activa'),
(13, '2026-12-01', '2026-12-31', 50.00, 'Activa'),
(14, '2025-11-15', '2025-11-30', 40.00, 'Inactiva'),
(15, '2025-12-01', '2025-12-31', 20.00, 'Inactiva'),
(16, '2026-11-01', '2026-11-20', 10.00, 'Activa'),
(17, '2026-11-05', '2026-11-25', 15.00, 'Activa'),
(18, '2026-11-01', '2026-11-15', 20.00, 'Activa'),
(19, '2026-11-10', '2026-11-30', 12.00, 'Activa'),
(20, '2027-01-01', '2027-01-15', 10.00, 'Activa'),
(21, '2026-11-01', '2026-11-30', 8.00, 'Activa'),
(22, '2026-11-01', '2026-11-30', 18.00, 'Activa'),
(23, '2026-11-01', '2026-11-30', 25.00, 'Activa'),
(24, '2026-12-01', '2026-12-20', 12.00, 'Activa'),
(25, '2026-11-01', '2026-11-30', 15.00, 'Activa');
-- CLIENTE
INSERT INTO CLIENTE (ID_CLIENTE, CORREO, TELEFONO_CLIENTE, ESTADO_CLIENTE) VALUES
-- 35 Clientes Naturales (IDs 1 al 35)
(1, 'carlos.mendoza@gmail.com', '7854-1234', 'Activo'),
(2, 'ana.guerra@yahoo.com', '7234-5678', 'Activo'),
(3, 'luis.ramirez@hotmail.com', '7987-4321', 'Activo'),
(4, 'marta.fuentes@gmail.com', '7123-8901', 'Activo'),
(5, 'jorge.hernandez@outlook.com', '7543-2109', 'Activo'),
(6, 'elena.castro@gmail.com', '7654-3210', 'Activo'),
(7, 'roberto.flores@yahoo.com', '7321-6548', 'Activo'),
(8, 'sandra.martinez@gmail.com', '7456-9871', 'Activo'),
(9, 'victor.perez@hotmail.com', '7890-1235', 'Activo'),
(10, 'claudia.rivas@gmail.com', '7111-2233', 'Activo'),
(11, 'daniel.cruz@outlook.com', '7222-3344', 'Activo'),
(12, 'beatriz.gomez@gmail.com', '7333-4455', 'Activo'),
(13, 'oscar.silva@yahoo.com', '7444-5566', 'Activo'),
(14, 'patricia.morales@gmail.com', '7555-6677', 'Activo'),
(15, 'ricardo.ortiz@hotmail.com', '7666-7788', 'Activo'),
(16, 'gabriela.suarez@gmail.com', '7777-8899', 'Activo'),
(17, 'fernando.aguilar@outlook.com', '7888-9900', 'Activo'),
(18, 'sofia.portillo@gmail.com', '7999-0011', 'Activo'),
(19, 'alejandro.coreas@yahoo.com', '7100-1122', 'Activo'),
(20, 'daniela.orellana@gmail.com', '7200-2233', 'Activo'),
(21, 'mauricio.melendez@hotmail.com', '7300-3344', 'Activo'),
(22, 'carolina.escobar@gmail.com', '7400-4455', 'Activo'),
(23, 'eduardo.velasquez@outlook.com', '7500-5566', 'Activo'),
(24, 'katherine.quinteros@gmail.com', '7600-6677', 'Activo'),
(25, 'hugo.perez@yahoo.com', '7700-7788', 'Activo'),
(26, 'veronica.ramirez@gmail.com', '7800-8899', 'Activo'),
(27, 'cesar.romero@hotmail.com', '7900-9900', 'Activo'),
(28, 'monica.sosa@gmail.com', '7123-1111', 'Activo'),
(29, 'francisco.amezquita@outlook.com', '7234-2222', 'Activo'),
(30, 'jessica.guevara@gmail.com', '7345-3333', 'Activo'),
(31, 'manuel.arevalo@yahoo.com', '7456-4444', 'Activo'),
(32, 'rocio.navas@gmail.com', '7567-5555', 'Activo'),
(33, 'alfredo.palacios@hotmail.com', '7678-6666', 'Activo'),
(34, 'brenda.lara@gmail.com', '7789-7777', 'Activo'),
(35, 'sergio.bonilla@outlook.com', '7890-8888', 'Activo'),

-- 25 Clientes Jurídicos (IDs 36 al 60)
(36, 'compras@hotellosrobles.com', '2245-1000', 'Activo'),
(37, 'adquisiciones@restaurantelaloma.sv', '2268-2000', 'Activo'),
(38, 'contacto@constructoraaltos.com', '2234-3000', 'Activo'),
(39, 'admin@hotelorquidea.com', '2660-4000', 'Activo'),
(40, 'info@cafeterialabenecol.sv', '2440-5000', 'Activo'),
(41, 'operaciones@inmobiliariacentral.com', '2298-6000', 'Activo'),
(42, 'gerencia@supermercadoely.com', '2332-7000', 'Activo'),
(43, 'compras@hotelpalmeras.sv', '2661-8000', 'Activo'),
(44, 'logistica@industriastecnologicas.com', '2279-9000', 'Activo'),
(45, 'facturacion@restauranteelsabor.com', '2222-1111', 'Activo'),
(46, 'admin@residencialessonsonate.com', '2451-2222', 'Activo'),
(47, 'contacto@hoteltropical.sv', '2664-3333', 'Activo'),
(48, 'compras@distribuidoramejia.com', '2236-4444', 'Activo'),
(49, 'ventas@equipamientohogar.com', '2272-5555', 'Activo'),
(50, 'soporte@constructormontana.sv', '2211-6666', 'Activo'),
(51, 'admin@hostalcolonial.com', '2443-7788', 'Activo'),
(52, 'compras@restauranteelfogon.com', '2280-9900', 'Activo'),
(53, 'finanzas@inversionessanbenito.com', '2299-4433', 'Activo'),
(54, 'operaciones@corporaciondelnorte.sv', '2335-5566', 'Activo'),
(55, 'contacto@hotelmiramar.com', '2668-7788', 'Activo'),
(56, 'admin@cafegourmetsv.com', '2225-9988', 'Activo'),
(57, 'compras@constructoraorion.com', '2244-1122', 'Activo'),
(58, 'logistica@multiserviciosglobales.sv', '2276-3344', 'Activo'),
(59, 'facturacion@hotellapaz.com', '2448-5566', 'Activo'),
(60, 'admin@comercializadoradelvalle.com', '2290-7788', 'Activo');

-- CLIENTENATURAL (IDs 1 al 35)
INSERT INTO CLIENTENATURAL (ID_CLIENTE, NOMBRE_CLIENTE, DUI_CLIENTE) VALUES
(1, 'Carlos Alberto Mendoza', '03456789-1'),
(2, 'Ana María Guerra', '04567890-2'),
(3, 'Luis Alonso Ramírez', '05678901-3'),
(4, 'Marta Alicia Fuentes', '06789012-4'),
(5, 'Jorge Mario Hernández', '07890123-5'),
(6, 'Elena Beatriz Castro', '08901234-6'),
(7, 'Roberto Carlos Flores', '09012345-7'),
(8, 'Sandra Patricia Martínez', '01234567-8'),
(9, 'Víctor Manuel Pérez', '02345678-9'),
(10, 'Claudia Elizabeth Rivas', '03456780-1'),
(11, 'Daniel Enrique Cruz', '04567812-2'),
(12, 'Beatriz Adriana Gómez', '05678923-3'),
(13, 'Óscar Antonio Silva', '06789034-4'),
(14, 'Patricia Guadalupe Morales', '07890145-5'),
(15, 'Ricardo Ernesto Ortiz', '08901256-6'),
(16, 'Gabriela Alejandra Suárez', '09012367-7'),
(17, 'Fernando José Aguilar', '01234589-8'),
(18, 'Sofía Margarita Portillo', '02345690-9'),
(19, 'Alejandro Javier Coreas', '03456712-1'),
(20, 'Daniela Michelle Orellana', '04567823-2'),
(21, 'Mauricio Ernesto Meléndez', '05678934-3'),
(22, 'Carolina del Carmen Escobar', '06789045-4'),
(23, 'Eduardo Rafael Velásquez', '07890156-5'),
(24, 'Katherine Nicole Quinteros', '08901267-6'),
(25, 'Hugo Ernesto Pérez', '09012378-7'),
(26, 'Verónica Alejandra Ramírez', '01234590-8'),
(27, 'César Alejandro Romero', '02345601-9'),
(28, 'Mónica Raquel Sosa', '03456723-1'),
(29, 'Francisco Javier Amézquita', '04567834-2'),
(30, 'Jessica María Guevara', '05678945-3'),
(31, 'Manuel de Jesús Arévalo', '06789056-4'),
(32, 'Rocío del Carmen Navas', '07890167-5'),
(33, 'Alfredo Enrique Palacios', '08901278-6'),
(34, 'Brenda Estefanía Lara', '09012389-7'),
(35, 'Sergio Daniel Bonilla', '01234501-8');

-- CLIENTEJURIDICO (IDS 36 al 60 )
INSERT INTO CLIENTEJURIDICO (ID_CLIENTE, NOMBRE_REPRESENTANTE_LEGAL, NIT, RAZON_SOCIAL, CUPO_CREDITO_CORPORATIVO) VALUES
(36, 'Roberto Valdés', '0614-120585-101-2', 'Hoteles y Resorts Los Robles', 25000.00),
(37, 'Mario Benítez', '0614-220890-102-5', 'Restaurantes La Loma', 10000.00),
(38, 'Carmen de Paz', '0614-301178-103-8', 'Constructora Altos de Santa Tecla', 50000.00),
(39, 'Sofia Arévalo', '0614-050482-104-1', 'Hotel Boutique Orquídea', 15000.00),
(40, 'Mauricio Cerna', '0614-180995-105-3', 'Cafetería y Repostería La Benecol', 5000.00),
(41, 'Ricardo Molina', '0614-251280-106-7', 'Inmobiliaria Central', 30000.00),
(42, 'Rosaura Menjívar', '0614-090688-107-9', 'Supermercados Ely', 40000.00),
(43, 'Ernesto Salguero', '0614-140275-108-4', 'Hotel Las Palmeras del Golfo', 20000.00),
(44, 'Marcela Dubón', '0614-310191-109-2', 'Industrias Tecnológicas de C.A.', 35000.00),
(45, 'Humberto Ticas', '0614-110783-110-6', 'Restaurante El Sabor Criollo', 8000.00),
(46, 'Guillermo Portillo', '0614-220389-111-8', 'Inversiones Residenciales Sonsonate', 45000.00),
(47, 'Ana Patricia Rueda', '0614-081092-112-1', 'Hotel Tropical San Miguel', 18000.00),
(48, 'José Luis Mejía', '0614-190477-113-5', 'Distribuidora Mejía e Hijos', 22000.00),
(49, 'Claudia Cárdenas', '0614-270884-114-3', 'Equipamiento del Hogar Moderno', 12000.00),
(50, 'David Sandoval', '0614-031290-115-9', 'Constructora Montaña Alta', 60000.00),
(51, 'Fernando Chinchilla', '0614-160586-116-4', 'Hostal Colonial de Occidente', 6000.00),
(52, 'Gloria Melgar', '0614-290993-117-2', 'Restaurante y Asados El Fogón', 9000.00),
(53, 'Mauricio Interiano', '0614-121179-118-8', 'Inversiones San Benito', 28000.00),
(54, 'Beatriz Orellana', '0614-040787-119-1', 'Corporación del Norte', 33000.00),
(55, 'Roxana Galán', '0614-210294-120-5', 'Hotel y Playa Miramar', 24000.00),
(56, 'Samuel Peraza', '0614-150881-121-7', 'Café Gourmet Salvadoreño', 7000.00),
(57, 'Cristian Landaverde', '0614-280689-122-3', 'Constructora e Inmobiliaria Orión', 55000.00),
(58, 'Walter Espinoza', '0614-071092-123-6', 'Multiservicios Globales de C.A.', 15000.00),
(59, 'Carmen Elena Sosa', '0614-130385-124-9', 'Hotel La Paz de Oriente', 17000.00),
(60, 'Gustavo Adolfo Paz', '0614-201276-125-2', 'Comercializadora del Valle', 38000.00);

-- EMPLEADO

INSERT INTO EMPLEADO (ID_EMPLEADO, ID_SUCURSAL, ID_SUPERVISOR, ID_USUARIO, NOMBRE_EMPLEADO, DUI_EMPLEADO, CORREO_ELECTRONICO, FECHA_CONTRATACION, DIRECCION_EMPLEADO, TELEFONO_EMPLEADO, TIPO_EMPLEADO) VALUES
-- Sucursal San Salvador (IDs 1-10)
(1, 1, NULL, 1, 'Juan Carlos Sánchez', '02345678-1', 'jsanchez@electrohogar.sv', '2023-01-15', 'Colonia Escalón, San Salvador', '7911-2233', 'Supervisor'),
(2, 1, 1, 2, 'María José Hernández', '03456789-2', 'mhernandez@electrohogar.sv', '2023-03-10', 'Soyapango, San Salvador', '7822-3344', 'Subordinado'),
(3, 1, 1, 3, 'Luis Alberto Martínez', '04567890-3', 'lmartinez@electrohogar.sv', '2023-05-12', 'Mejicanos, San Salvador', '7733-4455', 'Subordinado'),
(4, 1, 1, 4, 'Carlos Eduardo Flores', '05678901-4', 'cflores@electrohogar.sv', '2023-06-20', 'San Salvador Centro', '7644-5566', 'Subordinado'),
(5, 1, 1, 5, 'Ana Raquel Ramírez', '06789012-5', 'aramirez@electrohogar.sv', '2023-08-01', 'Antiguo Cuscatlán', '7555-6677', 'Subordinado'),
(6, 1, 1, 6, 'Kevin Alexander Gómez', '07890123-6', 'kgomez@electrohogar.sv', '2023-09-15', 'Ilopango, San Salvador', '7466-7788', 'Subordinado'),
(7, 1, 1, 7, 'Diana Marcela Castillo', '08901234-7', 'dcastillo@electrohogar.sv', '2023-10-10', 'Ciudad Delgado', '7377-8899', 'Subordinado'),
(8, 1, 1, 8, 'Nelson Ernesto Ortiz', '09012345-8', 'nortiz@electrohogar.sv', '2024-01-11', 'San Salvador Norte', '7288-9900', 'Subordinado'),
(9, 1, 1, 9, 'Paola Michelle Mendoza', '01234567-9', 'pmendoza@electrohogar.sv', '2024-02-15', 'Apopa, San Salvador', '7199-0011', 'Subordinado'),
(10, 1, 1, 10, 'Héctor Daniel Suárez', '02345679-0', 'hsuarez@electrohogar.sv', '2024-03-01', 'San Salvador Sur', '7011-1122', 'Subordinado'),

-- Sucursal Santa Ana (IDs 11-20)
(11, 2, NULL, 11, 'José Mauricio Rivas', '03456791-1', 'jrivas@electrohogar.sv', '2023-02-01', 'Colonia El Trébol, Santa Ana', '7922-1122', 'Supervisor'),
(12, 2, 11, 12, 'Claudia María Morales', '04567802-2', 'cmorales@electrohogar.sv', '2023-04-15', 'Santa Ana Centro', '7833-2233', 'Subordinado'),
(13, 2, 11, 13, 'Ernesto Antonio Silva', '05678913-3', 'esilva@electrohogar.sv', '2023-06-10', 'Chalchuapa, Santa Ana', '7744-3344', 'Subordinado'),
(14, 2, 11, 14, 'Fabiola Guadalupe Gaitán', '06789024-4', 'fgaitan@electrohogar.sv', '2023-07-22', 'Metapán, Santa Ana', '7655-4455', 'Subordinado'),
(15, 2, 11, 15, 'Víctor Manuel Aguilar', '07890135-5', 'vaguilar@electrohogar.sv', '2023-09-05', 'Santa Ana Oeste', '7566-5566', 'Subordinado'),
(16, 2, 11, 16, 'Brenda Lissette Portillo', '08901246-6', 'bportillo@electrohogar.sv', '2023-11-12', 'El Congo, Santa Ana', '7477-6677', 'Subordinado'),
(17, 2, 11, 17, 'Mario René Coreas', '09012357-7', 'mcoreas@electrohogar.sv', '2024-01-20', 'Santa Ana Norte', '7388-7788', 'Subordinado'),
(18, 2, 11, 18, 'Sandra Elizabeth Orellana', '01234678-8', 'sorellana@electrohogar.sv', '2024-02-10', 'Buena Vista, Santa Ana', '7299-8899', 'Subordinado'),
(19, 2, 11, 19, 'Javier Alejandro Meléndez', '02345789-9', 'jmelendez@electrohogar.sv', '2024-03-15', 'Santa Ana Sur', '7100-9900', 'Subordinado'),
(20, 2, 11, 20, 'Alejandra Beatriz Escobar', '03456890-0', 'aescobar@electrohogar.sv', '2024-04-01', 'Candelaria de la Frontera', '7011-0011', 'Subordinado'),

-- Sucursal San Miguel (IDs 21-30)
(21, 3, NULL, 21, 'Roberto Carlos Velásquez', '04567901-1', 'rvelasquez@electrohogar.sv', '2023-02-15', 'Avenida Roosevelt, San Miguel', '7933-4455', 'Supervisor'),
(22, 3, 21, 22, 'Karen Yessenia Quinteros', '05678012-2', 'lquinteros@electrohogar.sv', '2023-04-20', 'San Miguel Centro', '7844-5566', 'Subordinado'),
(23, 3, 21, 23, 'Edgar Alonso Pérez', '06789123-3', 'eperez@electrohogar.sv', '2023-06-15', 'Chinameca, San Miguel', '7755-6677', 'Subordinado'),
(24, 3, 21, 24, 'Nathalie Nicole Ramírez', '07890234-4', 'nramirez@electrohogar.sv', '2023-08-10', 'Moncagua, San Miguel', '7666-7788', 'Subordinado'),
(25, 3, 21, 25, 'David Alejandro Romero', '08901345-5', 'dromero@electrohogar.sv', '2023-10-01', 'San Miguel Norte', '7577-8899', 'Subordinado'),
(26, 3, 21, 26, 'Carmen Rosa Sosa', '09012456-6', 'csosa@electrohogar.sv', '2023-11-20', 'Quelepa, San Miguel', '7488-9900', 'Subordinado'),
(27, 3, 21, 27, 'Marvin Antonio Amézquita', '01235678-7', 'mamezquita@electrohogar.sv', '2024-01-05', 'San Miguel Este', '7399-0011', 'Subordinado'),
(28, 3, 21, 28, 'Flor de María Guevara', '02346789-8', 'fguevara@electrohogar.sv', '2024-02-18', 'El Tránsito, San Miguel', '7100-1122', 'Subordinado'),
(29, 3, 21, 29, 'Julio César Arévalo', '03457890-9', 'jarevalo@electrohogar.sv', '2024-03-10', 'San Miguel Sur', '7022-2233', 'Subordinado'),
(30, 3, 21, 30, 'Olga Marina Admin', '04568901-0', 'oadmin@electrohogar.sv', '2024-04-05', 'Comacarán, San Miguel', '7033-3344', 'Subordinado');

-- producto


INSERT INTO PRODUCTO (ID_PRODUCTO, ID_CATEGORIA, NOMBRE_PRODUCTO, PRECIO_VENTA, ESTADO_PRODUCTO) VALUES
-- Refrigeración (Cat 1)
(1, 1, 'Refrigerador Mabe 11 Pies Cromado', 489.99, 'Activo'),
(2, 1, 'Refrigerador LG Inverter 2 Puertas 14 Pies', 750.00, 'Activo'),
(3, 1, 'Refrigerador Samsung French Door 22 Pies', 1299.99, 'Activo'),
(4, 1, 'Mini Bar Cetron 3.2 Pies Cúbicos', 195.00, 'Activo'),
(5, 1, 'Refrigerador Whirlpool Top Mount 12 Pies', 520.00, 'Activo'),
(6, 1, 'Congelador Horizontal Midea 5 Pies Cúbicos', 280.00, 'Activo'),
(7, 1, 'Refrigerador Frigidaire 10 Pies Blanco', 430.00, 'Activo'),
(8, 1, 'Dispensador de Agua Enfriador Mabe', 165.00, 'Activo'),

-- Línea Blanca (Cat 2)
(9, 2, 'Cocina a Gas Mabe 4 Quemadores con Horno', 310.00, 'Activo'),
(10, 2, 'Cocina Whirlpool Vidrio Templado 6 Quemadores', 550.00, 'Activo'),
(11, 2, 'Estufa de Mesa Eléctrica 2 Hornillas Imaco', 38.00, 'Activo'),
(12, 2, 'Cocina a Gas Acero Inoxidable Challenger 4 Hornillas', 395.00, 'Activo'),
(13, 2, 'Cocina Empotrable de Inducción Midea 4 Zonas', 480.00, 'Activo'),
(14, 2, 'Campana Extractora de Humo Mabe 60 cm', 210.00, 'Activo'),
(15, 2, 'Horno Empotrable a Gas Whirlpool 24 Pulgadas', 610.00, 'Activo'),

-- Electrónica (Cat 3)
(16, 3, 'Smart TV TCL 50 Pulgadas 4K UHD', 349.99, 'Activo'),
(17, 3, 'Smart TV Sony Bravia 55 Pulgadas Google TV', 680.00, 'Activo'),
(18, 3, 'Pantalla LED Samsung 43 Pulgadas Full HD', 280.00, 'Activo'),
(19, 3, 'Smart TV LG 65 Pulgadas 4K ThinQ AI', 899.99, 'Activo'),
(20, 3, 'Smart TV Xiaomi 32 Pulgadas HD LED', 185.00, 'Activo'),
(21, 3, 'Pantalla LED Hisense 58 Pulgadas 4K UHD', 450.00, 'Activo'),
(22, 3, 'Smart TV RCA 40 Pulgadas Full HD', 220.00, 'Activo'),

-- Climatización (Cat 4)
(23, 4, 'Aire Acondicionado Split Inverter 12000 BTU Midea', 420.00, 'Activo'),
(24, 4, 'Aire Acondicionado Daikin 18000 BTU 220V', 720.00, 'Activo'),
(25, 4, 'Ventilador de Pedestal Black & Decker 3 en 1', 45.00, 'Activo'),
(26, 4, 'Aire Acondicionado Portable LG 10000 BTU', 490.00, 'Activo'),
(27, 4, 'Ventilador de Torre Oscilante Imaco con Control', 65.00, 'Activo'),
(28, 4, 'Aire Acondicionado Carrier 24000 BTU Inverter', 1100.00, 'Activo'),
(29, 4, 'Deshumidificador Casero Midea 30 Pints', 230.00, 'Activo'),
(30, 4, 'Ventilador de Piso Industrial 20 Pulgadas', 75.00, 'Activo'),

-- Audio y Video (Cat 5)
(31, 5, 'Barra de Sonido Sony con Subwoofer Inalámbrico', 210.00, 'Activo'),
(32, 5, 'Minicomponente LG Bluetooth XBOOM 1000W', 315.00, 'Activo'),
(33, 5, 'Sistema de Audio JBL PartyBox 110 Portátil', 399.99, 'Activo'),
(34, 5, 'Barra de Sonido Samsung 2.1 Canales con Dolby Audio', 175.00, 'Activo'),
(35, 5, 'Minicomponente Panasonic MAX GO 300W', 260.00, 'Activo'),
(36, 5, 'Reproductor Blu-Ray Disc Sony con Streaming', 120.00, 'Activo'),

-- Pequeños Electrodomésticos (Cat 6)
(37, 6, 'Licuadora Oster Jarra de Vidrio 3 Velocidades', 49.99, 'Activo'),
(38, 6, 'Cafetera Eléctrica Black & Decker 12 Tazas', 32.50, 'Activo'),
(39, 6, 'Microondas Mabe Digital 0.7 Pies Cúbicos', 95.00, 'Activo'),
(40, 6, 'Tostadora de Pan Philips 2 Ranuras', 28.00, 'Activo'),
(41, 6, 'Plancha de Vapor para Ropa Black & Decker', 24.99, 'Activo'),
(42, 6, 'Licuadora de Inmersión Oster con Accesorios', 42.00, 'Activo'),
(43, 6, 'Cafetera Espresso Philips de Cápsulas', 115.00, 'Activo'),
(44, 6, 'Microondas LG Grill 1.1 Pies Cúbicos', 160.00, 'Activo'),
(45, 6, 'Exprimidor de Cítricos Eléctrico Imaco', 22.00, 'Activo'),
(46, 6, 'Batidora de Mano Oster 5 Velocidades', 29.99, 'Activo'),
(47, 6, 'Hervidor de Agua Eléctrico Acero Inoxidable 1.7 L', 31.00, 'Activo'),
(48, 6, 'Sandwichera Placa Antiadherente Imaco', 26.50, 'Activo'),

-- Cómputo y Tecnología (Cat 7)
(49, 7, 'Laptop HP 15.6 Pulgadas Core i5 8GB RAM 512GB SSD', 620.00, 'Activo'),
(50, 7, 'Impresora Multifuncional Epson EcoTank L3210', 215.00, 'Activo'),
(51, 7, 'Laptop Lenovo IdeaPad 3 Celeron 4GB 128GB SSD', 340.00, 'Activo'),
(52, 7, 'Tablet Lenovo Tab M10 Plus 4GB 64GB', 199.99, 'Activo'),
(53, 7, 'Monitor Gamer LED 24 Pulgadas Full HD AOC', 155.00, 'Activo'),
(54, 7, 'Impresora HP LaserJet Pro Inalámbrica', 245.00, 'Activo'),
(55, 7, 'Router Inalámbrico Wi-Fi 6 Dual Band TP-Link', 79.99, 'Activo'),
(56, 7, 'Disco Duro Externo Portable 1TB Seagate', 62.00, 'Activo'),

-- Cocina y Repostería (Cat 8)
(57, 8, 'Batidora de Pedestal Oster con Tazón de Acero', 85.00, 'Activo'),
(58, 8, 'Freidora de Aire Imaco Digital 4 Litros', 99.99, 'Activo'),
(59, 8, 'Horno Tostador Black & Decker 9 Litros', 65.00, 'Activo'),
(60, 8, 'Procesador de Alimentos Oster 8 Tazas', 78.00, 'Activo'),
(61, 8, 'Olla de Presión Multifuncional Midea 6 Litros', 110.00, 'Activo'),
(62, 8, 'Wafflera Eléctrica Giratoria Oster', 45.00, 'Activo'),
(63, 8, 'Freidora de Aire Dual Basket Ninja 8 Litros', 199.99, 'Activo'),
(64, 8, 'Set de Ollas de Acero Inoxidable Tramontina 10 Pzas', 135.00, 'Activo'),

-- Lavado y Secado (Cat 9)
(65, 9, 'Lavadora Automática Whirlpool 18 Kg Carga Superior', 580.00, 'Activo'),
(66, 9, 'Centro de Lavado Mabe Gas 20 Kg', 1150.00, 'Activo'),
(67, 9, 'Secadora de Ropa Midea Eléctrica 7 Kg', 410.00, 'Activo'),
(68, 9, 'Lavadora Semiautomática Cetron 13 Kg Doble Tina', 295.00, 'Activo'),
(69, 9, 'Lavadora LG Carga Frontal Inverter 12 Kg', 790.00, 'Activo'),
(70, 9, 'Secadora de Ropa a Gas Whirlpool 15 Kg', 680.00, 'Activo'),

-- Cuidado Personal (Cat 10)
(71, 10, 'Secadora de Cabello Profesional Remington', 35.00, 'Activo'),
(72, 10, 'Afeitadora Recargable Philips Series 3000', 55.00, 'Activo'),
(73, 10, 'Plancha Alaciadora de Cabello Conair Cerámica', 42.00, 'Activo'),
(74, 10, 'Cortadora de Cabello Kit Profesional Wahl', 48.00, 'Activo'),
(75, 10, 'Depiladora Eléctrica Braun Silk-épil 3', 65.00, 'Activo'),
(76, 10, 'Cepillo Secador Revlon One-Step Volumizer', 52.00, 'Activo'),

-- Iluminación y Hogar (Cat 11)
(77, 11, 'Lámpara LED Inteligente de Piso Wi-Fi', 40.00, 'Activo'),
(78, 11, 'Aspiradora Vertical Sin Cable Midea', 125.00, 'Activo'),
(79, 11, 'Aspiradora de Arrastre 2000W Philips', 145.00, 'Activo'),
(80, 11, 'Robot Aspirador Inteligente Xiaomi Mi Robot', 275.00, 'Activo'),
(81, 11, 'Lámpara de Escritorio LED con Carga USB', 24.50, 'Activo'),
(82, 11, 'Set de Focos LED Inteligentes RGB Pack de 4', 32.00, 'Activo'),

-- Herramientas y Jardín (Cat 12)
(83, 12, 'Hidrolavadora Black & Decker 1500 PSI', 140.00, 'Activo'),
(84, 12, 'Taladro Percutor Bosch 550W con Accesorios', 79.99, 'Activo'),
(85, 12, 'Cortadora de Césped Eléctrica Black & Decker', 210.00, 'Activo'),
(86, 12, 'Kit de Herramientas Manuales 100 Piezas Stanley', 85.00, 'Activo'),
(87, 12, 'Esmeril Angular Bosch 4-1/2 Pulgadas 710W', 69.00, 'Activo'),
(88, 12, 'Soplador de Hojas Eléctrico B&D 400W', 55.00, 'Activo'),

-- Muebles de Oficina (Cat 13)
(89, 13, 'Silla Ergonómica Ejecutiva para Oficina', 130.00, 'Activo'),
(90, 13, 'Escritorio Modular de Madera para Cómputo', 160.00, 'Activo'),
(91, 13, 'Estantería Metálica de 5 Niveles para Archivo', 95.00, 'Activo'),
(92, 13, 'Silla de Visita Fija Tapizada en Tela', 55.00, 'Activo'),
(93, 13, 'Archivero Metálico de 3 Gavetas con Llave', 185.00, 'Activo'),

-- Smart Home (Cat 14)
(94, 14, 'Kit de Seguridad Smart Home Cámara y Sensores', 180.00, 'Activo'),
(95, 14, 'Enchufe Inteligente Wi-Fi Compatible con Alexa', 18.50, 'Activo'),
(96, 14, 'Cámara de Seguridad Exterior Wi-Fi 1080p Imou', 65.00, 'Activo'),
(97, 14, 'Cerradura Digital Inteligente con Huella Biométrica', 240.00, 'Activo'),

-- Accesorios de Audio (Cat 15)
(98, 15, 'Audífonos Inalámbricos Bluetooth Sony con Cancelación', 95.00, 'Activo'),
(99, 15, 'Bocina Portátil JBL Clip 4 Resistente al Agua', 65.00, 'Activo'),
(100, 15, 'Audífonos Gamer con Micrófono HyperX Cloud Stinger', 59.99, 'Activo'),

-- Refrigeración (Cat 1)
(101, 1, 'Refrigerador Hisense Inverter 13 Pies Gris', 575.00, 'Activo'),
(102, 1, 'Congelador Vertical Frigidaire 7 Pies', 410.00, 'Activo'),
(103, 1, 'Refrigerador Midea Side by Side 18 Pies', 890.00, 'Activo'),
(104, 1, 'Enfriador de Bebidas RCA 90 Litros', 225.00, 'Activo'),

-- Línea Blanca (Cat 2)
(105, 2, 'Cocina Eléctrica Frigidaire 4 Quemadores', 625.00, 'Activo'),
(106, 2, 'Horno de Gas Mabe 30 Pulgadas', 695.00, 'Activo'),
(107, 2, 'Campana Extractora Whirlpool 90 cm', 285.00, 'Activo'),

-- Electrónica (Cat 3)
(108, 3, 'Smart TV Hisense 70 Pulgadas 4K UHD', 785.00, 'Activo'),
(109, 3, 'Proyector Portátil Epson Full HD', 620.00, 'Activo'),
(110, 3, 'Smart TV Philips 55 Pulgadas Ambilight', 730.00, 'Activo'),
(111, 3, 'Pantalla Samsung QLED 65 Pulgadas', 1120.00, 'Activo'),

-- Climatización (Cat 4)
(112, 4, 'Ventilador de Techo Hunter con Control', 145.00, 'Activo'),
(113, 4, 'Purificador de Aire Xiaomi Smart Air', 185.00, 'Activo'),
(114, 4, 'Aire Acondicionado Mini Split LG 9000 BTU', 385.00, 'Activo'),

-- Audio y Video (Cat 5)
(115, 5, 'Parlante Bluetooth Bose SoundLink Flex', 175.00, 'Activo'),
(116, 5, 'Sistema de Teatro en Casa Sony 5.1', 450.00, 'Activo'),
(117, 5, 'Micrófono Inalámbrico JBL Dual', 120.00, 'Activo'),

-- Pequeños Electrodomésticos (Cat 6)
(118, 6, 'Licuadora Ninja Profesional 1000W', 135.00, 'Activo'),
(119, 6, 'Cafetera Programable Oster 12 Tazas', 55.00, 'Activo'),
(120, 6, 'Microondas Samsung 1.4 Pies Cúbicos', 185.00, 'Activo'),
(121, 6, 'Plancha de Vapor Philips 2400W', 65.00, 'Activo'),

-- Cómputo y Tecnología (Cat 7)
(122, 7, 'Laptop Acer Aspire 5 Ryzen 5 16GB RAM', 725.00, 'Activo'),
(123, 7, 'Teclado Mecánico Logitech G413', 95.00, 'Activo'),
(124, 7, 'Mouse Inalámbrico Logitech MX Master', 110.00, 'Activo'),
(125, 7, 'Monitor Samsung Curvo 27 Pulgadas', 225.00, 'Activo'),
(126, 7, 'UPS APC 900VA Respaldo Eléctrico', 155.00, 'Activo'),

-- Cocina y Repostería (Cat 8)
(127, 8, 'Freidora de Aire Oster 6 Litros', 125.00, 'Activo'),
(128, 8, 'Máquina para Pan Hamilton Beach', 115.00, 'Activo'),
(129, 8, 'Horno Eléctrico de Convección Oster 45 Litros', 245.00, 'Activo'),
(130, 8, 'Juego de Sartenes Antiadherentes T-fal 3 Piezas', 85.00, 'Activo'),

-- Lavado y Secado (Cat 9)
(131, 9, 'Lavadora Samsung Digital Inverter 19 Kg', 675.00, 'Activo'),
(132, 9, 'Secadora Eléctrica LG 20 Kg', 790.00, 'Activo'),
(133, 9, 'Lavadora Mabe Automática 16 Kg', 495.00, 'Activo'),

-- Cuidado Personal (Cat 10)
(134, 10, 'Secadora de Cabello Dyson Supersonic', 395.00, 'Activo'),
(135, 10, 'Rasuradora Philips OneBlade Recargable', 65.00, 'Activo'),
(136, 10, 'Cepillo Dental Eléctrico Oral-B Pro', 55.00, 'Activo'),

-- Iluminación y Hogar (Cat 11)
(137, 11, 'Aspiradora Robot Ecovacs Deebot', 345.00, 'Activo'),
(138, 11, 'Lámpara Inteligente Philips Hue', 75.00, 'Activo'),
(139, 11, 'Purificador de Agua de Grifo Brita', 45.00, 'Activo'),

-- Herramientas y Jardín (Cat 12)
(140, 12, 'Taladro Inalámbrico DeWalt 20V', 185.00, 'Activo'),
(141, 12, 'Sierra Circular Bosch 7-1/4 Pulgadas', 165.00, 'Activo'),
(142, 12, 'Juego de Destornilladores Stanley 20 Piezas', 35.00, 'Activo'),

-- Muebles de Oficina (Cat 13)
(143, 13, 'Escritorio Ajustable de Altura Eléctrico', 375.00, 'Activo'),
(144, 13, 'Silla de Oficina con Soporte Lumbar', 195.00, 'Activo'),
(145, 13, 'Mesa Plegable Multiuso 120 cm', 85.00, 'Activo'),

-- Smart Home (Cat 14)
(146, 14, 'Timbre Inteligente con Cámara Wi-Fi', 115.00, 'Activo'),
(147, 14, 'Sensor de Movimiento Inteligente Zigbee', 29.99, 'Activo'),
(148, 14, 'Controlador de Iluminación Smart Wi-Fi', 39.99, 'Activo'),

-- Accesorios de Audio (Cat 15)
(149, 15, 'Audífonos Inalámbricos JBL Tune 520BT', 55.00, 'Activo'),
(150, 15, 'Bocina Bluetooth Sony SRS-XB100', 65.00, 'Activo');

-- SUCURSAL 1: 150 PRODUCTOS
INSERT INTO INVENTARIO (ID_PRODUCTO, ID_SUCURSAL, STOCK) VALUES
(1, 1, 152),
(2, 1, 200),
(3, 1, 52),
(4, 1, 100),
(5, 1, 148),
(6, 1, 196),
(7, 1, 48),
(8, 1, 96),
(9, 1, 144),
(10, 1, 192),
(11, 1, 240),
(12, 1, 92),
(13, 1, 140),
(14, 1, 188),
(15, 1, 236),
(16, 1, 88),
(17, 1, 136),
(18, 1, 184),
(19, 1, 232),
(20, 1, 84),
(21, 1, 132),
(22, 1, 180),
(23, 1, 228),
(24, 1, 80),
(25, 1, 128),
(26, 1, 176),
(27, 1, 224),
(28, 1, 76),
(29, 1, 124),
(30, 1, 172),
(31, 1, 220),
(32, 1, 72),
(33, 1, 120),
(34, 1, 168),
(35, 1, 216),
(36, 1, 68),
(37, 1, 116),
(38, 1, 164),
(39, 1, 212),
(40, 1, 64),
(41, 1, 112),
(42, 1, 160),
(43, 1, 208),
(44, 1, 60),
(45, 1, 108),
(46, 1, 156),
(47, 1, 204),
(48, 1, 56),
(49, 1, 104),
(50, 1, 152),
(51, 1, 200),
(52, 1, 52),
(53, 1, 100),
(54, 1, 148),
(55, 1, 196),
(56, 1, 48),
(57, 1, 96),
(58, 1, 144),
(59, 1, 192),
(60, 1, 240),
(61, 1, 92),
(62, 1, 140),
(63, 1, 188),
(64, 1, 236),
(65, 1, 88),
(66, 1, 136),
(67, 1, 184),
(68, 1, 232),
(69, 1, 84),
(70, 1, 132),
(71, 1, 180),
(72, 1, 228),
(73, 1, 80),
(74, 1, 128),
(75, 1, 176),
(76, 1, 224),
(77, 1, 76),
(78, 1, 124),
(79, 1, 172),
(80, 1, 220),
(81, 1, 72),
(82, 1, 120),
(83, 1, 168),
(84, 1, 216),
(85, 1, 68),
(86, 1, 116),
(87, 1, 164),
(88, 1, 212),
(89, 1, 64),
(90, 1, 112),
(91, 1, 160),
(92, 1, 208),
(93, 1, 60),
(94, 1, 108),
(95, 1, 156),
(96, 1, 204),
(97, 1, 56),
(98, 1, 104),
(99, 1, 152),
(100, 1, 200),
(101, 1, 52),
(102, 1, 100),
(103, 1, 148),
(104, 1, 196),
(105, 1, 48),
(106, 1, 96),
(107, 1, 144),
(108, 1, 192),
(109, 1, 240),
(110, 1, 92),
(111, 1, 140),
(112, 1, 188),
(113, 1, 236),
(114, 1, 88),
(115, 1, 136),
(116, 1, 184),
(117, 1, 232),
(118, 1, 84),
(119, 1, 132),
(120, 1, 180),
(121, 1, 228),
(122, 1, 80),
(123, 1, 128),
(124, 1, 176),
(125, 1, 224),
(126, 1, 76),
(127, 1, 124),
(128, 1, 172),
(129, 1, 220),
(130, 1, 72),
(131, 1, 120),
(132, 1, 168),
(133, 1, 216),
(134, 1, 68),
(135, 1, 116),
(136, 1, 164),
(137, 1, 212),
(138, 1, 64),
(139, 1, 112),
(140, 1, 160),
(141, 1, 208),
(142, 1, 60),
(143, 1, 108),
(144, 1, 156),
(145, 1, 204),
(146, 1, 56),
(147, 1, 104),
(148, 1, 152),
(149, 1, 200),
(150, 1, 52);

-- SUCURSAL 2: 150 PRODUCTOS
INSERT INTO INVENTARIO (ID_PRODUCTO, ID_SUCURSAL, STOCK) VALUES
(1, 2, 222),
(2, 2, 85),
(3, 2, 144),
(4, 2, 203),
(5, 2, 66),
(6, 2, 125),
(7, 2, 184),
(8, 2, 47),
(9, 2, 106),
(10, 2, 165),
(11, 2, 224),
(12, 2, 87),
(13, 2, 146),
(14, 2, 205),
(15, 2, 68),
(16, 2, 127),
(17, 2, 186),
(18, 2, 49),
(19, 2, 108),
(20, 2, 167),
(21, 2, 226),
(22, 2, 89),
(23, 2, 148),
(24, 2, 207),
(25, 2, 70),
(26, 2, 129),
(27, 2, 188),
(28, 2, 51),
(29, 2, 110),
(30, 2, 169),
(31, 2, 228),
(32, 2, 91),
(33, 2, 150),
(34, 2, 209),
(35, 2, 72),
(36, 2, 131),
(37, 2, 190),
(38, 2, 53),
(39, 2, 112),
(40, 2, 171),
(41, 2, 230),
(42, 2, 93),
(43, 2, 152),
(44, 2, 211),
(45, 2, 74),
(46, 2, 133),
(47, 2, 192),
(48, 2, 55),
(49, 2, 114),
(50, 2, 173),
(51, 2, 232),
(52, 2, 95),
(53, 2, 154),
(54, 2, 213),
(55, 2, 76),
(56, 2, 135),
(57, 2, 194),
(58, 2, 57),
(59, 2, 116),
(60, 2, 175),
(61, 2, 234),
(62, 2, 97),
(63, 2, 156),
(64, 2, 215),
(65, 2, 78),
(66, 2, 137),
(67, 2, 196),
(68, 2, 59),
(69, 2, 118),
(70, 2, 177),
(71, 2, 236),
(72, 2, 99),
(73, 2, 158),
(74, 2, 217),
(75, 2, 80),
(76, 2, 139),
(77, 2, 198),
(78, 2, 61),
(79, 2, 120),
(80, 2, 179),
(81, 2, 238),
(82, 2, 101),
(83, 2, 160),
(84, 2, 219),
(85, 2, 82),
(86, 2, 141),
(87, 2, 200),
(88, 2, 63),
(89, 2, 122),
(90, 2, 181),
(91, 2, 240),
(92, 2, 103),
(93, 2, 162),
(94, 2, 221),
(95, 2, 84),
(96, 2, 143),
(97, 2, 202),
(98, 2, 65),
(99, 2, 124),
(100, 2, 183),
(101, 2, 46),
(102, 2, 105),
(103, 2, 164),
(104, 2, 223),
(105, 2, 86),
(106, 2, 145),
(107, 2, 204),
(108, 2, 67),
(109, 2, 126),
(110, 2, 185),
(111, 2, 48),
(112, 2, 107),
(113, 2, 166),
(114, 2, 225),
(115, 2, 88),
(116, 2, 147),
(117, 2, 206),
(118, 2, 69),
(119, 2, 128),
(120, 2, 187),
(121, 2, 50),
(122, 2, 109),
(123, 2, 168),
(124, 2, 227),
(125, 2, 90),
(126, 2, 149),
(127, 2, 208),
(128, 2, 71),
(129, 2, 130),
(130, 2, 189),
(131, 2, 52),
(132, 2, 111),
(133, 2, 170),
(134, 2, 229),
(135, 2, 92),
(136, 2, 151),
(137, 2, 210),
(138, 2, 73),
(139, 2, 132),
(140, 2, 191),
(141, 2, 54),
(142, 2, 113),
(143, 2, 172),
(144, 2, 231),
(145, 2, 94),
(146, 2, 153),
(147, 2, 212),
(148, 2, 75),
(149, 2, 134),
(150, 2, 193);

-- SUCURSAL 3: 150 PRODUCTOS
INSERT INTO INVENTARIO (ID_PRODUCTO, ID_SUCURSAL, STOCK) VALUES
(1, 3, 96),
(2, 3, 166),
(3, 3, 236),
(4, 3, 110),
(5, 3, 180),
(6, 3, 54),
(7, 3, 124),
(8, 3, 194),
(9, 3, 68),
(10, 3, 138),
(11, 3, 208),
(12, 3, 82),
(13, 3, 152),
(14, 3, 222),
(15, 3, 96),
(16, 3, 166),
(17, 3, 236),
(18, 3, 110),
(19, 3, 180),
(20, 3, 54),
(21, 3, 124),
(22, 3, 194),
(23, 3, 68),
(24, 3, 138),
(25, 3, 208),
(26, 3, 82),
(27, 3, 152),
(28, 3, 222),
(29, 3, 96),
(30, 3, 166),
(31, 3, 236),
(32, 3, 110),
(33, 3, 180),
(34, 3, 54),
(35, 3, 124),
(36, 3, 194),
(37, 3, 68),
(38, 3, 138),
(39, 3, 208),
(40, 3, 82),
(41, 3, 152),
(42, 3, 222),
(43, 3, 96),
(44, 3, 166),
(45, 3, 236),
(46, 3, 110),
(47, 3, 180),
(48, 3, 54),
(49, 3, 124),
(50, 3, 194),
(51, 3, 68),
(52, 3, 138),
(53, 3, 208),
(54, 3, 82),
(55, 3, 152),
(56, 3, 222),
(57, 3, 96),
(58, 3, 166),
(59, 3, 236),
(60, 3, 110),
(61, 3, 180),
(62, 3, 54),
(63, 3, 124),
(64, 3, 194),
(65, 3, 68),
(66, 3, 138),
(67, 3, 208),
(68, 3, 82),
(69, 3, 152),
(70, 3, 222),
(71, 3, 96),
(72, 3, 166),
(73, 3, 236),
(74, 3, 110),
(75, 3, 180),
(76, 3, 54),
(77, 3, 124),
(78, 3, 194),
(79, 3, 68),
(80, 3, 138),
(81, 3, 208),
(82, 3, 82),
(83, 3, 152),
(84, 3, 222),
(85, 3, 96),
(86, 3, 166),
(87, 3, 236),
(88, 3, 110),
(89, 3, 180),
(90, 3, 54),
(91, 3, 124),
(92, 3, 194),
(93, 3, 68),
(94, 3, 138),
(95, 3, 208),
(96, 3, 82),
(97, 3, 152),
(98, 3, 222),
(99, 3, 96),
(100, 3, 166),
(101, 3, 236),
(102, 3, 110),
(103, 3, 180),
(104, 3, 54),
(105, 3, 124),
(106, 3, 194),
(107, 3, 68),
(108, 3, 138),
(109, 3, 208),
(110, 3, 82),
(111, 3, 152),
(112, 3, 222),
(113, 3, 96),
(114, 3, 166),
(115, 3, 236),
(116, 3, 110),
(117, 3, 180),
(118, 3, 54),
(119, 3, 124),
(120, 3, 194),
(121, 3, 68),
(122, 3, 138),
(123, 3, 208),
(124, 3, 82),
(125, 3, 152),
(126, 3, 222),
(127, 3, 96),
(128, 3, 166),
(129, 3, 236),
(130, 3, 110),
(131, 3, 180),
(132, 3, 54),
(133, 3, 124),
(134, 3, 194),
(135, 3, 68),
(136, 3, 138),
(137, 3, 208),
(138, 3, 82),
(139, 3, 152),
(140, 3, 175),
(141, 3, 120),
(142, 3, 210),
(143, 3, 85),
(144, 3, 145),
(145, 3, 190),
(146, 3, 160),
(147, 3, 230),
(148, 3, 115),
(149, 3, 200),
(150, 3, 135);


-- LIMITE CREDITO PERSONAL (CLIENTES CON ID DEL 1 AL 35)
INSERT INTO LIMITECREDITOPERSONAL (ID_LIMITE, ID_SUCURSAL, ID_CLIENTE, MONTOLIMITE) VALUES
(1, 1, 1, 500.00),
(2, 1, 2, 750.00),
(3, 1, 3, 1000.00),
(4, 1, 4, 600.00),
(5, 1, 5, 800.00),
(6, 1, 6, 1200.00),
(7, 1, 7, 450.00),
(8, 1, 8, 900.00),
(9, 2, 9, 500.00),
(10, 2, 10, 650.00),
(11, 2, 11, 1100.00),
(12, 2, 12, 700.00),
(13, 2, 13, 850.00),
(14, 2, 14, 1000.00),
(15, 2, 15, 550.00),
(16, 3, 16, 600.00),
(17, 3, 17, 750.00),
(18, 3, 18, 900.00),
(19, 3, 19, 1200.00),
(20, 3, 20, 500.00),
(21, 3, 21, 800.00),
(22, 3, 22, 1000.00),
(23, 1, 23, 1500.00),
(24, 2, 24, 950.00),
(25, 3, 25, 650.00);

-- CAJERO (12)
INSERT INTO CAJERO (ID_EMPLEADO, NUMERO_CAJA, TURNO) VALUES
(2, 1, 'Mañana'), 
(3, 2, 'Tarde'), 
(7, 3, 'Noche'), 
(12, 1, 'Mañana'), 
(13, 2, 'Tarde'), 
(16, 3, 'Noche'), 
(22, 1, 'Mañana'), 
(23, 2, 'Tarde'), 
(26, 3, 'Noche'), 
(27, 1, 'Mañana'), 
(8, 2, 'Tarde'), 
(18, 3, 'Noche');


-- VENDEDORES (15)
INSERT INTO VENDEDOR (ID_EMPLEADO, PORCENTAJE_COMISION, META_MENSUAL) VALUES
(4, 3.50, 15000.00), 
(5, 4.00, 18000.00), 
(6, 3.00, 12000.00),
(9, 3.50, 16000.00), 
(10, 4.50, 20000.00), 
(14, 3.00, 14000.00), 
(15, 4.00, 17000.00), 
(17, 3.50, 15000.00), 
(19, 3.00, 13000.00), 
(20, 4.50, 22000.00), 
(24, 3.50, 15000.00), 
(25, 4.00, 19000.00), 
(28, 3.00, 12500.00), 
(29, 4.50, 21000.00), 
(21, 3.50, 16000.00);


INSERT INTO COMPRAPRODUCTO (ID_PROVEEDOR, ID_PRODUCTO, FECHA_ENTREGA, PRECIO_PACTADO) VALUES
(1, 1, '2026-01-10', 380.00), -- Refrigerador Mabe 11 Pies Cromado
(2, 2, '2026-01-10', 590.00), -- Refrigerador LG Inverter 2 Puertas 14 Pies
(3, 3, '2026-01-10', 1050.00), -- Refrigerador Samsung French Door 22 Pies
(5, 4, '2026-01-11', 140.00), -- Mini Bar Cetron 3.2 Pies Cúbicos
(4, 5, '2026-01-11', 410.00), -- Refrigerador Whirlpool Top Mount 12 Pies
(17, 6, '2026-01-11', 270.00), -- Congelador Horizontal Midea 5 Pies Cúbicos
(14, 7, '2026-01-12', 340.00), -- Refrigerador Frigidaire 10 Pies Blanco
(1, 8, '2026-01-12', 128.70), -- Dispensador de Agua Enfriador Mabe
(1, 9, '2026-01-12', 230.00), -- Cocina a Gas Mabe 4 Quemadores con Horno
(4, 10, '2026-01-13', 430.00), -- Cocina Whirlpool Vidrio Templado 6 Quemadores
(12, 11, '2026-01-13', 25.00), -- Estufa de Mesa Eléctrica 2 Hornillas Imaco
(13, 12, '2026-01-13', 310.00), -- Cocina a Gas Acero Inoxidable Challenger 4 Hornillas
(17, 13, '2026-01-14', 370.00), -- Cocina Empotrable de Inducción Midea 4 Zonas
(1, 14, '2026-01-14', 150.00), -- Campana Extractora de Humo Mabe 60 cm
(4, 15, '2026-01-14', 480.00), -- Horno Empotrable a Gas Whirlpool 24 Pulgadas
(2, 16, '2026-01-15', 272.99), -- Smart TV TCL 50 Pulgadas 4K UHD
(6, 17, '2026-01-15', 530.00), -- Smart TV Sony Bravia 55 Pulgadas Google TV
(3, 18, '2026-01-15', 210.00), -- Pantalla LED Samsung 43 Pulgadas Full HD
(2, 19, '2026-01-16', 710.00), -- Smart TV LG 65 Pulgadas 4K ThinQ AI
(2, 20, '2026-01-16', 144.30), -- Smart TV Xiaomi 32 Pulgadas HD LED
(2, 21, '2026-01-16', 351.00), -- Pantalla LED Hisense 58 Pulgadas 4K UHD
(2, 22, '2026-01-17', 171.60), -- Smart TV RCA 40 Pulgadas Full HD
(17, 23, '2026-01-17', 320.00), -- Aire Acondicionado Split Inverter 12000 BTU Midea
(15, 24, '2026-01-17', 560.00), -- Aire Acondicionado Daikin 18000 BTU 220V
(8, 25, '2026-01-18', 30.00), -- Ventilador de Pedestal Black & Decker 3 en 1
(2, 26, '2026-01-18', 380.00), -- Aire Acondicionado Portable LG 10000 BTU
(12, 27, '2026-01-18', 45.00), -- Ventilador de Torre Oscilante Imaco con Control
(16, 28, '2026-01-19', 890.00), -- Aire Acondicionado Carrier 24000 BTU Inverter
(17, 29, '2026-01-19', 170.00), -- Deshumidificador Casero Midea 30 Pints
(2, 30, '2026-01-19', 58.50), -- Ventilador de Piso Industrial 20 Pulgadas
(6, 31, '2026-01-20', 160.00), -- Barra de Sonido Sony con Subwoofer Inalámbrico
(2, 32, '2026-01-20', 240.00), -- Minicomponente LG Bluetooth XBOOM 1000W
(20, 33, '2026-01-20', 311.99), -- Sistema de Audio JBL PartyBox 110 Portátil
(3, 34, '2026-01-21', 130.00), -- Barra de Sonido Samsung 2.1 Canales con Dolby Audio
(9, 35, '2026-01-21', 200.00), -- Minicomponente Panasonic MAX GO 300W
(6, 36, '2026-01-21', 85.00), -- Reproductor Blu-Ray Disc Sony con Streaming
(7, 37, '2026-01-22', 35.00), -- Licuadora Oster Jarra de Vidrio 3 Velocidades
(8, 38, '2026-01-22', 22.00), -- Cafetera Eléctrica Black & Decker 12 Tazas
(1, 39, '2026-01-22', 70.00), -- Microondas Mabe Digital 0.7 Pies Cúbicos
(11, 40, '2026-01-23', 18.00), -- Tostadora de Pan Philips 2 Ranuras
(8, 41, '2026-01-23', 18.00), -- Plancha de Vapor para Ropa Black & Decker
(7, 42, '2026-01-23', 28.00), -- Licuadora de Inmersión Oster con Accesorios
(11, 43, '2026-01-24', 85.00), -- Cafetera Espresso Philips de Cápsulas
(2, 44, '2026-01-24', 120.00), -- Microondas LG Grill 1.1 Pies Cúbicos
(12, 45, '2026-01-24', 14.00), -- Exprimidor de Cítricos Eléctrico Imaco
(7, 46, '2026-01-25', 20.00), -- Batidora de Mano Oster 5 Velocidades
(20, 47, '2026-01-25', 24.18), -- Hervidor de Agua Eléctrico Acero Inoxidable 1.7 L
(12, 48, '2026-01-25', 17.00), -- Sandwichera Placa Antiadherente Imaco
(2, 49, '2026-01-26', 483.60), -- Laptop HP 15.6 Pulgadas Core i5 8GB RAM 512GB SSD
(20, 50, '2026-01-26', 167.70), -- Impresora Multifuncional Epson EcoTank L3210
(20, 51, '2026-01-26', 265.20), -- Laptop Lenovo IdeaPad 3 Celeron 4GB 128GB SSD
(20, 52, '2026-01-27', 155.99), -- Tablet Lenovo Tab M10 Plus 4GB 64GB
(2, 53, '2026-01-27', 120.90), -- Monitor Gamer LED 24 Pulgadas Full HD AOC
(20, 54, '2026-01-27', 191.10), -- Impresora HP LaserJet Pro Inalámbrica
(20, 55, '2026-01-28', 62.39), -- Router Inalámbrico Wi-Fi 6 Dual Band TP-Link
(20, 56, '2026-01-28', 48.36), -- Disco Duro Externo Portable 1TB Seagate
(7, 57, '2026-01-28', 65.00), -- Batidora de Pedestal Oster con Tazón de Acero
(12, 58, '2026-01-29', 75.00), -- Freidora de Aire Imaco Digital 4 Litros
(8, 59, '2026-01-29', 45.00), -- Horno Tostador Black & Decker 9 Litros
(7, 60, '2026-01-29', 55.00), -- Procesador de Alimentos Oster 8 Tazas
(17, 61, '2026-01-30', 80.00), -- Olla de Presión Multifuncional Midea 6 Litros
(7, 62, '2026-01-30', 32.00), -- Wafflera Eléctrica Giratoria Oster
(20, 63, '2026-01-30', 155.99), -- Freidora de Aire Dual Basket Ninja 8 Litros
(20, 64, '2026-01-31', 95.00), -- Set de Ollas de Acero Inoxidable Tramontina 10 Pzas
(4, 65, '2026-01-31', 450.00), -- Lavadora Automática Whirlpool 18 Kg Carga Superior
(1, 66, '2026-01-31', 850.00), -- Centro de Lavado Mabe Gas 20 Kg
(17, 67, '2026-02-01', 310.00), -- Secadora de Ropa Midea Eléctrica 7 Kg
(5, 68, '2026-02-01', 210.00), -- Lavadora Semiautomática Cetron 13 Kg Doble Tina
(2, 69, '2026-02-01', 620.00), -- Lavadora LG Carga Frontal Inverter 12 Kg
(4, 70, '2026-02-02', 520.00), -- Secadora de Ropa a Gas Whirlpool 15 Kg
(20, 71, '2026-02-02', 27.30), -- Secadora de Cabello Profesional Remington
(11, 72, '2026-02-02', 38.00), -- Afeitadora Recargable Philips Series 3000
(20, 73, '2026-02-03', 32.76), -- Plancha Alaciadora de Cabello Conair Cerámica
(20, 74, '2026-02-03', 37.44), -- Cortadora de Cabello Kit Profesional Wahl
(20, 75, '2026-02-03', 50.70), -- Depiladora Eléctrica Braun Silk-épil 3
(20, 76, '2026-02-04', 40.56), -- Cepillo Secador Revlon One-Step Volumizer
(20, 77, '2026-02-04', 31.20), -- Lámpara LED Inteligente de Piso Wi-Fi
(17, 78, '2026-02-04', 95.00), -- Aspiradora Vertical Sin Cable Midea
(11, 79, '2026-02-05', 110.00), -- Aspiradora de Arrastre 2000W Philips
(20, 80, '2026-02-05', 214.50), -- Robot Aspirador Inteligente Xiaomi Mi Robot
(20, 81, '2026-02-05', 19.11), -- Lámpara de Escritorio LED con Carga USB
(20, 82, '2026-02-06', 24.96), -- Set de Focos LED Inteligentes RGB Pack de 4
(8, 83, '2026-02-06', 105.00), -- Hidrolavadora Black & Decker 1500 PSI
(10, 84, '2026-02-06', 55.00), -- Taladro Percutor Bosch 550W con Accesorios
(8, 85, '2026-02-07', 160.00), -- Cortadora de Césped Eléctrica Black & Decker
(20, 86, '2026-02-07', 66.30), -- Kit de Herramientas Manuales 100 Piezas Stanley
(10, 87, '2026-02-07', 48.00), -- Esmeril Angular Bosch 4-1/2 Pulgadas 710W
(20, 88, '2026-02-08', 42.90), -- Soplador de Hojas Eléctrico B&D 400W
(20, 89, '2026-02-08', 101.40), -- Silla Ergonómica Ejecutiva para Oficina
(20, 90, '2026-02-08', 124.80), -- Escritorio Modular de Madera para Cómputo
(20, 91, '2026-02-09', 74.10), -- Estantería Metálica de 5 Niveles para Archivo
(20, 92, '2026-02-09', 42.90), -- Silla de Visita Fija Tapizada en Tela
(20, 93, '2026-02-09', 144.30), -- Archivero Metálico de 3 Gavetas con Llave
(20, 94, '2026-02-10', 140.40), -- Kit de Seguridad Smart Home Cámara y Sensores
(20, 95, '2026-02-10', 14.43), -- Enchufe Inteligente Wi-Fi Compatible con Alexa
(20, 96, '2026-02-10', 50.70), -- Cámara de Seguridad Exterior Wi-Fi 1080p Imou
(20, 97, '2026-02-11', 187.20), -- Cerradura Digital Inteligente con Huella Biométrica
(6, 98, '2026-02-11', 70.00), -- Audífonos Inalámbricos Bluetooth Sony con Cancelación
(20, 99, '2026-02-11', 50.70), -- Bocina Portátil JBL Clip 4 Resistente al Agua
(20, 100, '2026-02-12', 46.79), -- Audífonos Gamer con Micrófono HyperX Cloud Stinger
(20, 101, '2026-02-12', 448.50), -- Refrigerador Hisense Inverter 13 Pies Gris
(14, 102, '2026-02-12', 319.80), -- Congelador Vertical Frigidaire 7 Pies
(17, 103, '2026-02-13', 694.20), -- Refrigerador Midea Side by Side 18 Pies
(20, 104, '2026-02-13', 175.50), -- Enfriador de Bebidas RCA 90 Litros
(14, 105, '2026-02-13', 487.50), -- Cocina Eléctrica Frigidaire 4 Quemadores
(1, 106, '2026-02-14', 542.10), -- Horno de Gas Mabe 30 Pulgadas
(4, 107, '2026-02-14', 222.30), -- Campana Extractora Whirlpool 90 cm
(2, 108, '2026-02-14', 612.30), -- Smart TV Hisense 70 Pulgadas 4K UHD
(20, 109, '2026-02-15', 483.60), -- Proyector Portátil Epson Full HD
(11, 110, '2026-02-15', 569.40), -- Smart TV Philips 55 Pulgadas Ambilight
(3, 111, '2026-02-15', 873.60), -- Pantalla Samsung QLED 65 Pulgadas
(20, 112, '2026-02-16', 113.10), -- Ventilador de Techo Hunter con Control
(20, 113, '2026-02-16', 144.30), -- Purificador de Aire Xiaomi Smart Air
(2, 114, '2026-02-16', 300.30), -- Aire Acondicionado Mini Split LG 9000 BTU
(20, 115, '2026-02-17', 136.50), -- Parlante Bluetooth Bose SoundLink Flex
(6, 116, '2026-02-17', 351.00), -- Sistema de Teatro en Casa Sony 5.1
(20, 117, '2026-02-17', 93.60), -- Micrófono Inalámbrico JBL Dual
(20, 118, '2026-02-18', 105.30), -- Licuadora Ninja Profesional 1000W
(7, 119, '2026-02-18', 42.90), -- Cafetera Programable Oster 12 Tazas
(3, 120, '2026-02-18', 144.30), -- Microondas Samsung 1.4 Pies Cúbicos
(11, 121, '2026-02-19', 50.70), -- Plancha de Vapor Philips 2400W
(20, 122, '2026-02-19', 565.50), -- Laptop Acer Aspire 5 Ryzen 5 16GB RAM
(20, 123, '2026-02-19', 74.10), -- Teclado Mecánico Logitech G413
(20, 124, '2026-02-20', 85.80), -- Mouse Inalámbrico Logitech MX Master
(3, 125, '2026-02-20', 175.50), -- Monitor Samsung Curvo 27 Pulgadas
(20, 126, '2026-02-20', 120.90), -- UPS APC 900VA Respaldo Eléctrico
(7, 127, '2026-02-21', 97.50), -- Freidora de Aire Oster 6 Litros
(20, 128, '2026-02-21', 89.70), -- Máquina para Pan Hamilton Beach
(7, 129, '2026-02-21', 191.10), -- Horno Eléctrico de Convección Oster 45 Litros
(20, 130, '2026-02-22', 66.30), -- Juego de Sartenes Antiadherentes T-fal 3 Piezas
(3, 131, '2026-02-22', 526.50), -- Lavadora Samsung Digital Inverter 19 Kg
(2, 132, '2026-02-22', 616.20), -- Secadora Eléctrica LG 20 Kg
(1, 133, '2026-02-23', 386.10), -- Lavadora Mabe Automática 16 Kg
(20, 134, '2026-02-23', 308.10), -- Secadora de Cabello Dyson Supersonic
(11, 135, '2026-02-23', 50.70), -- Rasuradora Philips OneBlade Recargable
(20, 136, '2026-02-24', 42.90), -- Cepillo Dental Eléctrico Oral-B Pro
(20, 137, '2026-02-24', 269.10), -- Aspiradora Robot Ecovacs Deebot
(11, 138, '2026-02-24', 58.50), -- Lámpara Inteligente Philips Hue
(20, 139, '2026-02-25', 35.10), -- Purificador de Agua de Grifo Brita
(20, 140, '2026-02-25', 144.30), -- Taladro Inalámbrico DeWalt 20V
(10, 141, '2026-02-25', 128.70), -- Sierra Circular Bosch 7-1/4 Pulgadas
(20, 142, '2026-02-26', 27.30), -- Juego de Destornilladores Stanley 20 Piezas
(20, 143, '2026-02-26', 292.50), -- Escritorio Ajustable de Altura Eléctrico
(20, 144, '2026-02-26', 152.10), -- Silla de Oficina con Soporte Lumbar
(20, 145, '2026-02-27', 66.30), -- Mesa Plegable Multiuso 120 cm
(20, 146, '2026-02-27', 89.70), -- Timbre Inteligente con Cámara Wi-Fi
(20, 147, '2026-02-27', 23.39), -- Sensor de Movimiento Inteligente Zigbee
(20, 148, '2026-02-28', 31.19), -- Controlador de Iluminación Smart Wi-Fi
(20, 149, '2026-02-28', 42.90), -- Audífonos Inalámbricos JBL Tune 520BT
(6, 150, '2026-02-28', 50.70); -- Bocina Bluetooth Sony SRS-XB100

-- PRODUCTOPROMOCION
INSERT INTO PRODUCTOPROMOCION (ID_PROMOCION, ID_PRODUCTO) VALUES
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(13, 37),
(13, 38),
(13, 39),
(13, 40),
(16, 9),
(16, 10),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 19),
(17, 20),
(18, 21),
(18, 22),
(18, 23),
(18, 24),
(18, 25),
(18, 26),
(19, 27),
(19, 28),
(19, 29),
(19, 30),
(20, 31),
(20, 32),
(21, 33),
(21, 34),
(21, 35),
(21, 36),
(22, 41),
(22, 42),
(22, 43),
(22, 44),
(22, 45),
(22, 46),
(23, 47),
(23, 48),
(23, 49),
(23, 50),
(23, 51),
(23, 52),
(24, 53),
(24, 54),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 59),
(25, 60);
-- ACTURAS (1 AL 50)
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(1, 1, 4, 1, 'FAC-001-00001', '2026-03-01 09:15:00', 592.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(2, 36, 5, 1, 'FAC-001-00002', '2026-03-01 10:30:00', 1239.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(3, 9, 12, 2, 'FAC-002-00001', '2026-03-01 11:00:00', 412.50, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(4, 37, 13, 2, 'FAC-002-00002', '2026-03-01 12:20:00', 745.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(5, 16, 22, 3, 'FAC-003-00001', '2026-03-01 14:00:00', 587.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(6, 38, 23, 3, 'FAC-003-00002', '2026-03-01 15:30:00', 915.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(7, 3, 6, 1, 'FAC-001-00003', '2026-03-02 09:30:00', 374.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(8, 10, 8, 1, 'FAC-001-00004', '2026-03-02 10:45:00', 819.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(9, 39, 10, 1, 'FAC-001-00005', '2026-03-02 11:50:00', 292.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(10, 11, 16, 2, 'FAC-002-00003', '2026-03-02 13:10:00', 604.98, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(11, 40, 18, 2, 'FAC-002-00004', '2026-03-02 14:40:00', 1424.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(12, 19, 26, 3, 'FAC-003-00003', '2026-03-02 16:00:00', 582.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(13, 41, 28, 3, 'FAC-003-00004', '2026-03-02 17:15:00', 1219.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(14, 22, 4, 1, 'FAC-001-00006', '2026-03-03 09:20:00', 794.99, 'Transferencia', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(15, 42, 5, 1, 'FAC-001-00007', '2026-03-03 10:50:00', 257.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(16, 2, 12, 2, 'FAC-002-00005', '2026-03-03 11:30:00', 522.49, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(17, 43, 13, 2, 'FAC-002-00006', '2026-03-03 13:00:00', 1295.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(18, 12, 22, 3, 'FAC-003-00005', '2026-03-03 14:15:00', 782.50, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(19, 44, 23, 3, 'FAC-003-00006', '2026-03-03 15:45:00', 1049.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(20, 4, 6, 1, 'FAC-001-00008', '2026-03-04 09:10:00', 372.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(21, 13, 8, 1, 'FAC-001-00009', '2026-03-04 10:25:00', 874.99, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(22, 45, 10, 1, 'FAC-001-00010', '2026-03-04 11:40:00', 592.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(23, 14, 16, 2, 'FAC-002-00007', '2026-03-04 13:00:00', 925.00, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(24, 46, 18, 2, 'FAC-002-00008', '2026-03-04 14:20:00', 394.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(25, 23, 26, 3, 'FAC-003-00007', '2026-03-04 15:50:00', 692.50, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(26, 47, 28, 3, 'FAC-003-00008', '2026-03-04 17:05:00', 712.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(27, 5, 4, 1, 'FAC-001-00011', '2026-03-05 09:30:00', 1229.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(28, 15, 5, 1, 'FAC-001-00012', '2026-03-05 10:45:00', 327.49, 'Transferencia', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(29, 48, 12, 2, 'FAC-002-00009', '2026-03-05 12:00:00', 744.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(30, 24, 13, 2, 'FAC-002-00010', '2026-03-05 13:30:00', 482.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(31, 49, 22, 3, 'FAC-003-00009', '2026-03-05 15:00:00', 312.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(32, 25, 23, 3, 'FAC-003-00010', '2026-03-05 16:30:00', 394.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(33, 6, 6, 1, 'FAC-001-00013', '2026-03-06 09:15:00', 534.99, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(34, 50, 8, 1, 'FAC-001-00014', '2026-03-06 10:30:00', 465.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(35, 17, 10, 1, 'FAC-001-00015', '2026-03-06 11:45:00', 1224.98, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(36, 51, 16, 2, 'FAC-002-00011', '2026-03-06 13:15:00', 257.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(37, 26, 18, 2, 'FAC-002-00012', '2026-03-06 14:45:00', 325.00, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(38, 52, 26, 3, 'FAC-003-00011', '2026-03-06 16:00:00', 82.49, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(39, 27, 28, 3, 'FAC-003-00012', '2026-03-06 17:20:00', 234.99, 'Transferencia', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(40, 7, 4, 1, 'FAC-001-00016', '2026-03-07 09:20:00', 537.49, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(41, 53, 5, 1, 'FAC-001-00017', '2026-03-07 10:40:00', 604.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(42, 18, 12, 2, 'FAC-002-00013', '2026-03-07 11:55:00', 77.49, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(43, 54, 13, 2, 'FAC-002-00014', '2026-03-07 13:20:00', 945.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(44, 28, 22, 3, 'FAC-003-00013', '2026-03-07 14:50:00', 364.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(45, 55, 23, 3, 'FAC-003-00014', '2026-03-07 16:15:00', 804.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(46, 8, 6, 1, 'FAC-001-00018', '2026-03-08 09:30:00', 60.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(47, 56, 8, 1, 'FAC-001-00019', '2026-03-08 11:00:00', 104.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(48, 20, 10, 1, 'FAC-001-00020', '2026-03-08 12:30:00', 247.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(49, 57, 16, 2, 'FAC-002-00015', '2026-03-08 14:00:00', 215.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(50, 29, 18, 2, 'FAC-002-00016', '2026-03-08 15:30:00', 665.00, 'Credito Personal', 'Activa');

-- Factura 1 (Total: 592.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (1, 1, 10, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (1, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (1, 3, 40, 1, 10.00, 10.00);

-- Factura 2 (Total: 1239.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (2, 1, 2, 1, 750.00, 750.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (2, 2, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (2, 3, 49, 1, 451.98, 451.98);

-- Factura 3 (Total: 412.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (3, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (3, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (3, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (3, 4, 71, 1, 169.51, 169.51);

-- Factura 4 (Total: 745.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (4, 1, 9, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (4, 2, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (4, 3, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (4, 4, 50, 1, 230.01, 230.01);

-- Factura 5 (Total: 587.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (5, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (5, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (5, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (5, 4, 84, 1, 304.50, 304.50);

-- Factura 6 (Total: 915.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (6, 1, 7, 1, 430.00, 430.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (6, 2, 27, 1, 65.00, 65.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (6, 3, 83, 1, 140.00, 140.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (6, 4, 23, 1, 280.00, 280.00);

-- Factura 7 (Total: 374.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (7, 1, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (7, 2, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (7, 3, 16, 1, 314.99, 314.99);

-- Factura 8 (Total: 819.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (8, 1, 1, 1, 489.99, 489.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (8, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (8, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (8, 4, 71, 1, 125.00, 125.00);

-- Factura 9 (Total: 292.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (9, 1, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (9, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (9, 3, 52, 1, 199.99, 199.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (9, 4, 81, 1, 23.51, 23.51);

-- Factura 10 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (10, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (10, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (10, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (10, 4, 84, 1, 167.00, 167.00);

-- Factura 11 (Total: 1424.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (11, 1, 3, 1, 1299.99, 1299.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (11, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (11, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (11, 4, 38, 1, 65.01, 65.01);

-- Factura 12 (Total: 582.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (12, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (12, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (12, 3, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (12, 4, 71, 1, 125.00, 125.00);

-- Factura 13 (Total: 1219.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (13, 1, 28, 1, 1100.00, 1100.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (13, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (13, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (13, 4, 71, 1, 45.01, 45.01);

-- Factura 14 (Total: 794.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (14, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (14, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (14, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (14, 4, 38, 1, 55.00, 55.00);

-- Factura 15 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (15, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (15, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (15, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (15, 4, 71, 1, 132.00, 132.00);

-- Factura 16 (Total: 522.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (16, 1, 4, 1, 195.00, 195.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (16, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (16, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (16, 4, 53, 1, 252.51, 252.51);

-- Factura 17 (Total: 1295.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (17, 1, 66, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (17, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (17, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (17, 4, 81, 1, 77.50, 77.50);

-- Factura 18 (Total: 782.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (18, 1, 19, 1, 689.99, 689.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (18, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (18, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (18, 4, 71, 1, 35.02, 35.02);

-- Factura 19 (Total: 1049.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (19, 1, 69, 1, 790.00, 790.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (19, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (19, 3, 50, 1, 209.99, 209.99);

-- Factura 20 (Total: 372.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (20, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (20, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (20, 3, 51, 1, 315.01, 315.01);

-- Factura 21 (Total: 874.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (21, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (21, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (21, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (21, 4, 71, 1, 120.01, 120.01);

-- Factura 22 (Total: 592.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (22, 1, 10, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (22, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (22, 3, 40, 1, 10.00, 10.00);

-- Factura 23 (Total: 925.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (23, 1, 19, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (23, 2, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (23, 3, 2, 1, 495.00, 495.00);

-- Factura 24 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (24, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (24, 2, 38, 1, 25.00, 25.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (24, 3, 40, 1, 20.00, 20.00);

-- Factura 25 (Total: 692.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (25, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (25, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (25, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (25, 4, 52, 1, 190.01, 190.01);

-- Factura 26 (Total: 712.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (26, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (26, 2, 38, 1, 32.50, 32.50);

-- Factura 27 (Total: 1229.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (27, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (27, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (27, 3, 40, 1, 47.48, 47.48);

-- Factura 28 (Total: 327.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (28, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (28, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (28, 3, 53, 1, 245.00, 245.00);

-- Factura 29 (Total: 744.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (29, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (29, 2, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (29, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (29, 4, 71, 1, 147.00, 147.00);

-- Factura 30 (Total: 482.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (30, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (30, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (30, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (30, 4, 53, 1, 349.51, 349.51);

-- Factura 31 (Total: 312.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (31, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (31, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (31, 3, 53, 1, 249.00, 249.00);

-- Factura 32 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (32, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (32, 2, 38, 1, 20.00, 20.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (32, 3, 71, 1, 25.00, 25.00);

-- Factura 33 (Total: 534.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (33, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (33, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (33, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (33, 4, 40, 1, 32.50, 32.50);

-- Factura 34 (Total: 465.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (34, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (34, 2, 37, 1, 420.00, 420.00);

-- Factura 35 (Total: 1224.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (35, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (35, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (35, 3, 40, 1, 42.48, 42.48);

-- Factura 36 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (36, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (36, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (36, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (36, 4, 71, 1, 132.00, 132.00);

-- Factura 37 (Total: 325.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (37, 1, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (37, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (37, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (37, 4, 71, 1, 99.50, 99.50);

-- Factura 38 (Total: 82.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (38, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (38, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (38, 3, 71, 1, 7.51, 7.51);

-- Factura 39 (Total: 234.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (39, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (39, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (39, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (39, 4, 71, 1, 92.00, 92.00);

-- Factura 40 (Total: 537.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (40, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (40, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (40, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (40, 4, 71, 1, 130.01, 130.01);

-- Factura 41 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (41, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (41, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (41, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (41, 4, 84, 1, 167.00, 167.00);

-- Factura 42 (Total: 77.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (42, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (42, 2, 40, 1, 27.50, 27.50);

-- Factura 43 (Total: 945.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (43, 1, 7, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (43, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (43, 3, 50, 1, 232.50, 232.50);

-- Factura 44 (Total: 364.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (44, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (44, 2, 16, 1, 315.00, 315.00);

-- Factura 45 (Total: 804.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (45, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (45, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (45, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (45, 4, 71, 1, 50.01, 50.01);

-- Factura 46 (Total: 60.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (46, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (46, 2, 40, 1, 28.00, 28.00);

-- Factura 47 (Total: 104.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (47, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (47, 2, 40, 1, 55.00, 55.00);

-- Factura 48 (Total: 247.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (48, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (48, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (48, 3, 71, 1, 184.00, 184.00);

-- Factura 49 (Total: 215.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (49, 1, 50, 1, 215.00, 215.00);

-- Factura 50 (Total: 665.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (50, 1, 2, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (50, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (50, 3, 71, 1, 82.50, 82.50);
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(51, 30, 22, 3, 'FAC-003-00015', '2026-03-08 16:45:00', 314.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(52, 58, 23, 3, 'FAC-003-00016', '2026-03-09 09:15:00', 1239.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(53, 31, 4, 1, 'FAC-001-00021', '2026-03-09 10:30:00', 412.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(54, 59, 5, 1, 'FAC-001-00022', '2026-03-09 11:50:00', 745.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(55, 32, 12, 2, 'FAC-002-00017', '2026-03-09 13:20:00', 587.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(56, 60, 13, 2, 'FAC-002-00018', '2026-03-09 14:40:00', 915.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(57, 33, 22, 3, 'FAC-003-00017', '2026-03-10 09:30:00', 374.98, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(58, 1, 23, 3, 'FAC-003-00018', '2026-03-10 11:00:00', 819.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(59, 34, 6, 1, 'FAC-001-00023', '2026-03-10 12:15:00', 292.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(60, 35, 8, 1, 'FAC-001-00024', '2026-03-10 13:50:00', 604.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(61, 36, 10, 1, 'FAC-001-00025', '2026-03-11 09:20:00', 1424.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(62, 37, 16, 2, 'FAC-002-00019', '2026-03-11 10:40:00', 582.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(63, 38, 18, 2, 'FAC-002-00020', '2026-03-11 12:00:00', 1219.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(64, 39, 26, 3, 'FAC-003-00019', '2026-03-11 13:30:00', 794.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(65, 40, 28, 3, 'FAC-003-00020', '2026-03-11 15:10:00', 257.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(66, 2, 4, 1, 'FAC-001-00026', '2026-03-12 09:10:00', 522.49, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(67, 41, 5, 1, 'FAC-001-00027', '2026-03-12 10:30:00', 1295.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(68, 3, 12, 2, 'FAC-002-00021', '2026-03-12 11:45:00', 782.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(69, 42, 13, 2, 'FAC-002-00022', '2026-03-12 13:15:00', 1049.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(70, 4, 22, 3, 'FAC-003-00021', '2026-03-12 14:50:00', 372.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(71, 43, 23, 3, 'FAC-003-00022', '2026-03-12 16:20:00', 874.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(72, 5, 6, 1, 'FAC-001-00028', '2026-03-13 09:20:00', 592.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(73, 44, 8, 1, 'FAC-001-00029', '2026-03-13 10:45:00', 925.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(74, 6, 10, 1, 'FAC-001-00030', '2026-03-13 12:10:00', 394.99, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(75, 45, 16, 2, 'FAC-002-00023', '2026-03-13 13:40:00', 692.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(76, 7, 18, 2, 'FAC-002-00024', '2026-03-13 15:00:00', 712.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(77, 46, 26, 3, 'FAC-003-00023', '2026-03-14 09:15:00', 1229.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(78, 8, 28, 3, 'FAC-003-00024', '2026-03-14 10:40:00', 327.49, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(79, 47, 4, 1, 'FAC-001-00031', '2026-03-14 12:00:00', 744.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(80, 9, 5, 1, 'FAC-001-00032', '2026-03-14 13:30:00', 482.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(81, 48, 12, 2, 'FAC-002-00025', '2026-03-15 09:30:00', 312.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(82, 10, 13, 2, 'FAC-002-00026', '2026-03-15 10:55:00', 394.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(83, 49, 22, 3, 'FAC-003-00025', '2026-03-15 12:20:00', 534.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(84, 11, 23, 3, 'FAC-003-00026', '2026-03-15 13:45:00', 465.00, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(85, 50, 6, 1, 'FAC-001-00033', '2026-03-15 15:10:00', 1224.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(86, 12, 8, 1, 'FAC-001-00034', '2026-03-16 09:15:00', 257.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(87, 51, 10, 1, 'FAC-001-00035', '2026-03-16 10:40:00', 325.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(88, 13, 16, 2, 'FAC-002-00027', '2026-03-16 12:00:00', 82.49, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(89, 52, 18, 2, 'FAC-002-00028', '2026-03-16 13:30:00', 234.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(90, 14, 26, 3, 'FAC-003-00027', '2026-03-16 15:00:00', 537.49, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(91, 53, 28, 3, 'FAC-003-00028', '2026-03-17 09:20:00', 604.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(92, 15, 4, 1, 'FAC-001-00036', '2026-03-17 10:45:00', 77.49, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(93, 54, 5, 1, 'FAC-001-00037', '2026-03-17 12:10:00', 945.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(94, 16, 12, 2, 'FAC-002-00029', '2026-03-17 13:40:00', 364.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(95, 55, 13, 2, 'FAC-002-00030', '2026-03-17 15:05:00', 804.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(96, 17, 22, 3, 'FAC-003-00029', '2026-03-18 09:15:00', 60.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(97, 56, 23, 3, 'FAC-003-00030', '2026-03-18 10:40:00', 104.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(98, 18, 6, 1, 'FAC-001-00038', '2026-03-18 12:05:00', 247.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(99, 57, 8, 1, 'FAC-001-00039', '2026-03-18 13:30:00', 215.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(100, 19, 10, 1, 'FAC-001-00040', '2026-03-18 15:00:00', 665.00, 'Tarjeta', 'Activa');

-- Factura 51 (Total: 314.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (51, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (51, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (51, 3, 71, 1, 240.00, 240.00);

-- Factura 52 (Total: 1239.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (52, 1, 2, 1, 750.00, 750.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (52, 2, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (52, 3, 49, 1, 451.98, 451.98);

-- Factura 53 (Total: 412.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (53, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (53, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (53, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (53, 4, 71, 1, 169.51, 169.51);

-- Factura 54 (Total: 745.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (54, 1, 9, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (54, 2, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (54, 3, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (54, 4, 50, 1, 230.01, 230.01);

-- Factura 55 (Total: 587.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (55, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (55, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (55, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (55, 4, 84, 1, 304.50, 304.50);

-- Factura 56 (Total: 915.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (56, 1, 7, 1, 430.00, 430.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (56, 2, 27, 1, 65.00, 65.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (56, 3, 83, 1, 140.00, 140.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (56, 4, 23, 1, 280.00, 280.00);

-- Factura 57 (Total: 374.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (57, 1, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (57, 2, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (57, 3, 16, 1, 314.99, 314.99);

-- Factura 58 (Total: 819.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (58, 1, 1, 1, 489.99, 489.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (58, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (58, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (58, 4, 71, 1, 125.00, 125.00);

-- Factura 59 (Total: 292.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (59, 1, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (59, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (59, 3, 52, 1, 199.99, 199.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (59, 4, 81, 1, 23.51, 23.51);

-- Factura 60 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (60, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (60, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (60, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (60, 4, 84, 1, 167.00, 167.00);

-- Factura 61 (Total: 1424.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (61, 1, 3, 1, 1299.99, 1299.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (61, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (61, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (61, 4, 38, 1, 65.01, 65.01);

-- Factura 62 (Total: 582.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (62, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (62, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (62, 3, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (62, 4, 71, 1, 125.00, 125.00);

-- Factura 63 (Total: 1219.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (63, 1, 28, 1, 1100.00, 1100.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (63, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (63, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (63, 4, 71, 1, 45.01, 45.01);

-- Factura 64 (Total: 794.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (64, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (64, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (64, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (64, 4, 38, 1, 55.00, 55.00);

-- Factura 65 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (65, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (65, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (65, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (65, 4, 71, 1, 132.00, 132.00);

-- Factura 66 (Total: 522.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (66, 1, 4, 1, 195.00, 195.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (66, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (66, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (66, 4, 53, 1, 252.51, 252.51);

-- Factura 67 (Total: 1295.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (67, 1, 66, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (67, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (67, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (67, 4, 81, 1, 77.50, 77.50);

-- Factura 68 (Total: 782.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (68, 1, 19, 1, 689.99, 689.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (68, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (68, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (68, 4, 71, 1, 35.02, 35.02);

-- Factura 69 (Total: 1049.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (69, 1, 69, 1, 790.00, 790.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (69, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (69, 3, 50, 1, 209.99, 209.99);

-- Factura 70 (Total: 372.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (70, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (70, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (70, 3, 51, 1, 315.01, 315.01);

-- Factura 71 (Total: 874.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (71, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (71, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (71, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (71, 4, 71, 1, 120.01, 120.01);

-- Factura 72 (Total: 592.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (72, 1, 10, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (72, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (72, 3, 40, 1, 10.00, 10.00);

-- Factura 73 (Total: 925.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (73, 1, 19, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (73, 2, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (73, 3, 2, 1, 495.00, 495.00);

-- Factura 74 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (74, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (74, 2, 38, 1, 25.00, 25.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (74, 3, 40, 1, 20.00, 20.00);

-- Factura 75 (Total: 692.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (75, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (75, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (75, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (75, 4, 52, 1, 190.01, 190.01);

-- Factura 76 (Total: 712.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (76, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (76, 2, 38, 1, 32.50, 32.50);

-- Factura 77 (Total: 1229.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (77, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (77, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (77, 3, 40, 1, 47.48, 47.48);

-- Factura 78 (Total: 327.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (78, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (78, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (78, 3, 53, 1, 245.00, 245.00);

-- Factura 79 (Total: 744.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (79, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (79, 2, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (79, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (79, 4, 71, 1, 147.00, 147.00);

-- Factura 80 (Total: 482.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (80, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (80, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (80, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (80, 4, 53, 1, 349.51, 349.51);

-- Factura 81 (Total: 312.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (81, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (81, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (81, 3, 53, 1, 249.00, 249.00);

-- Factura 82 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (82, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (82, 2, 38, 1, 20.00, 20.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (82, 3, 71, 1, 25.00, 25.00);

-- Factura 83 (Total: 534.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (83, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (83, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (83, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (83, 4, 40, 1, 32.50, 32.50);

-- Factura 84 (Total: 465.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (84, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (84, 2, 37, 1, 420.00, 420.00);

-- Factura 85 (Total: 1224.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (85, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (85, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (85, 3, 40, 1, 42.48, 42.48);

-- Factura 86 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (86, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (86, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (86, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (86, 4, 71, 1, 132.00, 132.00);

-- Factura 87 (Total: 325.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (87, 1, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (87, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (87, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (87, 4, 71, 1, 99.50, 99.50);

-- Factura 88 (Total: 82.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (88, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (88, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (88, 3, 71, 1, 7.51, 7.51);

-- Factura 89 (Total: 234.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (89, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (89, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (89, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (89, 4, 71, 1, 92.00, 92.00);

-- Factura 90 (Total: 537.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (90, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (90, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (90, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (90, 4, 71, 1, 130.01, 130.01);

-- Factura 91 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (91, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (91, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (91, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (91, 4, 84, 1, 167.00, 167.00);

-- Factura 92 (Total: 77.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (92, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (92, 2, 40, 1, 27.50, 27.50);

-- Factura 93 (Total: 945.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (93, 1, 7, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (93, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (93, 3, 50, 1, 232.50, 232.50);

-- Factura 94 (Total: 364.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (94, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (94, 2, 16, 1, 315.00, 315.00);

-- Factura 95 (Total: 804.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (95, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (95, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (95, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (95, 4, 71, 1, 50.01, 50.01);

-- Factura 96 (Total: 60.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (96, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (96, 2, 40, 1, 28.00, 28.00);

-- Factura 97 (Total: 104.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (97, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (97, 2, 40, 1, 55.00, 55.00);

-- Factura 98 (Total: 247.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (98, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (98, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (98, 3, 71, 1, 184.00, 184.00);

-- Factura 99 (Total: 215.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (99, 1, 50, 1, 215.00, 215.00);

-- Factura 100 (Total: 665.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (100, 1, 2, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (100, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (100, 3, 71, 1, 82.50, 82.50);



INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(101, 20, 12, 2, 'FAC-002-00031', '2026-03-19 09:30:00', 522.49, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(102, 58, 13, 2, 'FAC-002-00032', '2026-03-19 10:55:00', 1239.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(103, 21, 22, 3, 'FAC-003-00031', '2026-03-19 12:20:00', 412.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(104, 59, 23, 3, 'FAC-003-00032', '2026-03-19 13:45:00', 745.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(105, 22, 4, 1, 'FAC-001-00041', '2026-03-20 09:15:00', 587.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(106, 60, 5, 1, 'FAC-001-00042', '2026-03-20 10:40:00', 915.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(107, 23, 6, 1, 'FAC-001-00043', '2026-03-20 12:05:00', 374.98, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(108, 24, 8, 1, 'FAC-001-00044', '2026-03-20 13:30:00', 819.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(109, 25, 10, 1, 'FAC-001-00045', '2026-03-20 15:00:00', 292.50, 'Efectivo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(110, 26, 16, 2, 'FAC-002-00033', '2026-03-21 09:20:00', 604.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(111, 27, 18, 2, 'FAC-002-00034', '2026-03-21 10:45:00', 1424.99, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(112, 28, 26, 3, 'FAC-003-00033', '2026-03-21 12:10:00', 582.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(113, 29, 28, 3, 'FAC-003-00034', '2026-03-21 13:35:00', 1219.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(114, 30, 4, 1, 'FAC-001-00046', '2026-03-22 09:10:00', 794.99, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(115, 31, 5, 1, 'FAC-001-00047', '2026-03-22 10:35:00', 257.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(116, 32, 12, 2, 'FAC-002-00035', '2026-03-22 12:00:00', 522.49, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(117, 33, 13, 2, 'FAC-002-00036', '2026-03-22 13:25:00', 1295.00, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(118, 34, 22, 3, 'FAC-003-00035', '2026-03-22 14:50:00', 782.50, 'Tarjeta', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(119, 35, 23, 3, 'FAC-003-00036', '2026-03-22 16:15:00', 1049.98, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(120, 36, 6, 1, 'FAC-001-00048', '2026-03-23 09:20:00', 372.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(121, 37, 8, 1, 'FAC-001-00049', '2026-03-23 10:45:00', 874.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(122, 38, 10, 1, 'FAC-001-00050', '2026-03-23 12:10:00', 592.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(123, 39, 16, 2, 'FAC-002-00037', '2026-03-23 13:35:00', 925.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(124, 40, 18, 2, 'FAC-002-00038', '2026-03-23 15:00:00', 394.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(125, 41, 26, 3, 'FAC-003-00037', '2026-03-24 09:15:00', 692.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(126, 42, 28, 3, 'FAC-003-00038', '2026-03-24 10:40:00', 712.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(127, 43, 4, 1, 'FAC-001-00051', '2026-03-24 12:00:00', 1229.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(128, 44, 5, 1, 'FAC-001-00052', '2026-03-24 13:25:00', 327.49, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(129, 45, 12, 2, 'FAC-002-00039', '2026-03-24 14:50:00', 744.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(130, 46, 13, 2, 'FAC-002-00040', '2026-03-24 16:15:00', 482.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(131, 47, 22, 3, 'FAC-003-00039', '2026-03-25 09:30:00', 312.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(132, 48, 23, 3, 'FAC-003-00040', '2026-03-25 10:55:00', 394.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(133, 49, 6, 1, 'FAC-001-00053', '2026-03-25 12:20:00', 534.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(134, 50, 8, 1, 'FAC-001-00054', '2026-03-25 13:45:00', 465.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(135, 51, 10, 1, 'FAC-001-00055', '2026-03-25 15:10:00', 1224.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(136, 52, 16, 2, 'FAC-002-00041', '2026-03-26 09:15:00', 257.50, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(137, 53, 18, 2, 'FAC-002-00042', '2026-03-26 10:40:00', 325.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(138, 54, 26, 3, 'FAC-003-00041', '2026-03-26 12:00:00', 82.49, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(139, 55, 28, 3, 'FAC-003-00042', '2026-03-26 13:30:00', 234.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(140, 56, 4, 1, 'FAC-001-00056', '2026-03-26 15:00:00', 537.49, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(141, 57, 5, 1, 'FAC-001-00057', '2026-03-27 09:20:00', 604.98, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(142, 58, 12, 2, 'FAC-002-00043', '2026-03-27 10:45:00', 77.49, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(143, 59, 13, 2, 'FAC-002-00044', '2026-03-27 12:10:00', 945.00, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(144, 60, 22, 3, 'FAC-003-00043', '2026-03-27 13:40:00', 364.99, 'Credito Corporativo', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(145, 1, 23, 3, 'FAC-003-00044', '2026-03-27 15:05:00', 804.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(146, 2, 6, 1, 'FAC-001-00058', '2026-03-28 09:15:00', 60.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(147, 3, 8, 1, 'FAC-001-00059', '2026-03-28 10:40:00', 104.99, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(148, 4, 10, 1, 'FAC-001-00060', '2026-03-28 12:05:00', 247.50, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(149, 5, 16, 2, 'FAC-002-00045', '2026-03-28 13:30:00', 215.00, 'Credito Personal', 'Activa');
INSERT INTO FACTURA (ID_FACTURA, ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, FECHA_HORA, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA) VALUES
(150, 6, 18, 2, 'FAC-002-00046', '2026-03-28 15:00:00', 665.00, 'Credito Personal', 'Activa');

-- Factura 101 (Total: 522.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (101, 1, 4, 1, 195.00, 195.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (101, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (101, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (101, 4, 53, 1, 252.51, 252.51);

-- Factura 102 (Total: 1239.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (102, 1, 2, 1, 750.00, 750.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (102, 2, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (102, 3, 49, 1, 451.98, 451.98);

-- Factura 103 (Total: 412.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (103, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (103, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (103, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (103, 4, 71, 1, 169.51, 169.51);

-- Factura 104 (Total: 745.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (104, 1, 9, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (104, 2, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (104, 3, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (104, 4, 50, 1, 230.01, 230.01);

-- Factura 105 (Total: 587.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (105, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (105, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (105, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (105, 4, 84, 1, 304.50, 304.50);

-- Factura 106 (Total: 915.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (106, 1, 7, 1, 430.00, 430.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (106, 2, 27, 1, 65.00, 65.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (106, 3, 83, 1, 140.00, 140.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (106, 4, 23, 1, 280.00, 280.00);

-- Factura 107 (Total: 374.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (107, 1, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (107, 2, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (107, 3, 16, 1, 314.99, 314.99);

-- Factura 108 (Total: 819.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (108, 1, 1, 1, 489.99, 489.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (108, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (108, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (108, 4, 71, 1, 125.00, 125.00);

-- Factura 109 (Total: 292.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (109, 1, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (109, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (109, 3, 52, 1, 199.99, 199.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (109, 4, 81, 1, 23.51, 23.51);

-- Factura 110 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (110, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (110, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (110, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (110, 4, 84, 1, 167.00, 167.00);

-- Factura 111 (Total: 1424.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (111, 1, 3, 1, 1299.99, 1299.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (111, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (111, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (111, 4, 38, 1, 65.01, 65.01);

-- Factura 112 (Total: 582.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (112, 1, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (112, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (112, 3, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (112, 4, 71, 1, 125.00, 125.00);

-- Factura 113 (Total: 1219.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (113, 1, 28, 1, 1100.00, 1100.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (113, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (113, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (113, 4, 71, 1, 45.01, 45.01);

-- Factura 114 (Total: 794.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (114, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (114, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (114, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (114, 4, 38, 1, 55.00, 55.00);

-- Factura 115 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (115, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (115, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (115, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (115, 4, 71, 1, 132.00, 132.00);

-- Factura 116 (Total: 522.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (116, 1, 4, 1, 195.00, 195.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (116, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (116, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (116, 4, 53, 1, 252.51, 252.51);

-- Factura 117 (Total: 1295.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (117, 1, 66, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (117, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (117, 3, 71, 1, 35.00, 35.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (117, 4, 81, 1, 77.50, 77.50);

-- Factura 118 (Total: 782.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (118, 1, 19, 1, 689.99, 689.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (118, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (118, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (118, 4, 71, 1, 35.02, 35.02);

-- Factura 119 (Total: 1049.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (119, 1, 69, 1, 790.00, 790.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (119, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (119, 3, 50, 1, 209.99, 209.99);

-- Factura 120 (Total: 372.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (120, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (120, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (120, 3, 51, 1, 315.01, 315.01);

-- Factura 121 (Total: 874.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (121, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (121, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (121, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (121, 4, 71, 1, 120.01, 120.01);

-- Factura 122 (Total: 592.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (122, 1, 10, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (122, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (122, 3, 40, 1, 10.00, 10.00);

-- Factura 123 (Total: 925.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (123, 1, 19, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (123, 2, 50, 1, 215.00, 215.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (123, 3, 2, 1, 495.00, 495.00);

-- Factura 124 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (124, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (124, 2, 38, 1, 25.00, 25.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (124, 3, 40, 1, 20.00, 20.00);

-- Factura 125 (Total: 692.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (125, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (125, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (125, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (125, 4, 52, 1, 190.01, 190.01);

-- Factura 126 (Total: 712.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (126, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (126, 2, 38, 1, 32.50, 32.50);

-- Factura 127 (Total: 1229.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (127, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (127, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (127, 3, 40, 1, 47.48, 47.48);

-- Factura 128 (Total: 327.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (128, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (128, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (128, 3, 53, 1, 245.00, 245.00);

-- Factura 129 (Total: 744.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (129, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (129, 2, 31, 1, 210.00, 210.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (129, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (129, 4, 71, 1, 147.00, 147.00);

-- Factura 130 (Total: 482.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (130, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (130, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (130, 3, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (130, 4, 53, 1, 349.51, 349.51);

-- Factura 131 (Total: 312.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (131, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (131, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (131, 3, 53, 1, 249.00, 249.00);

-- Factura 132 (Total: 394.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (132, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (132, 2, 38, 1, 20.00, 20.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (132, 3, 71, 1, 25.00, 25.00);

-- Factura 133 (Total: 534.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (133, 1, 23, 1, 420.00, 420.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (133, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (133, 3, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (133, 4, 40, 1, 32.50, 32.50);

-- Factura 134 (Total: 465.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (134, 1, 25, 1, 45.00, 45.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (134, 2, 37, 1, 420.00, 420.00);

-- Factura 135 (Total: 1224.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (135, 1, 3, 1, 1150.00, 1150.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (135, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (135, 3, 40, 1, 42.48, 42.48);

-- Factura 136 (Total: 257.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (136, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (136, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (136, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (136, 4, 71, 1, 132.00, 132.00);

-- Factura 137 (Total: 325.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (137, 1, 11, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (137, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (137, 3, 53, 1, 155.00, 155.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (137, 4, 71, 1, 99.50, 99.50);

-- Factura 138 (Total: 82.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (138, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (138, 2, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (138, 3, 71, 1, 7.51, 7.51);

-- Factura 139 (Total: 234.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (139, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (139, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (139, 3, 56, 1, 62.00, 62.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (139, 4, 71, 1, 92.00, 92.00);

-- Factura 140 (Total: 537.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (140, 1, 16, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (140, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (140, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (140, 4, 71, 1, 130.01, 130.01);

-- Factura 141 (Total: 604.98)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (141, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (141, 2, 38, 1, 38.00, 38.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (141, 3, 6, 1, 349.99, 349.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (141, 4, 84, 1, 167.00, 167.00);

-- Factura 142 (Total: 77.49)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (142, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (142, 2, 40, 1, 27.50, 27.50);

-- Factura 143 (Total: 945.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (143, 1, 7, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (143, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (143, 3, 50, 1, 232.50, 232.50);

-- Factura 144 (Total: 364.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (144, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (144, 2, 16, 1, 315.00, 315.00);

-- Factura 145 (Total: 804.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (145, 1, 17, 1, 680.00, 680.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (145, 2, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (145, 3, 40, 1, 24.99, 24.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (145, 4, 71, 1, 50.01, 50.01);

-- Factura 146 (Total: 60.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (146, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (146, 2, 40, 1, 28.00, 28.00);

-- Factura 147 (Total: 104.99)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (147, 1, 37, 1, 49.99, 49.99);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (147, 2, 40, 1, 55.00, 55.00);

-- Factura 148 (Total: 247.50)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (148, 1, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (148, 2, 47, 1, 31.00, 31.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (148, 3, 71, 1, 184.00, 184.00);

-- Factura 149 (Total: 215.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (149, 1, 50, 1, 215.00, 215.00);

-- Factura 150 (Total: 665.00)
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (150, 1, 2, 1, 550.00, 550.00);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (150, 2, 38, 1, 32.50, 32.50);
INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL) VALUES (150, 3, 71, 1, 82.50, 82.50);

-- CREDITO

INSERT INTO CREDITO (ID_CREDITO, ID_FACTURA, ESTADO_CREDITO, FECHA_OTORGACION, MONTO_FINANCIADO, SALDO_PENDIENTE, TASA_INTERES, NUMERO_CUOTAS) VALUES
(1, 1, 'Pendiente', '2026-03-01', 592.50, 592.50, 15.00, 6),
(2, 2, 'Pendiente', '2026-03-01', 1239.98, 1239.98, 15.00, 12),
(3, 4, 'Pendiente', '2026-03-01', 745.00, 745.00, 15.00, 6),
(4, 5, 'Pendiente', '2026-03-01', 587.50, 587.50, 15.00, 6),
(5, 6, 'Pendiente', '2026-03-01', 915.00, 915.00, 15.00, 6),
(6, 7, 'Pendiente', '2026-03-02', 374.98, 374.98, 15.00, 3),
(7, 8, 'Pendiente', '2026-03-02', 819.98, 819.98, 15.00, 6),
(8, 9, 'Pendiente', '2026-03-02', 292.50, 292.50, 15.00, 3),
(9, 11, 'Pendiente', '2026-03-02', 1424.99, 1424.99, 15.00, 12),
(10, 12, 'Pendiente', '2026-03-02', 582.50, 582.50, 15.00, 6),
(11, 13, 'Pendiente', '2026-03-02', 1219.99, 1219.99, 15.00, 12),
(12, 15, 'Pendiente', '2026-03-03', 257.50, 257.50, 15.00, 3),
(13, 16, 'Pendiente', '2026-03-03', 522.49, 522.49, 15.00, 6),
(14, 17, 'Pendiente', '2026-03-03', 1295.00, 1295.00, 15.00, 12),
(15, 19, 'Pendiente', '2026-03-03', 1049.98, 1049.98, 15.00, 6),
(16, 20, 'Pendiente', '2026-03-04', 372.50, 372.50, 15.00, 3),
(17, 22, 'Pendiente', '2026-03-04', 592.50, 592.50, 15.00, 6),
(18, 23, 'Pendiente', '2026-03-04', 925.00, 925.00, 15.00, 6),
(19, 24, 'Pendiente', '2026-03-04', 394.99, 394.99, 15.00, 3),
(20, 26, 'Pendiente', '2026-03-04', 712.50, 712.50, 15.00, 6),
(21, 27, 'Pendiente', '2026-03-05', 1229.98, 1229.98, 15.00, 12),
(22, 29, 'Pendiente', '2026-03-05', 744.99, 744.99, 15.00, 6),
(23, 31, 'Pendiente', '2026-03-05', 312.50, 312.50, 15.00, 3),
(24, 32, 'Pendiente', '2026-03-05', 394.99, 394.99, 15.00, 3),
(25, 34, 'Pendiente', '2026-03-06', 465.00, 465.00, 15.00, 3),
(26, 36, 'Pendiente', '2026-03-06', 257.50, 257.50, 15.00, 3),
(27, 37, 'Pendiente', '2026-03-06', 325.00, 325.00, 15.00, 3),
(28, 38, 'Pendiente', '2026-03-06', 82.49, 82.49, 15.00, 3),
(29, 40, 'Pendiente', '2026-03-07', 537.49, 537.49, 15.00, 6),
(30, 41, 'Pendiente', '2026-03-07', 604.98, 604.98, 15.00, 6),
(31, 43, 'Pendiente', '2026-03-07', 945.00, 945.00, 15.00, 6),
(32, 44, 'Pendiente', '2026-03-07', 364.99, 364.99, 15.00, 3),
(33, 45, 'Pendiente', '2026-03-07', 804.99, 804.99, 15.00, 6),
(34, 47, 'Pendiente', '2026-03-08', 104.99, 104.99, 15.00, 3),
(35, 48, 'Pendiente', '2026-03-08', 247.50, 247.50, 15.00, 3),
(36, 49, 'Pendiente', '2026-03-08', 215.00, 215.00, 15.00, 3),
(37, 50, 'Pendiente', '2026-03-08', 665.00, 665.00, 15.00, 6),
(38, 51, 'Pendiente', '2026-03-08', 314.98, 314.98, 15.00, 3),
(39, 52, 'Pendiente', '2026-03-09', 1239.98, 1239.98, 15.00, 12),
(40, 54, 'Pendiente', '2026-03-09', 745.00, 745.00, 15.00, 6),
(41, 55, 'Pendiente', '2026-03-09', 587.50, 587.50, 15.00, 6),
(42, 56, 'Pendiente', '2026-03-09', 915.00, 915.00, 15.00, 6),
(43, 58, 'Pendiente', '2026-03-10', 819.98, 819.98, 15.00, 6),
(44, 60, 'Pendiente', '2026-03-10', 604.98, 604.98, 15.00, 6),
(45, 61, 'Pendiente', '2026-03-11', 1424.99, 1424.99, 15.00, 12),
(46, 62, 'Pendiente', '2026-03-11', 582.50, 582.50, 15.00, 6),
(47, 63, 'Pendiente', '2026-03-11', 1219.99, 1219.99, 15.00, 12),
(48, 64, 'Pendiente', '2026-03-11', 794.99, 794.99, 15.00, 6),
(49, 65, 'Pendiente', '2026-03-11', 257.50, 257.50, 15.00, 3),
(50, 66, 'Pendiente', '2026-03-12', 522.49, 522.49, 15.00, 6),
(51, 67, 'Pendiente', '2026-03-12', 1295.00, 1295.00, 15.00, 12),
(52, 68, 'Pendiente', '2026-03-12', 782.50, 782.50, 15.00, 6),
(53, 69, 'Pendiente', '2026-03-12', 1049.98, 1049.98, 15.00, 6),
(54, 71, 'Pendiente', '2026-03-12', 874.99, 874.99, 15.00, 6),
(55, 72, 'Pendiente', '2026-03-13', 592.50, 592.50, 15.00, 6),
(56, 73, 'Pendiente', '2026-03-13', 925.00, 925.00, 15.00, 6),
(57, 75, 'Pendiente', '2026-03-13', 692.50, 692.50, 15.00, 6),
(58, 76, 'Pendiente', '2026-03-13', 712.50, 712.50, 15.00, 6),
(59, 77, 'Pendiente', '2026-03-14', 1229.98, 1229.98, 15.00, 12),
(60, 79, 'Pendiente', '2026-03-14', 744.99, 744.99, 15.00, 6),
(61, 80, 'Pendiente', '2026-03-14', 482.50, 482.50, 15.00, 3),
(62, 81, 'Pendiente', '2026-03-15', 312.50, 312.50, 15.00, 3),
(63, 82, 'Pendiente', '2026-03-15', 394.99, 394.99, 15.00, 3),
(64, 83, 'Pendiente', '2026-03-15', 534.99, 534.99, 15.00, 6),
(65, 85, 'Pendiente', '2026-03-15', 1224.98, 1224.98, 15.00, 12),
(66, 86, 'Pendiente', '2026-03-16', 257.50, 257.50, 15.00, 3),
(67, 87, 'Pendiente', '2026-03-16', 325.00, 325.00, 15.00, 3),
(68, 89, 'Pendiente', '2026-03-16', 234.99, 234.99, 15.00, 3),
(69, 90, 'Pendiente', '2026-03-16', 537.49, 537.49, 15.00, 6),
(70, 91, 'Pendiente', '2026-03-17', 604.98, 604.98, 15.00, 6),
(71, 93, 'Pendiente', '2026-03-17', 945.00, 945.00, 15.00, 6),
(72, 94, 'Pendiente', '2026-03-17', 364.99, 364.99, 15.00, 3),
(73, 95, 'Pendiente', '2026-03-17', 804.99, 804.99, 15.00, 6),
(74, 97, 'Pendiente', '2026-03-18', 104.99, 104.99, 15.00, 3),
(75, 98, 'Pendiente', '2026-03-18', 247.50, 247.50, 15.00, 3),
(76, 99, 'Pendiente', '2026-03-18', 215.00, 215.00, 15.00, 3);

INSERT INTO CUOTA (ID_CREDITO, NUMERO_CUOTA, FECHA_VENCIMIENTO, FECHA_PAGO, MONTO_ABONADO, MONTO_ESPERADO, ESTADO_CUOTA) VALUES
-- Crédito 1 (Factura 1 - Monto: 592.50)
(1, 1, '2026-04-01', NULL, 0.00, 98.75, 'Pendiente'),
(1, 2, '2026-05-01', NULL, 0.00, 98.75, 'Pendiente'),
(1, 3, '2026-06-01', NULL, 0.00, 98.75, 'Pendiente'),
(1, 4, '2026-07-01', NULL, 0.00, 98.75, 'Pendiente'),
(1, 5, '2026-08-01', NULL, 0.00, 98.75, 'Pendiente'),
(1, 6, '2026-09-01', NULL, 0.00, 98.75, 'Pendiente'),

-- Crédito 2 (Factura 2 - Monto: 1239.98)
(2, 1, '2026-04-01', NULL, 0.00, 206.66, 'Pendiente'),
(2, 2, '2026-05-01', NULL, 0.00, 206.66, 'Pendiente'),
(2, 3, '2026-06-01', NULL, 0.00, 206.66, 'Pendiente'),
(2, 4, '2026-07-01', NULL, 0.00, 206.66, 'Pendiente'),
(2, 5, '2026-08-01', NULL, 0.00, 206.66, 'Pendiente'),
(2, 6, '2026-09-01', NULL, 0.00, 206.68, 'Pendiente'),

-- Crédito 3 (Factura 4 - Monto: 745.00)
(3, 1, '2026-04-01', NULL, 0.00, 124.16, 'Pendiente'),
(3, 2, '2026-05-01', NULL, 0.00, 124.16, 'Pendiente'),
(3, 3, '2026-06-01', NULL, 0.00, 124.16, 'Pendiente'),
(3, 4, '2026-07-01', NULL, 0.00, 124.16, 'Pendiente'),
(3, 5, '2026-08-01', NULL, 0.00, 124.18, 'Pendiente'),
(3, 6, '2026-09-01', NULL, 0.00, 124.18, 'Pendiente'),

-- Crédito 4 (Factura 5 - Monto: 587.50)
(4, 1, '2026-04-01', NULL, 0.00, 97.91, 'Pendiente'),
(4, 2, '2026-05-01', NULL, 0.00, 97.91, 'Pendiente'),
(4, 3, '2026-06-01', NULL, 0.00, 97.91, 'Pendiente'),
(4, 4, '2026-07-01', NULL, 0.00, 97.91, 'Pendiente'),
(4, 5, '2026-08-01', NULL, 0.00, 97.93, 'Pendiente'),
(4, 6, '2026-09-01', NULL, 0.00, 97.93, 'Pendiente'),

-- Crédito 5 (Factura 6 - Monto: 915.00)
(5, 1, '2026-04-01', NULL, 0.00, 152.50, 'Pendiente'),
(5, 2, '2026-05-01', NULL, 0.00, 152.50, 'Pendiente'),
(5, 3, '2026-06-01', NULL, 0.00, 152.50, 'Pendiente'),
(5, 4, '2026-07-01', NULL, 0.00, 152.50, 'Pendiente'),
(5, 5, '2026-08-01', NULL, 0.00, 152.50, 'Pendiente'),
(5, 6, '2026-09-01', NULL, 0.00, 152.50, 'Pendiente'),

-- Crédito 6 (Factura 7 - Monto: 374.98)
(6, 1, '2026-04-02', NULL, 0.00, 62.49, 'Pendiente'),
(6, 2, '2026-05-02', NULL, 0.00, 62.49, 'Pendiente'),
(6, 3, '2026-06-02', NULL, 0.00, 62.49, 'Pendiente'),
(6, 4, '2026-07-02', NULL, 0.00, 62.49, 'Pendiente'),
(6, 5, '2026-08-02', NULL, 0.00, 62.51, 'Pendiente'),
(6, 6, '2026-09-02', NULL, 0.00, 62.51, 'Pendiente'),

-- Crédito 7 (Factura 8 - Monto: 819.98)
(7, 1, '2026-04-02', NULL, 0.00, 136.66, 'Pendiente'),
(7, 2, '2026-05-02', NULL, 0.00, 136.66, 'Pendiente'),
(7, 3, '2026-06-02', NULL, 0.00, 136.66, 'Pendiente'),
(7, 4, '2026-07-02', NULL, 0.00, 136.66, 'Pendiente'),
(7, 5, '2026-08-02', NULL, 0.00, 136.67, 'Pendiente'),
(7, 6, '2026-09-02', NULL, 0.00, 136.67, 'Pendiente'),

-- Crédito 8 (Factura 9 - Monto: 292.50)
(8, 1, '2026-04-02', NULL, 0.00, 48.75, 'Pendiente'),
(8, 2, '2026-05-02', NULL, 0.00, 48.75, 'Pendiente'),
(8, 3, '2026-06-02', NULL, 0.00, 48.75, 'Pendiente'),
(8, 4, '2026-07-02', NULL, 0.00, 48.75, 'Pendiente'),
(8, 5, '2026-08-02', NULL, 0.00, 48.75, 'Pendiente'),
(8, 6, '2026-09-02', NULL, 0.00, 48.75, 'Pendiente'),

-- Crédito 9 (Factura 11 - Monto: 1424.99)
(9, 1, '2026-04-02', NULL, 0.00, 237.49, 'Pendiente'),
(9, 2, '2026-05-02', NULL, 0.00, 237.49, 'Pendiente'),
(9, 3, '2026-06-02', NULL, 0.00, 237.49, 'Pendiente'),
(9, 4, '2026-07-02', NULL, 0.00, 237.50, 'Pendiente'),
(9, 5, '2026-08-02', NULL, 0.00, 237.50, 'Pendiente'),
(9, 6, '2026-09-02', NULL, 0.00, 237.52, 'Pendiente'),

-- Crédito 10 (Factura 12 - Monto: 582.50)
(10, 1, '2026-04-02', NULL, 0.00, 97.08, 'Pendiente'),
(10, 2, '2026-05-02', NULL, 0.00, 97.08, 'Pendiente'),
(10, 3, '2026-06-02', NULL, 0.00, 97.08, 'Pendiente'),
(10, 4, '2026-07-02', NULL, 0.00, 97.08, 'Pendiente'),
(10, 5, '2026-08-02', NULL, 0.00, 97.09, 'Pendiente'),
(10, 6, '2026-09-02', NULL, 0.00, 97.09, 'Pendiente'),

-- Crédito 11 (Factura 13 - Monto: 1219.99)
(11, 1, '2026-04-02', NULL, 0.00, 203.33, 'Pendiente'),
(11, 2, '2026-05-02', NULL, 0.00, 203.33, 'Pendiente'),
(11, 3, '2026-06-02', NULL, 0.00, 203.33, 'Pendiente'),
(11, 4, '2026-07-02', NULL, 0.00, 203.33, 'Pendiente'),
(11, 5, '2026-08-02', NULL, 0.00, 203.33, 'Pendiente'),
(11, 6, '2026-09-02', NULL, 0.00, 203.34, 'Pendiente'),

-- Crédito 12 (Factura 15 - Monto: 257.50)
(12, 1, '2026-04-03', NULL, 0.00, 42.91, 'Pendiente'),
(12, 2, '2026-05-03', NULL, 0.00, 42.91, 'Pendiente'),
(12, 3, '2026-06-03', NULL, 0.00, 42.91, 'Pendiente'),
(12, 4, '2026-07-03', NULL, 0.00, 42.91, 'Pendiente'),
(12, 5, '2026-08-03', NULL, 0.00, 42.93, 'Pendiente'),
(12, 6, '2026-09-03', NULL, 0.00, 42.93, 'Pendiente'),

-- Crédito 13 (Factura 16 - Monto: 522.49)
(13, 1, '2026-04-03', NULL, 0.00, 87.08, 'Pendiente'),
(13, 2, '2026-05-03', NULL, 0.00, 87.08, 'Pendiente'),
(13, 3, '2026-06-03', NULL, 0.00, 87.08, 'Pendiente'),
(13, 4, '2026-07-03', NULL, 0.00, 87.08, 'Pendiente'),
(13, 5, '2026-08-03', NULL, 0.00, 87.08, 'Pendiente'),
(13, 6, '2026-09-03', NULL, 0.00, 87.09, 'Pendiente'),

-- Crédito 14 (Factura 17 - Monto: 1295.00)
(14, 1, '2026-04-03', NULL, 0.00, 215.83, 'Pendiente'),
(14, 2, '2026-05-03', NULL, 0.00, 215.83, 'Pendiente'),
(14, 3, '2026-06-03', NULL, 0.00, 215.83, 'Pendiente'),
(14, 4, '2026-07-03', NULL, 0.00, 215.83, 'Pendiente'),
(14, 5, '2026-08-03', NULL, 0.00, 215.84, 'Pendiente'),
(14, 6, '2026-09-03', NULL, 0.00, 215.84, 'Pendiente'),

-- Crédito 15 (Factura 19 - Monto: 1049.98)
(15, 1, '2026-04-03', NULL, 0.00, 174.99, 'Pendiente'),
(15, 2, '2026-05-03', NULL, 0.00, 174.99, 'Pendiente'),
(15, 3, '2026-06-03', NULL, 0.00, 174.99, 'Pendiente'),
(15, 4, '2026-07-03', NULL, 0.00, 174.99, 'Pendiente'),
(15, 5, '2026-08-03', NULL, 0.00, 175.00, 'Pendiente'),
(15, 6, '2026-09-03', NULL, 0.00, 175.02, 'Pendiente'),

-- Crédito 16 (Factura 20 - Monto: 372.50)
(16, 1, '2026-04-04', NULL, 0.00, 62.08, 'Pendiente'),
(16, 2, '2026-05-04', NULL, 0.00, 62.08, 'Pendiente'),
(16, 3, '2026-06-04', NULL, 0.00, 62.08, 'Pendiente'),
(16, 4, '2026-07-04', NULL, 0.00, 62.08, 'Pendiente'),
(16, 5, '2026-08-04', NULL, 0.00, 62.09, 'Pendiente'),
(16, 6, '2026-09-04', NULL, 0.00, 62.09, 'Pendiente'),

-- Crédito 17 (Factura 22 - Monto: 592.50)
(17, 1, '2026-04-04', NULL, 0.00, 98.75, 'Pendiente'),
(17, 2, '2026-05-04', NULL, 0.00, 98.75, 'Pendiente'),
(17, 3, '2026-06-04', NULL, 0.00, 98.75, 'Pendiente'),
(17, 4, '2026-07-04', NULL, 0.00, 98.75, 'Pendiente'),
(17, 5, '2026-08-04', NULL, 0.00, 98.75, 'Pendiente'),
(17, 6, '2026-09-04', NULL, 0.00, 98.75, 'Pendiente'),

-- Crédito 18 (Factura 23 - Monto: 925.00)
(18, 1, '2026-04-04', NULL, 0.00, 154.16, 'Pendiente'),
(18, 2, '2026-05-04', NULL, 0.00, 154.16, 'Pendiente'),
(18, 3, '2026-06-04', NULL, 0.00, 154.16, 'Pendiente'),
(18, 4, '2026-07-04', NULL, 0.00, 154.16, 'Pendiente'),
(18, 5, '2026-08-04', NULL, 0.00, 154.18, 'Pendiente'),
(18, 6, '2026-09-04', NULL, 0.00, 154.18, 'Pendiente'),

-- Crédito 19 (Factura 24 - Monto: 394.99)
(19, 1, '2026-04-04', NULL, 0.00, 65.83, 'Pendiente'),
(19, 2, '2026-05-04', NULL, 0.00, 65.83, 'Pendiente'),
(19, 3, '2026-06-04', NULL, 0.00, 65.83, 'Pendiente'),
(19, 4, '2026-07-04', NULL, 0.00, 65.83, 'Pendiente'),
(19, 5, '2026-08-04', NULL, 0.00, 65.83, 'Pendiente'),
(19, 6, '2026-09-04', NULL, 0.00, 65.84, 'Pendiente'),

-- Crédito 20 (Factura 26 - Monto: 712.50)
(20, 1, '2026-04-04', NULL, 0.00, 118.75, 'Pendiente'),
(20, 2, '2026-05-04', NULL, 0.00, 118.75, 'Pendiente'),
(20, 3, '2026-06-04', NULL, 0.00, 118.75, 'Pendiente'),
(20, 4, '2026-07-04', NULL, 0.00, 118.75, 'Pendiente'),
(20, 5, '2026-08-04', NULL, 0.00, 118.75, 'Pendiente'),
(20, 6, '2026-09-04', NULL, 0.00, 118.75, 'Pendiente'),

-- Crédito 21 (Factura 27 - Monto: 1229.98)
(21, 1, '2026-04-05', NULL, 0.00, 204.99, 'Pendiente'),
(21, 2, '2026-05-05', NULL, 0.00, 204.99, 'Pendiente'),
(21, 3, '2026-06-05', NULL, 0.00, 204.99, 'Pendiente'),
(21, 4, '2026-07-05', NULL, 0.00, 204.99, 'Pendiente'),
(21, 5, '2026-08-05', NULL, 0.00, 205.00, 'Pendiente'),
(21, 6, '2026-09-05', NULL, 0.00, 205.02, 'Pendiente'),

-- Crédito 22 (Factura 29 - Monto: 744.99)
(22, 1, '2026-04-05', NULL, 0.00, 124.16, 'Pendiente'),
(22, 2, '2026-05-05', NULL, 0.00, 124.16, 'Pendiente'),
(22, 3, '2026-06-05', NULL, 0.00, 124.16, 'Pendiente'),
(22, 4, '2026-07-05', NULL, 0.00, 124.16, 'Pendiente'),
(22, 5, '2026-08-05', NULL, 0.00, 124.17, 'Pendiente'),
(22, 6, '2026-09-05', NULL, 0.00, 124.18, 'Pendiente'),

-- Crédito 23 (Factura 31 - Monto: 312.50)
(23, 1, '2026-04-05', NULL, 0.00, 52.08, 'Pendiente'),
(23, 2, '2026-05-05', NULL, 0.00, 52.08, 'Pendiente'),
(23, 3, '2026-06-05', NULL, 0.00, 52.08, 'Pendiente'),
(23, 4, '2026-07-05', NULL, 0.00, 52.08, 'Pendiente'),
(23, 5, '2026-08-05', NULL, 0.00, 52.09, 'Pendiente'),
(23, 6, '2026-09-05', NULL, 0.00, 52.09, 'Pendiente'),

-- Crédito 24 (Factura 32 - Monto: 394.99)
(24, 1, '2026-04-05', NULL, 0.00, 65.83, 'Pendiente'),
(24, 2, '2026-05-05', NULL, 0.00, 65.83, 'Pendiente'),
(24, 3, '2026-06-05', NULL, 0.00, 65.83, 'Pendiente'),
(24, 4, '2026-07-05', NULL, 0.00, 65.83, 'Pendiente'),
(24, 5, '2026-08-05', NULL, 0.00, 65.83, 'Pendiente'),
(24, 6, '2026-09-05', NULL, 0.00, 65.84, 'Pendiente'),

-- Crédito 25 (Factura 34 - Monto: 465.00)
(25, 1, '2026-04-06', NULL, 0.00, 77.50, 'Pendiente'),
(25, 2, '2026-05-06', NULL, 0.00, 77.50, 'Pendiente'),
(25, 3, '2026-06-06', NULL, 0.00, 77.50, 'Pendiente'),
(25, 4, '2026-07-06', NULL, 0.00, 77.50, 'Pendiente'),
(25, 5, '2026-08-06', NULL, 0.00, 77.50, 'Pendiente'),
(25, 6, '2026-09-06', NULL, 0.00, 77.50, 'Pendiente'),

-- Crédito 26 (Factura 36 - Monto: 257.50)
(26, 1, '2026-04-06', NULL, 0.00, 42.91, 'Pendiente'),
(26, 2, '2026-05-06', NULL, 0.00, 42.91, 'Pendiente'),
(26, 3, '2026-06-06', NULL, 0.00, 42.91, 'Pendiente'),
(26, 4, '2026-07-06', NULL, 0.00, 42.91, 'Pendiente'),
(26, 5, '2026-08-06', NULL, 0.00, 42.93, 'Pendiente'),
(26, 6, '2026-09-06', NULL, 0.00, 42.93, 'Pendiente'),

-- Crédito 27 (Factura 37 - Monto: 325.00)
(27, 1, '2026-04-06', NULL, 0.00, 54.16, 'Pendiente'),
(27, 2, '2026-05-06', NULL, 0.00, 54.16, 'Pendiente'),
(27, 3, '2026-06-06', NULL, 0.00, 54.16, 'Pendiente'),
(27, 4, '2026-07-06', NULL, 0.00, 54.16, 'Pendiente'),
(27, 5, '2026-08-06', NULL, 0.00, 54.18, 'Pendiente'),
(27, 6, '2026-09-06', NULL, 0.00, 54.18, 'Pendiente'),

-- Crédito 28 (Factura 38 - Monto: 82.49)
(28, 1, '2026-04-06', NULL, 0.00, 13.74, 'Pendiente'),
(28, 2, '2026-05-06', NULL, 0.00, 13.74, 'Pendiente'),
(28, 3, '2026-06-06', NULL, 0.00, 13.74, 'Pendiente'),
(28, 4, '2026-07-06', NULL, 0.00, 13.74, 'Pendiente'),
(28, 5, '2026-08-06', NULL, 0.00, 13.74, 'Pendiente'),
(28, 6, '2026-09-06', NULL, 0.00, 13.79, 'Pendiente'),

-- Crédito 29 (Factura 40 - Monto: 537.49)
(29, 1, '2026-04-07', NULL, 0.00, 89.58, 'Pendiente'),
(29, 2, '2026-05-07', NULL, 0.00, 89.58, 'Pendiente'),
(29, 3, '2026-06-07', NULL, 0.00, 89.58, 'Pendiente'),
(29, 4, '2026-07-07', NULL, 0.00, 89.58, 'Pendiente'),
(29, 5, '2026-08-07', NULL, 0.00, 89.58, 'Pendiente'),
(29, 6, '2026-09-07', NULL, 0.00, 89.59, 'Pendiente'),

-- Crédito 30 (Factura 41 - Monto: 604.98)
(30, 1, '2026-04-07', NULL, 0.00, 100.83, 'Pendiente'),
(30, 2, '2026-05-07', NULL, 0.00, 100.83, 'Pendiente'),
(30, 3, '2026-06-07', NULL, 0.00, 100.83, 'Pendiente'),
(30, 4, '2026-07-07', NULL, 0.00, 100.83, 'Pendiente'),
(30, 5, '2026-08-07', NULL, 0.00, 100.83, 'Pendiente'),
(30, 6, '2026-09-07', NULL, 0.00, 100.83, 'Pendiente'),

-- Crédito 31 (Factura 43 - Monto: 945.00)
(31, 1, '2026-04-07', NULL, 0.00, 157.50, 'Pendiente'),
(31, 2, '2026-05-07', NULL, 0.00, 157.50, 'Pendiente'),
(31, 3, '2026-06-07', NULL, 0.00, 157.50, 'Pendiente'),
(31, 4, '2026-07-07', NULL, 0.00, 157.50, 'Pendiente'),
(31, 5, '2026-08-07', NULL, 0.00, 157.50, 'Pendiente'),
(31, 6, '2026-09-07', NULL, 0.00, 157.50, 'Pendiente'),

-- Crédito 32 (Factura 44 - Monto: 364.99)
(32, 1, '2026-04-07', NULL, 0.00, 60.83, 'Pendiente'),
(32, 2, '2026-05-07', NULL, 0.00, 60.83, 'Pendiente'),
(32, 3, '2026-06-07', NULL, 0.00, 60.83, 'Pendiente'),
(32, 4, '2026-07-07', NULL, 0.00, 60.83, 'Pendiente'),
(32, 5, '2026-08-07', NULL, 0.00, 60.83, 'Pendiente'),
(32, 6, '2026-09-07', NULL, 0.00, 60.84, 'Pendiente'),

-- Crédito 33 (Factura 45 - Monto: 804.99)
(33, 1, '2026-04-07', NULL, 0.00, 134.16, 'Pendiente'),
(33, 2, '2026-05-07', NULL, 0.00, 134.16, 'Pendiente'),
(33, 3, '2026-06-07', NULL, 0.00, 134.16, 'Pendiente'),
(33, 4, '2026-07-07', NULL, 0.00, 134.16, 'Pendiente'),
(33, 5, '2026-08-07', NULL, 0.00, 134.17, 'Pendiente'),
(33, 6, '2026-09-07', NULL, 0.00, 134.18, 'Pendiente'),

-- Crédito 34 (Factura 47 - Monto: 104.99)
(34, 1, '2026-04-08', NULL, 0.00, 17.49, 'Pendiente'),
(34, 2, '2026-05-08', NULL, 0.00, 17.49, 'Pendiente'),
(34, 3, '2026-06-08', NULL, 0.00, 17.49, 'Pendiente'),
(34, 4, '2026-07-08', NULL, 0.00, 17.49, 'Pendiente'),
(34, 5, '2026-08-08', NULL, 0.00, 17.49, 'Pendiente'),
(34, 6, '2026-09-08', NULL, 0.00, 17.54, 'Pendiente'),

-- Crédito 35 (Factura 48 - Monto: 247.50)
(35, 1, '2026-04-08', NULL, 0.00, 41.25, 'Pendiente'),
(35, 2, '2026-05-08', NULL, 0.00, 41.25, 'Pendiente'),
(35, 3, '2026-06-08', NULL, 0.00, 41.25, 'Pendiente'),
(35, 4, '2026-07-08', NULL, 0.00, 41.25, 'Pendiente'),
(35, 5, '2026-08-08', NULL, 0.00, 41.25, 'Pendiente'),
(35, 6, '2026-09-08', NULL, 0.00, 41.25, 'Pendiente'),

-- Crédito 36 (Factura 49 - Monto: 215.00)
(36, 1, '2026-04-08', NULL, 0.00, 35.83, 'Pendiente'),
(36, 2, '2026-05-08', NULL, 0.00, 35.83, 'Pendiente'),
(36, 3, '2026-06-08', NULL, 0.00, 35.83, 'Pendiente'),
(36, 4, '2026-07-08', NULL, 0.00, 35.83, 'Pendiente'),
(36, 5, '2026-08-08', NULL, 0.00, 35.83, 'Pendiente'),
(36, 6, '2026-09-08', NULL, 0.00, 35.85, 'Pendiente'),

-- Crédito 37 (Factura 50 - Monto: 665.00)
(37, 1, '2026-04-08', NULL, 0.00, 110.83, 'Pendiente'),
(37, 2, '2026-05-08', NULL, 0.00, 110.83, 'Pendiente'),
(37, 3, '2026-06-08', NULL, 0.00, 110.83, 'Pendiente'),
(37, 4, '2026-07-08', NULL, 0.00, 110.83, 'Pendiente'),
(37, 5, '2026-08-08', NULL, 0.00, 110.83, 'Pendiente'),
(37, 6, '2026-09-08', NULL, 0.00, 110.85, 'Pendiente'),

-- Crédito 38 (Factura 51 - Monto: 314.98)
(38, 1, '2026-04-08', NULL, 0.00, 52.49, 'Pendiente'),
(38, 2, '2026-05-08', NULL, 0.00, 52.49, 'Pendiente'),
(38, 3, '2026-06-08', NULL, 0.00, 52.49, 'Pendiente'),
(38, 4, '2026-07-08', NULL, 0.00, 52.49, 'Pendiente'),
(38, 5, '2026-08-08', NULL, 0.00, 52.51, 'Pendiente'),
(38, 6, '2026-09-08', NULL, 0.00, 52.51, 'Pendiente'),

-- Crédito 39 (Factura 52 - Monto: 1239.98)
(39, 1, '2026-04-09', NULL, 0.00, 206.66, 'Pendiente'),
(39, 2, '2026-05-09', NULL, 0.00, 206.66, 'Pendiente'),
(39, 3, '2026-06-09', NULL, 0.00, 206.66, 'Pendiente'),
(39, 4, '2026-07-09', NULL, 0.00, 206.66, 'Pendiente'),
(39, 5, '2026-08-09', NULL, 0.00, 206.66, 'Pendiente'),
(39, 6, '2026-09-09', NULL, 0.00, 206.68, 'Pendiente'),

-- Crédito 40 (Factura 54 - Monto: 745.00)
(40, 1, '2026-04-09', NULL, 0.00, 124.16, 'Pendiente'),
(40, 2, '2026-05-09', NULL, 0.00, 124.16, 'Pendiente'),
(40, 3, '2026-06-09', NULL, 0.00, 124.16, 'Pendiente'),
(40, 4, '2026-07-09', NULL, 0.00, 124.16, 'Pendiente'),
(40, 5, '2026-08-09', NULL, 0.00, 124.18, 'Pendiente'),
(40, 6, '2026-09-09', NULL, 0.00, 124.18, 'Pendiente'),

-- Crédito 41 (Factura 55 - Monto: 587.50)
(41, 1, '2026-04-09', NULL, 0.00, 97.91, 'Pendiente'),
(41, 2, '2026-05-09', NULL, 0.00, 97.91, 'Pendiente'),
(41, 3, '2026-06-09', NULL, 0.00, 97.91, 'Pendiente'),
(41, 4, '2026-07-09', NULL, 0.00, 97.91, 'Pendiente'),
(41, 5, '2026-08-09', NULL, 0.00, 97.93, 'Pendiente'),
(41, 6, '2026-09-09', NULL, 0.00, 97.93, 'Pendiente'),

-- Crédito 42 (Factura 56 - Monto: 915.00)
(42, 1, '2026-04-09', NULL, 0.00, 152.50, 'Pendiente'),
(42, 2, '2026-05-09', NULL, 0.00, 152.50, 'Pendiente'),
(42, 3, '2026-06-09', NULL, 0.00, 152.50, 'Pendiente'),
(42, 4, '2026-07-09', NULL, 0.00, 152.50, 'Pendiente'),
(42, 5, '2026-08-09', NULL, 0.00, 152.50, 'Pendiente'),
(42, 6, '2026-09-09', NULL, 0.00, 152.50, 'Pendiente'),

-- Crédito 43 (Factura 58 - Monto: 819.98)
(43, 1, '2026-04-10', NULL, 0.00, 136.66, 'Pendiente'),
(43, 2, '2026-05-10', NULL, 0.00, 136.66, 'Pendiente'),
(43, 3, '2026-06-10', NULL, 0.00, 136.66, 'Pendiente'),
(43, 4, '2026-07-10', NULL, 0.00, 136.66, 'Pendiente'),
(43, 5, '2026-08-10', NULL, 0.00, 136.67, 'Pendiente'),
(43, 6, '2026-09-10', NULL, 0.00, 136.67, 'Pendiente'),

-- Crédito 44 (Factura 60 - Monto: 604.98)
(44, 1, '2026-04-10', NULL, 0.00, 100.83, 'Pendiente'),
(44, 2, '2026-05-10', NULL, 0.00, 100.83, 'Pendiente'),
(44, 3, '2026-06-10', NULL, 0.00, 100.83, 'Pendiente'),
(44, 4, '2026-07-10', NULL, 0.00, 100.83, 'Pendiente'),
(44, 5, '2026-08-10', NULL, 0.00, 100.83, 'Pendiente'),
(44, 6, '2026-09-10', NULL, 0.00, 100.83, 'Pendiente'),

-- Crédito 45 (Factura 61 - Monto: 1424.99)
(45, 1, '2026-04-11', NULL, 0.00, 237.49, 'Pendiente'),
(45, 2, '2026-05-11', NULL, 0.00, 237.49, 'Pendiente'),
(45, 3, '2026-06-11', NULL, 0.00, 237.49, 'Pendiente'),
(45, 4, '2026-07-11', NULL, 0.00, 237.50, 'Pendiente'),
(45, 5, '2026-08-11', NULL, 0.00, 237.50, 'Pendiente'),
(45, 6, '2026-09-11', NULL, 0.00, 237.52, 'Pendiente'),

-- Crédito 46 (Factura 62 - Monto: 582.50)
(46, 1, '2026-04-11', NULL, 0.00, 97.08, 'Pendiente'),
(46, 2, '2026-05-11', NULL, 0.00, 97.08, 'Pendiente'),
(46, 3, '2026-06-11', NULL, 0.00, 97.08, 'Pendiente'),
(46, 4, '2026-07-11', NULL, 0.00, 97.08, 'Pendiente'),
(46, 5, '2026-08-11', NULL, 0.00, 97.09, 'Pendiente'),
(46, 6, '2026-09-11', NULL, 0.00, 97.09, 'Pendiente'),

-- Crédito 47 (Factura 63 - Monto: 1219.99)
(47, 1, '2026-04-11', NULL, 0.00, 203.33, 'Pendiente'),
(47, 2, '2026-05-11', NULL, 0.00, 203.33, 'Pendiente'),
(47, 3, '2026-06-11', NULL, 0.00, 203.33, 'Pendiente'),
(47, 4, '2026-07-11', NULL, 0.00, 203.33, 'Pendiente'),
(47, 5, '2026-08-11', NULL, 0.00, 203.33, 'Pendiente'),
(47, 6, '2026-09-11', NULL, 0.00, 203.34, 'Pendiente'),

-- Crédito 48 (Factura 64 - Monto: 794.99)
(48, 1, '2026-04-11', NULL, 0.00, 132.49, 'Pendiente'),
(48, 2, '2026-05-11', NULL, 0.00, 132.49, 'Pendiente'),
(48, 3, '2026-06-11', NULL, 0.00, 132.49, 'Pendiente'),
(48, 4, '2026-07-11', NULL, 0.00, 132.50, 'Pendiente'),
(48, 5, '2026-08-11', NULL, 0.00, 132.50, 'Pendiente'),
(48, 6, '2026-09-11', NULL, 0.00, 132.52, 'Pendiente'),

-- Crédito 49 (Factura 65 - Monto: 257.50)
(49, 1, '2026-04-11', NULL, 0.00, 42.91, 'Pendiente'),
(49, 2, '2026-05-11', NULL, 0.00, 42.91, 'Pendiente'),
(49, 3, '2026-06-11', NULL, 0.00, 42.91, 'Pendiente'),
(49, 4, '2026-07-11', NULL, 0.00, 42.91, 'Pendiente'),
(49, 5, '2026-08-11', NULL, 0.00, 42.93, 'Pendiente'),
(49, 6, '2026-09-11', NULL, 0.00, 42.93, 'Pendiente'),

-- Crédito 50 (Factura 66 - Monto: 522.49)
(50, 1, '2026-04-12', NULL, 0.00, 87.08, 'Pendiente'),
(50, 2, '2026-05-12', NULL, 0.00, 87.08, 'Pendiente'),
(50, 3, '2026-06-12', NULL, 0.00, 87.08, 'Pendiente'),
(50, 4, '2026-07-12', NULL, 0.00, 87.08, 'Pendiente'),
(50, 5, '2026-08-12', NULL, 0.00, 87.08, 'Pendiente'),
(50, 6, '2026-09-12', NULL, 0.00, 87.09, 'Pendiente'),

-- Crédito 51 (Factura 67 - Monto: 1295.00)
(51, 1, '2026-04-12', NULL, 0.00, 215.83, 'Pendiente'),
(51, 2, '2026-05-12', NULL, 0.00, 215.83, 'Pendiente'),
(51, 3, '2026-06-12', NULL, 0.00, 215.83, 'Pendiente'),
(51, 4, '2026-07-12', NULL, 0.00, 215.83, 'Pendiente'),
(51, 5, '2026-08-12', NULL, 0.00, 215.84, 'Pendiente'),
(51, 6, '2026-09-12', NULL, 0.00, 215.84, 'Pendiente'),

-- Crédito 52 (Factura 68 - Monto: 782.50)
(52, 1, '2026-04-12', NULL, 0.00, 130.41, 'Pendiente'),
(52, 2, '2026-05-12', NULL, 0.00, 130.41, 'Pendiente'),
(52, 3, '2026-06-12', NULL, 0.00, 130.41, 'Pendiente'),
(52, 4, '2026-07-12', NULL, 0.00, 130.41, 'Pendiente'),
(52, 5, '2026-08-12', NULL, 0.00, 130.43, 'Pendiente'),
(52, 6, '2026-09-12', NULL, 0.00, 130.43, 'Pendiente'),

-- Crédito 53 (Factura 69 - Monto: 1049.98)
(53, 1, '2026-04-12', NULL, 0.00, 174.99, 'Pendiente'),
(53, 2, '2026-05-12', NULL, 0.00, 174.99, 'Pendiente'),
(53, 3, '2026-06-12', NULL, 0.00, 174.99, 'Pendiente'),
(53, 4, '2026-07-12', NULL, 0.00, 174.99, 'Pendiente'),
(53, 5, '2026-08-12', NULL, 0.00, 175.00, 'Pendiente'),
(53, 6, '2026-09-12', NULL, 0.00, 175.02, 'Pendiente'),

-- Crédito 54 (Factura 71 - Monto: 874.99)
(54, 1, '2026-04-12', NULL, 0.00, 145.83, 'Pendiente'),
(54, 2, '2026-05-12', NULL, 0.00, 145.83, 'Pendiente'),
(54, 3, '2026-06-12', NULL, 0.00, 145.83, 'Pendiente'),
(54, 4, '2026-07-12', NULL, 0.00, 145.83, 'Pendiente'),
(54, 5, '2026-08-12', NULL, 0.00, 145.83, 'Pendiente'),
(54, 6, '2026-09-12', NULL, 0.00, 145.84, 'Pendiente'),

-- Crédito 55 (Factura 72 - Monto: 592.50)
(55, 1, '2026-04-13', NULL, 0.00, 98.75, 'Pendiente'),
(55, 2, '2026-05-13', NULL, 0.00, 98.75, 'Pendiente'),
(55, 3, '2026-06-13', NULL, 0.00, 98.75, 'Pendiente'),
(55, 4, '2026-07-13', NULL, 0.00, 98.75, 'Pendiente'),
(55, 5, '2026-08-13', NULL, 0.00, 98.75, 'Pendiente'),
(55, 6, '2026-09-13', NULL, 0.00, 98.75, 'Pendiente'),

-- Crédito 56 (Factura 73 - Monto: 925.00)
(56, 1, '2026-04-13', NULL, 0.00, 154.16, 'Pendiente'),
(56, 2, '2026-05-13', NULL, 0.00, 154.16, 'Pendiente'),
(56, 3, '2026-06-13', NULL, 0.00, 154.16, 'Pendiente'),
(56, 4, '2026-07-13', NULL, 0.00, 154.16, 'Pendiente'),
(56, 5, '2026-08-13', NULL, 0.00, 154.18, 'Pendiente'),
(56, 6, '2026-09-13', NULL, 0.00, 154.18, 'Pendiente'),

-- Crédito 57 (Factura 75 - Monto: 692.50)
(57, 1, '2026-04-13', NULL, 0.00, 115.41, 'Pendiente'),
(57, 2, '2026-05-13', NULL, 0.00, 115.41, 'Pendiente'),
(57, 3, '2026-06-13', NULL, 0.00, 115.41, 'Pendiente'),
(57, 4, '2026-07-13', NULL, 0.00, 115.41, 'Pendiente'),
(57, 5, '2026-08-13', NULL, 0.00, 115.43, 'Pendiente'),
(57, 6, '2026-09-13', NULL, 0.00, 115.43, 'Pendiente'),

-- Crédito 58 (Factura 76 - Monto: 712.50)
(58, 1, '2026-04-13', NULL, 0.00, 118.75, 'Pendiente'),
(58, 2, '2026-05-13', NULL, 0.00, 118.75, 'Pendiente'),
(58, 3, '2026-06-13', NULL, 0.00, 118.75, 'Pendiente'),
(58, 4, '2026-07-13', NULL, 0.00, 118.75, 'Pendiente'),
(58, 5, '2026-08-13', NULL, 0.00, 118.75, 'Pendiente'),
(58, 6, '2026-09-13', NULL, 0.00, 118.75, 'Pendiente'),

-- Crédito 59 (Factura 77 - Monto: 1229.98)
(59, 1, '2026-04-14', NULL, 0.00, 204.99, 'Pendiente'),
(59, 2, '2026-05-14', NULL, 0.00, 204.99, 'Pendiente'),
(59, 3, '2026-06-14', NULL, 0.00, 204.99, 'Pendiente'),
(59, 4, '2026-07-14', NULL, 0.00, 204.99, 'Pendiente'),
(59, 5, '2026-08-14', NULL, 0.00, 205.00, 'Pendiente'),
(59, 6, '2026-09-14', NULL, 0.00, 205.02, 'Pendiente'),

-- Crédito 60 (Factura 79 - Monto: 744.99)
(60, 1, '2026-04-14', NULL, 0.00, 124.16, 'Pendiente'),
(60, 2, '2026-05-14', NULL, 0.00, 124.16, 'Pendiente'),
(60, 3, '2026-06-14', NULL, 0.00, 124.16, 'Pendiente'),
(60, 4, '2026-07-14', NULL, 0.00, 124.16, 'Pendiente'),
(60, 5, '2026-08-14', NULL, 0.00, 124.17, 'Pendiente'),
(60, 6, '2026-09-14', NULL, 0.00, 124.18, 'Pendiente'),

-- Crédito 61 (Factura 80 - Monto: 482.50)
(61, 1, '2026-04-14', NULL, 0.00, 80.41, 'Pendiente'),
(61, 2, '2026-05-14', NULL, 0.00, 80.41, 'Pendiente'),
(61, 3, '2026-06-14', NULL, 0.00, 80.41, 'Pendiente'),
(61, 4, '2026-07-14', NULL, 0.00, 80.41, 'Pendiente'),
(61, 5, '2026-08-14', NULL, 0.00, 80.43, 'Pendiente'),
(61, 6, '2026-09-14', NULL, 0.00, 80.43, 'Pendiente'),

-- Crédito 62 (Factura 81 - Monto: 312.50)
(62, 1, '2026-04-15', NULL, 0.00, 52.08, 'Pendiente'),
(62, 2, '2026-05-15', NULL, 0.00, 52.08, 'Pendiente'),
(62, 3, '2026-06-15', NULL, 0.00, 52.08, 'Pendiente'),
(62, 4, '2026-07-15', NULL, 0.00, 52.08, 'Pendiente'),
(62, 5, '2026-08-15', NULL, 0.00, 52.09, 'Pendiente'),
(62, 6, '2026-09-15', NULL, 0.00, 52.09, 'Pendiente'),

-- Crédito 63 (Factura 82 - Monto: 394.99)
(63, 1, '2026-04-15', NULL, 0.00, 65.83, 'Pendiente'),
(63, 2, '2026-05-15', NULL, 0.00, 65.83, 'Pendiente'),
(63, 3, '2026-06-15', NULL, 0.00, 65.83, 'Pendiente'),
(63, 4, '2026-07-15', NULL, 0.00, 65.83, 'Pendiente'),
(63, 5, '2026-08-15', NULL, 0.00, 65.83, 'Pendiente'),
(63, 6, '2026-09-15', NULL, 0.00, 65.84, 'Pendiente'),

-- Crédito 64 (Factura 83 - Monto: 534.99)
(64, 1, '2026-04-15', NULL, 0.00, 89.16, 'Pendiente'),
(64, 2, '2026-05-15', NULL, 0.00, 89.16, 'Pendiente'),
(64, 3, '2026-06-15', NULL, 0.00, 89.16, 'Pendiente'),
(64, 4, '2026-07-15', NULL, 0.00, 89.16, 'Pendiente'),
(64, 5, '2026-08-15', NULL, 0.00, 89.17, 'Pendiente'),
(64, 6, '2026-09-15', NULL, 0.00, 89.18, 'Pendiente'),

-- Crédito 65 (Factura 85 - Monto: 1224.98)
(65, 1, '2026-04-15', NULL, 0.00, 204.16, 'Pendiente'),
(65, 2, '2026-05-15', NULL, 0.00, 204.16, 'Pendiente'),
(65, 3, '2026-06-15', NULL, 0.00, 204.16, 'Pendiente'),
(65, 4, '2026-07-15', NULL, 0.00, 204.16, 'Pendiente'),
(65, 5, '2026-08-15', NULL, 0.00, 204.17, 'Pendiente'),
(65, 6, '2026-09-15', NULL, 0.00, 204.17, 'Pendiente'),

-- Crédito 66 (Factura 86 - Monto: 257.50)
(66, 1, '2026-04-16', NULL, 0.00, 42.91, 'Pendiente'),
(66, 2, '2026-05-16', NULL, 0.00, 42.91, 'Pendiente'),
(66, 3, '2026-06-16', NULL, 0.00, 42.91, 'Pendiente'),
(66, 4, '2026-07-16', NULL, 0.00, 42.91, 'Pendiente'),
(66, 5, '2026-08-16', NULL, 0.00, 42.93, 'Pendiente'),
(66, 6, '2026-09-16', NULL, 0.00, 42.93, 'Pendiente'),

-- Crédito 67 (Factura 87 - Monto: 325.00)
(67, 1, '2026-04-16', NULL, 0.00, 54.16, 'Pendiente'),
(67, 2, '2026-05-16', NULL, 0.00, 54.16, 'Pendiente'),
(67, 3, '2026-06-16', NULL, 0.00, 54.16, 'Pendiente'),
(67, 4, '2026-07-16', NULL, 0.00, 54.16, 'Pendiente'),
(67, 5, '2026-08-16', NULL, 0.00, 54.18, 'Pendiente'),
(67, 6, '2026-09-16', NULL, 0.00, 54.18, 'Pendiente'),

-- Crédito 68 (Factura 89 - Monto: 234.99)
(68, 1, '2026-04-16', NULL, 0.00, 39.16, 'Pendiente'),
(68, 2, '2026-05-16', NULL, 0.00, 39.16, 'Pendiente'),
(68, 3, '2026-06-16', NULL, 0.00, 39.16, 'Pendiente'),
(68, 4, '2026-07-16', NULL, 0.00, 39.16, 'Pendiente'),
(68, 5, '2026-08-16', NULL, 0.00, 39.17, 'Pendiente'),
(68, 6, '2026-09-16', NULL, 0.00, 39.18, 'Pendiente'),

-- Crédito 69 (Factura 90 - Monto: 537.49)
(69, 1, '2026-04-16', NULL, 0.00, 89.58, 'Pendiente'),
(69, 2, '2026-05-16', NULL, 0.00, 89.58, 'Pendiente'),
(69, 3, '2026-06-16', NULL, 0.00, 89.58, 'Pendiente'),
(69, 4, '2026-07-16', NULL, 0.00, 89.58, 'Pendiente'),
(69, 5, '2026-08-16', NULL, 0.00, 89.58, 'Pendiente'),
(69, 6, '2026-09-16', NULL, 0.00, 89.59, 'Pendiente'),

-- Crédito 70 (Factura 91 - Monto: 604.98)
(70, 1, '2026-04-17', NULL, 0.00, 100.83, 'Pendiente'),
(70, 2, '2026-05-17', NULL, 0.00, 100.83, 'Pendiente'),
(70, 3, '2026-06-17', NULL, 0.00, 100.83, 'Pendiente'),
(70, 4, '2026-07-17', NULL, 0.00, 100.83, 'Pendiente'),
(70, 5, '2026-08-17', NULL, 0.00, 100.83, 'Pendiente'),
(70, 6, '2026-09-17', NULL, 0.00, 100.83, 'Pendiente'),

-- Crédito 71 (Factura 93 - Monto: 945.00)
(71, 1, '2026-04-17', NULL, 0.00, 157.50, 'Pendiente'),
(71, 2, '2026-05-17', NULL, 0.00, 157.50, 'Pendiente'),
(71, 3, '2026-06-17', NULL, 0.00, 157.50, 'Pendiente'),
(71, 4, '2026-07-17', NULL, 0.00, 157.50, 'Pendiente'),
(71, 5, '2026-08-17', NULL, 0.00, 157.50, 'Pendiente'),
(71, 6, '2026-09-17', NULL, 0.00, 157.50, 'Pendiente'),

-- Crédito 72 (Factura 94 - Monto: 364.99)
(72, 1, '2026-04-17', NULL, 0.00, 60.83, 'Pendiente'),
(72, 2, '2026-05-17', NULL, 0.00, 60.83, 'Pendiente'),
(72, 3, '2026-06-17', NULL, 0.00, 60.83, 'Pendiente'),
(72, 4, '2026-07-17', NULL, 0.00, 60.83, 'Pendiente'),
(72, 5, '2026-08-17', NULL, 0.00, 60.83, 'Pendiente'),
(72, 6, '2026-09-17', NULL, 0.00, 60.84, 'Pendiente'),

-- Crédito 73 (Factura 95 - Monto: 804.99)
(73, 1, '2026-04-17', NULL, 0.00, 134.16, 'Pendiente'),
(73, 2, '2026-05-17', NULL, 0.00, 134.16, 'Pendiente'),
(73, 3, '2026-06-17', NULL, 0.00, 134.16, 'Pendiente'),
(73, 4, '2026-07-17', NULL, 0.00, 134.16, 'Pendiente'),
(73, 5, '2026-08-17', NULL, 0.00, 134.17, 'Pendiente'),
(73, 6, '2026-09-17', NULL, 0.00, 134.18, 'Pendiente'),

-- Crédito 74 (Factura 97 - Monto: 104.99)
(74, 1, '2026-04-18', NULL, 0.00, 17.49, 'Pendiente'),
(74, 2, '2026-05-18', NULL, 0.00, 17.49, 'Pendiente'),
(74, 3, '2026-06-18', NULL, 0.00, 17.49, 'Pendiente'),
(74, 4, '2026-07-18', NULL, 0.00, 17.49, 'Pendiente'),
(74, 5, '2026-08-18', NULL, 0.00, 17.49, 'Pendiente'),
(74, 6, '2026-09-18', NULL, 0.00, 17.54, 'Pendiente'),

-- Crédito 75 (Factura 98 - Monto: 247.50)
(75, 1, '2026-04-18', NULL, 0.00, 41.25, 'Pendiente'),
(75, 2, '2026-05-18', NULL, 0.00, 41.25, 'Pendiente'),
(75, 3, '2026-06-18', NULL, 0.00, 41.25, 'Pendiente'),
(75, 4, '2026-07-18', NULL, 0.00, 41.25, 'Pendiente'),
(75, 5, '2026-08-18', NULL, 0.00, 41.25, 'Pendiente'),
(75, 6, '2026-09-18', NULL, 0.00, 41.25, 'Pendiente'),

-- Crédito 76 (Factura 99 - Monto: 215.00)
(76, 1, '2026-04-18', NULL, 0.00, 35.83, 'Pendiente'),
(76, 2, '2026-05-18', NULL, 0.00, 35.83, 'Pendiente'),
(76, 3, '2026-06-18', NULL, 0.00, 35.83, 'Pendiente'),
(76, 4, '2026-07-18', NULL, 0.00, 35.83, 'Pendiente'),
(76, 5, '2026-08-18', NULL, 0.00, 35.83, 'Pendiente'),
(76, 6, '2026-09-18', NULL, 0.00, 35.85, 'Pendiente');

INSERT INTO CREDITO (ID_CREDITO, ID_FACTURA, ESTADO_CREDITO, FECHA_OTORGACION, MONTO_FINANCIADO, SALDO_PENDIENTE, TASA_INTERES, NUMERO_CUOTAS) VALUES
(77, 101, 'Pendiente', '2026-03-19', 522.49, 522.49, 15.00, 6),
(78, 102, 'Pendiente', '2026-03-19', 1239.98, 1239.98, 15.00, 12),
(79, 104, 'Pendiente', '2026-03-19', 745.00, 745.00, 15.00, 6),
(80, 105, 'Pendiente', '2026-03-20', 587.50, 587.50, 15.00, 6),
(81, 106, 'Pendiente', '2026-03-20', 915.00, 915.00, 15.00, 6),
(82, 108, 'Pendiente', '2026-03-20', 819.98, 819.98, 15.00, 6),
(83, 110, 'Pendiente', '2026-03-21', 604.98, 604.98, 15.00, 6),
(84, 112, 'Pendiente', '2026-03-21', 582.50, 582.50, 15.00, 6),
(85, 113, 'Pendiente', '2026-03-21', 1219.99, 1219.99, 15.00, 12),
(86, 115, 'Pendiente', '2026-03-22', 257.50, 257.50, 15.00, 3),
(87, 117, 'Pendiente', '2026-03-22', 1295.00, 1295.00, 15.00, 12),
(88, 119, 'Pendiente', '2026-03-22', 1049.98, 1049.98, 15.00, 6),
(89, 120, 'Pendiente', '2026-03-23', 372.50, 372.50, 15.00, 3),
(90, 121, 'Pendiente', '2026-03-23', 874.99, 874.99, 15.00, 6),
(91, 122, 'Pendiente', '2026-03-23', 592.50, 592.50, 15.00, 6),
(92, 123, 'Pendiente', '2026-03-23', 925.00, 925.00, 15.00, 6),
(93, 124, 'Pendiente', '2026-03-23', 394.99, 394.99, 15.00, 3),
(94, 125, 'Pendiente', '2026-03-24', 692.50, 692.50, 15.00, 6),
(95, 126, 'Pendiente', '2026-03-24', 712.50, 712.50, 15.00, 6),
(96, 127, 'Pendiente', '2026-03-24', 1229.98, 1229.98, 15.00, 12),
(97, 128, 'Pendiente', '2026-03-24', 327.49, 327.49, 15.00, 3),
(98, 129, 'Pendiente', '2026-03-24', 744.99, 744.99, 15.00, 6),
(99, 130, 'Pendiente', '2026-03-24', 482.50, 482.50, 15.00, 3),
(100, 131, 'Pendiente', '2026-03-25', 312.50, 312.50, 15.00, 3),
(101, 132, 'Pendiente', '2026-03-25', 394.99, 394.99, 15.00, 3),
(102, 133, 'Pendiente', '2026-03-25', 534.99, 534.99, 15.00, 6),
(103, 134, 'Pendiente', '2026-03-25', 465.00, 465.00, 15.00, 3),
(104, 135, 'Pendiente', '2026-03-25', 1224.98, 1224.98, 15.00, 12),
(105, 136, 'Pendiente', '2026-03-26', 257.50, 257.50, 15.00, 3),
(106, 137, 'Pendiente', '2026-03-26', 325.00, 325.00, 15.00, 3),
(107, 138, 'Pendiente', '2026-03-26', 82.49, 82.49, 15.00, 3),
(108, 139, 'Pendiente', '2026-03-26', 234.99, 234.99, 15.00, 3),
(109, 140, 'Pendiente', '2026-03-26', 537.49, 537.49, 15.00, 6),
(110, 141, 'Pendiente', '2026-03-27', 604.98, 604.98, 15.00, 6),
(111, 142, 'Pendiente', '2026-03-27', 77.49, 77.49, 15.00, 3),
(112, 143, 'Pendiente', '2026-03-27', 945.00, 945.00, 15.00, 6),
(113, 144, 'Pendiente', '2026-03-27', 364.99, 364.99, 15.00, 3),
(114, 145, 'Pendiente', '2026-03-27', 804.99, 804.99, 15.00, 6),
(115, 146, 'Pendiente', '2026-03-28', 60.50, 60.50, 15.00, 3),
(116, 147, 'Pendiente', '2026-03-28', 104.99, 104.99, 15.00, 3),
(117, 148, 'Pendiente', '2026-03-28', 247.50, 247.50, 15.00, 3),
(118, 149, 'Pendiente', '2026-03-28', 215.00, 215.00, 15.00, 3),
(119, 150, 'Pendiente', '2026-03-28', 665.00, 665.00, 15.00, 6);

INSERT INTO CUOTA (ID_CREDITO, NUMERO_CUOTA, FECHA_VENCIMIENTO, FECHA_PAGO, MONTO_ABONADO, MONTO_ESPERADO, ESTADO_CUOTA) VALUES
-- Crédito 77 (Factura 101 | 522.49 / 6 cuotas)
(77, 1, '2026-04-19', NULL, 0.00, 87.08, 'Pendiente'),
(77, 2, '2026-05-19', NULL, 0.00, 87.08, 'Pendiente'),
(77, 3, '2026-06-19', NULL, 0.00, 87.08, 'Pendiente'),
(77, 4, '2026-07-19', NULL, 0.00, 87.08, 'Pendiente'),
(77, 5, '2026-08-19', NULL, 0.00, 87.08, 'Pendiente'),
(77, 6, '2026-09-19', NULL, 0.00, 87.09, 'Pendiente'),

-- Crédito 78 (Factura 102 | 1239.98 / 12 cuotas)
(78, 1, '2026-04-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 2, '2026-05-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 3, '2026-06-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 4, '2026-07-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 5, '2026-08-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 6, '2026-09-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 7, '2026-10-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 8, '2026-11-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 9, '2026-12-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 10, '2027-01-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 11, '2027-02-19', NULL, 0.00, 103.33, 'Pendiente'),
(78, 12, '2027-03-19', NULL, 0.00, 103.35, 'Pendiente'),

-- Crédito 79 (Factura 104 | 745.00 / 6 cuotas)
(79, 1, '2026-04-19', NULL, 0.00, 124.16, 'Pendiente'),
(79, 2, '2026-05-19', NULL, 0.00, 124.16, 'Pendiente'),
(79, 3, '2026-06-19', NULL, 0.00, 124.16, 'Pendiente'),
(79, 4, '2026-07-19', NULL, 0.00, 124.16, 'Pendiente'),
(79, 5, '2026-08-19', NULL, 0.00, 124.16, 'Pendiente'),
(79, 6, '2026-09-19', NULL, 0.00, 124.20, 'Pendiente'),

-- Crédito 80 (Factura 105 | 587.50 / 6 cuotas)
(80, 1, '2026-04-20', NULL, 0.00, 97.91, 'Pendiente'),
(80, 2, '2026-05-20', NULL, 0.00, 97.91, 'Pendiente'),
(80, 3, '2026-06-20', NULL, 0.00, 97.91, 'Pendiente'),
(80, 4, '2026-07-20', NULL, 0.00, 97.91, 'Pendiente'),
(80, 5, '2026-08-20', NULL, 0.00, 97.91, 'Pendiente'),
(80, 6, '2026-09-20', NULL, 0.00, 97.95, 'Pendiente'),

-- Crédito 81 (Factura 106 | 915.00 / 6 cuotas)
(81, 1, '2026-04-20', NULL, 0.00, 152.50, 'Pendiente'),
(81, 2, '2026-05-20', NULL, 0.00, 152.50, 'Pendiente'),
(81, 3, '2026-06-20', NULL, 0.00, 152.50, 'Pendiente'),
(81, 4, '2026-07-20', NULL, 0.00, 152.50, 'Pendiente'),
(81, 5, '2026-08-20', NULL, 0.00, 152.50, 'Pendiente'),
(81, 6, '2026-09-20', NULL, 0.00, 152.50, 'Pendiente'),

-- Crédito 82 (Factura 108 | 819.98 / 6 cuotas)
(82, 1, '2026-04-20', NULL, 0.00, 136.66, 'Pendiente'),
(82, 2, '2026-05-20', NULL, 0.00, 136.66, 'Pendiente'),
(82, 3, '2026-06-20', NULL, 0.00, 136.66, 'Pendiente'),
(82, 4, '2026-07-20', NULL, 0.00, 136.66, 'Pendiente'),
(82, 5, '2026-08-20', NULL, 0.00, 136.66, 'Pendiente'),
(82, 6, '2026-09-20', NULL, 0.00, 136.68, 'Pendiente'),

-- Crédito 83 (Factura 110 | 604.98 / 6 cuotas)
(83, 1, '2026-04-21', NULL, 0.00, 100.83, 'Pendiente'),
(83, 2, '2026-05-21', NULL, 0.00, 100.83, 'Pendiente'),
(83, 3, '2026-06-21', NULL, 0.00, 100.83, 'Pendiente'),
(83, 4, '2026-07-21', NULL, 0.00, 100.83, 'Pendiente'),
(83, 5, '2026-08-21', NULL, 0.00, 100.83, 'Pendiente'),
(83, 6, '2026-09-21', NULL, 0.00, 100.83, 'Pendiente'),

-- Crédito 84 (Factura 112 | 582.50 / 6 cuotas)
(84, 1, '2026-04-21', NULL, 0.00, 97.08, 'Pendiente'),
(84, 2, '2026-05-21', NULL, 0.00, 97.08, 'Pendiente'),
(84, 3, '2026-06-21', NULL, 0.00, 97.08, 'Pendiente'),
(84, 4, '2026-07-21', NULL, 0.00, 97.08, 'Pendiente'),
(84, 5, '2026-08-21', NULL, 0.00, 97.08, 'Pendiente'),
(84, 6, '2026-09-21', NULL, 0.00, 97.10, 'Pendiente'),

-- Crédito 85 (Factura 113 | 1219.99 / 12 cuotas)
(85, 1, '2026-04-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 2, '2026-05-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 3, '2026-06-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 4, '2026-07-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 5, '2026-08-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 6, '2026-09-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 7, '2026-10-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 8, '2026-11-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 9, '2026-12-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 10, '2027-01-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 11, '2027-02-21', NULL, 0.00, 101.66, 'Pendiente'),
(85, 12, '2027-03-21', NULL, 0.00, 101.73, 'Pendiente'),

-- Crédito 86 (Factura 115 | 257.50 / 3 cuotas)
(86, 1, '2026-04-22', NULL, 0.00, 85.83, 'Pendiente'),
(86, 2, '2026-05-22', NULL, 0.00, 85.83, 'Pendiente'),
(86, 3, '2026-06-22', NULL, 0.00, 85.84, 'Pendiente'),

-- Crédito 87 (Factura 117 | 1295.00 / 12 cuotas)
(87, 1, '2026-04-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 2, '2026-05-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 3, '2026-06-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 4, '2026-07-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 5, '2026-08-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 6, '2026-09-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 7, '2026-10-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 8, '2026-11-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 9, '2026-12-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 10, '2027-01-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 11, '2027-02-22', NULL, 0.00, 107.91, 'Pendiente'),
(87, 12, '2027-03-22', NULL, 0.00, 107.99, 'Pendiente'),

-- Crédito 88 (Factura 119 | 1049.98 / 6 cuotas)
(88, 1, '2026-04-22', NULL, 0.00, 174.99, 'Pendiente'),
(88, 2, '2026-05-22', NULL, 0.00, 174.99, 'Pendiente'),
(88, 3, '2026-06-22', NULL, 0.00, 174.99, 'Pendiente'),
(88, 4, '2026-07-22', NULL, 0.00, 174.99, 'Pendiente'),
(88, 5, '2026-08-22', NULL, 0.00, 174.99, 'Pendiente'),
(88, 6, '2026-09-22', NULL, 0.00, 175.03, 'Pendiente'),

-- Crédito 89 (Factura 120 | 372.50 / 3 cuotas)
(89, 1, '2026-04-23', NULL, 0.00, 124.16, 'Pendiente'),
(89, 2, '2026-05-23', NULL, 0.00, 124.16, 'Pendiente'),
(89, 3, '2026-06-23', NULL, 0.00, 124.18, 'Pendiente'),

-- Crédito 90 (Factura 121 | 874.99 / 6 cuotas)
(90, 1, '2026-04-23', NULL, 0.00, 145.83, 'Pendiente'),
(90, 2, '2026-05-23', NULL, 0.00, 145.83, 'Pendiente'),
(90, 3, '2026-06-23', NULL, 0.00, 145.83, 'Pendiente'),
(90, 4, '2026-07-23', NULL, 0.00, 145.83, 'Pendiente'),
(90, 5, '2026-08-23', NULL, 0.00, 145.83, 'Pendiente'),
(90, 6, '2026-09-23', NULL, 0.00, 145.84, 'Pendiente'),

-- Crédito 91 (Factura 122 | 592.50 / 6 cuotas)
(91, 1, '2026-04-23', NULL, 0.00, 98.75, 'Pendiente'),
(91, 2, '2026-05-23', NULL, 0.00, 98.75, 'Pendiente'),
(91, 3, '2026-06-23', NULL, 0.00, 98.75, 'Pendiente'),
(91, 4, '2026-07-23', NULL, 0.00, 98.75, 'Pendiente'),
(91, 5, '2026-08-23', NULL, 0.00, 98.75, 'Pendiente'),
(91, 6, '2026-09-23', NULL, 0.00, 98.75, 'Pendiente'),

-- Crédito 92 (Factura 123 | 925.00 / 6 cuotas)
(92, 1, '2026-04-23', NULL, 0.00, 154.16, 'Pendiente'),
(92, 2, '2026-05-23', NULL, 0.00, 154.16, 'Pendiente'),
(92, 3, '2026-06-23', NULL, 0.00, 154.16, 'Pendiente'),
(92, 4, '2026-07-23', NULL, 0.00, 154.16, 'Pendiente'),
(92, 5, '2026-08-23', NULL, 0.00, 154.16, 'Pendiente'),
(92, 6, '2026-09-23', NULL, 0.00, 154.20, 'Pendiente'),

-- Crédito 93 (Factura 124 | 394.99 / 3 cuotas)
(93, 1, '2026-04-23', NULL, 0.00, 131.66, 'Pendiente'),
(93, 2, '2026-05-23', NULL, 0.00, 131.66, 'Pendiente'),
(93, 3, '2026-06-23', NULL, 0.00, 131.67, 'Pendiente'),

-- Crédito 94 (Factura 125 | 692.50 / 6 cuotas)
(94, 1, '2026-04-24', NULL, 0.00, 115.41, 'Pendiente'),
(94, 2, '2026-05-24', NULL, 0.00, 115.41, 'Pendiente'),
(94, 3, '2026-06-24', NULL, 0.00, 115.41, 'Pendiente'),
(94, 4, '2026-07-24', NULL, 0.00, 115.41, 'Pendiente'),
(94, 5, '2026-08-24', NULL, 0.00, 115.41, 'Pendiente'),
(94, 6, '2026-09-24', NULL, 0.00, 115.45, 'Pendiente'),

-- Crédito 95 (Factura 126 | 712.50 / 6 cuotas)
(95, 1, '2026-04-24', NULL, 0.00, 118.75, 'Pendiente'),
(95, 2, '2026-05-24', NULL, 0.00, 118.75, 'Pendiente'),
(95, 3, '2026-06-24', NULL, 0.00, 118.75, 'Pendiente'),
(95, 4, '2026-07-24', NULL, 0.00, 118.75, 'Pendiente'),
(95, 5, '2026-08-24', NULL, 0.00, 118.75, 'Pendiente'),
(95, 6, '2026-09-24', NULL, 0.00, 118.75, 'Pendiente'),

-- Crédito 96 (Factura 127 | 1229.98 / 12 cuotas)
(96, 1, '2026-04-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 2, '2026-05-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 3, '2026-06-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 4, '2026-07-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 5, '2026-08-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 6, '2026-09-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 7, '2026-10-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 8, '2026-11-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 9, '2026-12-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 10, '2027-01-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 11, '2027-02-24', NULL, 0.00, 102.49, 'Pendiente'),
(96, 12, '2027-03-24', NULL, 0.00, 102.59, 'Pendiente'),

-- Crédito 97 (Factura 128 | 327.49 / 3 cuotas)
(97, 1, '2026-04-24', NULL, 0.00, 109.16, 'Pendiente'),
(97, 2, '2026-05-24', NULL, 0.00, 109.16, 'Pendiente'),
(97, 3, '2026-06-24', NULL, 0.00, 109.17, 'Pendiente'),

-- Crédito 98 (Factura 129 | 744.99 / 6 cuotas)
(98, 1, '2026-04-24', NULL, 0.00, 124.16, 'Pendiente'),
(98, 2, '2026-05-24', NULL, 0.00, 124.16, 'Pendiente'),
(98, 3, '2026-06-24', NULL, 0.00, 124.16, 'Pendiente'),
(98, 4, '2026-07-24', NULL, 0.00, 124.16, 'Pendiente'),
(98, 5, '2026-08-24', NULL, 0.00, 124.16, 'Pendiente'),
(98, 6, '2026-09-24', NULL, 0.00, 124.19, 'Pendiente'),

-- Crédito 99 (Factura 130 | 482.50 / 3 cuotas)
(99, 1, '2026-04-24', NULL, 0.00, 160.83, 'Pendiente'),
(99, 2, '2026-05-24', NULL, 0.00, 160.83, 'Pendiente'),
(99, 3, '2026-06-24', NULL, 0.00, 160.84, 'Pendiente'),

-- Crédito 100 (Factura 131 | 312.50 / 3 cuotas)
(100, 1, '2026-04-25', NULL, 0.00, 104.16, 'Pendiente'),
(100, 2, '2026-05-25', NULL, 0.00, 104.16, 'Pendiente'),
(100, 3, '2026-06-25', NULL, 0.00, 104.18, 'Pendiente'),

-- Crédito 101 (Factura 132 | 394.99 / 3 cuotas)
(101, 1, '2026-04-25', NULL, 0.00, 131.66, 'Pendiente'),
(101, 2, '2026-05-25', NULL, 0.00, 131.66, 'Pendiente'),
(101, 3, '2026-06-25', NULL, 0.00, 131.67, 'Pendiente'),

-- Crédito 102 (Factura 133 | 534.99 / 6 cuotas)
(102, 1, '2026-04-25', NULL, 0.00, 89.16, 'Pendiente'),
(102, 2, '2026-05-25', NULL, 0.00, 89.16, 'Pendiente'),
(102, 3, '2026-06-25', NULL, 0.00, 89.16, 'Pendiente'),
(102, 4, '2026-07-25', NULL, 0.00, 89.16, 'Pendiente'),
(102, 5, '2026-08-25', NULL, 0.00, 89.16, 'Pendiente'),
(102, 6, '2026-09-25', NULL, 0.00, 89.19, 'Pendiente'),

-- Crédito 103 (Factura 134 | 465.00 / 3 cuotas)
(103, 1, '2026-04-25', NULL, 0.00, 155.00, 'Pendiente'),
(103, 2, '2026-05-25', NULL, 0.00, 155.00, 'Pendiente'),
(103, 3, '2026-06-25', NULL, 0.00, 155.00, 'Pendiente'),

-- Crédito 104 (Factura 135 | 1224.98 / 12 cuotas)
(104, 1, '2026-04-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 2, '2026-05-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 3, '2026-06-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 4, '2026-07-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 5, '2026-08-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 6, '2026-09-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 7, '2026-10-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 8, '2026-11-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 9, '2026-12-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 10, '2027-01-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 11, '2027-02-25', NULL, 0.00, 102.08, 'Pendiente'),
(104, 12, '2027-03-25', NULL, 0.00, 102.10, 'Pendiente'),

-- Crédito 105 (Factura 136 | 257.50 / 3 cuotas)
(105, 1, '2026-04-26', NULL, 0.00, 85.83, 'Pendiente'),
(105, 2, '2026-05-26', NULL, 0.00, 85.83, 'Pendiente'),
(105, 3, '2026-06-26', NULL, 0.00, 85.84, 'Pendiente'),

-- Crédito 106 (Factura 137 | 325.00 / 3 cuotas)
(106, 1, '2026-04-26', NULL, 0.00, 108.33, 'Pendiente'),
(106, 2, '2026-05-26', NULL, 0.00, 108.33, 'Pendiente'),
(106, 3, '2026-06-26', NULL, 0.00, 108.34, 'Pendiente'),

-- Crédito 107 (Factura 138 | 82.49 / 3 cuotas)
(107, 1, '2026-04-26', NULL, 0.00, 27.49, 'Pendiente'),
(107, 2, '2026-05-26', NULL, 0.00, 27.50, 'Pendiente'),
(107, 3, '2026-06-26', NULL, 0.00, 27.50, 'Pendiente'),

-- Crédito 108 (Factura 139 | 234.99 / 3 cuotas)
(108, 1, '2026-04-26', NULL, 0.00, 78.33, 'Pendiente'),
(108, 2, '2026-05-26', NULL, 0.00, 78.33, 'Pendiente'),
(108, 3, '2026-06-26', NULL, 0.00, 78.33, 'Pendiente'),

-- Crédito 109 (Factura 140 | 537.49 / 6 cuotas)
(109, 1, '2026-04-26', NULL, 0.00, 89.58, 'Pendiente'),
(109, 2, '2026-05-26', NULL, 0.00, 89.58, 'Pendiente'),
(109, 3, '2026-06-26', NULL, 0.00, 89.58, 'Pendiente'),
(109, 4, '2026-07-26', NULL, 0.00, 89.58, 'Pendiente'),
(109, 5, '2026-08-26', NULL, 0.00, 89.58, 'Pendiente'),
(109, 6, '2026-09-26', NULL, 0.00, 89.59, 'Pendiente'),

-- Crédito 110 (Factura 141 | 604.98 / 6 cuotas)
(110, 1, '2026-04-27', NULL, 0.00, 100.83, 'Pendiente'),
(110, 2, '2026-05-27', NULL, 0.00, 100.83, 'Pendiente'),
(110, 3, '2026-06-27', NULL, 0.00, 100.83, 'Pendiente'),
(110, 4, '2026-07-27', NULL, 0.00, 100.83, 'Pendiente'),
(110, 5, '2026-08-27', NULL, 0.00, 100.83, 'Pendiente'),
(110, 6, '2026-09-27', NULL, 0.00, 100.83, 'Pendiente'),

-- Crédito 111 (Factura 142 | 77.49 / 3 cuotas)
(111, 1, '2026-04-27', NULL, 0.00, 25.83, 'Pendiente'),
(111, 2, '2026-05-27', NULL, 0.00, 25.83, 'Pendiente'),
(111, 3, '2026-06-27', NULL, 0.00, 25.83, 'Pendiente'),

-- Crédito 112 (Factura 143 | 945.00 / 6 cuotas)
(112, 1, '2026-04-27', NULL, 0.00, 157.50, 'Pendiente'),
(112, 2, '2026-05-27', NULL, 0.00, 157.50, 'Pendiente'),
(112, 3, '2026-06-27', NULL, 0.00, 157.50, 'Pendiente'),
(112, 4, '2026-07-27', NULL, 0.00, 157.50, 'Pendiente'),
(112, 5, '2026-08-27', NULL, 0.00, 157.50, 'Pendiente'),
(112, 6, '2026-09-27', NULL, 0.00, 157.50, 'Pendiente'),

-- Crédito 113 (Factura 144 | 364.99 / 3 cuotas)
(113, 1, '2026-04-27', NULL, 0.00, 121.66, 'Pendiente'),
(113, 2, '2026-05-27', NULL, 0.00, 121.66, 'Pendiente'),
(113, 3, '2026-06-27', NULL, 0.00, 121.67, 'Pendiente'),

-- Crédito 114 (Factura 145 | 804.99 / 6 cuotas)
(114, 1, '2026-04-27', NULL, 0.00, 134.16, 'Pendiente'),
(114, 2, '2026-05-27', NULL, 0.00, 134.16, 'Pendiente'),
(114, 3, '2026-06-27', NULL, 0.00, 134.16, 'Pendiente'),
(114, 4, '2026-07-27', NULL, 0.00, 134.16, 'Pendiente'),
(114, 5, '2026-08-27', NULL, 0.00, 134.16, 'Pendiente'),
(114, 6, '2026-09-27', NULL, 0.00, 134.19, 'Pendiente'),

-- Crédito 115 (Factura 146 | 60.50 / 3 cuotas)
(115, 1, '2026-04-28', NULL, 0.00, 20.16, 'Pendiente'),
(115, 2, '2026-05-28', NULL, 0.00, 20.17, 'Pendiente'),
(115, 3, '2026-06-28', NULL, 0.00, 20.17, 'Pendiente'),

-- Crédito 116 (Factura 147 | 104.99 / 3 cuotas)
(116, 1, '2026-04-28', NULL, 0.00, 34.99, 'Pendiente'),
(116, 2, '2026-05-28', NULL, 0.00, 35.00, 'Pendiente'),
(116, 3, '2026-06-28', NULL, 0.00, 35.00, 'Pendiente'),

-- Crédito 117 (Factura 148 | 247.50 / 3 cuotas)
(117, 1, '2026-04-28', NULL, 0.00, 82.50, 'Pendiente'),
(117, 2, '2026-05-28', NULL, 0.00, 82.50, 'Pendiente'),
(117, 3, '2026-06-28', NULL, 0.00, 82.50, 'Pendiente'),

-- Crédito 118 (Factura 149 | 215.00 / 3 cuotas)
(118, 1, '2026-04-28', NULL, 0.00, 71.66, 'Pendiente'),
(118, 2, '2026-05-28', NULL, 0.00, 71.66, 'Pendiente'),
(118, 3, '2026-06-28', NULL, 0.00, 71.68, 'Pendiente'),

-- Crédito 119 (Factura 150 | 665.00 / 6 cuotas)
(119, 1, '2026-04-28', NULL, 0.00, 110.83, 'Pendiente'),
(119, 2, '2026-05-28', NULL, 0.00, 110.83, 'Pendiente'),
(119, 3, '2026-06-28', NULL, 0.00, 110.83, 'Pendiente'),
(119, 4, '2026-07-28', NULL, 0.00, 110.83, 'Pendiente'),
(119, 5, '2026-08-28', NULL, 0.00, 110.83, 'Pendiente'),
(119, 6, '2026-09-28', NULL, 0.00, 110.85, 'Pendiente');
-- BITACORAPRODUCTO
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (1, 1, 1, 450.00, 489.99, '2026-02-10 08:30:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (2, 3, 1, 1199.99, 1299.99, '2026-02-12 09:15:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (3, 6, 11, 329.99, 349.99, '2026-02-15 10:00:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (4, 9, 1, 399.00, 420.00, '2026-02-18 11:20:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (5, 16, 30, 329.99, 349.99, '2026-02-20 14:10:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (6, 19, 11, 850.00, 899.99, '2026-02-22 15:30:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (7, 23, 30, 390.00, 420.00, '2026-02-25 09:45:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (8, 28, 1, 1050.00, 1100.00, '2026-02-26 16:00:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (9, 37, 11, 45.00, 49.99, '2026-02-27 10:15:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (10, 49, 30, 590.00, 620.00, '2026-02-28 11:30:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (11, 58, 1, 89.99, 99.99, '2026-03-02 13:00:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (12, 65, 11, 550.00, 580.00, '2026-03-05 14:20:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (13, 66, 30, 1100.00, 1150.00, '2026-03-08 09:10:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (14, 69, 1, 750.00, 790.00, '2026-03-10 10:50:00');
INSERT INTO BITACORAPRODUCTO (ID_BITACORA, ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR, PRECIO_ACTUAL, FECHA_CAMBIO) VALUES (15, 83, 11, 130.00, 140.00, '2026-03-12 15:40:00');
-- BITACORAFACTURACANCELADA
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (1, 3, 1, '2026-03-01 11:30:00', 'Error en el ingreso del método de pago por parte del cajero.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (2, 7, 11, '2026-03-02 12:00:00', 'El cliente solicitó anulación de la compra por cambio de modelo de refrigerador.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (3, 12, 30, '2026-03-02 16:45:00', 'Transacción duplicada por fallo temporal en la red del POS.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (4, 15, 1, '2026-03-03 11:15:00', 'Falta de inventario físico real al momento de despachar el producto.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (5, 20, 11, '2026-03-04 09:50:00', 'El cliente canceló la compra antes de emitir el comprobante fiscal definitivo.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (6, 25, 30, '2026-03-04 16:20:00', 'Error en la selección del NIT del cliente corporativo.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (7, 30, 1, '2026-03-05 14:00:00', 'Problema con la lectura de la tarjeta de crédito del cliente.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (8, 35, 11, '2026-03-06 12:30:00', 'Anulación solicitada por gerencia debido a aplicación incorrecta de descuento promocional.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (9, 41, 30, '2026-03-07 11:10:00', 'El cliente desistió de la compra por motivos personales.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (10, 48, 1, '2026-03-08 13:00:00', 'Error en la cantidad digitada de productos en el detalle de la factura.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (11, 55, 11, '2026-03-09 14:00:00', 'Devolución de producto defectuoso detectado en caja.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (12, 60, 30, '2026-03-10 14:30:00', 'Cambio de método de pago de efectivo a crédito corporativo por parte del cliente.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (13, 68, 1, '2026-03-12 12:15:00', 'Factura anulada por cierre de caja y reverso de operación.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (14, 74, 11, '2026-03-13 12:40:00', 'Error en la identificación del vendedor comisionista.');
INSERT INTO BITACORAFACTURACANCELADA (ID_BITACORA_FACTURA, ID_FACTURA, ID_EMPLEADO, FECHA_CREACION, MOTIVO_DE_CANCELACION) VALUES (15, 82, 30, '2026-03-15 11:20:00', 'Anulación por cambio de sucursal de retiro de mercadería.');

