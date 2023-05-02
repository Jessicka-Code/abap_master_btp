@EndUserText.label: 'Consumption-Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPL_9117
  as projection on Z_I_BOOKSUPPL_9117
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      @ObjectModel.text.element: ['SupplementDescription']
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency_code               as CurrencyCode,
      last_change_at              as LastChangedAt,
      /* Associations */
      _Travel  : redirected to Z_C_TRAVEL_9117,
      _Booking : redirected to parent Z_C_BOOKING_9117,
      _Product,
      _SupplementText
}
