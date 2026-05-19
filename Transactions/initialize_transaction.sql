BEGIN; -- Iniciar transacción - La totalidad del bloque será tratado como una sola unidad lógica (ACID)
-- Se crea un contexto transaccional - Transaction ID (XID)
-- Postgre hace rollback automático en caso de algún fallo
UPDATE industrial_sensors SET read_value = 0 WHERE id = 1;
-- Transacción activa. El motor mantiene el estado en RAM

COMMIT; -- ROLLBACK; Libera el recurso. 
