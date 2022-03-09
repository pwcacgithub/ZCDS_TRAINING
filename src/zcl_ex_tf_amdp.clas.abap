CLASS zcl_ex_tf_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_amdp_marker_hdb.
    CLASS-METHODS: get_flightconnections_tblfn FOR TABLE FUNCTION zcds_tf_getflightcon.
    CLASS-METHODS: get_flightconnections_tblfn_so FOR TABLE FUNCTION zcds_tf_getflightcon_so.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EX_TF_AMDP IMPLEMENTATION.


  METHOD get_flightconnections_tblfn BY DATABASE FUNCTION FOR HDB
                                LANGUAGE SQLSCRIPT
                                OPTIONS READ-ONLY
                                USING sflights.
    RETURN
    SELECT DISTINCT
        sflights.mandt,
        sflights.carrid,
        sflights.carrname,
        sflights.countryfr,
        string_agg( sflights.cityto, ',' ORDER BY cityto ) as cityto
    FROM sflights
    WHERE sflights.mandt = session_context( 'CLIENT' )
    AND   sflights.carrid = p_carrid
    GROUP BY sflights.mandt,sflights.carrid,sflights.carrname,sflights.countryfr
    order by carrid;

  endmethod.


  METHOD get_flightconnections_tblfn_so BY DATABASE FUNCTION FOR HDB
                                LANGUAGE SQLSCRIPT
                                OPTIONS READ-ONLY
                                USING mara makt.

*System Language = session_context( 'LOCALE_SAP')
*System User     = session_context( 'APPLICATIONUSER')
*System Client   = session_context( 'CLIENT')

    lt_data = apply_filter ( mara, :sel_opt );

RETURN
SELECT mara.mandt, mara.matnr, makt.maktx
from :lt_data mara inner join makt
makt on mara.mandt = makt.mandt
    and mara.matnr = makt.matnr
    and makt.spras = session_context( 'LOCALE_SAP')
     order by matnr;
  ENDMETHOD.
ENDCLASS.
