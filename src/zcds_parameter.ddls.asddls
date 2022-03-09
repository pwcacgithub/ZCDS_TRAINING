@AbapCatalog.sqlViewName: 'ZCDSPARAM1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS Views Parameters'
define view ZCDS_PARAMETER
  with parameters
    p_carrid : s_carr_id,
    p_connid : s_conn_id,
    //@Environment.systemField:#SYSTEM_DATE
    p_fldate : syst_datum
  as select from sflight
{
  key carrid,
  key connid,
      fldate,
      price,
      currency,
      planetype,
      $session.system_date as SystemDate
}
where
      carrid = :p_carrid
  and connid = :p_connid
  //and fldate = $parameters.p_fldate
