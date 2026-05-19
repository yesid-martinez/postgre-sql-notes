EXPLAIN (ANALYZE, COSTS, BUFFERS) SELECT * FROM industrial_sensors WHERE read_value > 99.5;

-- shared hit: RAM pages
-- shared read: Disk pages
