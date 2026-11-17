USE sistema_ventas;


CREATE USER IF NOT EXISTS 'user_vendedor'@'localhost' IDENTIFIED BY 'Vendedor2026!';
GRANT 'rol_vendedor' TO 'user_vendedor'@'localhost';
SET DEFAULT ROLE ALL TO 'user_vendedor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_PRODUCTOS TO 'rol_vendedor', 'user_vendedor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_CLIENTE_NATURAL TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_NATURAL TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_CLIENTE TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTIVAR_CLIENTE TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_CLIENTE TO 'rol_vendedor', 'user_vendedor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_REGISTRAR_CLIENTE_JURIDICO TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_CONSULTAR_CLIENTE_JURIDICO TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_CLIENTE_JURIDICO TO 'rol_vendedor', 'user_vendedor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_ACTUALIZAR_EMPLEADO TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_RESTABLECER_CONTRASENA TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DESACTIVAR_USUARIO TO 'rol_vendedor', 'user_vendedor'@'localhost';


GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_VALIDAR_USUARIO TO 'rol_vendedor', 'user_vendedor'@'localhost';
GRANT EXECUTE ON PROCEDURE sistema_ventas.SP_DEFINIR_ROL_USUARIO TO 'rol_vendedor', 'user_vendedor'@'localhost';


GRANT SELECT ON sistema_ventas.* TO 'rol_vendedor', 'user_vendedor'@'localhost';

FLUSH PRIVILEGES;
