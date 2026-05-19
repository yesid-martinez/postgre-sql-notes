-- Aritmética de punteros
SELECT attname, atttypid::regtype AS tipo, attlen, attnum
FROM pg_attribute
WHERE attrelid = 'industrial_sensors'::regclass AND attnum > 0;
