DO $$
  DECLARE
    v_student text := 'Yesid Martinez Gomez';
    v_stk integer;
    v_decision text;
    BEGIN
      SELECT stock INTO v_stk FROM logistics_products WHERE id = 5;

      IF v_stk < 50 THEN
        v_decision := 'REPOSICIÓN INMEDIATA';
      ELSE
        v_decision := 'NIVEL ESTABLE';
      END IF;

      RAISE NOTICE 'Lógica: % | Decisión para ID 7: %', v_student, v_decision;

      DROP TABLE IF EXISTS stock_alert;
      CREATE TEMP TABLE stock_alert AS SELECT v_student AS author, v_decision AS sistemic_state;
END $$ LANGUAGE plpgsql;

SELECT * FROM stock_alert;
