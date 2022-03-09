@AbapCatalog.sqlViewName: 'ZCDSJOINS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Joins'
define view ZCDS_JOINS

//---Cross Join---//
//  as select from 
//                 t000 
//      cross join t100 
//    { 
//      t000.mandt, 
//      t000.mtext, 
//      t100.sprsl, 
//      t100.arbgb, 
//      t100.msgnr, 
//      t100.text 
//    } 
//    where 
//      t100.arbgb = 'SABAPDEMOS' 

//---Left Outer Join---//
//  as select from    scustom as c
//    left outer join sbook   as b on c.id = b.customid
//{
//  c.name as CustomerName,
//  c.city as CustomerCity
//}
//where
//  b.bookid = '00002406'


  //---Inner Join---//
  as select from sbook   as b
    inner join   spfli   as p on  b.carrid <> p.carrid
                              and b.connid <> p.connid
    inner join   scustom as c on b.customid = c.id
{
  b.customid,
  c.name,
  b.fldate,
  p.cityfrom,
  p.cityto
}
where
  b.bookid = '00002406'

