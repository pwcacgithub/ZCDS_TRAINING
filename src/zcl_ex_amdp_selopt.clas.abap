CLASS zcl_ex_amdp_selopt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF ty_data,
            matnr TYPE matnr,
            ersda TYPE ersda,
            ernam TYPE ernam,
        END OF ty_data.

    TYPES: tt_data TYPE TABLE OF ty_data.

    CLASS-METHODS: get_data IMPORTING VALUE(iv_cond) TYPE string
                            EXPORTING VALUE(et_data) TYPE tt_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EX_AMDP_SELOPT IMPLEMENTATION.


  METHOD get_data BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
                OPTIONS READ-ONLY USING mara.

    lt_data = APPLY_FILTER ( mara, :iv_cond );

    et_data = SELECT _mara.matnr, _mara.ersda, _mara.ernam
                FROM :lt_data as _mara order by matnr;

  ENDMETHOD.
ENDCLASS.
