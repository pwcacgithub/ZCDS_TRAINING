*&---------------------------------------------------------------------*
*& Report zr_cds_tf_program
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_cds_tf_program.

PARAMETERS p_carrid TYPE sflights-carrid.

SELECT * FROM zcds_tf_getflightcon( p_carrid = @p_carrid )
INTO TABLE @DATA(lt_flightconn).
IF sy-subrc EQ 0.
  cl_demo_output=>display_data( name = 'Flight Connection'
                                value = lt_flightconn ).

ENDIF.
