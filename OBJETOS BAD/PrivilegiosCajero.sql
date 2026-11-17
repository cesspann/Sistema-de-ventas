USE sistema_ventas;


CREATE USER IF NOT EXISTS 'user_cajero'@'localhost' IDENTIFIED BY 'Cajero2026!';
GRANT 'rol_cajero' TO 'user_cajero'@'localhost';
SET DEFAULT ROLE ALL TO 'user_cajero'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REALIZAR_VENTA TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ANULAR_FACTURA TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_FACTURAS TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_DETALLE_FACTURA TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_BITACORA_FACTURA_ANULADA TO 'rol_cajero', 'user_cajero'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_NATURAL TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_JURIDICO TO 'rol_cajero', 'user_cajero'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CREDITOS TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CUOTAS TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_PAGAR_CUOTA TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_LIMITE_CREDITO_PERSONAL TO 'rol_cajero', 'user_cajero'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PRODUCTOS_SUCURSAL TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PROMOCIONES TO 'rol_cajero', 'user_cajero'@'localhost';

GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_VALIDAR_USUARIO TO 'rol_cajero', 'user_cajero'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DEFINIR_ROL_USUARIO TO 'rol_cajero', 'user_cajero'@'localhost';


GRANT SELECT ON sistema_ventas.* TO 'rol_cajero', 'user_cajero'@'localhost';

FLUSH PRIVILEGES;
