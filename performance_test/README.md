# Optimización de consultas usando work_mem

## Objetivo
Analizar el impacto de la configuración de memoria work_mem sobre una consulta que realiza ordenamiento sobre una tabla grande.

La prueba se realizó sobre la tabla: `traffic_telemetry` con aproximadamente: `2,000,000 registros`

## Consulta analizada
```
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM traffic_telemetry
ORDER BY timestamp_recorded DESC;
```
Esta consulta:

- Lee todos los registros de la tabla.
- Ordena los resultados por timestamp_recorded.
- Retorna todas las filas ordenadas.

## Resultado con work_mem = 16 MB
```
Plan de ejecución:

Sort Method: external merge  Disk: 113520kB
Buffers: shared hit=18695, temp read=14190 written=14195
Execution Time: 1222.748 ms
```

### Análisis

La operación de ordenamiento (Sort) no pudo realizarse completamente en memoria RAM.
PostgreSQL utilizó `external merge` lo que significa que:

- El motor agotó el espacio disponible en work_mem.
- Parte del ordenamiento se escribió en archivos temporales.
- El proceso necesitó operaciones de lectura/escritura en disco.

> [!WARNING]
> Cuando PostgreSQL usa external merge, el rendimiento disminuye significativamente debido al uso de disco temporal (temp files).

---

## Incremento temporal de work_mem

Se realizó una modificación temporal de sesión:

```
SET work_mem = '256MB';
```

> [!IMPORTANT]
> SET work_mem afecta únicamente la sesión actual y no modifica permanentemente la configuración global del servidor.

---

## Resultado con work_mem = 256MB
```
Nuevo plan de ejecución:

Sort Method: quicksort  Memory: 189778kB
Execution Time: 575.557 ms
```

## Cambios observados

Antes:
```
Sort Method: external merge
Disk: 113520kB
Execution Time: ~1222 ms
```

Después:
```
Sort Method: quicksort
Memory: 189778kB
Execution Time: ~575 ms
```
PostgreSQL pudo realizar el ordenamiento completamente en memoria RAM.
- Ya no fue necesario escribir archivos temporales.
- Desaparecieron los temp read/write.
- El algoritmo utilizado cambió a `quicksort`

> [!NOTE]
> El algoritmo quicksort en memoria es considerablemente más eficiente que external merge cuando el conjunto de datos cabe completamente en RAM.

# Conclusión

- Se comprobó experimentalmente el impacto de work_mem.
- Se verificó cómo PostgreSQL cambia entre `external merge` y `quicksort`
- Se redujo el tiempo de ejecución aproximadamente en un `50%`.
- El principal cuello de botella no era el Seq Scan, sino el proceso de ordenamiento (Sort).
- El acceso secuencial a la tabla fue relativamente eficiente: `Seq Scan actual time=0.008..96ms`
- El ordenamiento completo de 2 millones de filas generó el mayor costo computacional.

## Optimización estructural recomendada

Aunque aumentar work_mem mejoró el rendimiento, la optimización correcta para esta consulta es crear un índice sobre la columna utilizada en ORDER BY.

> [!TIP]
> Los índices son especialmente efectivos en consultas paginadas o consultas con LIMIT.
