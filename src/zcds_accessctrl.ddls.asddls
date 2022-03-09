@AbapCatalog.sqlViewName: 'ZCDSACCESSCTRL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Access control based on logon user'
define view ZCDS_Accessctrl
  as select from ekko
{
  ebeln,
  bukrs,
  ernam
}
