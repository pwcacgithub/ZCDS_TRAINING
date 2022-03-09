*&---------------------------------------------------------------------*
*& Report zr_amdp_param
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_amdp_param.

*** Parameter Declaration
PARAMETERS: p_carrid TYPE sflights-carrid.

*** Create instance for AMDP Class
DATA(lo_amdp_param) = NEW zcl_ex_amdp_param(  ).

*** Get Flight Connection Details
lo_amdp_param->get_flightconnections( EXPORTING i_carrid = p_carrid
                                    IMPORTING et_flightconn = DATA(lt_flightconn) ).
IF lt_flightconn[] IS NOT INITIAL.
*** Display Report
  cl_demo_output=>display_data( name = 'Flight Connections'
                                value = lt_flightconn ).

ENDIF.
