@AbapCatalog.sqlViewName: 'ZCDSSTROPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'String Operations'
define view ZCDS_STRINGOPR
  as select from demo_expressions
{
  length(            char1               ) as R_Length,
  instr(             char1, 'L'         )  as R_Position,
  concat(            char1, char2        ) as R_Concat,
  concat_with_space( char1, char2, 3    )  as R_Concat_with_space,
  left(              char1, 3            ) as R_Left,
  right(             char1, 3            ) as R_Right,
  lower(             char1               ) as R_Lower,
  upper(             char2               ) as R_Upper,
  lpad(              char1, 10, '0'      ) as R_Lpad,
  rpad(              char1, 10, '0'      ) as R_Rpad,
  ltrim(             char1, 'A'          ) as R_Ltrim,
  rtrim(             char1, 'E'          ) as R_Rtrim,
  replace(           char2, 'ORA', 'XXX' ) as R_Replace,
  substring(         char2, 2, 3         ) as R_Substring
}
