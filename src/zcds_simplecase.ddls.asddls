@AbapCatalog.sqlViewName: 'ZCDSSIMCASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Simple Case Statement'
define view ZCDS_SIMPLECASE as select from sbuspart     //Airline Partner
{
buspartnum as ID,
contact,
contphono,
case buspatyp
when 'FC' then 'Customer'
when 'TA' then 'Travel Agency'
else 'NA'
end as Type
}
