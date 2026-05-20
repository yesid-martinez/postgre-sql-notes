SELECT specific_catalog, specific_schema, specific_name, routine_catalog, routine_schema, routine_name
FROM information_schema.routines
WHERE routine_type = 'FUNCTION' AND routine_schema NOT IN('pg_catalog', 'information_schema');
