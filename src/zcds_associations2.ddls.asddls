@AbapCatalog.sqlViewName: 'ZCDSASSO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Associations 2'
define view ZCDS_ASSOCIATIONS2 as select from ZCDS_ASSOCIATIONS1 as a {
    key a.carrid,
    key a.connid,
    sum( a._SbookFlights.forcuram ) as Amount
}
group by a.carrid, a.connid
