SELECT
  attname,
  n_distinct,
  correlation 
FROM pg_stats
WHERE tablename = 'industrial_sensors';
