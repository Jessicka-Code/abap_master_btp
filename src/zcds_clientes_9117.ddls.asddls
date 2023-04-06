@AbapCatalog.sqlViewName: 'ZV_CLI_9117'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.allowExtensions: true
define view ZCDS_CLIENTES_9117
  as select from ztb_cliente_9117 as clientes
    inner join   ztb_cln_lib_9117 as clnts on clnts.id_cliente = clientes.id_cliente
{
  key clientes.id_cliente as IdCliente,
  key tipo_acceso         as TipoAcceso,
  key clnts.id_libro,
      nombre              as Nombre,
      apellidos           as Apellidos,
      email               as Email,
      url                 as Url
}
