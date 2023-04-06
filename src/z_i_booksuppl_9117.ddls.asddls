@AbapCatalog.sqlViewName: 'ZV_BOOK_9117'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking Supplement'
define view Z_I_BOOKSUPPL_9117
  as select from ztb_booksup_9117
  association        to parent Z_I_BOOKING_9117 as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                   and $projection.booking_id = _Booking.booking_id
  association [1..1] to Z_I_TRAVEL_9117          as _Travel        on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement       as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID

{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
      
}
