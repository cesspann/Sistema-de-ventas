/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/10/2026 20:31:19                          */
/*==============================================================*/


drop table if exists BITACORAFACTURACANCELADA;

drop table if exists BITACORAPRODUCTO;

drop table if exists CAJERO;

drop table if exists CATEGORIA;

drop table if exists CLIENTE;

drop table if exists CLIENTEJURIDICO;

drop table if exists CLIENTENATURAL;

drop table if exists COMPRAPRODUCTO;

drop table if exists CREDITO;

drop table if exists CUOTA;

drop table if exists DETALLEFACTURA;

drop table if exists EMPLEADO;

drop table if exists FACTURA;

drop table if exists LIMITECREDITOPERSONAL;

drop table if exists PRODUCTO;

drop table if exists PRODUCTOPROMOCION;

drop table if exists PROMOCION;

drop table if exists PROVEEDOR;

drop table if exists SUCURSAL;

drop table if exists USUARIO;

drop table if exists VENDEDOR;

/*==============================================================*/
/* Table: BITACORAFACTURACANCELADA                              */
/*==============================================================*/
create table BITACORAFACTURACANCELADA
(
   ID_BITACORA_FACTURA  int not null auto_increment,
   ID_FACTURA           int not null,
   ID_EMPLEADO          int not null,
   FECHA_CREACION       datetime not null default current_timestamp,
   MOTIVO_DE_CANCELACION varchar(500) not null,
   primary key (ID_BITACORA_FACTURA),
   constraint CK_MOTIVO_CANCELACION check (length(trim(MOTIVO_DE_CANCELACION)) > 0)
);

/*==============================================================*/
/* Table: BITACORAPRODUCTO                                      */
/*==============================================================*/
create table BITACORAPRODUCTO
(
   ID_BITACORA          int not null auto_increment,
   ID_PRODUCTO          int not null,
   ID_EMPLEADO          int not null,
   PRECIO_ANTERIOR      decimal(10,2) not null,
   PRECIO_ACTUAL        decimal(10,2) not null,
   FECHA_CAMBIO         datetime not null default current_timestamp,
   primary key (ID_BITACORA),
   constraint CK_BITA_PROD_PRECIO_ANT check (PRECIO_ANTERIOR > 0),
   constraint CK_BITA_PROD_PRECIO_ACT check (PRECIO_ACTUAL > 0)
);

/*==============================================================*/
/* Table: CAJERO                                                */
/*==============================================================*/
create table CAJERO
(
   ID_EMPLEADO          int not null,
   NUMERO_CAJA         int not null,
   TURNO                varchar(30) not null,
   primary key (ID_EMPLEADO),
   constraint CK_CAJERO_NUM_CAJA check (NUMERO_CAJA > 0),
   constraint CK_CAJERO_TURNO check (TURNO in('Mañana', 'Tarde', 'Noche'))
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   ID_CATEGORIA         int not null auto_increment,
   NOMBRE_CATEGORIA     varchar(150) not null,
   ESTADO_CATEGORIA     varchar(50) not null default 'Activo',
   primary key (ID_CATEGORIA),
   constraint CK_ESTADO_CATEGORIA check (ESTADO_CATEGORIA in('Activo', 'Inactivo'))
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   ID_CLIENTE           int not null auto_increment,
   CORREO               varchar(100),
   TELEFONO_CLIENTE     varchar(20),
   ESTADO_CLIENTE       varchar(50) not null default 'Activo',
   primary key (ID_CLIENTE),
   constraint CK_ESTADO_CLIENTE check (ESTADO_CLIENTE in('Activo', 'Inactivo'))
);

/*==============================================================*/
/* Table: CLIENTEJURIDICO                                       */
/*==============================================================*/
create table CLIENTEJURIDICO
(
   ID_CLIENTE           int not null,
   NOMBRE_REPRESENTANTE_LEGAL varchar(100) not null,
   NIT                  varchar(20) not null unique,
   RAZON_SOCIAL         varchar(100) not null,
   CUPO_CREDITO_CORPORATIVO decimal(10,2) not null,
   primary key (ID_CLIENTE),
   constraint CK_CUPO_CORP check (CUPO_CREDITO_CORPORATIVO >= 0)
);

