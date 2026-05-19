select * from pg_stat_activity;

-- select pg_backend_pid(); -- Active Backend Session ID

-- SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid = 12345; -- Detener proceso backend asociado al PID 12345.
