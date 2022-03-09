@AbapCatalog.sqlViewName: 'ZCDSAGGFUN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Aggregate Function'
define view ZCDS_AGGFUNCTION
//  as select from sflight
//{
//  carrid,
//  count( distinct planetype ) as planeTypes
//}
//where
//  carrid = 'AA'
//group by
//  carrid

  as select from sflight
{
  min( price )                as Min_Price,
  max( price )                as Max_Price,
  sum( price )                as Total_Price,
  avg( price )                as TotalAverage
}
where
      carrid = 'LH'
  and connid = '0400'
