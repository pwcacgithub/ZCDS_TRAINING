@AbapCatalog.sqlViewName: 'ZCDSASSO1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Associations'

define view ZCDS_ASSOCIATIONS1
  as select from sflight
  association [1..*] to sbook as _sbook on  $projection.carrid = _sbook.carrid
                                        and $projection.connid = _sbook.connid
                                        and $projection.fldate = _sbook.fldate
{
  key   carrid,
  key   connid,
  key   fldate,
 
        //Exposed Association
        _sbook[ forcurkey = 'JPY' ] as _SbookFlights
        //_sbook as _SbookFlights
        //_sbook[ inner ] as _SbookFlights
}
where
  sflight.carrid = 'AA'
//and _sbook.forcurkey = 'JPY'
//  and sflight.connid = '0017'
