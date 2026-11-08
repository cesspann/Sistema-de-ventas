DELIMITER %%

DROP PROCEDURE IF EXISTS SP_REGISTRAR_FACTURA%%

CREATE PROCEDURE SP_REGISTRAR_FACTURA(
    IN P_ID_CLIENTE INT,
    IN P_ID_EMPLEADO INT,
    IN P_ID_SUCURSAL INT,
    IN P_METODO_PAGO VARCHAR(30),
    OUT P_ID_FACTURA INT
)
BEGIN
    DECLARE V_NUMERO_FACTURA VARCHAR(20);
    DECLARE V_NUMERO_PROVISIONAL VARCHAR(20);

    -- Se valida que el cliente exista y esté activo
    IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE ID_CLIENTE = P_ID_CLIENTE AND ESTADO_CLIENTE = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe o está inactivo.';
    END IF;

    -- El cliente debe pertenecer a un tipo definido (natural o juridico)
    IF NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = P_ID_CLIENTE)
       AND NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente debe ser natural o juridico.';
    END IF;

    -- Se valida que el empleado exista
    IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE ID_EMPLEADO = P_ID_EMPLEADO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe.';
    END IF;

    -- Se valida que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal no existe.';
    END IF;

    -- Se valida el método de pago
    IF P_METODO_PAGO IS NULL OR P_METODO_PAGO NOT IN ('Efectivo', 'Tarjeta', 'Transferencia', 'Credito Corporativo', 'Credito Personal') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El método de pago no es válido.';
    END IF;

    -- Se valida que el crédito personal sea para un cliente natural
    IF P_METODO_PAGO = 'Credito Personal' AND NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito personal requiere un cliente natural.';
    END IF;

    -- Se valida que el crédito corporativo sea para un cliente jurídico
    IF P_METODO_PAGO = 'Credito Corporativo' AND NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito corporativo requiere un cliente jurídico.';
    END IF;

   -- Se asigna un número provisional a la factura para cumplir con not null de la factura
    SET V_NUMERO_PROVISIONAL = 'TEMPORAL';

    -- Se registra la factura con monto inicial de cero y número provisional mientras se genera el real
    INSERT INTO FACTURA (ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, MONTO_TOTAL, METODO_PAGO)
    VALUES (P_ID_CLIENTE, P_ID_EMPLEADO, P_ID_SUCURSAL, V_NUMERO_PROVISIONAL, 0, P_METODO_PAGO);

    -- Se obtiene el identificador de la factura registrada
    SET P_ID_FACTURA = LAST_INSERT_ID();

    -- Se genera automáticamente el número definitivo de la factura en base a la inserción realizada
    SET V_NUMERO_FACTURA = CONCAT('FAC-', LPAD(P_ID_FACTURA, 6, '0'));

    -- Se actualiza la factura con su número definitivo
    UPDATE FACTURA 
    SET NUMERO_FACTURA = V_NUMERO_FACTURA 
    WHERE ID_FACTURA = P_ID_FACTURA;

END%%




DROP PROCEDURE IF EXISTS SP_CONSULTAR_FACTURAS%%

