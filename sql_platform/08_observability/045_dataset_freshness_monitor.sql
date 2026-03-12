CREATE OR REPLACE VIEW OPS.DATASET_FRESHNESS_MONITOR AS

SELECT
table_schema,
table_name,
last_altered AS last_update_time,
DATEDIFF('minute', last_altered, CURRENT_TIMESTAMP()) AS minutes_since_update

FROM ENTERPRISE_DATA_PLATFORM_DB.INFORMATION_SCHEMA.TABLES
WHERE table_schema IN ('RAW','STAGING','MART');