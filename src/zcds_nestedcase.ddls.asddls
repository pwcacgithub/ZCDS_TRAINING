@AbapCatalog.sqlViewName: 'ZCDSNESTCASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Nested Case Expression'
define view ZCDS_NESTEDCASE
  as select from spfli              //Flight Schedule
{
  key carrid,
  key connid,
      case carrid
      when 'AA' then 'Priority 1'
      when 'LH' then
       case connid
          when '0400' then 'Priority 2'
             else 'Prioirty 3'
             end
      else 'Unknown'
      end as Priority
}
