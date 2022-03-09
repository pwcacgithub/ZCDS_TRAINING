@AbapCatalog.sqlViewName: 'ZCDSPARAM2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Accessing Parameterized CDS Views in another CDS view'
define view ZCDS_PARAMETER2
  as select from ZEX_I_Parameter ( p_carrid : 'AA' ,
                                    p_connid : '0017',
                                    p_fldate : '20180111')

{
  *
}
