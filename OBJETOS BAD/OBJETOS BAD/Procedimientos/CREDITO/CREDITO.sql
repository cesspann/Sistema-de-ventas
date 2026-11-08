DELIMITER %%



DROP PROCEDURE IF EXISTS SP_CONSULTAR_CREDITOS%%

CREATE PROCEDURE SP_CONSULTAR_CREDITOS(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(50),
    IN P_ESTADO VARCHAR(30)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(52);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, C.ID_FACTURA, F.NUMERO_FACTURA, F.MONTO_TOTAL AS TOTAL_FACTURA, C.MONTO_FINANCIADO, C.SALDO_PENDIENTE, C.ESTADO_CREDITO, C.FECHA_OTORGACION
        FROM CREDITO C
        JOIN FACTURA F ON C.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CREDITO = TRIM(P_ESTADO))
        ORDER BY C.FECHA_OTORGACION DESC, C.ID_CREDITO DESC;

    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, C.ID_FACTURA, F.NUMERO_FACTURA, F.MONTO_TOTAL AS TOTAL_FACTURA, C.MONTO_FINANCIADO, C.SALDO_PENDIENTE, C.ESTADO_CREDITO, C.FECHA_OTORGACION
        FROM CREDITO C
        JOIN FACTURA F ON C.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (
              CAST(F.ID_CLIENTE AS CHAR) LIKE V_FILTRO
              OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
              OR CJ.RAZON_SOCIAL LIKE V_FILTRO
              OR CAST(C.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(C.ID_CREDITO AS CHAR) LIKE V_FILTRO
              OR F.NUMERO_FACTURA LIKE V_FILTRO
          )
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CREDITO = TRIM(P_ESTADO))
        ORDER BY C.FECHA_OTORGACION DESC, C.ID_CREDITO DESC;

    END IF;

END%%

DROP PROCEDURE IF EXISTS SP_GENERAR_PLAN_CUOTAS%%

