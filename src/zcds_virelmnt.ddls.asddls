@AbapCatalog.sqlViewName: 'ZCDSVIRELMNT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Document Details'
@OData.publish: true                                                  //Odata Generated
define view ZCDS_VIRELMNT
as select from vbak as _vbak
inner join vbap as _vbap  on _vbak.vbeln = _vbap.vbeln       
{

@UI: { lineItem: [ { position: 10, label: 'Sales Document'} ]}
    key _vbak.vbeln as Sales_Document,

@UI: { lineItem: [ { position: 20, label: 'Item'} ]}    
    key _vbap.posnr as Item,

@UI: { lineItem: [ { position: 30, label: 'Material'} ]}    
        _vbap.matnr as Material,

@UI: { lineItem: [ { position: 40, label: 'Created On'} ]}
        _vbak.erdat as Created_On,

@UI: { lineItem: [ { position: 50, label: 'Created By Test'} ]}        
        _vbak.ernam as Created_By,

@UI: { lineItem: [ { position: 40, label: 'Header Text'} ]}
//@ObjectModel.virtualElement: true
//@ObjectModel.virtualElementCalculatedBy: 'ZCL_HEADERTEXT_CALC'      //Calculation Class
        cast( '' as abap.char(255)) as Header_Text
@<ObjectModel.virtualElement: true
@<ObjectModel.virtualElementCalculatedBy: 'ZCL_HEADERTEXT_CALC'      //Calculation Class
}
where _vbak.vbeln >= '0060000000' 
    and _vbak.vbeln <= '0060000020' 
