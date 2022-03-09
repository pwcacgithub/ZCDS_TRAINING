CLASS zcl_ex_amdp_param DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*** Interface Declaration
    INTERFACES if_amdp_marker_hdb.

*** Types Declaration
    TYPES: BEGIN OF ty_sflights,
            mandt   TYPE sflights-mandt,
            carrid  TYPE sflights-carrid,
            carrname  TYPE sflights-carrname,
            countryfr TYPE sflights-countryfr,
            cityto  TYPE string,
        END OF ty_sflights,

        tt_sflights TYPE STANDARD TABLE OF ty_sflights.

*** Method Declaration
    METHODS:
    get_flightconnections
        IMPORTING
        VALUE(i_carrid)     TYPE sflights-carrid
        EXPORTING
        VALUE(et_flightconn) TYPE tt_sflights.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EX_AMDP_PARAM IMPLEMENTATION.


  METHOD get_flightconnections BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
                            OPTIONS READ-ONLY USING sflights.

*** Perform STRING_AGG functions
    et_flightconn = select distinct
                        sflights.mandt,
                        sflights.carrid,
                        sflights.carrname,
                        sflights.countryfr,
                        string_agg( sflights.cityto, ',' order by cityto ) as cityto
                    from sflights
                    where sflights.mandt = session_context( 'CLIENT' )
                    and sflights.carrid = i_carrid
                    group by sflights.mandt, sflights.carrid, sflights.carrname,sflights.countryfr
                    order by carrid;

  ENDMETHOD.
ENDCLASS.
