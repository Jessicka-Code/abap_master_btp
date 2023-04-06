@AbapCatalog.sqlViewName: 'ZV_LIBROS_9117'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.allowExtensions: true
define view ZCDS_LIBROS_9117
  as select from    ztb_libros_9117 as libros
    inner join      ztb_catego_9117 as catego on libros.bi_categ = catego.bi_categ
    left outer join ZCDS_CLNTS_9117 as ventas on libros.id_libro = ventas.IdLibro
  association [0..*] to ZCDS_CLIENTES_9117 as _Clientes on $projection.IdLibro = _Clientes.id_libro

{
  key libros.id_libro  as IdLibro,
      libros.bi_categ  as Categoria,
      libros.titulo    as Titulo,
      libros.autor     as Autor,
      libros.editorial as Editorial,
      libros.idioma    as Idioma,
      libros.paginas   as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      libros.precio    as Precio,
      @Semantics.currencyCode: true
      libros.moneda    as Moneda,
      libros.formato   as Formato,
      libros.url       as Url,
      case
        when ventas.Ventas <= 0 then 0
        when ventas.Ventas between 1 and 2 then 1
        when ventas.Ventas between 3 and 4 then 2
        when ventas.Ventas > 4 then 3
        else 0
      end as Ventas,
      
      case
        when ventas.Ventas <= 0 then 'Sin ventas'
        when ventas.Ventas between 1 and 2 then 'Pocas ventas'
        when ventas.Ventas between 3 and 4 then 'Ventas medias'
        when ventas.Ventas > 4 then 'Ventas altas'
        else 'Sin ventas'
      end as Estado,
      _Clientes
}
