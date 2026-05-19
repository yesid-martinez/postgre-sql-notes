-- SELECT pid, locktype, mode, granted
-- FROM pg_locks
-- WHERE relation = 'industrial_sensors'::regclass;

SELECT pid, locktype, mode, granted FROM pg_locks;