/*==============================================================*/
/* Table: CLIENTENATURAL                                        */
/*==============================================================*/
create table CLIENTENATURAL
(
   ID_CLIENTE           int not null,
   NOMBRE_CLIENTE       varchar(150) not null,
   DUI_CLIENTE          varchar(12) unique,
   primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: COMPRAPRODUCTO                                        */
/*==============================================================*/
create table COMPRAPRODUCTO
(
   ID_PROVEEDOR         int not null,
   ID_PRODUCTO          int not null,
   FECHA_ENTREGA        date not null,
   PRECIO_PACTADO       decimal(10,2) not null,
   primary key (ID_PROVEEDOR, ID_PRODUCTO),
   constraint CK_PRECIO_PACTADO check (PRECIO_PACTADO > 0)
);

/*==============================================================*/
/* Table: CREDITO                                               */
/*==============================================================*/
create table CREDITO
(
   ID_CREDITO           int not null auto_increment,
   ID_FACTURA           int not null,
   ESTADO_CREDITO       varchar(50) not null default 'Pendiente',
   FECHA_OTORGACION     date not null default (curdate()),
   MONTO_PRIMA DECIMAL(10,2) NOT NULL DEFAULT 0.00,
   MONTO_FINANCIADO     decimal(10,2) not null,
   SALDO_PENDIENTE      decimal(10,2) not null,
   TASA_INTERES         decimal(10,2) not null,
   NUMERO_CUOTAS        int not null,
   

   primary key (ID_CREDITO),
   constraint CK_ESTADO_CREDITO check (ESTADO_CREDITO in ('Pendiente', 'Pagado', 'Vencido', 'Cancelado')),
   constraint CK_MONTO_FINANCIADO check (MONTO_FINANCIADO > 0),
   constraint CK_SALDO_PENDIENTE check (SALDO_PENDIENTE >= 0),
   constraint CK_TASA_INTERES check (TASA_INTERES >= 0),
   constraint CK_NUM_CUOTAS check (NUMERO_CUOTAS > 0),
   constraint CK_CREDITO_MONTO_PRIMA check (MONTO_PRIMA >= 0)
);

/*==============================================================*/
/* Table: CUOTA                                                 */
/*==============================================================*/
create table CUOTA
(
   ID_CREDITO           int not null,
   NUMERO_CUOTA         int not null,
   FECHA_VENCIMIENTO    date not null,
   FECHA_PAGO           datetime null,
   MONTO_ABONADO        decimal(10,2) not null default 0.00,
   MONTO_ESPERADO       decimal(10,2) not null,
   ESTADO_CUOTA         varchar(50) not null default 'Pendiente',
   primary key (ID_CREDITO,NUMERO_CUOTA),
   constraint CK_MONTO_ABONADO check (MONTO_ABONADO >= 0),
   constraint CK_MONTO_ESPERADO check (MONTO_ESPERADO > 0),
   constraint CK_ESTADO_CUOTA check (ESTADO_CUOTA in ('Pendiente', 'Pagada', 'Vencida', 'Cancelada'))   
);
create index IDX_CUOTA_ESTADO_VENC on CUOTA (ESTADO_CUOTA, FECHA_VENCIMIENTO);
/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA
(
   ID_FACTURA           int not null,
   NUMERO_CORRELATIVO   int not null,
   ID_PRODUCTO          int not null,
   CANTIDAD_DE_DETALLE  int not null,
   PRECIO_UNITARIO      decimal(10,2) not null,
   SUBTOTAL             decimal(10,2) not null,
   primary key (ID_FACTURA, NUMERO_CORRELATIVO),
   constraint CK_NUM_CORRELATIVO check (NUMERO_CORRELATIVO > 0),
   constraint CK_CANT_DETALLE check (CANTIDAD_DE_DETALLE > 0),
   constraint CK_PRECIO_UNIT check (PRECIO_UNITARIO > 0),
   constraint CK_SUBTOTAL check (SUBTOTAL >= 0)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   ID_EMPLEADO          int not null auto_increment,
   ID_SUCURSAL          int not null,
   ID_SUPERVISOR        int,
   ID_USUARIO           int not null,
   NOMBRE_EMPLEADO      varchar(150) not null,
   DUI_EMPLEADO         varchar(12) not null unique,
   CORREO_ELECTRONICO   varchar(150),
   FECHA_CONTRATACION   date not null default (curdate()),
   DIRECCION_EMPLEADO   varchar(200),
   TELEFONO_EMPLEADO    varchar(20),
   ESTADO_EMPLEADO VARCHAR(20) NOT NULL DEFAULT 'Activo',
   TIPO_EMPLEADO VARCHAR(30) NULL,
   constraint CK_ESTADO_EMPLEADO check (ESTADO_EMPLEADO IN ('Activo', 'Inactivo')),
   primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   ID_FACTURA           int not null auto_increment,
   ID_CLIENTE           int not null,
   ID_EMPLEADO          int not null,
   ID_SUCURSAL          int not null,
   NUMERO_FACTURA       varchar(20) not null unique ,
   FECHA_HORA           datetime not null default current_timestamp,
   MONTO_TOTAL          decimal(10,2) not null,
   METODO_PAGO          varchar(30) not null,
   ESTADO_FACTURA       varchar(50) not null default 'Activa',
   primary key (ID_FACTURA),
   constraint CK_MONTO_TOTAL check (MONTO_TOTAL >= 0),
   constraint CK_METODO_PAGO check (METODO_PAGO in ('Efectivo', 'Tarjeta', 'Credito Corporativo', 'Credito Personal', 'Transferencia')),
   constraint CK_ESTADO_FACTURA check (ESTADO_FACTURA in ('Activa', 'Anulada'))
);
create index IDX_FACTURA_FECHA on FACTURA (FECHA_HORA);
/*==============================================================*/
/* Table: LIMITECREDITOPERSONAL                                 */
/*==============================================================*/
create table LIMITECREDITOPERSONAL
(
   ID_LIMITE            int not null auto_increment,
   ID_SUCURSAL          int not null,
   ID_CLIENTE           int not null,
   MONTOLIMITE          decimal(10,2) not null,
   primary key (ID_LIMITE),
   constraint CK_MONTO_LIMITE_PER check (MONTOLIMITE > 0),
   constraint UQ_LIMITE_CLIENTE_SUCURSAL UNIQUE (ID_CLIENTE, ID_SUCURSAL)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   ID_PRODUCTO          int not null auto_increment, 
   ID_CATEGORIA         int not null,
   NOMBRE_PRODUCTO      varchar(150) not null,
   PRECIO_VENTA         decimal(10,2) not null,
   ESTADO_PRODUCTO      varchar(50) not null default 'Activo',
   primary key (ID_PRODUCTO),
   constraint CK_PRECIO_VENTA check (PRECIO_VENTA > 0),
   constraint CK_ESTADO_PRODUCTO check (ESTADO_PRODUCTO in ('Activo', 'Inactivo'))
);

/*==============================================================*/
/* Table: PRODUCTOPROMOCION                                     */
/*==============================================================*/
create table PRODUCTOPROMOCION
(
   ID_PROMOCION         int not null,
   ID_PRODUCTO          int not null,
   primary key (ID_PROMOCION, ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION
(
   ID_PROMOCION         int not null auto_increment,
   FECHA_INICIO         date not null,
   FECHA_FIN            date not null,
   PORCENTAJE_DESCUENTO decimal(5,2),
   ESTADO_PROMOCION     varchar(50) not null default 'Activa',
   primary key (ID_PROMOCION),
   constraint CK_PORC_DESC check (PORCENTAJE_DESCUENTO >= 0 and PORCENTAJE_DESCUENTO <= 100),
   constraint CK_ESTADO_PROM check (ESTADO_PROMOCION in ('Activa', 'Inactiva')),
   constraint CK_FECHAS_PROM check (FECHA_FIN >= FECHA_INICIO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   ID_PROVEEDOR         int not null auto_increment,
   NOMBRE_PROVEEDOR     varchar(150) not null,
   TELEFONO_PROVEEDOR   varchar(20),
   ESTADO_PROVEEDOR     varchar(50) not null default 'Activo',
   primary key (ID_PROVEEDOR),
   constraint CK_ESTADO_PROV check (ESTADO_PROVEEDOR in ('Activo', 'Inactivo'))
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL
(
   ID_SUCURSAL          int not null auto_increment,
   NOMBRE_SUCURSAL      varchar(200) not null,
   PRESUPUESTO_SUCURSAL decimal(15,2) not null,
   DIRECCION_SUCURSAL   varchar(200) not null,
   TELEFONO_SUCURSAL    varchar(20),
   ESTADO_SUCURSAL      varchar(50) not null default 'Activa',
   primary key (ID_SUCURSAL),
   constraint CK_PRESUPUESTO_SUC check (PRESUPUESTO_SUCURSAL >= 0),
   constraint CK_ESTADO_SUC check (ESTADO_SUCURSAL in ('Activa', 'Inactiva'))
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           int not null auto_increment,
   NOMBRE_USUARIO       varchar(50) not null unique,
   CLAVE                varchar(255) not null,
   ESTADO_USUARIO       varchar(20) not null default 'Activo',
   INTENTOS_INGRESO     int not null default 0,
   primary key (ID_USUARIO),
   constraint CK_ESTADO_USER check (ESTADO_USUARIO in ('Activo', 'Inactivo', 'Bloqueado')),
   constraint CK_INTENTOS_USER check (INTENTOS_INGRESO >= 0)
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR
(
   ID_EMPLEADO          int not null,
   PORCENTAJE_COMISION  decimal(10,2) not null,
   META_MENSUAL          decimal(10,2) not null,
   primary key (ID_EMPLEADO),
   constraint CK_PORC_COMISION check (PORCENTAJE_COMISION >= 0 and PORCENTAJE_COMISION <= 100),
   constraint CK_META_MENSUAL check (META_MENSUAL >= 0)
);
CREATE TABLE INVENTARIO (
    ID_PRODUCTO INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    STOCK INT NOT NULL DEFAULT 0,

    PRIMARY KEY (ID_PRODUCTO, ID_SUCURSAL),

    CONSTRAINT FK_INVENTARIO_PRODUCTO FOREIGN KEY (ID_PRODUCTO)REFERENCES PRODUCTO(ID_PRODUCTO),

    CONSTRAINT FK_INVENTARIO_SUCURSAL FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL),

    CONSTRAINT CK_INVENTARIO_STOCK  CHECK (STOCK >= 0)
);

alter table BITACORAFACTURACANCELADA add constraint FK_PUEDE_REGISTRAR foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table BITACORAFACTURACANCELADA add constraint FK_PUEDE_SER_REGISTRADA_COMO foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA) on delete restrict on update restrict;

alter table BITACORAPRODUCTO add constraint FK_REGISTRA foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table BITACORAPRODUCTO add constraint FK_SE_REGISTRA_EN foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table CAJERO add constraint FK_ES_UN foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table CLIENTEJURIDICO add constraint FK_HEREDA_DE2 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table CLIENTENATURAL add constraint FK_HEREDA_DE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table COMPRAPRODUCTO add constraint FK_ES_ABASTECIDO foreign key (ID_PROVEEDOR)
      references PROVEEDOR (ID_PROVEEDOR) on delete restrict on update restrict;

alter table COMPRAPRODUCTO add constraint FK_ES_ABASTECIDO2 foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table CREDITO add constraint FK_SE_REGISTRA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA) on delete restrict on update restrict;

alter table CUOTA add constraint FK_SE_DIVIDE_EN foreign key (ID_CREDITO)
      references CREDITO (ID_CREDITO) on delete restrict on update restrict;

alter table DETALLEFACTURA add constraint FK_INCLUYE foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table DETALLEFACTURA add constraint FK_SE_COMPONE foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_SUPERVISA foreign key (ID_SUPERVISOR)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_TIENE foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_TIENE_ASOCIADO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_ES_ATENDIDA_POR foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_ES_GENERADA_POR foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table FACTURA add constraint FK_PERTENECE_A foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table LIMITECREDITOPERSONAL add constraint FK_DESIGNA foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table LIMITECREDITOPERSONAL add constraint FK_TIENE_UN foreign key (ID_CLIENTE)
      references CLIENTENATURAL (ID_CLIENTE) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_CLASIFICA_A foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA) on delete restrict on update restrict;

alter table PRODUCTOPROMOCION add constraint FK_APLICA_A foreign key (ID_PROMOCION)
      references PROMOCION (ID_PROMOCION) on delete restrict on update restrict;

alter table PRODUCTOPROMOCION add constraint FK_APLICA_A2 foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table VENDEDOR add constraint FK_ES_UN2 foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

