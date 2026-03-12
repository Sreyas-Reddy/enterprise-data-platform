CREATE OR REPLACE VIEW OPS.PIPELINE_HEALTH_DASHBOARD AS

SELECT
r.pipeline_name,
r.status,
r.runtime_seconds,
f.minutes_since_update,
CASE
WHEN f.minutes_since_update > 1440 THEN 'STALE'
ELSE 'HEALTHY'
END AS freshness_status

FROM OPS.PIPELINE_RUNTIME_MONITOR r
LEFT JOIN OPS.DATASET_FRESHNESS_MONITOR f
ON r.pipeline_name = f.table_name;