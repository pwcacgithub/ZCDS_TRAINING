@AbapCatalog.sqlViewName: 'ZCDSMATDET'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Material Details'
define view ZCDS_MATERIALDET
  as select from mara
{
      @EndUserText.label: 'Material Number'
  key matnr as Material,
      @EndUserText.label: 'Material Type'
      case mtart
      when 'HAWA' then 'Trading Goods'
      when 'FERT' then 'Finished Products'
      when 'ROH' then 'Raw Materials'
      when 'MAT' then 'General Materials'
      else 'Other Types'
      end   as MaterialType,
      @EndUserText.label: 'Created By'
      ernam as CreateBy,
      @EndUserText.label: 'Unit Of Measure'
      @Semantics.unitOfMeasure: true
      meins as UnitOfMeasure
}
