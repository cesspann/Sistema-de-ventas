DELIMITER %%

DROP PROCEDURE SP_CONSULTAR_BITACORA_FACTURA_ANULADA%%
CREATE PROCEDURE SP_CONSULTAR_BITACORA_FACTURA_ANULADA(
    IN P_BUSQUEDA VARCHAR(150),
    IN P_FECHA_DESDE DATETIME,
    IN P_FECHA_HASTA DATETIME
)
BEGIN
     DECLARE V_FILTRO VARCHAR(255);

    -- CASO 1: Si el usuario NO escribió nada en la caja de búsqueda (viene NULL o vacío)
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        -- Trae todas las facturas anuladas aplicando únicamente los filtros de fecha (si existen)
        SELECT B.ID_BITACORA_FACTURA, B.ID_FACTURA, B.ID_EMPLEADO, B.FECHA_CREACION, B.MOTIVO_DE_CANCELACION
        FROM BITACORAFACTURACANCELADA B
        INNER JOIN FACTURA F ON B.ID_FACTURA = F.ID_FACTURA
        WHERE F.ID_SUCURSAL = V_ID_SUCURSAL
          AND (P_FECHA_DESDE IS NULL OR B.FECHA_CREACION >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CREACION <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CREACION DESC;

    -- CASO 2: Si el usuario escribió algo en la caja de búsqueda
    ELSE

        -- Preparamos el texto agregando '%' al inicio y al final para buscar coincidencias parciales en cualquier parte del texto.
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT B.ID_BITACORA_FACTURA, B.ID_FACTURA, B.ID_EMPLEADO, B.FECHA_CREACION, B.MOTIVO_DE_CANCELACION
        FROM BITACORAFACTURACANCELADA B
        INNER JOIN FACTURA F ON B.ID_FACTURA = F.ID_FACTURA
        WHERE F.ID_SUCURSAL = V_ID_SUCURSAL
          AND (
              -- Convertimos los IDs numéricos a texto para poder buscarlos con LIKE
              CAST(B.ID_BITACORA_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(B.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(B.ID_EMPLEADO AS CHAR) LIKE V_FILTRO
              -- O buscamos directamente texto dentro del motivo de cancelación
              OR B.MOTIVO_DE_CANCELACION LIKE V_FILTRO
          )
          -- Respetando adicionalmente el rango de fechas si el usuario lo especificó
          AND (P_FECHA_DESDE IS NULL OR B.FECHA_CREACION >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CREACION <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CREACION DESC;

    END IF;
END%%
DELIMITER ;