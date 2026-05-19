DO $$
  DECLARE test_plate text:= 'ALERTA-999';
  test_speed numeric:= 250.00;
  status text;

  BEGIN INSERT INTO traffic_telemetry (road_id, operator_id, model_id, vehicle_plate, detected_speed) VALUES (1, 1, 1, test_plate, test_speed);

  IF test_speed > 200 THEN
      RAISE EXCEPTION 'ALERTA DE SEGURIDAD: Lectura incompatible, Abortando registro.';
  END IF;

  status := 'Registro exitoso';
  RAISE NOTICE '%', status;

  -- Undo Log -> Revertir cambios no confirmados físicamente (COMMIT)
  EXCEPTION
    WHEN OTHERS THEN
        status := 'TRANSACCIÓN CANCELADA (ROLLBACK): ' || SQLERRM;
        RAISE NOTICE '%', status;
END $$
