CLASS zcl_headertext_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HEADERTEXT_CALC IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
*** IT_ORIGINAL_DATA - Importing parameter after fetching the data from CDS
*** CT_CALCULATED_DATA - Changing parameter table with Calculation fields
    DATA: lt_data TYPE STANDARD TABLE OF zcds_virelmnt,
          lt_line TYPE STANDARD TABLE OF tline,
          lv_name TYPE tdobname.

    lt_data[] = CORRESPONDING #( it_original_data[] ).
    LOOP AT lt_data INTO DATA(ls_data).
      ASSIGN ct_calculated_data[ sy-tabix ] TO FIELD-SYMBOL(<lfs_calc_data>).
      ASSIGN COMPONENT 'HEADER_TEXT' OF STRUCTURE <lfs_calc_data> TO FIELD-SYMBOL(<lfs_header_text>).
      lv_name = ls_data-sales_document.
      TRY.
          CALL FUNCTION 'READ_TEXT'
            EXPORTING
              client                  = sy-mandt
              id                      = 'TX01'
              language                = sy-langu
              name                    = lv_name
              object                  = 'VBBK'
            TABLES
              lines                   = lt_line
            EXCEPTIONS
              id                      = 1
              language                = 2
              name                    = 3
              not_found               = 4
              object                  = 5
              reference_check         = 6
              wrong_access_to_archive = 7
              OTHERS                  = 8.
          IF sy-subrc EQ 0.
            LOOP AT lt_line INTO DATA(ls_line).
              <lfs_header_text> = |{ <lfs_header_text> } { ls_line-tdline }|.
            ENDLOOP.
            CONDENSE <lfs_header_text>.
          ENDIF.
        CATCH cx_root INTO DATA(lx_root).
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
