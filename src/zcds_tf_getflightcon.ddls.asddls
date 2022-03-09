@EndUserText.label: 'Get Flight Connection'
define table function ZCDS_TF_GETFLIGHTCON
  with parameters
    p_carrid : s_carr_id
returns
{
  mandt     : abap.clnt;
  carrid    : s_carr_id;
  carrname  : s_carrname;
  countryfr : land1;
  cityto    : stringval;
}
implemented by method
  zcl_ex_tf_amdp=>get_flightconnections_tblfn;
