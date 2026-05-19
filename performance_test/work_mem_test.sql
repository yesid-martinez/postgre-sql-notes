SET work_mem = '256MB';

EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM traffic_telemetry
ORDER BY timestamp_recorded DESC;
