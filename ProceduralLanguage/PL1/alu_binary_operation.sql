DO $$
  DECLARE
    v_student text := 'Yesid Martinez';
    var_a integer:= 1500;
    var_b integer:= 3;
    v_result integer;
  BEGIN
    -- Ejecución de división binaria en la ALU
    v_result := var_a / var_b;
    -- El procesador reserva registros binarios en la work_mem. No genera I/O en disco.
    -- Es miles de veces más rápido procesar en CPU que escribir resultados intermedios.

    RAISE NOTICE 'ALU: Operación realizada por % | Resultado: %', v_student, v_result;

    DROP TABLE IF EXISTS ram_calc;
    CREATE TEMP TABLE ram_calc AS SELECT v_student AS author, v_result AS alu_result;
END $$ LANGUAGE plpgsql;

SELECT * FROM ram_calc;
