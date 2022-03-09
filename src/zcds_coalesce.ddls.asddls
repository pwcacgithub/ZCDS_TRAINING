@AbapCatalog.sqlViewName: 'ZCDSCOALESCE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Coalecse Function'
define view ZCDS_COALESCE
  as select from    scustom as c                        //Flight Customers
    left outer join sbook   as b on c.id = b.customid   //Single Flight Booking
{
  key    c.id                                               as CustomerId,
  key    b.bookid                                           as BookingId,
         c.name                                             as CustomerName,
         c.city                                             as CustomerCity,
         coalesce( b.invoice, 'No Valid Value' )            as Invoice
}
where
     b.bookid = '00002406'
  or b.bookid = '00005464'
