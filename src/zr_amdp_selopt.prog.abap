*&---------------------------------------------------------------------*
*& Report zr_amdp_param
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_amdp_selopt.

DATA: ls_mara TYPE mara.
SELECT-OPTIONS: s_matnr FOR ls_mara-matnr.

DATA(lv_cond) = cl_shdb_seltab=>combine_seltabs(
                    it_named_seltabs = VALUE #( ( name = 'MATNR' dref = REF #( s_matnr[] ) ) )
                    iv_client_field = 'MANDT' ).

zcl_ex_amdp_selopt=>get_data(
    EXPORTING
        iv_cond = lv_cond
    IMPORTING
        et_data = DATA(lt_data) ).

cl_demo_output=>display_data( value = lt_data ).
