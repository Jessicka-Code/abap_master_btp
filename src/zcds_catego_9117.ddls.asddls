@AbapCatalog.sqlViewName: 'ZV_CAT_9117'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorías'
define view ZCDS_CATEGO_9117
  as select from ztb_catego_9117
{
  key bi_categ    as Categoria,
      descripcion as Descripcion
}
