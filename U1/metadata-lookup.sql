-- Explain analyse SELECT pg_attribute.*
-- FROM pg_class
-- JOIN pg_attribute
--   ON pg_attribute.attrelid = pg_class.oid
-- WHERE pg_class.relname = 'industrial_sensors';

SELECT * FROM pg_attribute WHERE attrelid = 'industrial_sensors'::regclass;
