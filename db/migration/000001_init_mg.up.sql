CREATE TABLE "clientes" (
  "id" bigserial PRIMARY KEY,
  "cuit" varchar(11) UNIQUE NOT NULL,
  "razon_social" varchar NOT NULL
);

CREATE TABLE "proveedores" (
  "cuit" varchar(11) PRIMARY KEY,
  "denominacion" varchar(64) NOT NULL,
  "tipo_de_compra" varchar,
  "jurisdiccion_provincial" varchar,
  "clasificacion_gastos" varchar
);

CREATE TABLE "comprobantes_compra_csv" (
  "Fecha_de_Emision" varchar,
  "Tipo_de_Comprobante" varchar,
  "Punto_de_Venta" varchar,
  "Numero_de_Comprobante" varchar,
  "Tipo_Doc_Vendedor" varchar,
  "Nro_Doc_Vendedor" varchar,
  "Denominacion_Vendedor" varchar,
  "Importe_Total" varchar,
  "Moneda_Original" varchar,
  "Tipo_de_Cambio" varchar,
  "Importe_No_Gravado" varchar,
  "Importe_Exento" varchar,
  "Credito_Fiscal_Computable" varchar,
  "Importe_de_Per_o_Pagos_a_Cta_de_Otros_Imp_Nac" varchar,
  "Importe_de_Percepciones_de_Ingresos_Brutos" varchar,
  "Importe_de_Impuestos_Municipales" varchar,
  "Importe_de_Percepciones_o_Pagos_a_Cuenta_de_IVA" varchar,
  "Importe_de_Impuestos_Internos" varchar,
  "Importe_Otros_Tributos" varchar,
  "Neto_Gravado_IVA_0" varchar,
  "Neto_Gravado_IVA_25" varchar,
  "Importe_IVA_25" varchar,
  "Neto_Gravado_IVA_5" varchar,
  "Importe_IVA_5" varchar,
  "Neto_Gravado_IVA_105" varchar,
  "Importe_IVA_105" varchar,
  "Neto_Gravado_IVA_21" varchar,
  "Importe_IVA_21" varchar,
  "Neto_Gravado_IVA_27" varchar,
  "Importe_IVA_27" varchar,
  "Total_Neto_Gravado" varchar,
  "Total_IVA" varchar
);

CREATE TABLE "comprobantes_venta_csv" (
  "Fecha_de_Emision" varchar,
  "Tipo_de_Comprobante" varchar,
  "Punto_de_Venta" varchar,
  "Numero_de_Comprobante" varchar,
  "Numero_de_Comprobante_Hasta" varchar,
  "Tipo_Doc_Comprador" varchar,
  "Nro_Doc_Comprador" varchar,
  "Denominacion_Comprador" varchar,
  "Fecha_de_Vencimiento_del_Pago" varchar,
  "Importe_Total" varchar,
  "Moneda_Original" varchar,
  "Tipo_de_Cambio" varchar,
  "Importe_No_Gravado" varchar,
  "Importe_Exento" varchar,
  "Importe_de_Per_o_Pagos_a_Cta_de_Otros_Imp_Nac" varchar,
  "Importe_de_Percepciones_de_Ingresos_Brutos" varchar,
  "Importe_de_Impuestos_Municipales" varchar,
  "Percepcion_a_No_Categorizados" varchar,
  "Importe_de_Impuestos_Internos" varchar,
  "Importe_Otros_Tributos" varchar,
  "Neto_Gravado_IVA_0" varchar,
  "Neto_Gravado_IVA_25" varchar,
  "Importe_IVA_25" varchar,
  "Neto_Gravado_IVA_5" varchar,
  "Importe_IVA_5" varchar,
  "Neto_Gravado_IVA_105" varchar,
  "Importe_IVA_105" varchar,
  "Neto_Gravado_IVA_21" varchar,
  "Importe_IVA_21" varchar,
  "Neto_Gravado_IVA_27" varchar,
  "Importe_IVA_27" varchar,
  "Total_Neto_Gravado" varchar,
  "Total_IVA" varchar
);

