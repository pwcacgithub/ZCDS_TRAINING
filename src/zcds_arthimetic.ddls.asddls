@AbapCatalog.sqlViewName: 'ZCDSARTOPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Simple Arithemetic operations'
define view ZCDS_ARTHIMETIC as  select from sbook           //Single Flight Booking
{

forcurkey,
forcuram as amount,
cast( forcuram as abap.fltp ) + ( cast ( -forcuram as abap.fltp ) * 0.03 ) as reduced_amount,
cast( forcuram as abap.fltp ) * 0.03 as savings
}
