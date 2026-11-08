
DELIMITER %%

DROP PROCEDURE IF EXISTS SP_REGISTRAR_INVENTARIO%%
CREATE PROCEDURE SP_REGISTRAR_INVENTARIO(
    IN P_ID_PRODUCTO INT,
    IN P_ID_SUCURSAL INT,
    IN P_STOCK INT
)
BEGIN

    -- Se verifica que el producto exista
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto indicado no existe.';
    END IF;

    -- Se verifica que el producto se encuentre activo
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ESTADO_PRODUCTO='Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto se encuentra inactivo.';
    END IF;

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La sucursal indicada no existe.';
    END IF;

    -- Se valida que el stock no sea negativo
    IF P_STOCK IS NULL OR P_STOCK<0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La cantidad de inventario no puede ser negativa.';
    END IF;

    -- Se evita registrar dos veces el mismo producto en una sucursal
    IF EXISTS (SELECT 1 FROM INVENTARIO WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto ya tiene inventario registrado en esta sucursal.';
    END IF;

    INSERT INTO INVENTARIO (ID_PRODUCTO, ID_SUCURSAL, STOCK)
    VALUES (P_ID_PRODUCTO, P_ID_SUCURSAL, P_STOCK);

END%%
DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_INVENTARIO%%

CREATE PROCEDURE SP_ACTUALIZAR_INVENTARIO(
    IN P_ID_PRODUCTO INT,
    IN P_ID_SUCURSAL INT,
    IN P_CANTIDAD INT,
    IN P_TIPO_MOVIMIENTO VARCHAR(20)
)
BEGIN
    DECLARE V_STOCK_ACTUAL INT DEFAULT 0;

    -- Se valida que la cantidad sea mayor que cero
    IF P_CANTIDAD IS NULL OR P_CANTIDAD <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que cero.';
    END IF;

    -- Se valida el tipo de movimiento
    IF P_TIPO_MOVIMIENTO IS NULL OR P_TIPO_MOVIMIENTO NOT IN ('Entrada', 'Salida') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El movimiento debe ser Entrada o Salida.';
    END IF;

    -- Se verifica que el producto exista
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO = P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto indicado no existe.';
    END IF;

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Se comprueba que el producto tenga inventario en esa sucursal
    IF NOT EXISTS (SELECT 1 FROM INVENTARIO WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no tiene inventario registrado en esta sucursal.';
    END IF;

    -- Se obtiene y bloquea el stock actual
    SELECT STOCK 
    INTO V_STOCK_ACTUAL 
    FROM INVENTARIO 
    WHERE ID_PRODUCTO = P_ID_PRODUCTO 
    AND ID_SUCURSAL = P_ID_SUCURSAL 
    FOR UPDATE;

    -- Se aumenta el stock cuando ingresan productos
    IF P_TIPO_MOVIMIENTO = 'Entrada' THEN

        UPDATE INVENTARIO SET STOCK = STOCK + P_CANTIDAD WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL;

    -- Se disminuye el stock cuando salen productos
    ELSEIF P_TIPO_MOVIMIENTO = 'Salida' THEN

        -- Se verifica que existan suficientes unidades
        IF V_STOCK_ACTUAL < P_CANTIDAD THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficientes existencias para realizar la salida.';
        END IF;

        UPDATE INVENTARIO SET STOCK = STOCK - P_CANTIDAD WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL;

    END IF;

END%%

DROP PROCEDURE `SP_CONSULTAR_INVENTARIO`%%
CREATE PROCEDURE `SP_CONSULTAR_INVENTARIO`(
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La sucursal indicada no existe.';
    END IF;

    -- Se consultan las existencias de los productos en la sucursal
    SELECT
        I.ID_PRODUCTO,
        P.NOMBRE_PRODUCTO,
        I.ID_SUCURSAL,
        S.NOMBRE_SUCURSAL,
        I.STOCK
    FROM INVENTARIO I
    INNER JOIN PRODUCTO P ON I.ID_PRODUCTO=P.ID_PRODUCTO
    INNER JOIN SUCURSAL S ON I.ID_SUCURSAL=S.ID_SUCURSAL
    WHERE I.ID_SUCURSAL=P_ID_SUCURSAL
    ORDER BY P.NOMBRE_PRODUCTO;

END%%

DELIMITER ;