
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/25/2016 11:59:41
-- Generated from EDMX file: D:\wilmer\developer\github\data\DLR-POS\puntoVentaModelo\puntoVentaModelo\puntoVentaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [punto_venta];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_almacen_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[almacen] DROP CONSTRAINT [FK_almacen_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_banco_tercero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[banco] DROP CONSTRAINT [FK_banco_tercero];
GO
IF OBJECT_ID(N'[dbo].[FK_cajero_caja]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cajero] DROP CONSTRAINT [FK_cajero_caja];
GO
IF OBJECT_ID(N'[dbo].[FK_cajero_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cajero] DROP CONSTRAINT [FK_cajero_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_cliente_categoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_cliente_categoria];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_cliente_subcategoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_cliente_subcategoria];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente] DROP CONSTRAINT [FK_cliente_persona];
GO
IF OBJECT_ID(N'[dbo].[FK_cliente_subcategoria_cliente_categoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cliente_subcategoria] DROP CONSTRAINT [FK_cliente_subcategoria_cliente_categoria];
GO
IF OBJECT_ID(N'[dbo].[FK_combo_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[combo] DROP CONSTRAINT [FK_combo_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_compra_pago_anulados_compra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[compra_pago_anulados] DROP CONSTRAINT [FK_compra_pago_anulados_compra];
GO
IF OBJECT_ID(N'[dbo].[FK_compra_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[compra] DROP CONSTRAINT [FK_compra_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_compra_suplidor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[compra] DROP CONSTRAINT [FK_compra_suplidor];
GO
IF OBJECT_ID(N'[dbo].[FK_compra_vs_pagos_compra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[compra_vs_pagos] DROP CONSTRAINT [FK_compra_vs_pagos_compra];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_compra_vs_producto_producto]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[compra_detalle] DROP CONSTRAINT [FK_compra_vs_producto_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_comprobante_fiscal_comprobante_serie]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comprobante_fiscal] DROP CONSTRAINT [FK_comprobante_fiscal_comprobante_serie];
GO
IF OBJECT_ID(N'[dbo].[FK_comprobante_fiscal_tipo_comprobante_fiscal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comprobante_fiscal] DROP CONSTRAINT [FK_comprobante_fiscal_tipo_comprobante_fiscal];
GO
IF OBJECT_ID(N'[dbo].[FK_comprobante_ventas_caja]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comprobante_ventas] DROP CONSTRAINT [FK_comprobante_ventas_caja];
GO
IF OBJECT_ID(N'[dbo].[FK_comprobante_ventas_tipo_comprobante_fiscal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comprobante_ventas] DROP CONSTRAINT [FK_comprobante_ventas_tipo_comprobante_fiscal];
GO
IF OBJECT_ID(N'[dbo].[FK_cotizacion_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cotizacion] DROP CONSTRAINT [FK_cotizacion_cliente];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_cotizacion_detalles_cotizacion]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[cotizacion_detalles] DROP CONSTRAINT [FK_cotizacion_detalles_cotizacion];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_cotizacion_detalles_producto]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[cotizacion_detalles] DROP CONSTRAINT [FK_cotizacion_detalles_producto];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_cotizacion_detalles_unidad]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[cotizacion_detalles] DROP CONSTRAINT [FK_cotizacion_detalles_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_cotizacion_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cotizacion] DROP CONSTRAINT [FK_cotizacion_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_cotizacion_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cotizacion] DROP CONSTRAINT [FK_cotizacion_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_cuadre_caja_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cuadre_caja] DROP CONSTRAINT [FK_cuadre_caja_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_cuenta_bancaria_tipo_cuenta_bancaria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cuenta_bancaria] DROP CONSTRAINT [FK_cuenta_bancaria_tipo_cuenta_bancaria];
GO
IF OBJECT_ID(N'[dbo].[FK_departamento_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[departamento] DROP CONSTRAINT [FK_departamento_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_direccion_sector]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[direccion] DROP CONSTRAINT [FK_direccion_sector];
GO
IF OBJECT_ID(N'[dbo].[FK_egresos_caja_cajero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[egresos_caja] DROP CONSTRAINT [FK_egresos_caja_cajero];
GO
IF OBJECT_ID(N'[dbo].[FK_empleado_departamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empleado] DROP CONSTRAINT [FK_empleado_departamento];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_empleado_historial_datos_cargo]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[empleado_historial_datos] DROP CONSTRAINT [FK_empleado_historial_datos_cargo];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_empleado_historial_datos_empleado]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[empleado_historial_datos] DROP CONSTRAINT [FK_empleado_historial_datos_empleado];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_empleado_historial_datos_empleado1]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[empleado_historial_datos] DROP CONSTRAINT [FK_empleado_historial_datos_empleado1];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_empleado_historial_datos_situacion_empleado]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[empleado_historial_datos] DROP CONSTRAINT [FK_empleado_historial_datos_situacion_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_empleado_persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empleado] DROP CONSTRAINT [FK_empleado_persona];
GO
IF OBJECT_ID(N'[dbo].[FK_empleado_situacion_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empleado] DROP CONSTRAINT [FK_empleado_situacion_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_empleado_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empleado] DROP CONSTRAINT [FK_empleado_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_empleado_vs_cargo_cargo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empleado_vs_cargo] DROP CONSTRAINT [FK_empleado_vs_cargo_cargo];
GO
IF OBJECT_ID(N'[dbo].[FK_empresa_tercero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[empresa] DROP CONSTRAINT [FK_empresa_tercero];
GO
IF OBJECT_ID(N'[dbo].[FK_entrada_salida_inventario_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[entrada_salida_inventario] DROP CONSTRAINT [FK_entrada_salida_inventario_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_entrada_salida_inventario_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[entrada_salida_inventario] DROP CONSTRAINT [FK_entrada_salida_inventario_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_entrada_salida_inventario_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[entrada_salida_inventario] DROP CONSTRAINT [FK_entrada_salida_inventario_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_factura_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[factura] DROP CONSTRAINT [FK_factura_cliente];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_factura_detalle_factura]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[factura_detalle] DROP CONSTRAINT [FK_factura_detalle_factura];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_factura_detalle_producto]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[factura_detalle] DROP CONSTRAINT [FK_factura_detalle_producto];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_factura_detalle_unidad]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[factura_detalle] DROP CONSTRAINT [FK_factura_detalle_unidad];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_facturas_anuladas_factura]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[facturas_anuladas] DROP CONSTRAINT [FK_facturas_anuladas_factura];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_grupo_usuarios_permisos_grupo_usuarios]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[grupo_usuarios_permisos] DROP CONSTRAINT [FK_grupo_usuarios_permisos_grupo_usuarios];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_grupo_usuarios_permisos_permiso]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[grupo_usuarios_permisos] DROP CONSTRAINT [FK_grupo_usuarios_permisos_permiso];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_compras_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_compras] DROP CONSTRAINT [FK_historial_devolucion_compras_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_compras_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_compras] DROP CONSTRAINT [FK_historial_devolucion_compras_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_compras_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_compras] DROP CONSTRAINT [FK_historial_devolucion_compras_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_ventas_factura]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_ventas] DROP CONSTRAINT [FK_historial_devolucion_ventas_factura];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_ventas_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_ventas] DROP CONSTRAINT [FK_historial_devolucion_ventas_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_devolucion_ventas_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[historial_devolucion_ventas] DROP CONSTRAINT [FK_historial_devolucion_ventas_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_movimientos_inventario_almacen]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_historial_movimientos_inventario_almacen];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_movimientos_inventario_almacen1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_historial_movimientos_inventario_almacen1];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_movimientos_inventario_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_historial_movimientos_inventario_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_movimientos_inventario_tipo_movimiento_inventario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_historial_movimientos_inventario_tipo_movimiento_inventario];
GO
IF OBJECT_ID(N'[dbo].[FK_historial_movimientos_inventario_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_historial_movimientos_inventario_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_identificacion_tercero1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[identificacion] DROP CONSTRAINT [FK_identificacion_tercero1];
GO
IF OBJECT_ID(N'[dbo].[FK_identificacion_tipo_identificacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[identificacion] DROP CONSTRAINT [FK_identificacion_tipo_identificacion];
GO
IF OBJECT_ID(N'[dbo].[FK_ingresos_caja_cajero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ingresos_caja] DROP CONSTRAINT [FK_ingresos_caja_cajero];
GO
IF OBJECT_ID(N'[dbo].[FK_ingresos_caja_ingresos_conceptos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ingresos_caja] DROP CONSTRAINT [FK_ingresos_caja_ingresos_conceptos];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario] DROP CONSTRAINT [FK_inventario_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_reparacion_estados_reparacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario_reparacion] DROP CONSTRAINT [FK_inventario_reparacion_estados_reparacion];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_reparacion_marcas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario_reparacion] DROP CONSTRAINT [FK_inventario_reparacion_marcas];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_reparacion_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario_reparacion] DROP CONSTRAINT [FK_inventario_reparacion_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_reparacion_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario_reparacion] DROP CONSTRAINT [FK_inventario_reparacion_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_inventario_unidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventario] DROP CONSTRAINT [FK_inventario_unidad];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_mesas_detalles_mesas]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[mesas_detalles] DROP CONSTRAINT [FK_mesas_detalles_mesas];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_mesas_detalles_producto_detalle]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[mesas_detalles] DROP CONSTRAINT [FK_mesas_detalles_producto_detalle];
GO
IF OBJECT_ID(N'[dbo].[FK_modelo_marcas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[modelo] DROP CONSTRAINT [FK_modelo_marcas];
GO
IF OBJECT_ID(N'[dbo].[FK_moneda_historial_moneda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[moneda_historial] DROP CONSTRAINT [FK_moneda_historial_moneda];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_nomina_detalle_nomina]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[nomina_detalle] DROP CONSTRAINT [FK_nomina_detalle_nomina];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_nomina_detalle_nomina_conceptos]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[nomina_detalle] DROP CONSTRAINT [FK_nomina_detalle_nomina_conceptos];
GO
IF OBJECT_ID(N'[dbo].[FK_nomina_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nomina] DROP CONSTRAINT [FK_nomina_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_nomina_nomina_tipos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nomina] DROP CONSTRAINT [FK_nomina_nomina_tipos];
GO
IF OBJECT_ID(N'[dbo].[FK_nomina_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[nomina] DROP CONSTRAINT [FK_nomina_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_pedidos_cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_pedidos_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_pedidos_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[pedidos] DROP CONSTRAINT [FK_pedidos_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_persona_sexo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[persona] DROP CONSTRAINT [FK_persona_sexo];
GO
IF OBJECT_ID(N'[dbo].[FK_persona_tercero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[persona] DROP CONSTRAINT [FK_persona_tercero];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_almacen]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_producto_almacen];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_producto_codigobarra_producto]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[producto_codigobarra] DROP CONSTRAINT [FK_producto_codigobarra_producto];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_producto_codigobarra_unidad]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[producto_codigobarra] DROP CONSTRAINT [FK_producto_codigobarra_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_detalle_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto_vs_detalle] DROP CONSTRAINT [FK_producto_detalle_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_detalle_producto_especificacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto_vs_detalle] DROP CONSTRAINT [FK_producto_detalle_producto_especificacion];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_itebis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_producto_itebis];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_producto_oferta_historial_producto_oferta]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[producto_oferta_historial] DROP CONSTRAINT [FK_producto_oferta_historial_producto_oferta];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_subcategoria_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_producto_subcategoria_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_producto_tipo_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_producto_tipo_producto];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_producto_unidad_producto]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[producto_unidad] DROP CONSTRAINT [FK_producto_unidad_producto];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_producto_unidad_unidad]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[producto_unidad] DROP CONSTRAINT [FK_producto_unidad_unidad];
GO
IF OBJECT_ID(N'[dbo].[FK_provincia_region]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[provincia] DROP CONSTRAINT [FK_provincia_region];
GO
IF OBJECT_ID(N'[dbo].[FK_region_pais]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[region] DROP CONSTRAINT [FK_region_pais];
GO
IF OBJECT_ID(N'[dbo].[FK_sector_provincia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sector] DROP CONSTRAINT [FK_sector_provincia];
GO
IF OBJECT_ID(N'[dbo].[FK_sistema_modulo_opciones_sistema_modulos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sistema_modulo_opciones] DROP CONSTRAINT [FK_sistema_modulo_opciones_sistema_modulos];
GO
IF OBJECT_ID(N'[dbo].[FK_subcategoria_producto_categoria_producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[subcategoria_producto] DROP CONSTRAINT [FK_subcategoria_producto_categoria_producto];
GO
IF OBJECT_ID(N'[dbo].[FK_sucursal_empresa1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sucursal] DROP CONSTRAINT [FK_sucursal_empresa1];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_sucursal_vs_empleado_empleado]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[sucursal_vs_empleado] DROP CONSTRAINT [FK_sucursal_vs_empleado_empleado];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_sucursal_vs_empleado_sucursal]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[sucursal_vs_empleado] DROP CONSTRAINT [FK_sucursal_vs_empleado_sucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_suplidor_persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[suplidor] DROP CONSTRAINT [FK_suplidor_persona];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_tercero_observaciones_tercero]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[tercero_observaciones] DROP CONSTRAINT [FK_tercero_observaciones_tercero];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_tercero_vs_email_tercero]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[tercero_vs_email] DROP CONSTRAINT [FK_tercero_vs_email_tercero];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_tercero_vs_permiso_permiso]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[tercero_vs_permiso] DROP CONSTRAINT [FK_tercero_vs_permiso_permiso];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_tercero_vs_permiso_tercero]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[tercero_vs_permiso] DROP CONSTRAINT [FK_tercero_vs_permiso_tercero];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[FK_tervero_vs_telefono_tercero]', 'F') IS NOT NULL
    ALTER TABLE [puntoVentaModelStoreContainer].[tercero_vs_telefono] DROP CONSTRAINT [FK_tervero_vs_telefono_tercero];
GO
IF OBJECT_ID(N'[dbo].[FK_transferencia_inventario_sucursal1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transferencia_inventario] DROP CONSTRAINT [FK_transferencia_inventario_sucursal1];
GO
IF OBJECT_ID(N'[dbo].[FK_vendedor_tercero]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[vendedor] DROP CONSTRAINT [FK_vendedor_tercero];
GO
IF OBJECT_ID(N'[dbo].[FK_venta_vs_pagos_empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[venta_vs_pagos] DROP CONSTRAINT [FK_venta_vs_pagos_empleado];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[almacen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[almacen];
GO
IF OBJECT_ID(N'[dbo].[banco]', 'U') IS NOT NULL
    DROP TABLE [dbo].[banco];
GO
IF OBJECT_ID(N'[dbo].[caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[caja];
GO
IF OBJECT_ID(N'[dbo].[cajero]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cajero];
GO
IF OBJECT_ID(N'[dbo].[cargo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cargo];
GO
IF OBJECT_ID(N'[dbo].[catalogo_cuentas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[catalogo_cuentas];
GO
IF OBJECT_ID(N'[dbo].[categoria_producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[categoria_producto];
GO
IF OBJECT_ID(N'[dbo].[cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cliente];
GO
IF OBJECT_ID(N'[dbo].[cliente_categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cliente_categoria];
GO
IF OBJECT_ID(N'[dbo].[cliente_subcategoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cliente_subcategoria];
GO
IF OBJECT_ID(N'[dbo].[combo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[combo];
GO
IF OBJECT_ID(N'[dbo].[compra]', 'U') IS NOT NULL
    DROP TABLE [dbo].[compra];
GO
IF OBJECT_ID(N'[dbo].[compra_pago_anulados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[compra_pago_anulados];
GO
IF OBJECT_ID(N'[dbo].[compra_vs_pagos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[compra_vs_pagos];
GO
IF OBJECT_ID(N'[dbo].[comprobante_fiscal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comprobante_fiscal];
GO
IF OBJECT_ID(N'[dbo].[comprobante_serie]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comprobante_serie];
GO
IF OBJECT_ID(N'[dbo].[comprobante_ventas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comprobante_ventas];
GO
IF OBJECT_ID(N'[dbo].[correo_electronicos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[correo_electronicos];
GO
IF OBJECT_ID(N'[dbo].[cotizacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cotizacion];
GO
IF OBJECT_ID(N'[dbo].[cuadre_caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cuadre_caja];
GO
IF OBJECT_ID(N'[dbo].[cuenta_bancaria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cuenta_bancaria];
GO
IF OBJECT_ID(N'[dbo].[departamento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[departamento];
GO
IF OBJECT_ID(N'[dbo].[direccion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[direccion];
GO
IF OBJECT_ID(N'[dbo].[egresos_caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[egresos_caja];
GO
IF OBJECT_ID(N'[dbo].[egresos_conceptos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[egresos_conceptos];
GO
IF OBJECT_ID(N'[dbo].[empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[empleado];
GO
IF OBJECT_ID(N'[dbo].[empleado_vs_cargo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[empleado_vs_cargo];
GO
IF OBJECT_ID(N'[dbo].[empresa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[empresa];
GO
IF OBJECT_ID(N'[dbo].[entrada_salida_inventario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[entrada_salida_inventario];
GO
IF OBJECT_ID(N'[dbo].[estados_reparacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[estados_reparacion];
GO
IF OBJECT_ID(N'[dbo].[factura]', 'U') IS NOT NULL
    DROP TABLE [dbo].[factura];
GO
IF OBJECT_ID(N'[dbo].[grupo_usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[grupo_usuarios];
GO
IF OBJECT_ID(N'[dbo].[historial_devolucion_compras]', 'U') IS NOT NULL
    DROP TABLE [dbo].[historial_devolucion_compras];
GO
IF OBJECT_ID(N'[dbo].[historial_devolucion_ventas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[historial_devolucion_ventas];
GO
IF OBJECT_ID(N'[dbo].[identificacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[identificacion];
GO
IF OBJECT_ID(N'[dbo].[ingresos_caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ingresos_caja];
GO
IF OBJECT_ID(N'[dbo].[ingresos_conceptos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ingresos_conceptos];
GO
IF OBJECT_ID(N'[dbo].[inventario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inventario];
GO
IF OBJECT_ID(N'[dbo].[inventario_reparacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inventario_reparacion];
GO
IF OBJECT_ID(N'[dbo].[itebis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[itebis];
GO
IF OBJECT_ID(N'[dbo].[marcas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[marcas];
GO
IF OBJECT_ID(N'[dbo].[mesas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mesas];
GO
IF OBJECT_ID(N'[dbo].[modelo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[modelo];
GO
IF OBJECT_ID(N'[dbo].[moneda]', 'U') IS NOT NULL
    DROP TABLE [dbo].[moneda];
GO
IF OBJECT_ID(N'[dbo].[moneda_historial]', 'U') IS NOT NULL
    DROP TABLE [dbo].[moneda_historial];
GO
IF OBJECT_ID(N'[dbo].[nomina]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nomina];
GO
IF OBJECT_ID(N'[dbo].[nomina_conceptos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nomina_conceptos];
GO
IF OBJECT_ID(N'[dbo].[nomina_tipos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[nomina_tipos];
GO
IF OBJECT_ID(N'[dbo].[pais]', 'U') IS NOT NULL
    DROP TABLE [dbo].[pais];
GO
IF OBJECT_ID(N'[dbo].[pedidos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[pedidos];
GO
IF OBJECT_ID(N'[dbo].[permiso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[permiso];
GO
IF OBJECT_ID(N'[dbo].[persona]', 'U') IS NOT NULL
    DROP TABLE [dbo].[persona];
GO
IF OBJECT_ID(N'[dbo].[producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[producto];
GO
IF OBJECT_ID(N'[dbo].[producto_detalle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[producto_detalle];
GO
IF OBJECT_ID(N'[dbo].[producto_oferta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[producto_oferta];
GO
IF OBJECT_ID(N'[dbo].[producto_permisos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[producto_permisos];
GO
IF OBJECT_ID(N'[dbo].[producto_vs_detalle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[producto_vs_detalle];
GO
IF OBJECT_ID(N'[dbo].[provincia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[provincia];
GO
IF OBJECT_ID(N'[dbo].[region]', 'U') IS NOT NULL
    DROP TABLE [dbo].[region];
GO
IF OBJECT_ID(N'[dbo].[sector]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sector];
GO
IF OBJECT_ID(N'[dbo].[sexo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sexo];
GO
IF OBJECT_ID(N'[dbo].[sistema_historial]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sistema_historial];
GO
IF OBJECT_ID(N'[dbo].[sistema_modulo_opciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sistema_modulo_opciones];
GO
IF OBJECT_ID(N'[dbo].[sistema_modulos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sistema_modulos];
GO
IF OBJECT_ID(N'[dbo].[situacion_empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[situacion_empleado];
GO
IF OBJECT_ID(N'[dbo].[subcategoria_producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[subcategoria_producto];
GO
IF OBJECT_ID(N'[dbo].[sucursal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sucursal];
GO
IF OBJECT_ID(N'[dbo].[suplidor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[suplidor];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tarjetas_credito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tarjetas_credito];
GO
IF OBJECT_ID(N'[dbo].[tercero]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tercero];
GO
IF OBJECT_ID(N'[dbo].[tipo_comprobante_fiscal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo_comprobante_fiscal];
GO
IF OBJECT_ID(N'[dbo].[tipo_cuenta_bancaria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo_cuenta_bancaria];
GO
IF OBJECT_ID(N'[dbo].[tipo_identificacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo_identificacion];
GO
IF OBJECT_ID(N'[dbo].[tipo_movimiento_inventario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tipo_movimiento_inventario];
GO
IF OBJECT_ID(N'[dbo].[transferencia_inventario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[transferencia_inventario];
GO
IF OBJECT_ID(N'[dbo].[unidad]', 'U') IS NOT NULL
    DROP TABLE [dbo].[unidad];
GO
IF OBJECT_ID(N'[dbo].[vendedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[vendedor];
GO
IF OBJECT_ID(N'[dbo].[venta_vs_pagos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[venta_vs_pagos];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[compra_detalle]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[compra_detalle];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[cotizacion_detalles]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[cotizacion_detalles];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[empleado_historial_datos]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[empleado_historial_datos];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[factura_detalle]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[factura_detalle];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[facturas_anuladas]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[facturas_anuladas];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[grupo_usuarios_permisos]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[grupo_usuarios_permisos];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[mesas_detalles]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[mesas_detalles];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[nomina_detalle]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[nomina_detalle];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[producto_codigobarra]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[producto_codigobarra];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[producto_oferta_historial]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[producto_oferta_historial];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[producto_unidad]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[producto_unidad];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[sistema]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[sistema];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[sucursal_vs_empleado]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[sucursal_vs_empleado];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[tercero_observaciones]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[tercero_observaciones];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[tercero_vs_email]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[tercero_vs_email];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[tercero_vs_permiso]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[tercero_vs_permiso];
GO
IF OBJECT_ID(N'[puntoVentaModelStoreContainer].[tercero_vs_telefono]', 'U') IS NOT NULL
    DROP TABLE [puntoVentaModelStoreContainer].[tercero_vs_telefono];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'almacen'
CREATE TABLE [dbo].[almacen] (
    [codigo] int  NOT NULL,
    [nombre] varchar(100)  NULL,
    [estado] bit  NOT NULL,
    [sucursal_codigo] int  NOT NULL
);
GO

-- Creating table 'banco'
CREATE TABLE [dbo].[banco] (
    [codigo] int  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'caja'
CREATE TABLE [dbo].[caja] (
    [codigo] int  NOT NULL,
    [nombre] varchar(100)  NOT NULL,
    [secuencia] varchar(100)  NULL,
    [cod_sucursal] int  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'cajero'
CREATE TABLE [dbo].[cajero] (
    [codigo] int  NOT NULL,
    [estado] bit  NULL,
    [caja_codigo] int  NULL,
    [empleado_codigo] int  NULL
);
GO

-- Creating table 'cargo'
CREATE TABLE [dbo].[cargo] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'catalogo_cuentas'
CREATE TABLE [dbo].[catalogo_cuentas] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(max)  NULL,
    [numero_cuenta] varchar(max)  NULL,
    [cuenta_master] bit  NULL,
    [cuenta_sub_master] bit  NULL,
    [cuenta_acumulativa] bit  NULL,
    [cuenta_movimiento] bit  NULL,
    [origen_credito] bit  NULL,
    [origen_debito] bit  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'categoria_producto'
CREATE TABLE [dbo].[categoria_producto] (
    [codigo] int  NOT NULL,
    [nombre] varchar(100)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'cliente'
CREATE TABLE [dbo].[cliente] (
    [codigo] int  NOT NULL,
    [limite_credito] float  NULL,
    [estado] bit  NOT NULL,
    [fecha_creado] datetime  NULL,
    [abrir_credito] bit  NULL,
    [cod_sucursal_creado] int  NULL,
    [cliente_contado] bit  NULL,
    [cliente_categoria_codigo] int  NULL,
    [cliente_subcategoria_codigo] int  NULL
);
GO

-- Creating table 'cliente_categoria'
CREATE TABLE [dbo].[cliente_categoria] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'cliente_subcategoria'
CREATE TABLE [dbo].[cliente_subcategoria] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL,
    [cliente_categoria_codigo] int  NULL
);
GO

-- Creating table 'combo'
CREATE TABLE [dbo].[combo] (
    [codigo] int  NOT NULL,
    [precio] float  NOT NULL,
    [estado] bit  NULL,
    [cod_sucursal] int  NOT NULL
);
GO

-- Creating table 'compra'
CREATE TABLE [dbo].[compra] (
    [codigo] int  NOT NULL,
    [num_factura] varchar(50)  NOT NULL,
    [fecha] datetime  NULL,
    [ncf] varchar(50)  NULL,
    [rnc] varchar(50)  NULL,
    [cod_tipo] varchar(5)  NOT NULL,
    [estado] int  NULL,
    [fecha_limite] datetime  NULL,
    [pagada] bit  NULL,
    [efectivo] float  NULL,
    [cheque] float  NULL,
    [deposito] float  NULL,
    [sucursal_codigo] int  NULL,
    [suplidor_codigo] int  NOT NULL
);
GO

-- Creating table 'compra_pago_anulados'
CREATE TABLE [dbo].[compra_pago_anulados] (
    [codigo] int  NOT NULL,
    [cod_pago] int  NULL,
    [detalle] varchar(500)  NULL,
    [cod_empleado] int  NULL,
    [fecha] datetime  NULL,
    [compra_codigo] int  NULL
);
GO

-- Creating table 'compra_vs_pagos'
CREATE TABLE [dbo].[compra_vs_pagos] (
    [codigo] int  NOT NULL,
    [monto] float  NOT NULL,
    [devuelta] float  NULL,
    [tarjeta] float  NULL,
    [cheque] float  NULL,
    [deposito] float  NULL,
    [descuento] float  NULL,
    [fecha] datetime  NOT NULL,
    [estado] bit  NOT NULL,
    [cod_empleado] int  NOT NULL,
    [detalle] varchar(2000)  NULL,
    [cod_empleado_anular] int  NULL,
    [motivo_anular] varchar(max)  NULL,
    [compra_codigo] int  NOT NULL
);
GO

-- Creating table 'comprobante_fiscal'
CREATE TABLE [dbo].[comprobante_fiscal] (
    [codigo] int  NOT NULL,
    [cod_caja] int  NULL,
    [desde_numero] int  NULL,
    [hasta_numero] int  NULL,
    [contador] int  NULL,
    [avisar] int  NULL,
    [fecha] datetime  NULL,
    [comprobante_serie_codigo] int  NULL,
    [tipo_comprobante_fiscal_codigo] int  NULL
);
GO

-- Creating table 'comprobante_serie'
CREATE TABLE [dbo].[comprobante_serie] (
    [codigo] int  NOT NULL,
    [serie] varchar(1)  NOT NULL,
    [nombre] varchar(100)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'comprobante_ventas'
CREATE TABLE [dbo].[comprobante_ventas] (
    [codigo] int  NOT NULL,
    [contador] int  NULL,
    [caja_codigo] int  NULL,
    [tipo_comprobante_fiscal_codigo] int  NULL
);
GO

-- Creating table 'correo_electronicos'
CREATE TABLE [dbo].[correo_electronicos] (
    [codigo] int  NOT NULL,
    [correo] varchar(max)  NULL,
    [clave] varchar(max)  NOT NULL,
    [ssl_activo] bit  NOT NULL,
    [host] varchar(max)  NOT NULL,
    [puerto] int  NOT NULL
);
GO

-- Creating table 'cotizacion'
CREATE TABLE [dbo].[cotizacion] (
    [codigo] int  NOT NULL,
    [num_cotizacion] varchar(50)  NULL,
    [fecha] datetime  NULL,
    [estado] bit  NULL,
    [cliente_codigo] int  NULL,
    [empleado_codigo] int  NULL,
    [sucursal_codigo] int  NULL
);
GO

-- Creating table 'cuadre_caja'
CREATE TABLE [dbo].[cuadre_caja] (
    [codigo] int  NOT NULL,
    [cod_cajero] int  NOT NULL,
    [fecha] datetime  NOT NULL,
    [turno] int  NOT NULL,
    [efectivo] float  NULL,
    [cheque] float  NULL,
    [transferencia] float  NULL,
    [efectivo_inicial] float  NULL,
    [sobrante] float  NULL,
    [faltante] float  NULL,
    [abierta_cerrada] varchar(10)  NULL,
    [estado] int  NULL,
    [tarjeta] float  NULL,
    [bonos] float  NULL,
    [orden_compra] float  NULL
);
GO

-- Creating table 'cuenta_bancaria'
CREATE TABLE [dbo].[cuenta_bancaria] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(50)  NOT NULL,
    [numero_cuenta] varchar(max)  NULL,
    [estado] bit  NOT NULL,
    [cod_titular] int  NULL,
    [cod_banco] int  NULL,
    [tipo_cuenta_bancaria_codigo] int  NOT NULL
);
GO

-- Creating table 'departamento'
CREATE TABLE [dbo].[departamento] (
    [codigo] int  NOT NULL,
    [nombre] varchar(200)  NULL,
    [estado] bit  NULL,
    [sucursal_codigo] int  NOT NULL
);
GO

-- Creating table 'direccion'
CREATE TABLE [dbo].[direccion] (
    [codigo] int  NOT NULL,
    [detalle] varchar(1000)  NOT NULL,
    [estado] bit  NOT NULL,
    [sector_codigo] int  NOT NULL
);
GO

-- Creating table 'egresos_caja'
CREATE TABLE [dbo].[egresos_caja] (
    [codigo] int  NOT NULL,
    [cod_concepto] int  NULL,
    [fecha] datetime  NULL,
    [monto] float  NULL,
    [detalles] varchar(max)  NULL,
    [afecta_cuadre] int  NULL,
    [estado] int  NULL,
    [cuadrado] int  NULL,
    [cajero_codigo] int  NULL
);
GO

-- Creating table 'egresos_conceptos'
CREATE TABLE [dbo].[egresos_conceptos] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'empleado'
CREATE TABLE [dbo].[empleado] (
    [codigo] int  NOT NULL,
    [login] varchar(30)  NOT NULL,
    [clave] varchar(30)  NOT NULL,
    [sueldo] float  NULL,
    [estado] bit  NOT NULL,
    [cod_cargo] int  NULL,
    [cod_cliente] int  NULL,
    [cod_grupo_usuario] int  NULL,
    [fecha_ingreso] datetime  NULL,
    [PERMISO] varchar(1)  NULL,
    [cod_tipo_nomina] int  NULL,
    [departamento_codigo] int  NULL,
    [situacion_empleado_codigo] int  NULL,
    [sucursal_codigo] int  NULL
);
GO

-- Creating table 'empleado_vs_cargo'
CREATE TABLE [dbo].[empleado_vs_cargo] (
    [cod_empleado] int  NOT NULL,
    [cod_cargo] int  NOT NULL
);
GO

-- Creating table 'empresa'
CREATE TABLE [dbo].[empresa] (
    [codigo] int  NOT NULL,
    [secuencia] varchar(50)  NULL,
    [division] varchar(2)  NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'entrada_salida_inventario'
CREATE TABLE [dbo].[entrada_salida_inventario] (
    [codigo] int  NOT NULL,
    [tipo_movimiento] varchar(5)  NULL,
    [cantidad] float  NULL,
    [fecha] datetime  NULL,
    [cod_almacen] int  NULL,
    [motivo] varchar(500)  NULL,
    [empleado_codigo] int  NULL,
    [producto_codigo] int  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'estados_reparacion'
CREATE TABLE [dbo].[estados_reparacion] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'factura'
CREATE TABLE [dbo].[factura] (
    [codigo] int  NOT NULL,
    [num_factura] varchar(50)  NOT NULL,
    [fecha] datetime  NOT NULL,
    [fecha_limite] datetime  NULL,
    [codigo_empleado] int  NOT NULL,
    [rnc] varchar(50)  NULL,
    [ncf] varchar(50)  NULL,
    [codigo_tipo_factura] varchar(5)  NULL,
    [cod_sucursal] int  NULL,
    [estado] int  NULL,
    [pagada] bit  NULL,
    [cod_empleado_anular] int  NULL,
    [devuelta] float  NULL,
    [itebis] float  NULL,
    [efectivo] float  NULL,
    [cheque] float  NULL,
    [deposito] float  NULL,
    [motivo_anulada] varchar(max)  NULL,
    [tarjeta] float  NULL,
    [cod_orden_compra] int  NULL,
    [monto_orden_compra] float  NULL,
    [monto_propina] float  NULL,
    [cod_vendedor] int  NULL,
    [despachado] int  NULL,
    [autorizar_pedido] int  NULL,
    [cuadrado] int  NULL,
    [descuento] float  NULL,
    [detalles] varchar(max)  NULL,
    [codigo_comprobante] int  NULL,
    [cliente_codigo] int  NULL
);
GO

-- Creating table 'grupo_usuarios'
CREATE TABLE [dbo].[grupo_usuarios] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'historial_devolucion_compras'
CREATE TABLE [dbo].[historial_devolucion_compras] (
    [codigo] int  NOT NULL,
    [codigo_compra] int  NOT NULL,
    [cantidad] float  NULL,
    [costo] float  NULL,
    [fecha] datetime  NULL,
    [empleado_codigo] int  NULL,
    [producto_codigo] int  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'historial_devolucion_ventas'
CREATE TABLE [dbo].[historial_devolucion_ventas] (
    [codigo] int  NOT NULL,
    [cantidad] float  NULL,
    [fecha] datetime  NULL,
    [codigo_empleado] int  NULL,
    [tipo_devolucion] varchar(max)  NULL,
    [factura_codigo] int  NULL,
    [producto_codigo] int  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'identificacion'
CREATE TABLE [dbo].[identificacion] (
    [codigo] int  NOT NULL,
    [identificacion1] varchar(50)  NOT NULL,
    [cod_tercero] int  NOT NULL,
    [tipo_identificacion_codigo] int  NOT NULL
);
GO

-- Creating table 'ingresos_caja'
CREATE TABLE [dbo].[ingresos_caja] (
    [codigo] int  NOT NULL,
    [fecha] datetime  NULL,
    [monto] float  NULL,
    [detalles] varchar(max)  NULL,
    [afecta_cuadre] int  NULL,
    [estado] int  NULL,
    [cuadrado] int  NULL,
    [cajero_codigo] int  NULL,
    [ingresos_conceptos_codigo] int  NULL
);
GO

-- Creating table 'ingresos_conceptos'
CREATE TABLE [dbo].[ingresos_conceptos] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'inventario'
CREATE TABLE [dbo].[inventario] (
    [codigo] int  NOT NULL,
    [existencia] float  NOT NULL,
    [fecha_entrada] datetime  NULL,
    [fecha_vencimiento] datetime  NULL,
    [costo] float  NULL,
    [precio] float  NULL,
    [producto_codigo] int  NOT NULL,
    [unidad_codigo] int  NOT NULL
);
GO

-- Creating table 'inventario_reparacion'
CREATE TABLE [dbo].[inventario_reparacion] (
    [codigo] int  NOT NULL,
    [cod_modelo] int  NULL,
    [imei] varchar(max)  NULL,
    [matricula] varchar(max)  NULL,
    [serial] varchar(max)  NULL,
    [existencia] float  NULL,
    [fecha_entrada] datetime  NULL,
    [cod_empleado_modifico] int  NULL,
    [cod_cliente_titular] int  NULL,
    [detalles] varchar(max)  NULL,
    [estado] int  NULL,
    [estados_reparacion_codigo] int  NULL,
    [marcas_codigo] int  NULL,
    [producto_codigo] int  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'itebis'
CREATE TABLE [dbo].[itebis] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(50)  NOT NULL,
    [it] int  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'marcas'
CREATE TABLE [dbo].[marcas] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'mesas'
CREATE TABLE [dbo].[mesas] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL,
    [cod_sucursal] int  NULL
);
GO

-- Creating table 'modelo'
CREATE TABLE [dbo].[modelo] (
    [codigo] int  NOT NULL,
    [nombre_modelo] varchar(max)  NULL,
    [estado] int  NULL,
    [marcas_codigo] int  NULL
);
GO

-- Creating table 'moneda'
CREATE TABLE [dbo].[moneda] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [tasa_actual] float  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'moneda_historial'
CREATE TABLE [dbo].[moneda_historial] (
    [codigo] int  NOT NULL,
    [tasa] float  NOT NULL,
    [fecha] datetime  NOT NULL,
    [moneda_codigo] int  NOT NULL
);
GO

-- Creating table 'nomina'
CREATE TABLE [dbo].[nomina] (
    [codigo] int  NOT NULL,
    [fecha_inicial] datetime  NULL,
    [fecha_final] datetime  NULL,
    [estado] int  NULL,
    [abierta_cerrada] varchar(5)  NULL,
    [cod_empleado_cerrada] int  NULL,
    [empleado_codigo] int  NULL,
    [nomina_tipos_codigo] int  NULL,
    [sucursal_codigo] int  NULL
);
GO

-- Creating table 'nomina_conceptos'
CREATE TABLE [dbo].[nomina_conceptos] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [aumenta_sueldo] int  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'nomina_tipos'
CREATE TABLE [dbo].[nomina_tipos] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'pais'
CREATE TABLE [dbo].[pais] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'pedidos'
CREATE TABLE [dbo].[pedidos] (
    [codigo] int  NOT NULL,
    [num_factura] varchar(10)  NULL,
    [fecha_creado] datetime  NULL,
    [fecha_confirmado] datetime  NULL,
    [fecha_limite] datetime  NULL,
    [estado] int  NULL,
    [cod_empleado_anulado] int  NULL,
    [motivo_anulado] varchar(max)  NULL,
    [costo_envio] float  NULL,
    [cliente_codigo] int  NULL,
    [empleado_codigo] int  NULL,
    [sucursal_codigo] int  NULL
);
GO

-- Creating table 'permiso'
CREATE TABLE [dbo].[permiso] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'persona'
CREATE TABLE [dbo].[persona] (
    [codigo] int  NOT NULL,
    [apellido] varchar(50)  NULL,
    [fecha_nacimiento] datetime  NOT NULL,
    [estado] bit  NOT NULL,
    [sexo_codigo] int  NULL
);
GO

-- Creating table 'producto'
CREATE TABLE [dbo].[producto] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NOT NULL,
    [referencia] varchar(max)  NULL,
    [estado] bit  NULL,
    [reorden] float  NULL,
    [punto_maximo] float  NULL,
    [imagen] varchar(max)  NULL,
    [cod_unidad_minima] int  NULL,
    [almacen_codigo] int  NULL,
    [categoria_producto_codigo] int  NULL,
    [itebis_codigo] int  NULL,
    [subcategoria_producto_codigo] int  NULL
);
GO

-- Creating table 'producto_detalle'
CREATE TABLE [dbo].[producto_detalle] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(100)  NOT NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'producto_oferta'
CREATE TABLE [dbo].[producto_oferta] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [descuento] float  NULL,
    [fecha_inicial] datetime  NULL,
    [fecha_final] datetime  NULL,
    [estado] int  NULL,
    [cod_sucursal] int  NULL
);
GO

-- Creating table 'producto_permisos'
CREATE TABLE [dbo].[producto_permisos] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'producto_vs_detalle'
CREATE TABLE [dbo].[producto_vs_detalle] (
    [codigo_producto] int  NOT NULL,
    [codigo_detalle] int  NOT NULL,
    [descripcion] varchar(500)  NULL
);
GO

-- Creating table 'provincia'
CREATE TABLE [dbo].[provincia] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL,
    [region_codigo] int  NOT NULL
);
GO

-- Creating table 'region'
CREATE TABLE [dbo].[region] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL,
    [pais_codigo] int  NOT NULL
);
GO

-- Creating table 'sector'
CREATE TABLE [dbo].[sector] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL,
    [provincia_codigo] int  NOT NULL
);
GO

-- Creating table 'sexo'
CREATE TABLE [dbo].[sexo] (
    [codigo] int  NOT NULL,
    [sexo1] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'sistema_historial'
CREATE TABLE [dbo].[sistema_historial] (
    [codigo] int  NOT NULL,
    [ruta_imagen_productos] varchar(max)  NULL,
    [ruta_backup] varchar(max)  NULL,
    [ruta_logo_empresa] varchar(max)  NULL,
    [codigo_moneda] int  NULL,
    [permisos_por_grupos_usuarios] int  NULL,
    [autorizar_pedidos_apartir] float  NULL,
    [limite_egreso_caja] float  NULL,
    [cod_comprobante_nota_credito] int  NULL,
    [usar_comprobantes] int  NULL,
    [fecha_vencimiento] datetime  NULL,
    [ip_server] varchar(max)  NULL,
    [base_datos] varchar(max)  NULL,
    [base_datos_usuario] varchar(max)  NULL,
    [base_datos_clave] varchar(max)  NULL,
    [ver_imagen_fact_Touch] int  NULL,
    [ver_nombre_fact_touch] int  NULL,
    [porciento_propina] float  NULL,
    [cod_empleado_modifico] int  NULL,
    [fecha_modifico] datetime  NULL
);
GO

-- Creating table 'sistema_modulo_opciones'
CREATE TABLE [dbo].[sistema_modulo_opciones] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(max)  NULL,
    [nombre_logico] varchar(max)  NULL,
    [imagen] varchar(max)  NULL,
    [estado] bit  NULL,
    [sistema_modulos_codigo] int  NOT NULL
);
GO

-- Creating table 'sistema_modulos'
CREATE TABLE [dbo].[sistema_modulos] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(max)  NULL,
    [nombre_logico] varchar(max)  NULL,
    [imagen] varchar(max)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'situacion_empleado'
CREATE TABLE [dbo].[situacion_empleado] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(50)  NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'subcategoria_producto'
CREATE TABLE [dbo].[subcategoria_producto] (
    [codigo] int  NOT NULL,
    [nombre] varchar(100)  NULL,
    [estado] bit  NULL,
    [categoria_producto_codigo] int  NULL
);
GO

-- Creating table 'sucursal'
CREATE TABLE [dbo].[sucursal] (
    [codigo] int  NOT NULL,
    [secuencia] varchar(3)  NOT NULL,
    [estado] bit  NULL,
    [empresa_codigo] int  NOT NULL
);
GO

-- Creating table 'suplidor'
CREATE TABLE [dbo].[suplidor] (
    [codigo] int  NOT NULL,
    [fecha_creacion] datetime  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tarjetas_credito'
CREATE TABLE [dbo].[tarjetas_credito] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'tercero'
CREATE TABLE [dbo].[tercero] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NOT NULL,
    [identificacion] varchar(11)  NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'tipo_comprobante_fiscal'
CREATE TABLE [dbo].[tipo_comprobante_fiscal] (
    [codigo] int  NOT NULL,
    [secuencia] varchar(2)  NULL,
    [nombre] varchar(100)  NOT NULL,
    [estado] int  NOT NULL
);
GO

-- Creating table 'tipo_cuenta_bancaria'
CREATE TABLE [dbo].[tipo_cuenta_bancaria] (
    [codigo] int  NOT NULL,
    [descripcion] varchar(50)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'tipo_identificacion'
CREATE TABLE [dbo].[tipo_identificacion] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'tipo_movimiento_inventario'
CREATE TABLE [dbo].[tipo_movimiento_inventario] (
    [codigo] varchar(5)  NOT NULL,
    [nombre] varchar(100)  NOT NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'transferencia_inventario'
CREATE TABLE [dbo].[transferencia_inventario] (
    [codigo] int  NOT NULL,
    [cantidad] float  NOT NULL,
    [fecha] datetime  NOT NULL,
    [codigo_almacen_destino] int  NULL,
    [codigo_empleado] int  NULL,
    [almacen_codigo] int  NULL,
    [almacen1_codigo] int  NULL,
    [producto_codigo] int  NOT NULL,
    [sucursal_codigo] int  NULL,
    [tipo_movimiento_inventario_codigo] varchar(5)  NULL,
    [unidad_codigo] int  NOT NULL
);
GO

-- Creating table 'unidad'
CREATE TABLE [dbo].[unidad] (
    [codigo] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [estado] bit  NULL,
    [unidad_abreviada] varchar(max)  NULL
);
GO

-- Creating table 'vendedor'
CREATE TABLE [dbo].[vendedor] (
    [codigo] int  NOT NULL,
    [porciento] float  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'venta_vs_pagos'
CREATE TABLE [dbo].[venta_vs_pagos] (
    [codigo] int  NOT NULL,
    [cod_factura] int  NOT NULL,
    [monto] float  NOT NULL,
    [devuelta] float  NULL,
    [tarjeta] float  NOT NULL,
    [cheque] float  NOT NULL,
    [transferencia] float  NULL,
    [descuento] float  NULL,
    [cod_orden_compra] int  NULL,
    [monto_orden_compra] float  NULL,
    [fecha] datetime  NOT NULL,
    [detalle] varchar(max)  NULL,
    [estado] bit  NULL,
    [cod_empleado_anular] int  NULL,
    [motivo_anulado] varchar(max)  NULL,
    [cuadrado] int  NULL,
    [empleado_codigo] int  NOT NULL
);
GO

-- Creating table 'compra_detalle'
CREATE TABLE [dbo].[compra_detalle] (
    [cod_compra] int  NOT NULL,
    [cod_producto] int  NOT NULL,
    [cod_unidad] int  NOT NULL,
    [costo] float  NULL,
    [cantidad] float  NOT NULL,
    [venta] float  NULL,
    [monto] float  NOT NULL,
    [descuento] float  NULL,
    [estado] int  NOT NULL
);
GO

-- Creating table 'cotizacion_detalles'
CREATE TABLE [dbo].[cotizacion_detalles] (
    [codigo_cotizacion] int  NOT NULL,
    [cantidad] float  NULL,
    [precio] float  NULL,
    [monto] float  NULL,
    [estado] bit  NULL,
    [producto_codigo] int  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'empleado_historial_datos'
CREATE TABLE [dbo].[empleado_historial_datos] (
    [codigo] int IDENTITY(1,1) NOT NULL,
    [cod_empleado] int  NOT NULL,
    [nombre] varchar(50)  NULL,
    [apellido] varchar(50)  NULL,
    [identificacion] varchar(15)  NULL,
    [fecha_nacimiento] datetime  NULL,
    [usuario] varchar(50)  NULL,
    [clave] varchar(50)  NULL,
    [cod_situacion] int  NOT NULL,
    [cod_sexo] int  NULL,
    [cod_cargo] int  NOT NULL,
    [cod_sucursal] int  NOT NULL,
    [cod_departamento] int  NULL,
    [sueldo] float  NULL,
    [fecha] datetime  NOT NULL,
    [fecha_ingreso] datetime  NULL,
    [cod_tipo_nomina] int  NULL,
    [empleado1_codigo] int  NULL
);
GO

-- Creating table 'factura_detalle'
CREATE TABLE [dbo].[factura_detalle] (
    [cod_factura] int  NOT NULL,
    [cod_producto] int  NOT NULL,
    [cantidad] float  NOT NULL,
    [precio] float  NOT NULL,
    [monto] float  NOT NULL,
    [itebis] float  NULL,
    [descuento] float  NULL,
    [estado] int  NOT NULL,
    [detalles] varchar(max)  NULL,
    [unidad_codigo] int  NULL
);
GO

-- Creating table 'facturas_anuladas'
CREATE TABLE [dbo].[facturas_anuladas] (
    [cod_factura] int  NOT NULL,
    [fecha] datetime  NOT NULL,
    [detalle] varchar(max)  NOT NULL
);
GO

-- Creating table 'mesas_detalles'
CREATE TABLE [dbo].[mesas_detalles] (
    [codigo_mesa] int  NOT NULL,
    [cod_detalle] int  NOT NULL,
    [descripcion] varchar(max)  NULL
);
GO

-- Creating table 'nomina_detalle'
CREATE TABLE [dbo].[nomina_detalle] (
    [cod_nomina] int  NOT NULL,
    [cod_empleado] int  NOT NULL,
    [cod_concepto] int  NOT NULL,
    [monto_sueldo] float  NOT NULL,
    [cod_empleado_modifico] int  NULL,
    [estado] int  NULL
);
GO

-- Creating table 'producto_codigobarra'
CREATE TABLE [dbo].[producto_codigobarra] (
    [cod_producto] int  NOT NULL,
    [cod_unidad] int  NOT NULL,
    [codigo_barra] varchar(max)  NOT NULL,
    [codigo] int  NULL
);
GO

-- Creating table 'producto_oferta_historial'
CREATE TABLE [dbo].[producto_oferta_historial] (
    [codigo] int  NOT NULL,
    [nombre] varchar(max)  NULL,
    [descuento] float  NULL,
    [fecha_inicial] datetime  NULL,
    [fecha_final] datetime  NULL,
    [estado] int  NULL,
    [fecha_actualizada] datetime  NULL,
    [cod_empleado_actualiza] int  NULL,
    [cod_sucursal] int  NULL
);
GO

-- Creating table 'sistema'
CREATE TABLE [dbo].[sistema] (
    [codigo] int IDENTITY(1,1) NOT NULL,
    [ruta_imagen_productos] varchar(max)  NULL,
    [ruta_backup] varchar(max)  NULL,
    [ruta_logo_empresa] varchar(max)  NULL,
    [codigo_moneda] int  NULL,
    [permisos_por_grupos_usuarios] int  NULL,
    [autorizar_pedidos_apartir] float  NULL,
    [limite_egreso_caja] float  NULL,
    [cod_comprobante_nota_credito] int  NULL,
    [usar_comprobantes] int  NULL,
    [fecha_vencimiento] datetime  NULL,
    [ip_server] varchar(max)  NULL,
    [base_datos] varchar(max)  NULL,
    [base_datos_usuario] varchar(max)  NULL,
    [base_datos_clave] varchar(max)  NULL,
    [ver_imagen_fact_touch] int  NULL,
    [ver_nombre_fact_touch] int  NULL,
    [porciento_propina] float  NULL
);
GO

-- Creating table 'sucursal_vs_empleado'
CREATE TABLE [dbo].[sucursal_vs_empleado] (
    [cod_sucursal] int  NOT NULL,
    [cod_empleado] int  NOT NULL,
    [estado] bit  NULL
);
GO

-- Creating table 'tercero_observaciones'
CREATE TABLE [dbo].[tercero_observaciones] (
    [codigo] int  NULL,
    [observacion] varchar(1000)  NOT NULL,
    [entidad] varchar(5)  NULL,
    [estado] bit  NULL,
    [fecha] datetime  NULL,
    [tercero_codigo] int  NULL
);
GO

-- Creating table 'tercero_vs_email'
CREATE TABLE [dbo].[tercero_vs_email] (
    [cod_tercero] int  NOT NULL,
    [email] varchar(max)  NULL,
    [tipo_entidad] varchar(max)  NULL
);
GO

-- Creating table 'tercero_vs_permiso'
CREATE TABLE [dbo].[tercero_vs_permiso] (
    [cod_tercero] int  NOT NULL,
    [cod_permiso] int  NOT NULL,
    [tipo_entidad] varchar(5)  NULL,
    [estado] bit  NOT NULL
);
GO

-- Creating table 'tercero_vs_telefono'
CREATE TABLE [dbo].[tercero_vs_telefono] (
    [cod_tercero] int  NOT NULL,
    [telefono] varchar(50)  NOT NULL,
    [tipo_entidad] varchar(3)  NULL,
    [tipo_telefono] varchar(50)  NULL
);
GO

-- Creating table 'grupo_usuarios_permisos'
CREATE TABLE [dbo].[grupo_usuarios_permisos] (
    [grupo_usuarios_codigo] int  NOT NULL,
    [permiso_codigo] int  NOT NULL
);
GO

-- Creating table 'producto_unidad'
CREATE TABLE [dbo].[producto_unidad] (
    [producto_codigo] int  NOT NULL,
    [unidad_codigo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [codigo] in table 'almacen'
ALTER TABLE [dbo].[almacen]
ADD CONSTRAINT [PK_almacen]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'banco'
ALTER TABLE [dbo].[banco]
ADD CONSTRAINT [PK_banco]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'caja'
ALTER TABLE [dbo].[caja]
ADD CONSTRAINT [PK_caja]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cajero'
ALTER TABLE [dbo].[cajero]
ADD CONSTRAINT [PK_cajero]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cargo'
ALTER TABLE [dbo].[cargo]
ADD CONSTRAINT [PK_cargo]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'catalogo_cuentas'
ALTER TABLE [dbo].[catalogo_cuentas]
ADD CONSTRAINT [PK_catalogo_cuentas]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'categoria_producto'
ALTER TABLE [dbo].[categoria_producto]
ADD CONSTRAINT [PK_categoria_producto]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [PK_cliente]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cliente_categoria'
ALTER TABLE [dbo].[cliente_categoria]
ADD CONSTRAINT [PK_cliente_categoria]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cliente_subcategoria'
ALTER TABLE [dbo].[cliente_subcategoria]
ADD CONSTRAINT [PK_cliente_subcategoria]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'combo'
ALTER TABLE [dbo].[combo]
ADD CONSTRAINT [PK_combo]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'compra'
ALTER TABLE [dbo].[compra]
ADD CONSTRAINT [PK_compra]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'compra_pago_anulados'
ALTER TABLE [dbo].[compra_pago_anulados]
ADD CONSTRAINT [PK_compra_pago_anulados]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'compra_vs_pagos'
ALTER TABLE [dbo].[compra_vs_pagos]
ADD CONSTRAINT [PK_compra_vs_pagos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'comprobante_fiscal'
ALTER TABLE [dbo].[comprobante_fiscal]
ADD CONSTRAINT [PK_comprobante_fiscal]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'comprobante_serie'
ALTER TABLE [dbo].[comprobante_serie]
ADD CONSTRAINT [PK_comprobante_serie]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'comprobante_ventas'
ALTER TABLE [dbo].[comprobante_ventas]
ADD CONSTRAINT [PK_comprobante_ventas]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'correo_electronicos'
ALTER TABLE [dbo].[correo_electronicos]
ADD CONSTRAINT [PK_correo_electronicos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'cotizacion'
ALTER TABLE [dbo].[cotizacion]
ADD CONSTRAINT [PK_cotizacion]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo], [cod_cajero], [fecha], [turno] in table 'cuadre_caja'
ALTER TABLE [dbo].[cuadre_caja]
ADD CONSTRAINT [PK_cuadre_caja]
    PRIMARY KEY CLUSTERED ([codigo], [cod_cajero], [fecha], [turno] ASC);
GO

-- Creating primary key on [codigo] in table 'cuenta_bancaria'
ALTER TABLE [dbo].[cuenta_bancaria]
ADD CONSTRAINT [PK_cuenta_bancaria]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'departamento'
ALTER TABLE [dbo].[departamento]
ADD CONSTRAINT [PK_departamento]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'direccion'
ALTER TABLE [dbo].[direccion]
ADD CONSTRAINT [PK_direccion]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'egresos_caja'
ALTER TABLE [dbo].[egresos_caja]
ADD CONSTRAINT [PK_egresos_caja]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'egresos_conceptos'
ALTER TABLE [dbo].[egresos_conceptos]
ADD CONSTRAINT [PK_egresos_conceptos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'empleado'
ALTER TABLE [dbo].[empleado]
ADD CONSTRAINT [PK_empleado]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [cod_empleado], [cod_cargo] in table 'empleado_vs_cargo'
ALTER TABLE [dbo].[empleado_vs_cargo]
ADD CONSTRAINT [PK_empleado_vs_cargo]
    PRIMARY KEY CLUSTERED ([cod_empleado], [cod_cargo] ASC);
GO

-- Creating primary key on [codigo] in table 'empresa'
ALTER TABLE [dbo].[empresa]
ADD CONSTRAINT [PK_empresa]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'entrada_salida_inventario'
ALTER TABLE [dbo].[entrada_salida_inventario]
ADD CONSTRAINT [PK_entrada_salida_inventario]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'estados_reparacion'
ALTER TABLE [dbo].[estados_reparacion]
ADD CONSTRAINT [PK_estados_reparacion]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'factura'
ALTER TABLE [dbo].[factura]
ADD CONSTRAINT [PK_factura]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'grupo_usuarios'
ALTER TABLE [dbo].[grupo_usuarios]
ADD CONSTRAINT [PK_grupo_usuarios]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'historial_devolucion_compras'
ALTER TABLE [dbo].[historial_devolucion_compras]
ADD CONSTRAINT [PK_historial_devolucion_compras]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'historial_devolucion_ventas'
ALTER TABLE [dbo].[historial_devolucion_ventas]
ADD CONSTRAINT [PK_historial_devolucion_ventas]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo], [identificacion1], [cod_tercero] in table 'identificacion'
ALTER TABLE [dbo].[identificacion]
ADD CONSTRAINT [PK_identificacion]
    PRIMARY KEY CLUSTERED ([codigo], [identificacion1], [cod_tercero] ASC);
GO

-- Creating primary key on [codigo] in table 'ingresos_caja'
ALTER TABLE [dbo].[ingresos_caja]
ADD CONSTRAINT [PK_ingresos_caja]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'ingresos_conceptos'
ALTER TABLE [dbo].[ingresos_conceptos]
ADD CONSTRAINT [PK_ingresos_conceptos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'inventario'
ALTER TABLE [dbo].[inventario]
ADD CONSTRAINT [PK_inventario]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'inventario_reparacion'
ALTER TABLE [dbo].[inventario_reparacion]
ADD CONSTRAINT [PK_inventario_reparacion]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'itebis'
ALTER TABLE [dbo].[itebis]
ADD CONSTRAINT [PK_itebis]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'marcas'
ALTER TABLE [dbo].[marcas]
ADD CONSTRAINT [PK_marcas]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'mesas'
ALTER TABLE [dbo].[mesas]
ADD CONSTRAINT [PK_mesas]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'modelo'
ALTER TABLE [dbo].[modelo]
ADD CONSTRAINT [PK_modelo]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'moneda'
ALTER TABLE [dbo].[moneda]
ADD CONSTRAINT [PK_moneda]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'moneda_historial'
ALTER TABLE [dbo].[moneda_historial]
ADD CONSTRAINT [PK_moneda_historial]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'nomina'
ALTER TABLE [dbo].[nomina]
ADD CONSTRAINT [PK_nomina]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'nomina_conceptos'
ALTER TABLE [dbo].[nomina_conceptos]
ADD CONSTRAINT [PK_nomina_conceptos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'nomina_tipos'
ALTER TABLE [dbo].[nomina_tipos]
ADD CONSTRAINT [PK_nomina_tipos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'pais'
ALTER TABLE [dbo].[pais]
ADD CONSTRAINT [PK_pais]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'pedidos'
ALTER TABLE [dbo].[pedidos]
ADD CONSTRAINT [PK_pedidos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'permiso'
ALTER TABLE [dbo].[permiso]
ADD CONSTRAINT [PK_permiso]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'persona'
ALTER TABLE [dbo].[persona]
ADD CONSTRAINT [PK_persona]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'producto'
ALTER TABLE [dbo].[producto]
ADD CONSTRAINT [PK_producto]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'producto_detalle'
ALTER TABLE [dbo].[producto_detalle]
ADD CONSTRAINT [PK_producto_detalle]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'producto_oferta'
ALTER TABLE [dbo].[producto_oferta]
ADD CONSTRAINT [PK_producto_oferta]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'producto_permisos'
ALTER TABLE [dbo].[producto_permisos]
ADD CONSTRAINT [PK_producto_permisos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo_producto], [codigo_detalle] in table 'producto_vs_detalle'
ALTER TABLE [dbo].[producto_vs_detalle]
ADD CONSTRAINT [PK_producto_vs_detalle]
    PRIMARY KEY CLUSTERED ([codigo_producto], [codigo_detalle] ASC);
GO

-- Creating primary key on [codigo] in table 'provincia'
ALTER TABLE [dbo].[provincia]
ADD CONSTRAINT [PK_provincia]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'region'
ALTER TABLE [dbo].[region]
ADD CONSTRAINT [PK_region]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sector'
ALTER TABLE [dbo].[sector]
ADD CONSTRAINT [PK_sector]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sexo'
ALTER TABLE [dbo].[sexo]
ADD CONSTRAINT [PK_sexo]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sistema_historial'
ALTER TABLE [dbo].[sistema_historial]
ADD CONSTRAINT [PK_sistema_historial]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sistema_modulo_opciones'
ALTER TABLE [dbo].[sistema_modulo_opciones]
ADD CONSTRAINT [PK_sistema_modulo_opciones]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sistema_modulos'
ALTER TABLE [dbo].[sistema_modulos]
ADD CONSTRAINT [PK_sistema_modulos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'situacion_empleado'
ALTER TABLE [dbo].[situacion_empleado]
ADD CONSTRAINT [PK_situacion_empleado]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'subcategoria_producto'
ALTER TABLE [dbo].[subcategoria_producto]
ADD CONSTRAINT [PK_subcategoria_producto]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sucursal'
ALTER TABLE [dbo].[sucursal]
ADD CONSTRAINT [PK_sucursal]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'suplidor'
ALTER TABLE [dbo].[suplidor]
ADD CONSTRAINT [PK_suplidor]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [codigo] in table 'tarjetas_credito'
ALTER TABLE [dbo].[tarjetas_credito]
ADD CONSTRAINT [PK_tarjetas_credito]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'tercero'
ALTER TABLE [dbo].[tercero]
ADD CONSTRAINT [PK_tercero]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'tipo_comprobante_fiscal'
ALTER TABLE [dbo].[tipo_comprobante_fiscal]
ADD CONSTRAINT [PK_tipo_comprobante_fiscal]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'tipo_cuenta_bancaria'
ALTER TABLE [dbo].[tipo_cuenta_bancaria]
ADD CONSTRAINT [PK_tipo_cuenta_bancaria]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'tipo_identificacion'
ALTER TABLE [dbo].[tipo_identificacion]
ADD CONSTRAINT [PK_tipo_identificacion]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'tipo_movimiento_inventario'
ALTER TABLE [dbo].[tipo_movimiento_inventario]
ADD CONSTRAINT [PK_tipo_movimiento_inventario]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [PK_transferencia_inventario]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'unidad'
ALTER TABLE [dbo].[unidad]
ADD CONSTRAINT [PK_unidad]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'vendedor'
ALTER TABLE [dbo].[vendedor]
ADD CONSTRAINT [PK_vendedor]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'venta_vs_pagos'
ALTER TABLE [dbo].[venta_vs_pagos]
ADD CONSTRAINT [PK_venta_vs_pagos]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [cod_compra], [cod_producto], [cod_unidad], [cantidad], [monto], [estado] in table 'compra_detalle'
ALTER TABLE [dbo].[compra_detalle]
ADD CONSTRAINT [PK_compra_detalle]
    PRIMARY KEY CLUSTERED ([cod_compra], [cod_producto], [cod_unidad], [cantidad], [monto], [estado] ASC);
GO

-- Creating primary key on [codigo_cotizacion] in table 'cotizacion_detalles'
ALTER TABLE [dbo].[cotizacion_detalles]
ADD CONSTRAINT [PK_cotizacion_detalles]
    PRIMARY KEY CLUSTERED ([codigo_cotizacion] ASC);
GO

-- Creating primary key on [codigo], [cod_empleado], [cod_situacion], [cod_cargo], [cod_sucursal], [fecha] in table 'empleado_historial_datos'
ALTER TABLE [dbo].[empleado_historial_datos]
ADD CONSTRAINT [PK_empleado_historial_datos]
    PRIMARY KEY CLUSTERED ([codigo], [cod_empleado], [cod_situacion], [cod_cargo], [cod_sucursal], [fecha] ASC);
GO

-- Creating primary key on [cod_factura], [cod_producto], [cantidad], [precio], [monto], [estado] in table 'factura_detalle'
ALTER TABLE [dbo].[factura_detalle]
ADD CONSTRAINT [PK_factura_detalle]
    PRIMARY KEY CLUSTERED ([cod_factura], [cod_producto], [cantidad], [precio], [monto], [estado] ASC);
GO

-- Creating primary key on [cod_factura], [fecha], [detalle] in table 'facturas_anuladas'
ALTER TABLE [dbo].[facturas_anuladas]
ADD CONSTRAINT [PK_facturas_anuladas]
    PRIMARY KEY CLUSTERED ([cod_factura], [fecha], [detalle] ASC);
GO

-- Creating primary key on [codigo_mesa], [cod_detalle] in table 'mesas_detalles'
ALTER TABLE [dbo].[mesas_detalles]
ADD CONSTRAINT [PK_mesas_detalles]
    PRIMARY KEY CLUSTERED ([codigo_mesa], [cod_detalle] ASC);
GO

-- Creating primary key on [cod_nomina], [cod_empleado], [cod_concepto], [monto_sueldo] in table 'nomina_detalle'
ALTER TABLE [dbo].[nomina_detalle]
ADD CONSTRAINT [PK_nomina_detalle]
    PRIMARY KEY CLUSTERED ([cod_nomina], [cod_empleado], [cod_concepto], [monto_sueldo] ASC);
GO

-- Creating primary key on [cod_producto], [cod_unidad], [codigo_barra] in table 'producto_codigobarra'
ALTER TABLE [dbo].[producto_codigobarra]
ADD CONSTRAINT [PK_producto_codigobarra]
    PRIMARY KEY CLUSTERED ([cod_producto], [cod_unidad], [codigo_barra] ASC);
GO

-- Creating primary key on [codigo] in table 'producto_oferta_historial'
ALTER TABLE [dbo].[producto_oferta_historial]
ADD CONSTRAINT [PK_producto_oferta_historial]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [codigo] in table 'sistema'
ALTER TABLE [dbo].[sistema]
ADD CONSTRAINT [PK_sistema]
    PRIMARY KEY CLUSTERED ([codigo] ASC);
GO

-- Creating primary key on [cod_sucursal], [cod_empleado] in table 'sucursal_vs_empleado'
ALTER TABLE [dbo].[sucursal_vs_empleado]
ADD CONSTRAINT [PK_sucursal_vs_empleado]
    PRIMARY KEY CLUSTERED ([cod_sucursal], [cod_empleado] ASC);
GO

-- Creating primary key on [observacion] in table 'tercero_observaciones'
ALTER TABLE [dbo].[tercero_observaciones]
ADD CONSTRAINT [PK_tercero_observaciones]
    PRIMARY KEY CLUSTERED ([observacion] ASC);
GO

-- Creating primary key on [cod_tercero] in table 'tercero_vs_email'
ALTER TABLE [dbo].[tercero_vs_email]
ADD CONSTRAINT [PK_tercero_vs_email]
    PRIMARY KEY CLUSTERED ([cod_tercero] ASC);
GO

-- Creating primary key on [cod_tercero], [cod_permiso], [estado] in table 'tercero_vs_permiso'
ALTER TABLE [dbo].[tercero_vs_permiso]
ADD CONSTRAINT [PK_tercero_vs_permiso]
    PRIMARY KEY CLUSTERED ([cod_tercero], [cod_permiso], [estado] ASC);
GO

-- Creating primary key on [cod_tercero], [telefono] in table 'tercero_vs_telefono'
ALTER TABLE [dbo].[tercero_vs_telefono]
ADD CONSTRAINT [PK_tercero_vs_telefono]
    PRIMARY KEY CLUSTERED ([cod_tercero], [telefono] ASC);
GO

-- Creating primary key on [grupo_usuarios_codigo], [permiso_codigo] in table 'grupo_usuarios_permisos'
ALTER TABLE [dbo].[grupo_usuarios_permisos]
ADD CONSTRAINT [PK_grupo_usuarios_permisos]
    PRIMARY KEY CLUSTERED ([grupo_usuarios_codigo], [permiso_codigo] ASC);
GO

-- Creating primary key on [producto_codigo], [unidad_codigo] in table 'producto_unidad'
ALTER TABLE [dbo].[producto_unidad]
ADD CONSTRAINT [PK_producto_unidad]
    PRIMARY KEY CLUSTERED ([producto_codigo], [unidad_codigo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [sucursal_codigo] in table 'almacen'
ALTER TABLE [dbo].[almacen]
ADD CONSTRAINT [FK_almacen_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_almacen_sucursal'
CREATE INDEX [IX_FK_almacen_sucursal]
ON [dbo].[almacen]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [almacen_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_historial_movimientos_inventario_almacen]
    FOREIGN KEY ([almacen_codigo])
    REFERENCES [dbo].[almacen]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_movimientos_inventario_almacen'
CREATE INDEX [IX_FK_historial_movimientos_inventario_almacen]
ON [dbo].[transferencia_inventario]
    ([almacen_codigo]);
GO

-- Creating foreign key on [almacen1_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_historial_movimientos_inventario_almacen1]
    FOREIGN KEY ([almacen1_codigo])
    REFERENCES [dbo].[almacen]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_movimientos_inventario_almacen1'
CREATE INDEX [IX_FK_historial_movimientos_inventario_almacen1]
ON [dbo].[transferencia_inventario]
    ([almacen1_codigo]);
GO

-- Creating foreign key on [almacen_codigo] in table 'producto'
ALTER TABLE [dbo].[producto]
ADD CONSTRAINT [FK_producto_almacen]
    FOREIGN KEY ([almacen_codigo])
    REFERENCES [dbo].[almacen]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_almacen'
CREATE INDEX [IX_FK_producto_almacen]
ON [dbo].[producto]
    ([almacen_codigo]);
GO

-- Creating foreign key on [codigo] in table 'banco'
ALTER TABLE [dbo].[banco]
ADD CONSTRAINT [FK_banco_tercero]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [caja_codigo] in table 'cajero'
ALTER TABLE [dbo].[cajero]
ADD CONSTRAINT [FK_cajero_caja]
    FOREIGN KEY ([caja_codigo])
    REFERENCES [dbo].[caja]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cajero_caja'
CREATE INDEX [IX_FK_cajero_caja]
ON [dbo].[cajero]
    ([caja_codigo]);
GO

-- Creating foreign key on [caja_codigo] in table 'comprobante_ventas'
ALTER TABLE [dbo].[comprobante_ventas]
ADD CONSTRAINT [FK_comprobante_ventas_caja]
    FOREIGN KEY ([caja_codigo])
    REFERENCES [dbo].[caja]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_comprobante_ventas_caja'
CREATE INDEX [IX_FK_comprobante_ventas_caja]
ON [dbo].[comprobante_ventas]
    ([caja_codigo]);
GO

-- Creating foreign key on [empleado_codigo] in table 'cajero'
ALTER TABLE [dbo].[cajero]
ADD CONSTRAINT [FK_cajero_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cajero_empleado'
CREATE INDEX [IX_FK_cajero_empleado]
ON [dbo].[cajero]
    ([empleado_codigo]);
GO

-- Creating foreign key on [cajero_codigo] in table 'egresos_caja'
ALTER TABLE [dbo].[egresos_caja]
ADD CONSTRAINT [FK_egresos_caja_cajero]
    FOREIGN KEY ([cajero_codigo])
    REFERENCES [dbo].[cajero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_egresos_caja_cajero'
CREATE INDEX [IX_FK_egresos_caja_cajero]
ON [dbo].[egresos_caja]
    ([cajero_codigo]);
GO

-- Creating foreign key on [cajero_codigo] in table 'ingresos_caja'
ALTER TABLE [dbo].[ingresos_caja]
ADD CONSTRAINT [FK_ingresos_caja_cajero]
    FOREIGN KEY ([cajero_codigo])
    REFERENCES [dbo].[cajero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ingresos_caja_cajero'
CREATE INDEX [IX_FK_ingresos_caja_cajero]
ON [dbo].[ingresos_caja]
    ([cajero_codigo]);
GO

-- Creating foreign key on [cod_cargo] in table 'empleado_historial_datos'
ALTER TABLE [dbo].[empleado_historial_datos]
ADD CONSTRAINT [FK_empleado_historial_datos_cargo]
    FOREIGN KEY ([cod_cargo])
    REFERENCES [dbo].[cargo]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_historial_datos_cargo'
CREATE INDEX [IX_FK_empleado_historial_datos_cargo]
ON [dbo].[empleado_historial_datos]
    ([cod_cargo]);
GO

-- Creating foreign key on [cod_cargo] in table 'empleado_vs_cargo'
ALTER TABLE [dbo].[empleado_vs_cargo]
ADD CONSTRAINT [FK_empleado_vs_cargo_cargo]
    FOREIGN KEY ([cod_cargo])
    REFERENCES [dbo].[cargo]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_vs_cargo_cargo'
CREATE INDEX [IX_FK_empleado_vs_cargo_cargo]
ON [dbo].[empleado_vs_cargo]
    ([cod_cargo]);
GO

-- Creating foreign key on [categoria_producto_codigo] in table 'producto'
ALTER TABLE [dbo].[producto]
ADD CONSTRAINT [FK_producto_tipo_producto]
    FOREIGN KEY ([categoria_producto_codigo])
    REFERENCES [dbo].[categoria_producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_tipo_producto'
CREATE INDEX [IX_FK_producto_tipo_producto]
ON [dbo].[producto]
    ([categoria_producto_codigo]);
GO

-- Creating foreign key on [categoria_producto_codigo] in table 'subcategoria_producto'
ALTER TABLE [dbo].[subcategoria_producto]
ADD CONSTRAINT [FK_subcategoria_producto_categoria_producto]
    FOREIGN KEY ([categoria_producto_codigo])
    REFERENCES [dbo].[categoria_producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_subcategoria_producto_categoria_producto'
CREATE INDEX [IX_FK_subcategoria_producto_categoria_producto]
ON [dbo].[subcategoria_producto]
    ([categoria_producto_codigo]);
GO

-- Creating foreign key on [cliente_categoria_codigo] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_cliente_categoria]
    FOREIGN KEY ([cliente_categoria_codigo])
    REFERENCES [dbo].[cliente_categoria]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_cliente_categoria'
CREATE INDEX [IX_FK_cliente_cliente_categoria]
ON [dbo].[cliente]
    ([cliente_categoria_codigo]);
GO

-- Creating foreign key on [cliente_subcategoria_codigo] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_cliente_subcategoria]
    FOREIGN KEY ([cliente_subcategoria_codigo])
    REFERENCES [dbo].[cliente_subcategoria]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_cliente_subcategoria'
CREATE INDEX [IX_FK_cliente_cliente_subcategoria]
ON [dbo].[cliente]
    ([cliente_subcategoria_codigo]);
GO

-- Creating foreign key on [codigo] in table 'cliente'
ALTER TABLE [dbo].[cliente]
ADD CONSTRAINT [FK_cliente_persona]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[persona]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [cliente_codigo] in table 'cotizacion'
ALTER TABLE [dbo].[cotizacion]
ADD CONSTRAINT [FK_cotizacion_cliente]
    FOREIGN KEY ([cliente_codigo])
    REFERENCES [dbo].[cliente]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cotizacion_cliente'
CREATE INDEX [IX_FK_cotizacion_cliente]
ON [dbo].[cotizacion]
    ([cliente_codigo]);
GO

-- Creating foreign key on [cliente_codigo] in table 'factura'
ALTER TABLE [dbo].[factura]
ADD CONSTRAINT [FK_factura_cliente]
    FOREIGN KEY ([cliente_codigo])
    REFERENCES [dbo].[cliente]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_factura_cliente'
CREATE INDEX [IX_FK_factura_cliente]
ON [dbo].[factura]
    ([cliente_codigo]);
GO

-- Creating foreign key on [cliente_codigo] in table 'pedidos'
ALTER TABLE [dbo].[pedidos]
ADD CONSTRAINT [FK_pedidos_cliente]
    FOREIGN KEY ([cliente_codigo])
    REFERENCES [dbo].[cliente]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_pedidos_cliente'
CREATE INDEX [IX_FK_pedidos_cliente]
ON [dbo].[pedidos]
    ([cliente_codigo]);
GO

-- Creating foreign key on [cliente_categoria_codigo] in table 'cliente_subcategoria'
ALTER TABLE [dbo].[cliente_subcategoria]
ADD CONSTRAINT [FK_cliente_subcategoria_cliente_categoria]
    FOREIGN KEY ([cliente_categoria_codigo])
    REFERENCES [dbo].[cliente_categoria]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cliente_subcategoria_cliente_categoria'
CREATE INDEX [IX_FK_cliente_subcategoria_cliente_categoria]
ON [dbo].[cliente_subcategoria]
    ([cliente_categoria_codigo]);
GO

-- Creating foreign key on [codigo] in table 'combo'
ALTER TABLE [dbo].[combo]
ADD CONSTRAINT [FK_combo_producto]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [compra_codigo] in table 'compra_pago_anulados'
ALTER TABLE [dbo].[compra_pago_anulados]
ADD CONSTRAINT [FK_compra_pago_anulados_compra]
    FOREIGN KEY ([compra_codigo])
    REFERENCES [dbo].[compra]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_compra_pago_anulados_compra'
CREATE INDEX [IX_FK_compra_pago_anulados_compra]
ON [dbo].[compra_pago_anulados]
    ([compra_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'compra'
ALTER TABLE [dbo].[compra]
ADD CONSTRAINT [FK_compra_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_compra_sucursal'
CREATE INDEX [IX_FK_compra_sucursal]
ON [dbo].[compra]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [suplidor_codigo] in table 'compra'
ALTER TABLE [dbo].[compra]
ADD CONSTRAINT [FK_compra_suplidor]
    FOREIGN KEY ([suplidor_codigo])
    REFERENCES [dbo].[suplidor]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_compra_suplidor'
CREATE INDEX [IX_FK_compra_suplidor]
ON [dbo].[compra]
    ([suplidor_codigo]);
GO

-- Creating foreign key on [compra_codigo] in table 'compra_vs_pagos'
ALTER TABLE [dbo].[compra_vs_pagos]
ADD CONSTRAINT [FK_compra_vs_pagos_compra]
    FOREIGN KEY ([compra_codigo])
    REFERENCES [dbo].[compra]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_compra_vs_pagos_compra'
CREATE INDEX [IX_FK_compra_vs_pagos_compra]
ON [dbo].[compra_vs_pagos]
    ([compra_codigo]);
GO

-- Creating foreign key on [comprobante_serie_codigo] in table 'comprobante_fiscal'
ALTER TABLE [dbo].[comprobante_fiscal]
ADD CONSTRAINT [FK_comprobante_fiscal_comprobante_serie]
    FOREIGN KEY ([comprobante_serie_codigo])
    REFERENCES [dbo].[comprobante_serie]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_comprobante_fiscal_comprobante_serie'
CREATE INDEX [IX_FK_comprobante_fiscal_comprobante_serie]
ON [dbo].[comprobante_fiscal]
    ([comprobante_serie_codigo]);
GO

-- Creating foreign key on [tipo_comprobante_fiscal_codigo] in table 'comprobante_fiscal'
ALTER TABLE [dbo].[comprobante_fiscal]
ADD CONSTRAINT [FK_comprobante_fiscal_tipo_comprobante_fiscal]
    FOREIGN KEY ([tipo_comprobante_fiscal_codigo])
    REFERENCES [dbo].[tipo_comprobante_fiscal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_comprobante_fiscal_tipo_comprobante_fiscal'
CREATE INDEX [IX_FK_comprobante_fiscal_tipo_comprobante_fiscal]
ON [dbo].[comprobante_fiscal]
    ([tipo_comprobante_fiscal_codigo]);
GO

-- Creating foreign key on [tipo_comprobante_fiscal_codigo] in table 'comprobante_ventas'
ALTER TABLE [dbo].[comprobante_ventas]
ADD CONSTRAINT [FK_comprobante_ventas_tipo_comprobante_fiscal]
    FOREIGN KEY ([tipo_comprobante_fiscal_codigo])
    REFERENCES [dbo].[tipo_comprobante_fiscal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_comprobante_ventas_tipo_comprobante_fiscal'
CREATE INDEX [IX_FK_comprobante_ventas_tipo_comprobante_fiscal]
ON [dbo].[comprobante_ventas]
    ([tipo_comprobante_fiscal_codigo]);
GO

-- Creating foreign key on [codigo_cotizacion] in table 'cotizacion_detalles'
ALTER TABLE [dbo].[cotizacion_detalles]
ADD CONSTRAINT [FK_cotizacion_detalles_cotizacion]
    FOREIGN KEY ([codigo_cotizacion])
    REFERENCES [dbo].[cotizacion]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [empleado_codigo] in table 'cotizacion'
ALTER TABLE [dbo].[cotizacion]
ADD CONSTRAINT [FK_cotizacion_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cotizacion_empleado'
CREATE INDEX [IX_FK_cotizacion_empleado]
ON [dbo].[cotizacion]
    ([empleado_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'cotizacion'
ALTER TABLE [dbo].[cotizacion]
ADD CONSTRAINT [FK_cotizacion_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cotizacion_sucursal'
CREATE INDEX [IX_FK_cotizacion_sucursal]
ON [dbo].[cotizacion]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [cod_cajero] in table 'cuadre_caja'
ALTER TABLE [dbo].[cuadre_caja]
ADD CONSTRAINT [FK_cuadre_caja_empleado]
    FOREIGN KEY ([cod_cajero])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cuadre_caja_empleado'
CREATE INDEX [IX_FK_cuadre_caja_empleado]
ON [dbo].[cuadre_caja]
    ([cod_cajero]);
GO

-- Creating foreign key on [tipo_cuenta_bancaria_codigo] in table 'cuenta_bancaria'
ALTER TABLE [dbo].[cuenta_bancaria]
ADD CONSTRAINT [FK_cuenta_bancaria_tipo_cuenta_bancaria]
    FOREIGN KEY ([tipo_cuenta_bancaria_codigo])
    REFERENCES [dbo].[tipo_cuenta_bancaria]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cuenta_bancaria_tipo_cuenta_bancaria'
CREATE INDEX [IX_FK_cuenta_bancaria_tipo_cuenta_bancaria]
ON [dbo].[cuenta_bancaria]
    ([tipo_cuenta_bancaria_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'departamento'
ALTER TABLE [dbo].[departamento]
ADD CONSTRAINT [FK_departamento_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_departamento_sucursal'
CREATE INDEX [IX_FK_departamento_sucursal]
ON [dbo].[departamento]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [departamento_codigo] in table 'empleado'
ALTER TABLE [dbo].[empleado]
ADD CONSTRAINT [FK_empleado_departamento]
    FOREIGN KEY ([departamento_codigo])
    REFERENCES [dbo].[departamento]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_departamento'
CREATE INDEX [IX_FK_empleado_departamento]
ON [dbo].[empleado]
    ([departamento_codigo]);
GO

-- Creating foreign key on [sector_codigo] in table 'direccion'
ALTER TABLE [dbo].[direccion]
ADD CONSTRAINT [FK_direccion_sector]
    FOREIGN KEY ([sector_codigo])
    REFERENCES [dbo].[sector]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_direccion_sector'
CREATE INDEX [IX_FK_direccion_sector]
ON [dbo].[direccion]
    ([sector_codigo]);
GO

-- Creating foreign key on [cod_empleado] in table 'empleado_historial_datos'
ALTER TABLE [dbo].[empleado_historial_datos]
ADD CONSTRAINT [FK_empleado_historial_datos_empleado]
    FOREIGN KEY ([cod_empleado])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_historial_datos_empleado'
CREATE INDEX [IX_FK_empleado_historial_datos_empleado]
ON [dbo].[empleado_historial_datos]
    ([cod_empleado]);
GO

-- Creating foreign key on [empleado1_codigo] in table 'empleado_historial_datos'
ALTER TABLE [dbo].[empleado_historial_datos]
ADD CONSTRAINT [FK_empleado_historial_datos_empleado1]
    FOREIGN KEY ([empleado1_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_historial_datos_empleado1'
CREATE INDEX [IX_FK_empleado_historial_datos_empleado1]
ON [dbo].[empleado_historial_datos]
    ([empleado1_codigo]);
GO

-- Creating foreign key on [codigo] in table 'empleado'
ALTER TABLE [dbo].[empleado]
ADD CONSTRAINT [FK_empleado_persona]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[persona]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [situacion_empleado_codigo] in table 'empleado'
ALTER TABLE [dbo].[empleado]
ADD CONSTRAINT [FK_empleado_situacion_empleado]
    FOREIGN KEY ([situacion_empleado_codigo])
    REFERENCES [dbo].[situacion_empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_situacion_empleado'
CREATE INDEX [IX_FK_empleado_situacion_empleado]
ON [dbo].[empleado]
    ([situacion_empleado_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'empleado'
ALTER TABLE [dbo].[empleado]
ADD CONSTRAINT [FK_empleado_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_sucursal'
CREATE INDEX [IX_FK_empleado_sucursal]
ON [dbo].[empleado]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [empleado_codigo] in table 'entrada_salida_inventario'
ALTER TABLE [dbo].[entrada_salida_inventario]
ADD CONSTRAINT [FK_entrada_salida_inventario_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_entrada_salida_inventario_empleado'
CREATE INDEX [IX_FK_entrada_salida_inventario_empleado]
ON [dbo].[entrada_salida_inventario]
    ([empleado_codigo]);
GO

-- Creating foreign key on [empleado_codigo] in table 'historial_devolucion_compras'
ALTER TABLE [dbo].[historial_devolucion_compras]
ADD CONSTRAINT [FK_historial_devolucion_compras_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_compras_empleado'
CREATE INDEX [IX_FK_historial_devolucion_compras_empleado]
ON [dbo].[historial_devolucion_compras]
    ([empleado_codigo]);
GO

-- Creating foreign key on [empleado_codigo] in table 'nomina'
ALTER TABLE [dbo].[nomina]
ADD CONSTRAINT [FK_nomina_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_nomina_empleado'
CREATE INDEX [IX_FK_nomina_empleado]
ON [dbo].[nomina]
    ([empleado_codigo]);
GO

-- Creating foreign key on [empleado_codigo] in table 'pedidos'
ALTER TABLE [dbo].[pedidos]
ADD CONSTRAINT [FK_pedidos_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_pedidos_empleado'
CREATE INDEX [IX_FK_pedidos_empleado]
ON [dbo].[pedidos]
    ([empleado_codigo]);
GO

-- Creating foreign key on [cod_empleado] in table 'sucursal_vs_empleado'
ALTER TABLE [dbo].[sucursal_vs_empleado]
ADD CONSTRAINT [FK_sucursal_vs_empleado_empleado]
    FOREIGN KEY ([cod_empleado])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_sucursal_vs_empleado_empleado'
CREATE INDEX [IX_FK_sucursal_vs_empleado_empleado]
ON [dbo].[sucursal_vs_empleado]
    ([cod_empleado]);
GO

-- Creating foreign key on [empleado_codigo] in table 'venta_vs_pagos'
ALTER TABLE [dbo].[venta_vs_pagos]
ADD CONSTRAINT [FK_venta_vs_pagos_empleado]
    FOREIGN KEY ([empleado_codigo])
    REFERENCES [dbo].[empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_venta_vs_pagos_empleado'
CREATE INDEX [IX_FK_venta_vs_pagos_empleado]
ON [dbo].[venta_vs_pagos]
    ([empleado_codigo]);
GO

-- Creating foreign key on [codigo] in table 'empresa'
ALTER TABLE [dbo].[empresa]
ADD CONSTRAINT [FK_empresa_tercero]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [empresa_codigo] in table 'sucursal'
ALTER TABLE [dbo].[sucursal]
ADD CONSTRAINT [FK_sucursal_empresa1]
    FOREIGN KEY ([empresa_codigo])
    REFERENCES [dbo].[empresa]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_sucursal_empresa1'
CREATE INDEX [IX_FK_sucursal_empresa1]
ON [dbo].[sucursal]
    ([empresa_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'entrada_salida_inventario'
ALTER TABLE [dbo].[entrada_salida_inventario]
ADD CONSTRAINT [FK_entrada_salida_inventario_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_entrada_salida_inventario_producto'
CREATE INDEX [IX_FK_entrada_salida_inventario_producto]
ON [dbo].[entrada_salida_inventario]
    ([producto_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'entrada_salida_inventario'
ALTER TABLE [dbo].[entrada_salida_inventario]
ADD CONSTRAINT [FK_entrada_salida_inventario_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_entrada_salida_inventario_unidad'
CREATE INDEX [IX_FK_entrada_salida_inventario_unidad]
ON [dbo].[entrada_salida_inventario]
    ([unidad_codigo]);
GO

-- Creating foreign key on [estados_reparacion_codigo] in table 'inventario_reparacion'
ALTER TABLE [dbo].[inventario_reparacion]
ADD CONSTRAINT [FK_inventario_reparacion_estados_reparacion]
    FOREIGN KEY ([estados_reparacion_codigo])
    REFERENCES [dbo].[estados_reparacion]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_reparacion_estados_reparacion'
CREATE INDEX [IX_FK_inventario_reparacion_estados_reparacion]
ON [dbo].[inventario_reparacion]
    ([estados_reparacion_codigo]);
GO

-- Creating foreign key on [cod_factura] in table 'factura_detalle'
ALTER TABLE [dbo].[factura_detalle]
ADD CONSTRAINT [FK_factura_detalle_factura]
    FOREIGN KEY ([cod_factura])
    REFERENCES [dbo].[factura]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [cod_factura] in table 'facturas_anuladas'
ALTER TABLE [dbo].[facturas_anuladas]
ADD CONSTRAINT [FK_facturas_anuladas_factura]
    FOREIGN KEY ([cod_factura])
    REFERENCES [dbo].[factura]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [factura_codigo] in table 'historial_devolucion_ventas'
ALTER TABLE [dbo].[historial_devolucion_ventas]
ADD CONSTRAINT [FK_historial_devolucion_ventas_factura]
    FOREIGN KEY ([factura_codigo])
    REFERENCES [dbo].[factura]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_ventas_factura'
CREATE INDEX [IX_FK_historial_devolucion_ventas_factura]
ON [dbo].[historial_devolucion_ventas]
    ([factura_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'historial_devolucion_compras'
ALTER TABLE [dbo].[historial_devolucion_compras]
ADD CONSTRAINT [FK_historial_devolucion_compras_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_compras_producto'
CREATE INDEX [IX_FK_historial_devolucion_compras_producto]
ON [dbo].[historial_devolucion_compras]
    ([producto_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'historial_devolucion_compras'
ALTER TABLE [dbo].[historial_devolucion_compras]
ADD CONSTRAINT [FK_historial_devolucion_compras_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_compras_unidad'
CREATE INDEX [IX_FK_historial_devolucion_compras_unidad]
ON [dbo].[historial_devolucion_compras]
    ([unidad_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'historial_devolucion_ventas'
ALTER TABLE [dbo].[historial_devolucion_ventas]
ADD CONSTRAINT [FK_historial_devolucion_ventas_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_ventas_producto'
CREATE INDEX [IX_FK_historial_devolucion_ventas_producto]
ON [dbo].[historial_devolucion_ventas]
    ([producto_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'historial_devolucion_ventas'
ALTER TABLE [dbo].[historial_devolucion_ventas]
ADD CONSTRAINT [FK_historial_devolucion_ventas_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_devolucion_ventas_unidad'
CREATE INDEX [IX_FK_historial_devolucion_ventas_unidad]
ON [dbo].[historial_devolucion_ventas]
    ([unidad_codigo]);
GO

-- Creating foreign key on [cod_tercero] in table 'identificacion'
ALTER TABLE [dbo].[identificacion]
ADD CONSTRAINT [FK_identificacion_tercero1]
    FOREIGN KEY ([cod_tercero])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_identificacion_tercero1'
CREATE INDEX [IX_FK_identificacion_tercero1]
ON [dbo].[identificacion]
    ([cod_tercero]);
GO

-- Creating foreign key on [tipo_identificacion_codigo] in table 'identificacion'
ALTER TABLE [dbo].[identificacion]
ADD CONSTRAINT [FK_identificacion_tipo_identificacion]
    FOREIGN KEY ([tipo_identificacion_codigo])
    REFERENCES [dbo].[tipo_identificacion]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_identificacion_tipo_identificacion'
CREATE INDEX [IX_FK_identificacion_tipo_identificacion]
ON [dbo].[identificacion]
    ([tipo_identificacion_codigo]);
GO

-- Creating foreign key on [ingresos_conceptos_codigo] in table 'ingresos_caja'
ALTER TABLE [dbo].[ingresos_caja]
ADD CONSTRAINT [FK_ingresos_caja_ingresos_conceptos]
    FOREIGN KEY ([ingresos_conceptos_codigo])
    REFERENCES [dbo].[ingresos_conceptos]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ingresos_caja_ingresos_conceptos'
CREATE INDEX [IX_FK_ingresos_caja_ingresos_conceptos]
ON [dbo].[ingresos_caja]
    ([ingresos_conceptos_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'inventario'
ALTER TABLE [dbo].[inventario]
ADD CONSTRAINT [FK_inventario_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_producto'
CREATE INDEX [IX_FK_inventario_producto]
ON [dbo].[inventario]
    ([producto_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'inventario'
ALTER TABLE [dbo].[inventario]
ADD CONSTRAINT [FK_inventario_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_unidad'
CREATE INDEX [IX_FK_inventario_unidad]
ON [dbo].[inventario]
    ([unidad_codigo]);
GO

-- Creating foreign key on [marcas_codigo] in table 'inventario_reparacion'
ALTER TABLE [dbo].[inventario_reparacion]
ADD CONSTRAINT [FK_inventario_reparacion_marcas]
    FOREIGN KEY ([marcas_codigo])
    REFERENCES [dbo].[marcas]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_reparacion_marcas'
CREATE INDEX [IX_FK_inventario_reparacion_marcas]
ON [dbo].[inventario_reparacion]
    ([marcas_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'inventario_reparacion'
ALTER TABLE [dbo].[inventario_reparacion]
ADD CONSTRAINT [FK_inventario_reparacion_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_reparacion_producto'
CREATE INDEX [IX_FK_inventario_reparacion_producto]
ON [dbo].[inventario_reparacion]
    ([producto_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'inventario_reparacion'
ALTER TABLE [dbo].[inventario_reparacion]
ADD CONSTRAINT [FK_inventario_reparacion_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inventario_reparacion_unidad'
CREATE INDEX [IX_FK_inventario_reparacion_unidad]
ON [dbo].[inventario_reparacion]
    ([unidad_codigo]);
GO

-- Creating foreign key on [itebis_codigo] in table 'producto'
ALTER TABLE [dbo].[producto]
ADD CONSTRAINT [FK_producto_itebis]
    FOREIGN KEY ([itebis_codigo])
    REFERENCES [dbo].[itebis]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_itebis'
CREATE INDEX [IX_FK_producto_itebis]
ON [dbo].[producto]
    ([itebis_codigo]);
GO

-- Creating foreign key on [marcas_codigo] in table 'modelo'
ALTER TABLE [dbo].[modelo]
ADD CONSTRAINT [FK_modelo_marcas]
    FOREIGN KEY ([marcas_codigo])
    REFERENCES [dbo].[marcas]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_modelo_marcas'
CREATE INDEX [IX_FK_modelo_marcas]
ON [dbo].[modelo]
    ([marcas_codigo]);
GO

-- Creating foreign key on [codigo_mesa] in table 'mesas_detalles'
ALTER TABLE [dbo].[mesas_detalles]
ADD CONSTRAINT [FK_mesas_detalles_mesas]
    FOREIGN KEY ([codigo_mesa])
    REFERENCES [dbo].[mesas]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [moneda_codigo] in table 'moneda_historial'
ALTER TABLE [dbo].[moneda_historial]
ADD CONSTRAINT [FK_moneda_historial_moneda]
    FOREIGN KEY ([moneda_codigo])
    REFERENCES [dbo].[moneda]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_moneda_historial_moneda'
CREATE INDEX [IX_FK_moneda_historial_moneda]
ON [dbo].[moneda_historial]
    ([moneda_codigo]);
GO

-- Creating foreign key on [cod_nomina] in table 'nomina_detalle'
ALTER TABLE [dbo].[nomina_detalle]
ADD CONSTRAINT [FK_nomina_detalle_nomina]
    FOREIGN KEY ([cod_nomina])
    REFERENCES [dbo].[nomina]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [nomina_tipos_codigo] in table 'nomina'
ALTER TABLE [dbo].[nomina]
ADD CONSTRAINT [FK_nomina_nomina_tipos]
    FOREIGN KEY ([nomina_tipos_codigo])
    REFERENCES [dbo].[nomina_tipos]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_nomina_nomina_tipos'
CREATE INDEX [IX_FK_nomina_nomina_tipos]
ON [dbo].[nomina]
    ([nomina_tipos_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'nomina'
ALTER TABLE [dbo].[nomina]
ADD CONSTRAINT [FK_nomina_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_nomina_sucursal'
CREATE INDEX [IX_FK_nomina_sucursal]
ON [dbo].[nomina]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [cod_concepto] in table 'nomina_detalle'
ALTER TABLE [dbo].[nomina_detalle]
ADD CONSTRAINT [FK_nomina_detalle_nomina_conceptos]
    FOREIGN KEY ([cod_concepto])
    REFERENCES [dbo].[nomina_conceptos]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_nomina_detalle_nomina_conceptos'
CREATE INDEX [IX_FK_nomina_detalle_nomina_conceptos]
ON [dbo].[nomina_detalle]
    ([cod_concepto]);
GO

-- Creating foreign key on [pais_codigo] in table 'region'
ALTER TABLE [dbo].[region]
ADD CONSTRAINT [FK_region_pais]
    FOREIGN KEY ([pais_codigo])
    REFERENCES [dbo].[pais]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_region_pais'
CREATE INDEX [IX_FK_region_pais]
ON [dbo].[region]
    ([pais_codigo]);
GO

-- Creating foreign key on [sucursal_codigo] in table 'pedidos'
ALTER TABLE [dbo].[pedidos]
ADD CONSTRAINT [FK_pedidos_sucursal]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_pedidos_sucursal'
CREATE INDEX [IX_FK_pedidos_sucursal]
ON [dbo].[pedidos]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [cod_permiso] in table 'tercero_vs_permiso'
ALTER TABLE [dbo].[tercero_vs_permiso]
ADD CONSTRAINT [FK_tercero_vs_permiso_permiso]
    FOREIGN KEY ([cod_permiso])
    REFERENCES [dbo].[permiso]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_tercero_vs_permiso_permiso'
CREATE INDEX [IX_FK_tercero_vs_permiso_permiso]
ON [dbo].[tercero_vs_permiso]
    ([cod_permiso]);
GO

-- Creating foreign key on [sexo_codigo] in table 'persona'
ALTER TABLE [dbo].[persona]
ADD CONSTRAINT [FK_persona_sexo]
    FOREIGN KEY ([sexo_codigo])
    REFERENCES [dbo].[sexo]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_persona_sexo'
CREATE INDEX [IX_FK_persona_sexo]
ON [dbo].[persona]
    ([sexo_codigo]);
GO

-- Creating foreign key on [codigo] in table 'persona'
ALTER TABLE [dbo].[persona]
ADD CONSTRAINT [FK_persona_tercero]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [codigo] in table 'suplidor'
ALTER TABLE [dbo].[suplidor]
ADD CONSTRAINT [FK_suplidor_persona]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[persona]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [cod_producto] in table 'compra_detalle'
ALTER TABLE [dbo].[compra_detalle]
ADD CONSTRAINT [FK_compra_vs_producto_producto]
    FOREIGN KEY ([cod_producto])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_compra_vs_producto_producto'
CREATE INDEX [IX_FK_compra_vs_producto_producto]
ON [dbo].[compra_detalle]
    ([cod_producto]);
GO

-- Creating foreign key on [producto_codigo] in table 'cotizacion_detalles'
ALTER TABLE [dbo].[cotizacion_detalles]
ADD CONSTRAINT [FK_cotizacion_detalles_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cotizacion_detalles_producto'
CREATE INDEX [IX_FK_cotizacion_detalles_producto]
ON [dbo].[cotizacion_detalles]
    ([producto_codigo]);
GO

-- Creating foreign key on [cod_producto] in table 'factura_detalle'
ALTER TABLE [dbo].[factura_detalle]
ADD CONSTRAINT [FK_factura_detalle_producto]
    FOREIGN KEY ([cod_producto])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_factura_detalle_producto'
CREATE INDEX [IX_FK_factura_detalle_producto]
ON [dbo].[factura_detalle]
    ([cod_producto]);
GO

-- Creating foreign key on [producto_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_historial_movimientos_inventario_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_movimientos_inventario_producto'
CREATE INDEX [IX_FK_historial_movimientos_inventario_producto]
ON [dbo].[transferencia_inventario]
    ([producto_codigo]);
GO

-- Creating foreign key on [cod_producto] in table 'producto_codigobarra'
ALTER TABLE [dbo].[producto_codigobarra]
ADD CONSTRAINT [FK_producto_codigobarra_producto]
    FOREIGN KEY ([cod_producto])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [codigo_producto] in table 'producto_vs_detalle'
ALTER TABLE [dbo].[producto_vs_detalle]
ADD CONSTRAINT [FK_producto_detalle_producto]
    FOREIGN KEY ([codigo_producto])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [subcategoria_producto_codigo] in table 'producto'
ALTER TABLE [dbo].[producto]
ADD CONSTRAINT [FK_producto_subcategoria_producto]
    FOREIGN KEY ([subcategoria_producto_codigo])
    REFERENCES [dbo].[subcategoria_producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_subcategoria_producto'
CREATE INDEX [IX_FK_producto_subcategoria_producto]
ON [dbo].[producto]
    ([subcategoria_producto_codigo]);
GO

-- Creating foreign key on [cod_detalle] in table 'mesas_detalles'
ALTER TABLE [dbo].[mesas_detalles]
ADD CONSTRAINT [FK_mesas_detalles_producto_detalle]
    FOREIGN KEY ([cod_detalle])
    REFERENCES [dbo].[producto_detalle]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_mesas_detalles_producto_detalle'
CREATE INDEX [IX_FK_mesas_detalles_producto_detalle]
ON [dbo].[mesas_detalles]
    ([cod_detalle]);
GO

-- Creating foreign key on [codigo_detalle] in table 'producto_vs_detalle'
ALTER TABLE [dbo].[producto_vs_detalle]
ADD CONSTRAINT [FK_producto_detalle_producto_especificacion]
    FOREIGN KEY ([codigo_detalle])
    REFERENCES [dbo].[producto_detalle]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_detalle_producto_especificacion'
CREATE INDEX [IX_FK_producto_detalle_producto_especificacion]
ON [dbo].[producto_vs_detalle]
    ([codigo_detalle]);
GO

-- Creating foreign key on [codigo] in table 'producto_oferta_historial'
ALTER TABLE [dbo].[producto_oferta_historial]
ADD CONSTRAINT [FK_producto_oferta_historial_producto_oferta]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[producto_oferta]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [region_codigo] in table 'provincia'
ALTER TABLE [dbo].[provincia]
ADD CONSTRAINT [FK_provincia_region]
    FOREIGN KEY ([region_codigo])
    REFERENCES [dbo].[region]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_provincia_region'
CREATE INDEX [IX_FK_provincia_region]
ON [dbo].[provincia]
    ([region_codigo]);
GO

-- Creating foreign key on [provincia_codigo] in table 'sector'
ALTER TABLE [dbo].[sector]
ADD CONSTRAINT [FK_sector_provincia]
    FOREIGN KEY ([provincia_codigo])
    REFERENCES [dbo].[provincia]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_sector_provincia'
CREATE INDEX [IX_FK_sector_provincia]
ON [dbo].[sector]
    ([provincia_codigo]);
GO

-- Creating foreign key on [sistema_modulos_codigo] in table 'sistema_modulo_opciones'
ALTER TABLE [dbo].[sistema_modulo_opciones]
ADD CONSTRAINT [FK_sistema_modulo_opciones_sistema_modulos]
    FOREIGN KEY ([sistema_modulos_codigo])
    REFERENCES [dbo].[sistema_modulos]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_sistema_modulo_opciones_sistema_modulos'
CREATE INDEX [IX_FK_sistema_modulo_opciones_sistema_modulos]
ON [dbo].[sistema_modulo_opciones]
    ([sistema_modulos_codigo]);
GO

-- Creating foreign key on [cod_situacion] in table 'empleado_historial_datos'
ALTER TABLE [dbo].[empleado_historial_datos]
ADD CONSTRAINT [FK_empleado_historial_datos_situacion_empleado]
    FOREIGN KEY ([cod_situacion])
    REFERENCES [dbo].[situacion_empleado]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_empleado_historial_datos_situacion_empleado'
CREATE INDEX [IX_FK_empleado_historial_datos_situacion_empleado]
ON [dbo].[empleado_historial_datos]
    ([cod_situacion]);
GO

-- Creating foreign key on [cod_sucursal] in table 'sucursal_vs_empleado'
ALTER TABLE [dbo].[sucursal_vs_empleado]
ADD CONSTRAINT [FK_sucursal_vs_empleado_sucursal]
    FOREIGN KEY ([cod_sucursal])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [sucursal_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_transferencia_inventario_sucursal1]
    FOREIGN KEY ([sucursal_codigo])
    REFERENCES [dbo].[sucursal]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_transferencia_inventario_sucursal1'
CREATE INDEX [IX_FK_transferencia_inventario_sucursal1]
ON [dbo].[transferencia_inventario]
    ([sucursal_codigo]);
GO

-- Creating foreign key on [tercero_codigo] in table 'tercero_observaciones'
ALTER TABLE [dbo].[tercero_observaciones]
ADD CONSTRAINT [FK_tercero_observaciones_tercero]
    FOREIGN KEY ([tercero_codigo])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_tercero_observaciones_tercero'
CREATE INDEX [IX_FK_tercero_observaciones_tercero]
ON [dbo].[tercero_observaciones]
    ([tercero_codigo]);
GO

-- Creating foreign key on [cod_tercero] in table 'tercero_vs_email'
ALTER TABLE [dbo].[tercero_vs_email]
ADD CONSTRAINT [FK_tercero_vs_email_tercero]
    FOREIGN KEY ([cod_tercero])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [cod_tercero] in table 'tercero_vs_permiso'
ALTER TABLE [dbo].[tercero_vs_permiso]
ADD CONSTRAINT [FK_tercero_vs_permiso_tercero]
    FOREIGN KEY ([cod_tercero])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [cod_tercero] in table 'tercero_vs_telefono'
ALTER TABLE [dbo].[tercero_vs_telefono]
ADD CONSTRAINT [FK_tervero_vs_telefono_tercero]
    FOREIGN KEY ([cod_tercero])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [codigo] in table 'vendedor'
ALTER TABLE [dbo].[vendedor]
ADD CONSTRAINT [FK_vendedor_tercero]
    FOREIGN KEY ([codigo])
    REFERENCES [dbo].[tercero]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [tipo_movimiento_inventario_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_historial_movimientos_inventario_tipo_movimiento_inventario]
    FOREIGN KEY ([tipo_movimiento_inventario_codigo])
    REFERENCES [dbo].[tipo_movimiento_inventario]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_movimientos_inventario_tipo_movimiento_inventario'
CREATE INDEX [IX_FK_historial_movimientos_inventario_tipo_movimiento_inventario]
ON [dbo].[transferencia_inventario]
    ([tipo_movimiento_inventario_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'transferencia_inventario'
ALTER TABLE [dbo].[transferencia_inventario]
ADD CONSTRAINT [FK_historial_movimientos_inventario_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_historial_movimientos_inventario_unidad'
CREATE INDEX [IX_FK_historial_movimientos_inventario_unidad]
ON [dbo].[transferencia_inventario]
    ([unidad_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'cotizacion_detalles'
ALTER TABLE [dbo].[cotizacion_detalles]
ADD CONSTRAINT [FK_cotizacion_detalles_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_cotizacion_detalles_unidad'
CREATE INDEX [IX_FK_cotizacion_detalles_unidad]
ON [dbo].[cotizacion_detalles]
    ([unidad_codigo]);
GO

-- Creating foreign key on [unidad_codigo] in table 'factura_detalle'
ALTER TABLE [dbo].[factura_detalle]
ADD CONSTRAINT [FK_factura_detalle_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_factura_detalle_unidad'
CREATE INDEX [IX_FK_factura_detalle_unidad]
ON [dbo].[factura_detalle]
    ([unidad_codigo]);
GO

-- Creating foreign key on [cod_unidad] in table 'producto_codigobarra'
ALTER TABLE [dbo].[producto_codigobarra]
ADD CONSTRAINT [FK_producto_codigobarra_unidad]
    FOREIGN KEY ([cod_unidad])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_codigobarra_unidad'
CREATE INDEX [IX_FK_producto_codigobarra_unidad]
ON [dbo].[producto_codigobarra]
    ([cod_unidad]);
GO

-- Creating foreign key on [grupo_usuarios_codigo] in table 'grupo_usuarios_permisos'
ALTER TABLE [dbo].[grupo_usuarios_permisos]
ADD CONSTRAINT [FK_grupo_usuarios_permisos_grupo_usuarios]
    FOREIGN KEY ([grupo_usuarios_codigo])
    REFERENCES [dbo].[grupo_usuarios]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [permiso_codigo] in table 'grupo_usuarios_permisos'
ALTER TABLE [dbo].[grupo_usuarios_permisos]
ADD CONSTRAINT [FK_grupo_usuarios_permisos_permiso]
    FOREIGN KEY ([permiso_codigo])
    REFERENCES [dbo].[permiso]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_grupo_usuarios_permisos_permiso'
CREATE INDEX [IX_FK_grupo_usuarios_permisos_permiso]
ON [dbo].[grupo_usuarios_permisos]
    ([permiso_codigo]);
GO

-- Creating foreign key on [producto_codigo] in table 'producto_unidad'
ALTER TABLE [dbo].[producto_unidad]
ADD CONSTRAINT [FK_producto_unidad_producto]
    FOREIGN KEY ([producto_codigo])
    REFERENCES [dbo].[producto]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [unidad_codigo] in table 'producto_unidad'
ALTER TABLE [dbo].[producto_unidad]
ADD CONSTRAINT [FK_producto_unidad_unidad]
    FOREIGN KEY ([unidad_codigo])
    REFERENCES [dbo].[unidad]
        ([codigo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_producto_unidad_unidad'
CREATE INDEX [IX_FK_producto_unidad_unidad]
ON [dbo].[producto_unidad]
    ([unidad_codigo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------