@AbapCatalog.sqlViewName: 'ZCDSSRCCASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Searched Case'
define view ZCDS_SEARCHCASE
  as select from spfli          //Flight Schedule
{
  key carrid,
  key connid,
      distance,
      distid,
      case
      when distance >= 2000 then 'Long-Haul Flight'
      when distance >= 1000 and
           distance < 2000  then 'Medium-Haul Flight'
      when distance < 1000  then 'Short-Haul Flight'
      else 'Error'
      end as FlightType
}