CREATE TABLE "comprobantes_compra" (
  "id_cliente" bigint PRIMARY KEY,
  "periodo_imputacion" varchar(7) NOT NULL,
  "pendiente_imputacion" bool NOT NULL DEFAULT false,
  "Fecha_de_Emision" timestamptz,
  "Tipo_de_Comprobante" varchar(3),
  "Punto_de_Venta" varchar(5),
  "Numero_de_Comprobante" varchar(20),
  "Tipo_Doc_Vendedor" varchar(2),
  "Nro_Doc_Vendedor" varchar(20),
  "Denominacion_Vendedor" varchar(30),
  "Importe_Total" integer,
  "Moneda_Original" varchar,
  "Tipo_de_Cambio" varchar,
  "Importe_No_Gravado" integer,
  "Importe_Exento" integer,
  "Credito_Fiscal_Computable" integer,
  "Importe_de_Per_o_Pagos_a_Cta_de_Otros_Imp_Nac" integer,
  "Importe_de_Percepciones_de_Ingresos_Brutos" integer,
  "Importe_de_Impuestos_Municipales" integer,
  "Importe_de_Percepciones_o_Pagos_a_Cuenta_de_IVA" integer,
  "Importe_de_Impuestos_Internos" integer,
  "Importe_Otros_Tributos" integer,
  "Neto_Gravado_IVA_0" integer,
  "Neto_Gravado_IVA_25" integer,
  "Importe_IVA_25" integer,
  "Neto_Gravado_IVA_5" integer,
  "Importe_IVA_5" integer,
  "Neto_Gravado_IVA_105" integer,
  "Importe_IVA_105" integer,
  "Neto_Gravado_IVA_21" integer,
  "Importe_IVA_21" integer,
  "Neto_Gravado_IVA_27" integer,
  "Importe_IVA_27" integer,
  "Total_Neto_Gravado" integer,
  "Total_IVA" integer
);

CREATE TABLE "comprobantes_venta" (
  "id_cliente" bigint PRIMARY KEY,
  "Fecha_de_Emision" timestamptz,
  "Tipo_de_Comprobante" varchar(3),
  "Punto_de_Venta" varchar(5),
  "Numero_de_Comprobante" varchar(20),
  "Tipo_Doc_Vendedor" varchar(2),
  "Nro_Doc_Vendedor" varchar(20),
  "Denominacion_Vendedor" varchar(30),
  "Importe_Total" varchar,
  "Moneda_Original" varchar,
  "Tipo_de_Cambio" varchar,
  "Importe_No_Gravado" varchar,
  "Importe_Exento" varchar,
  "Credito_Fiscal_Computable" varchar,
  "Importe_de_Per_o_Pagos_a_Cta_de_Otros_Imp_Nac" varchar,
  "Importe_de_Percepciones_de_Ingresos_Brutos" varchar,
  "Importe_de_Impuestos_Municipales" varchar,
  "Importe_de_Percepciones_o_Pagos_a_Cuenta_de_IVA" varchar,
  "Importe_de_Impuestos_Internos" varchar,
  "Importe_Otros_Tributos" varchar,
  "Neto_Gravado_IVA_0" varchar,
  "Neto_Gravado_IVA_25" varchar,
  "Importe_IVA_25" varchar,
  "Neto_Gravado_IVA_5" varchar,
  "Importe_IVA_5" varchar,
  "Neto_Gravado_IVA_105" varchar,
  "Importe_IVA_105" varchar,
  "Neto_Gravado_IVA_21" varchar,
  "Importe_IVA_21" varchar,
  "Neto_Gravado_IVA_27" varchar,
  "Importe_IVA_27" varchar,
  "Total_Neto_Gravado" varchar,
  "Total_IVA" varchar
);

CREATE INDEX ON "clientes" ("cuit");

CREATE INDEX ON "proveedores" ("denominacion");

CREATE INDEX ON "comprobantes_compra" ("id_cliente", "periodo_imputacion");

CREATE INDEX ON "comprobantes_venta" ("id_cliente");

ALTER TABLE "comprobantes_compra" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "comprobantes_venta" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

CREATE PROCEDURE get_proveedores_cliente(id_cliente varchar)
LANGUAGE SQL
AS $$
SELECT comprobantes_compra.Denominacion_Vendedor, proveedores.denominacion
FROM comprobantes_compra
JOIN proveedores
ON comprobantes_compra.Denominacion_Vendedor = proveedores.denominacion
AND comprobantes_compra.id_cliente = id_cliente;
$$;