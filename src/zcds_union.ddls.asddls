@AbapCatalog.sqlViewName: 'ZCDSUNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Union & Union ALL'
define view ZCDS_UNION
  as select from mara
{
  key matnr as material,
      mtart as MaterialType
}
where
  ernam = 'CKUMAR021'

union all select from mara
//union  select from mara
{
  key matnr as material,
      mtart as MaterialType
}
where
  ernam = 'CKUMAR021'
