USE sistema_ventas;

CREATE USER IF NOT EXISTS 'user_supervisor'@'localhost' IDENTIFIED BY 'Supervisor2026!';
GRANT 'rol_supervisor' TO 'user_supervisor'@'localhost';
SET DEFAULT ROLE ALL TO 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_SUPERVISOR TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_EMPLEADO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_RESTABLECER_CONTRASENA TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_USUARIO TO 'rol_supervisor', 'user_supervisor'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_EMPLEADO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CAJEROS TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_VENDEDORES TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_CAJERO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_VENDEDOR TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_NATURAL TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_JURIDICO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_LIMITE_CREDITO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_LIMITE_CREDITO_PERSONAL TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CREDITOS TO 'rol_supervisor', 'user_supervisor'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_FACTURAS TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ANULAR_FACTURA TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_BITACORA_FACTURA_ANULADA TO 'rol_supervisor', 'user_supervisor'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PRODUCTOS TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PRODUCTOS_INACTIVOS TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_PRODUCTO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_STOCK TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_PRECIO_PRODUCTO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PRODUCTOS_SUCURSAL TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REPORTE_INVENTARIO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_HISTORIAL_PRECIOS TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CATEGORIAS TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_CATEGORIA TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_CATEGORIA TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PROMOCIONES TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_PROMOCION TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_PROMOCION TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_PROMOCION TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PROVEEDORES TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_PROVEEDOR TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_PROVEEDOR_TELEFONO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_PROVEEDOR TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REPORTE_VENTAS_POR_CATEGORIA TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REPORTE_VENTAS_POR_VENDEDOR TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REPORTE_VENTAS_POR_PROVEEDOR TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_VALIDAR_USUARIO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DEFINIR_ROL_USUARIO TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT EXECUTE ON FUNCTION sistema_ventas.FN_CALCULAR_PRECIO_PROMOCION TO 'rol_supervisor', 'user_supervisor'@'localhost';


GRANT SELECT ON sistema_ventas.* TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT UPDATE ON sistema_ventas.CATEGORIA TO 'rol_supervisor', 'user_supervisor'@'localhost';
GRANT UPDATE ON sistema_ventas.PRODUCTO TO 'rol_supervisor', 'user_supervisor'@'localhost';

FLUSH PRIVILEGES;
