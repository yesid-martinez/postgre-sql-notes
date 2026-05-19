SELECT pg_relation_filepath('industrial_sensors') AS file_route;
-- relation_filepath: función interna del catálogo
-- Recibe: una tabla, índice, secuencia, materialized view,TOAST table...
-- Devuelve: ruta física relativa al directorio $PGDATA

--> base/5/20820
-- 1) base: identifica el subdirectorio de bases de datos.
-- 2) 5: DB OID
-- 3) 20820: table relfilenode, puede coincidir con el oid.
