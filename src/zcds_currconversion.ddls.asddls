@AbapCatalog.sqlViewName: 'ZCDSCURCONV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Currency Conversion'
define view ZCDS_CURRCONVERSION
  as select from sbook
{
  key bookid,
      forcuram,
      forcurkey,
      currency_conversion(
          amount => forcuram,
          source_currency => forcurkey,
          target_currency => cast( 'INR' as abap.cuky( 5 ) ),
          exchange_rate_date => order_date ) as Currency_in_INR
}
where
      carrid    =  'AA'
  and connid    =  '0017'
  and forcuram  <> 0
  and forcurkey =  'USD'
