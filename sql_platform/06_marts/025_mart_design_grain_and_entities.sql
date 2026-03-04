USE DATABASE ENTERPRISE_DATA_PLATFORM_DB;
USE SCHEMA ENTERPRISE_DATA_PLATFORM_DB.STAGING;

-- Understand grains and keys before building MART
SELECT 
  COUNT(*) AS stg_orders_rows,
  COUNT(DISTINCT order_id) AS distinct_orders,
  COUNT(DISTINCT customer_id) AS distinct_customers
FROM STG_ORDERS;

SELECT 
  MIN(order_purchase_timestamp) AS min_purchase_ts,
  MAX(order_purchase_timestamp) AS max_purchase_ts
FROM STG_ORDERS;

select * from MART_CUSTOMER_RETENTION_KPIS;