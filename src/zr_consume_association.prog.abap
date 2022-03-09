*&---------------------------------------------------------------------*
*& Report ZR_ASSOCIATION_CONSUMPTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_consume_association.

SELECT
  carrid,
  connid,
  fldate,
  \_sbookflights-bookid,
  \_sbookflights-forcuram,
  \_sbookflights-forcurkey
   FROM zex_i_associations1
  INTO TABLE @DATA(lt_flight1).
IF sy-subrc = 0.
  cl_demo_output=>display_data( name = 'Flight Connection'
                                value = lt_flight1 ).
ENDIF.
