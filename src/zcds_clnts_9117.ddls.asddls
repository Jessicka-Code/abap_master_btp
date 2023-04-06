@AbapCatalog.sqlViewName: 'ZV_CLNTS_9117'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
define view ZCDS_CLNTS_9117 as select from ztb_cln_lib_9117
{
  key id_libro                    as IdLibro,
      count( distinct id_cliente) as Ventas
}
group by
  id_libro
