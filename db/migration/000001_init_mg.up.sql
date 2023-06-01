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
  "fecha_de_emision" varchar,
  "tipo_de_comprobante" varchar,
  "punto_de_venta" varchar,
  "numero_de_comprobante" varchar,
  "tipo_doc_vendedor" varchar,
  "nro_doc_vendedor" varchar,
  "denominacion_vendedor" varchar,
  "importe_total" varchar,
  "moneda_original" varchar,
  "tipo_de_cambio" varchar,
  "importe_no_gravado" varchar,
  "importe_exento" varchar,
  "credito_fiscal_computable" varchar,
  "importe_de_per_o_pagos_a_cta_de_otros_imp_nac" varchar,
  "importe_de_percepciones_de_ingresos_brutos" varchar,
  "importe_de_impuestos_municipales" varchar,
  "importe_de_percepciones_o_pagos_a_cuenta_de_iva" varchar,
  "importe_de_impuestos_internos" varchar,
  "importe_otros_tributos" varchar,
  "neto_gravado_iva_0" varchar,
  "neto_gravado_iva_25" varchar,
  "importe_iva_25" varchar,
  "neto_gravado_iva_5" varchar,
  "importe_iva_5" varchar,
  "neto_gravado_iva_105" varchar,
  "importe_iva_105" varchar,
  "neto_gravado_iva_21" varchar,
  "importe_iva_21" varchar,
  "neto_gravado_iva_27" varchar,
  "importe_iva_27" varchar,
  "total_neto_gravado" varchar,
  "total_iva" varchar
);

CREATE TABLE "comprobantes_venta_csv" (
  "fecha_de_emision" varchar,
  "tipo_de_comprobante" varchar,
  "punto_de_venta" varchar,
  "numero_de_comprobante" varchar,
  "numero_de_comprobante_hasta" varchar,
  "tipo_doc_comprador" varchar,
  "nro_doc_comprador" varchar,
  "denominacion_comprador" varchar,
  "fecha_de_vencimiento_del_pago" varchar,
  "importe_total" varchar,
  "moneda_original" varchar,
  "tipo_de_cambio" varchar,
  "importe_no_gravado" varchar,
  "importe_exento" varchar,
  "importe_de_per_o_pagos_a_cta_de_otros_imp_nac" varchar,
  "importe_de_percepciones_de_ingresos_brutos" varchar,
  "importe_de_impuestos_municipales" varchar,
  "percepcion_a_no_categorizados" varchar,
  "importe_de_impuestos_internos" varchar,
  "importe_otros_tributos" varchar,
  "neto_gravado_iva_0" varchar,
  "neto_gravado_iva_25" varchar,
  "importe_iva_25" varchar,
  "neto_gravado_iva_5" varchar,
  "importe_iva_5" varchar,
  "neto_gravado_iva_105" varchar,
  "importe_iva_105" varchar,
  "neto_gravado_iva_21" varchar,
  "importe_iva_21" varchar,
  "neto_gravado_iva_27" varchar,
  "importe_iva_27" varchar,
  "total_neto_gravado" varchar,
  "total_iva" varchar
);

CREATE TABLE "comprobantes_compra" (
  "id_cliente" bigint PRIMARY KEY,
  "periodo_imputacion" varchar(7) NOT NULL,
  "pendiente_imputacion" bool NOT NULL DEFAULT false,
  "fecha_de_emision" timestamptz,
  "tipo_de_comprobante" varchar(3),
  "punto_de_venta" varchar(5),
  "numero_de_comprobante" varchar(20),
  "tipo_doc_vendedor" varchar(2),
  "nro_doc_vendedor" varchar(20),
  "denominacion_vendedor" varchar(30),
  "importe_total" integer,
  "moneda_original" varchar,
  "tipo_de_cambio" varchar,
  "importe_no_gravado" integer,
  "importe_exento" integer,
  "credito_fiscal_computable" integer,
  "importe_de_per_o_pagos_a_cta_de_otros_imp_nac" integer,
  "importe_de_percepciones_de_ingresos_brutos" integer,
  "importe_de_impuestos_municipales" integer,
  "importe_de_percepciones_o_pagos_a_cuenta_de_iva" integer,
  "importe_de_impuestos_internos" integer,
  "importe_otros_tributos" integer,
  "neto_gravado_iva_0" integer,
  "neto_gravado_iva_25" integer,
  "importe_iva_25" integer,
  "neto_gravado_iva_5" integer,
  "importe_iva_5" integer,
  "neto_gravado_iva_105" integer,
  "importe_iva_105" integer,
  "neto_gravado_iva_21" integer,
  "importe_iva_21" integer,
  "neto_gravado_iva_27" integer,
  "importe_iva_27" integer,
  "total_neto_gravado" integer,
  "total_iva" integer
);

CREATE TABLE "comprobantes_venta" (
  "id_cliente" bigint PRIMARY KEY,
  "fecha_de_emision" timestamptz,
  "tipo_de_comprobante" varchar(3),
  "punto_de_venta" varchar(5),
  "numero_de_comprobante" varchar(20),
  "tipo_doc_vendedor" varchar(2),
  "nro_doc_vendedor" varchar(20),
  "denominacion_vendedor" varchar(30),
  "importe_total" varchar,
  "moneda_original" varchar,
  "tipo_de_cambio" varchar,
  "importe_no_gravado" varchar,
  "importe_exento" varchar,
  "credito_fiscal_computable" varchar,
  "importe_de_per_o_pagos_a_cta_de_otros_imp_nac" varchar,
  "importe_de_percepciones_de_ingresos_brutos" varchar,
  "importe_de_impuestos_municipales" varchar,
  "importe_de_percepciones_o_pagos_a_cuenta_de_iva" varchar,
  "importe_de_impuestos_internos" varchar,
  "importe_otros_tributos" varchar,
  "neto_gravado_iva_0" varchar,
  "neto_gravado_iva_25" varchar,
  "importe_iva_25" varchar,
  "neto_gravado_iva_5" varchar,
  "importe_iva_5" varchar,
  "neto_gravado_iva_105" varchar,
  "importe_iva_105" varchar,
  "neto_gravado_iva_21" varchar,
  "importe_iva_21" varchar,
  "neto_gravado_iva_27" varchar,
  "importe_iva_27" varchar,
  "total_neto_gravado" varchar,
  "total_iva" varchar
);

CREATE INDEX ON "clientes" ("cuit");

CREATE INDEX ON "proveedores" ("denominacion");

CREATE INDEX ON "comprobantes_compra" ("id_cliente", "periodo_imputacion");

CREATE INDEX ON "comprobantes_venta" ("id_cliente");

ALTER TABLE "comprobantes_compra" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "comprobantes_venta" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

CREATE PROCEDURE get_proveedores_cliente(idCliente bigint)
LANGUAGE SQL
AS $$
SELECT comprobantes_compra.denominacion_vendedor, proveedores.denominacion
FROM comprobantes_compra
INNER JOIN proveedores
ON comprobantes_compra.denominacion_vendedor = proveedores.denominacion
AND comprobantes_compra.id_cliente = idCliente;
$$;