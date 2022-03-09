@AbapCatalog.sqlViewName: 'ZCDSUNITCONV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Unit Conversion'
define view ZCDS_UNITCONVERSION
  as select from sbook
{
  key bookid,
      luggweight,
      wunit,
      unit_conversion(
      quantity => luggweight,
      source_unit => wunit,
      target_unit => cast( 'G' as abap.unit ) )
  as weight_in_grams
}
where
      carrid     =  'AA'
  and connid     =  '0017'
  and luggweight <> 0
