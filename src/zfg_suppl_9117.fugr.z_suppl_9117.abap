FUNCTION z_suppl_9117.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SUPPLEMENTS) TYPE  ZTT_SUPPL_9117
*"     REFERENCE(IV_OP_TYPE) TYPE  ZDE_FLAG_9117
*"  EXPORTING
*"     REFERENCE(EV_UPDATED) TYPE  ZDE_FLAG_9117
*"----------------------------------------------------------------------
  CHECK NOT it_supplements IS INITIAL.

  CASE iv_op_type.
    WHEN 'C'.
      INSERT ztb_booksup_9117 FROM TABLE @it_supplements.
    WHEN 'U'.
      UPDATE ztb_booksup_9117 FROM TABLE @it_supplements.
    WHEN 'D'.
      DELETE ztb_booksup_9117 FROM TABLE @it_supplements.
  ENDCASE.

  IF sy-subrc EQ 0.
    ev_updated = abap_true.
  ENDIF.

ENDFUNCTION.
