@AbapCatalog.sqlViewName: 'ZCDSDATFUN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Date Functions'
define view ZCDS_DATEFUNCTION
  as select from demo_expressions
{
  id,
  dats1                                   as date1,
  dats_is_valid(dats1)                    as valid1,
  dats2                                   as date2,
  dats_is_valid(dats2)                    as valid2,
  dats_days_between(dats1,dats2)          as difference,
  dats_add_days(dats1, 1,'INITIAL')       as day1,
  dats_add_months(dats2,1,'FAIL')         as day2
}
