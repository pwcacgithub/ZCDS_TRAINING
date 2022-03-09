*&---------------------------------------------------------------------*
*& Report ZR_PARAMETERCDS_CONSUMPTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_consume_parameterized_cds.

SELECT
  *
  FROM zex_i_parameter( p_carrid = 'AA' ,
                        p_connid = '0017',
                        p_fldate = '20190425' )
  INTO TABLE @DATA(lt_itab).
IF sy-subrc = 0.
    cl_demo_output=>display_data( name = 'Parameters in CDS'
                                value = lt_itab ).
ENDIF.
