@EndUserText.label: 'Table Function with Select Options'
define table function ZCDS_TF_GETFLIGHTCON_SO
  with parameters
    sel_opt : abap.char(1000)
returns
{
  mandt : abap.clnt;
  matnr : matnr;
  maktx : maktx;  
}
implemented by method
  zcl_ex_tf_amdp=>get_flightconnections_tblfn_so;
