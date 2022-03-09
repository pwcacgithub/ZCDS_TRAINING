@AbapCatalog.sqlViewName: 'ZCDSSFLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sample for Extension View'
define view ZCDS_SFLIGHT as select from sflight {    
    key carrid,
    key connid,
    key fldate,
    price,
    currency,
 case carrid
when 'AA' then 'Customer'
when 'BB' then 'Travel Agency'
else 'NA'
end as Type
}