CREATE PROCEDURE SP_GENERAR_PLAN_CUOTAS(
    IN P_ID_FACTURA INT,
    IN P_MONTO_PRIMA DECIMAL(10,2),
    IN P_TASA_INTERES DECIMAL(10,2),
    IN P_NUMERO_CUOTAS INT,
    OUT P_ID_CREDITO INT
)
BEGIN
    -- Datos obtenidos de la factura
    DECLARE V_ID_CLIENTE INT DEFAULT NULL;
    DECLARE V_ID_SUCURSAL INT DEFAULT NULL;
    DECLARE V_MONTO_TOTAL DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_METODO_PAGO VARCHAR(30);
    DECLARE V_ESTADO_FACTURA VARCHAR(30);
    DECLARE V_ESTADO_CLIENTE VARCHAR(30);

    -- Datos del crédito.
    DECLARE V_LIMITE DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_CUPO_DISPONIBLE DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_MONTO_FINANCIADO DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_INTERES DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_TOTAL_PAGAR DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_MONTO_CUOTA DECIMAL(12,2) DEFAULT 0.00;

    DECLARE V_ID_CREDITO INT;
    DECLARE V_NUMERO_ACTUAL INT DEFAULT 1;
    DECLARE V_FECHA_VENCIMIENTO DATE;
    DECLARE V_CUOTAS_VENCIDAS INT DEFAULT 0;

    -- Se bloque la factura para impedir que dos procesos generen creditos para la misma venta
    SELECT ID_CLIENTE, ID_SUCURSAL, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA
    INTO V_ID_CLIENTE, V_ID_SUCURSAL, V_MONTO_TOTAL, V_METODO_PAGO, V_ESTADO_FACTURA
    FROM FACTURA
    WHERE ID_FACTURA = P_ID_FACTURA
    FOR UPDATE;

    -- Se valida que la factura asociada a ese cliente exista
    IF V_ID_CLIENTE IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura indicada no existe para dicho cliente.';
    END IF;

    -- Solo se permiten creditos sobre facturas activas
    IF V_ESTADO_FACTURA <> 'Activa' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se  puede generar credito para una factura anulada.';
    END IF;

    -- Se verifica qe la factura corresponda a una venta a crédito.ALTER
    IF V_METODO_PAGO NOT IN ('Credito Corporativo', 'Credito Personal') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura no corresponde a una venta a credito.';
    END IF;

    -- Se obtiene el estado del cliente para verificar que este activo
    SELECT ESTADO_CLIENTE INTO V_ESTADO_CLIENTE
    FROM CLIENTE
    WHERE ID_CLIENTE = V_ID_CLIENTE;

    IF V_ESTADO_CLIENTE IS NULL OR V_ESTADO_CLIENTE <> 'Activo' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe o esta inactivo.';
    END IF;

    -- Evitar que una factura tenga más de un credito
    IF EXISTS (SELECT 1 FROM CREDITO WHERE ID_FACTURA = P_ID_FACTURA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya tiene un credito registrado';
    END IF;

    -- Se valida la prima
    IF P_MONTO_PRIMA IS NULL OR P_MONTO_PRIMA < 0 OR P_MONTO_PRIMA >= V_MONTO_TOTAL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La prima debe ser mayor o igual a cero y menor que el total de la factura.';
    END IF;

    -- Se valida la tasa de interes
    IF P_TASA_INTERES IS NULL OR P_TASA_INTERES < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La tasa de interes no puede ser negativa ni nula.';
    END IF;
 -- Validar el numero de cuotas
    IF P_NUMERO_CUOTAS IS NULL OR P_NUMERO_CUOTAS <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de cuotas debe ser mayor que cero.';
    END IF;

    -- Se calcula el monto que se financiara descontando la prima inicial
    SET V_MONTO_FINANCIADO = ROUND(V_MONTO_TOTAL - P_MONTO_PRIMA, 2);

    -- Se calcula el interes simple mensual
    SET V_INTERES = ROUND(V_MONTO_FINANCIADO * (P_TASA_INTERES) / 100.00 * P_NUMERO_CUOTAS, 2);

    -- Se calcula el total que debera pagar el cliente
    SET V_TOTAL_PAGAR = ROUND(V_MONTO_FINANCIADO + V_INTERES, 2);

    -- Bloquear el registro que contiene el limite de cretido y evitar que dos ventas simultaneas excedan el cupo

    -- Cliente juridico
    IF V_METODO_PAGO = 'Credito Corporativo' THEN

        IF NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = V_ID_CLIENTE) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito corporativo solo aplica a clients jurídicos.';
        END IF;

        SELECT CUPO_CREDITO_CORPORATIVO INTO V_LIMITE
        FROM CLIENTEJURIDICO
        WHERE ID_CLIENTE = V_ID_CLIENTE
        FOR UPDATE;

    -- Cliente natural
    ELSEIF V_METODO_PAGO = 'Credito Personal' THEN

        IF NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = V_ID_CLIENTE) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito personal solo aplica a clientes naturales.';
        END IF;

        SELECT MONTOLIMITE INTO V_LIMITE
        FROM LIMITECREDITOPERSONAL
        WHERE ID_CLIENTE = V_ID_CLIENTE
          AND ID_SUCURSAL = V_ID_SUCURSAL
        FOR UPDATE;

    END IF;

    -- Se verifica que tenga un limite de credito
    IF V_LIMITE IS NULL OR V_LIMITE <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no tiene un limite autorizado.';
    END IF;

    -- Se obtiene el cupo disponible
    SET V_CUPO_DISPONIBLE = FN_OBTENER_CUPO_DISPONIBLE_CLIENTE(V_ID_CLIENTE, V_ID_SUCURSAL);

    -- Verificar que el monto de la factura debe caer dentro del cupo disponible
    IF V_TOTAL_PAGAR > V_CUPO_DISPONIBLE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no cuenta con cupo suficiente para este crédito.';
    END IF;

    -- Registrar el crédito.
    INSERT INTO CREDITO (ID_FACTURA, MONTO_PRIMA, MONTO_FINANCIADO, SALDO_PENDIENTE, TASA_INTERES, NUMERO_CUOTAS)
    VALUES (P_ID_FACTURA, P_MONTO_PRIMA, V_MONTO_FINANCIADO, V_TOTAL_PAGAR, P_TASA_INTERES, P_NUMERO_CUOTAS);

    -- Se recupera el identificar del crédtito recien creado
    SET V_ID_CREDITO = LAST_INSERT_ID();

    -- Se devuelve el id del credito generado
    SET P_ID_CREDITO = V_ID_CREDITO;

    -- Calcula el monto base de cada cuota
    SET V_MONTO_CUOTA = ROUND(V_TOTAL_PAGAR / P_NUMERO_CUOTAS, 2);

    -- Se genera cuotas con vencimiento mensual
    WHILE V_NUMERO_ACTUAL <= P_NUMERO_CUOTAS DO

        -- le suma un mes a la fecha actual respecto a la fecha de cada cuota
        SET V_FECHA_VENCIMIENTO = DATE_ADD(CURRENT_DATE(), INTERVAL V_NUMERO_ACTUAL MONTH);

        -- Se insertan los creditos respectivos
        INSERT INTO CUOTA (ID_CREDITO, NUMERO_CUOTA, FECHA_VENCIMIENTO, FECHA_PAGO, MONTO_ESPERADO)
        VALUES (V_ID_CREDITO, V_NUMERO_ACTUAL, V_FECHA_VENCIMIENTO, NULL, V_MONTO_CUOTA);

        SET V_NUMERO_ACTUAL = V_NUMERO_ACTUAL + 1;

    END WHILE;

END%%

DELIMITER ;