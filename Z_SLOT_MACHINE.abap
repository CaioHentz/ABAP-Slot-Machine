REPORT Z_SLOT_MACHINE.

DATA: lv_idx1 TYPE i,
      lv_idx2 TYPE i,
      lv_idx3 TYPE i.

DATA: lt_simbolos TYPE TABLE OF string,
      lv_s1 TYPE string,
      lv_s2 TYPE string,
      lv_s3 TYPE string.

START-OF-SELECTION.

  " Monta a lista de símbolos
  APPEND '🍒' TO lt_simbolos.
  APPEND '🍋' TO lt_simbolos.
  APPEND '7' TO lt_simbolos.
  APPEND '🍇' TO lt_simbolos.
  APPEND '🔔' TO lt_simbolos.

  " Sorteia 3 índices (1 a 5)
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING ran_int_max = 5 ran_int_min = 1
    IMPORTING ran_int     = lv_idx1.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING ran_int_max = 5 ran_int_min = 1
    IMPORTING ran_int     = lv_idx2.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING ran_int_max = 5 ran_int_min = 1
    IMPORTING ran_int     = lv_idx3.

  " Pega símbolos correspondentes
  READ TABLE lt_simbolos INDEX lv_idx1 INTO lv_s1.
  READ TABLE lt_simbolos INDEX lv_idx2 INTO lv_s2.
  READ TABLE lt_simbolos INDEX lv_idx3 INTO lv_s3.

  " Mostra resultado
  WRITE: / '🎰 Resultado: ', lv_s1, lv_s2, lv_s3.

  " Verifica se ganhou
  IF lv_s1 = lv_s2 AND lv_s2 = lv_s3.
    WRITE: / '💰 JACKPOT!!! Você ganhou!'.
  ELSEIF lv_s1 = lv_s2 OR lv_s2 = lv_s3 OR lv_s1 = lv_s3.
    WRITE: / '💰 Boa!!! Dois acertos!'.
  ELSE.
    WRITE: / '😢 Não foi dessa vez...'.
  ENDIF.