*&---------------------------------------------------------------------*
*& Report ZR_CDS_TF_SELOPT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_cds_tf_selopt.


DATA:
  lv_matnr TYPE matnr.

SELECT-OPTIONS:
  s_matnr FOR lv_matnr.

DATA(lv_cond) = cl_shdb_seltab=>combine_seltabs(
                    it_named_seltabs = VALUE #( ( name = 'MATNR' dref = REF #( s_matnr[] ) ) )
                    iv_client_field = 'MANDT' ).

SELECT * FROM zcds_tf_getflightcon_so( sel_opt = @lv_cond )
  INTO TABLE @DATA(lt_data).
IF sy-subrc = 0.
  cl_demo_output=>display_data( value = lt_data ).
ENDIF.