CREATE PROCEDURE SP_CONSULTAR_FACTURAS(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(100)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(102);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT 
            F.ID_FACTURA, 
            F.NUMERO_FACTURA, 
            COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, 
            S.NOMBRE_SUCURSAL, 
            F.FECHA_HORA, 
            F.MONTO_TOTAL, 
            F.METODO_PAGO
        FROM FACTURA F
        JOIN CLIENTE C ON F.ID_CLIENTE = C.ID_CLIENTE
        LEFT JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE
        LEFT JOIN SUCURSAL S ON F.ID_SUCURSAL = S.ID_SUCURSAL
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND F.ESTADO_FACTURA = 'Activa'
        ORDER BY F.FECHA_HORA DESC, F.ID_FACTURA DESC;
    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT 
            F.ID_FACTURA, 
            F.NUMERO_FACTURA, 
            COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, 
            S.NOMBRE_SUCURSAL, 
            F.FECHA_HORA, 
            F.MONTO_TOTAL, 
            F.METODO_PAGO
        FROM FACTURA F
        JOIN CLIENTE C ON F.ID_CLIENTE = C.ID_CLIENTE
        LEFT JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE
        LEFT JOIN SUCURSAL S ON F.ID_SUCURSAL = S.ID_SUCURSAL
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND F.ESTADO_FACTURA = 'Activa'
          AND (
              CAST(F.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR F.NUMERO_FACTURA LIKE V_FILTRO
              OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
              OR CJ.RAZON_SOCIAL LIKE V_FILTRO
          )
        ORDER BY F.FECHA_HORA DESC, F.ID_FACTURA DESC;
    END IF;
END%%

DROP PROCEDURE SP_ANULAR_FACTURA%%
CREATE PROCEDURE SP_ANULAR_FACTURA(
    IN P_ID_FACTURA INT,
    IN P_ID_EMPLEADO INT,
    IN P_MOTIVO_CANCELACION VARCHAR(500)
)
BEGIN
    DECLARE V_ESTADO_FACTURA VARCHAR(50) DEFAULT NULL;
    DECLARE V_ID_CREDITO INT DEFAULT NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se verifica que el motivo de cancelación no esté vacío
    IF P_MOTIVO_CANCELACION IS NULL OR TRIM(P_MOTIVO_CANCELACION) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar el motivo de cancelacion.';
    END IF;

    -- Se comprueba que el empleado exista y se encuentre activo
    IF NOT EXISTS (SELECT 1 FROM EMPLEADO E JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO WHERE E.ID_EMPLEADO = P_ID_EMPLEADO AND U.ESTADO_USUARIO = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado responsable no existe o no se encuentra activo.';
    END IF;

    START TRANSACTION;

    -- Se verifica que la factura exista
    IF NOT EXISTS (SELECT 1 FROM FACTURA WHERE ID_FACTURA = P_ID_FACTURA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura indicada no existe en el sistema.';
    END IF;

    -- Se bloquea la factura para evitar anulaciones simultáneas
    SELECT ESTADO_FACTURA
    INTO V_ESTADO_FACTURA
    FROM FACTURA
    WHERE ID_FACTURA = P_ID_FACTURA
    FOR UPDATE;

    -- Se comprueba que la factura no esté anulada
    IF V_ESTADO_FACTURA = 'Anulada' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya se encuentra anulada previamente.';
    END IF;

    -- Se obtiene el crédito asociado a la factura, si existe
    SELECT ID_CREDITO
    INTO V_ID_CREDITO
    FROM CREDITO
    WHERE ID_FACTURA = P_ID_FACTURA
    LIMIT 1;

    -- Si tiene crédito, se comprueba que no existan cuotas pagadas
    IF V_ID_CREDITO IS NOT NULL THEN

        IF EXISTS (SELECT 1 FROM CUOTA WHERE ID_CREDITO = V_ID_CREDITO AND (ESTADO_CUOTA = 'Pagada' OR MONTO_ABONADO > 0)) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede anular una factura con cuotas abonadas o pagadas.';
        END IF;

    END IF;

    -- Se anula la factura
    -- El trigger devuelve automáticamente los productos al inventario
    UPDATE FACTURA
    SET ESTADO_FACTURA = 'Anulada'
    WHERE ID_FACTURA = P_ID_FACTURA;

    -- Se registra el motivo de cancelación en la bitácora
    INSERT INTO BITACORAFACTURACANCELADA (ID_FACTURA, ID_EMPLEADO, MOTIVO_DE_CANCELACION)
    VALUES (P_ID_FACTURA, P_ID_EMPLEADO, P_MOTIVO_CANCELACION);

    -- Si la factura tiene crédito, se cancela
    IF V_ID_CREDITO IS NOT NULL THEN

        UPDATE CREDITO
        SET ESTADO_CREDITO = 'Cancelado',
            SALDO_PENDIENTE = 0.00
        WHERE ID_CREDITO = V_ID_CREDITO;

        -- Se cancelan las cuotas pendientes
        UPDATE CUOTA
        SET ESTADO_CUOTA = 'Cancelada'
        WHERE ID_CREDITO = V_ID_CREDITO
          AND ESTADO_CUOTA <> 'Pagada';

    END IF;

    COMMIT;

END%%

DELIMITER ;