USE WAREHOUSE EDP_WH;
USE DATABASE ENTERPRISE_DATA_PLATFORM_DB;
USE SCHEMA ENTERPRISE_DATA_PLATFORM_DB.META;

-- RAW: OLIST_CUSTOMERS_RAW (source truth from files)
INSERT INTO DATA_DICTIONARY (
  DATABASE_NAME, SCHEMA_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE,
  BUSINESS_DEFINITION, STEWARD_OWNER, SOURCE_SYSTEM,
  SENSITIVITY_CLASS, QUALITY_SLA, CREATED_AT
)
VALUES
('ENTERPRISE_DATA_PLATFORM_DB','RAW','OLIST_CUSTOMERS_RAW','CUSTOMER_ID','STRING',
 'Unique identifier for a customer record in the Olist platform dataset.',
 'Data Steward - Customer Domain','Olist Kaggle Dataset',
 'INTERNAL','100% not null; unique expected', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','RAW','OLIST_CUSTOMERS_RAW','CUSTOMER_UNIQUE_ID','STRING',
 'Stable unique identifier that links multiple orders to the same customer across time.',
 'Data Steward - Customer Domain','Olist Kaggle Dataset',
 'INTERNAL','Not null expected; duplicate allowed depending on model logic', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','RAW','OLIST_CUSTOMERS_RAW','CUSTOMER_ZIP_CODE_PREFIX','NUMBER',
 'Customer postal code prefix (first digits) used for regional analysis.',
 'Data Steward - Customer Domain','Olist Kaggle Dataset',
 'INTERNAL','Not null preferred; must be numeric', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','RAW','OLIST_CUSTOMERS_RAW','CUSTOMER_CITY','STRING',
 'Customer city name captured at time of account/order.',
 'Data Steward - Customer Domain','Olist Kaggle Dataset',
 'INTERNAL','Not null preferred; trimmed', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','RAW','OLIST_CUSTOMERS_RAW','CUSTOMER_STATE','STRING',
 'Customer state code (2 characters).',
 'Data Steward - Customer Domain','Olist Kaggle Dataset',
 'INTERNAL','Not null; length=2', CURRENT_TIMESTAMP());

-- STAGING: STG_CUSTOMERS (cleaned + standardized version for downstream use)
INSERT INTO DATA_DICTIONARY (
  DATABASE_NAME, SCHEMA_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE,
  BUSINESS_DEFINITION, STEWARD_OWNER, SOURCE_SYSTEM,
  SENSITIVITY_CLASS, QUALITY_SLA, CREATED_AT
)
VALUES
('ENTERPRISE_DATA_PLATFORM_DB','STAGING','STG_CUSTOMERS','CUSTOMER_ID','STRING',
 'Primary customer key used across staging and mart models (trimmed/standardized).',
 'Data Steward - Customer Domain','dbt: stg_customers from RAW.OLIST_CUSTOMERS_RAW',
 'INTERNAL','100% not null; unique enforced via dbt', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','STAGING','STG_CUSTOMERS','CUSTOMER_UNIQUE_ID','STRING',
 'Business-level customer identifier used for identity resolution and LTV analytics.',
 'Data Steward - Customer Domain','dbt: stg_customers from RAW.OLIST_CUSTOMERS_RAW',
 'INTERNAL','Not null preferred; supports customer grouping', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','STAGING','STG_CUSTOMERS','CUSTOMER_ZIP_CODE_PREFIX','NUMBER',
 'Normalized ZIP prefix supporting geo rollups (city/state mapping).',
 'Data Steward - Customer Domain','dbt: stg_customers from RAW.OLIST_CUSTOMERS_RAW',
 'INTERNAL','Numeric; range checks optional', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','STAGING','STG_CUSTOMERS','CUSTOMER_CITY','STRING',
 'Standardized city used for reporting and segmentation.',
 'Data Steward - Customer Domain','dbt: stg_customers from RAW.OLIST_CUSTOMERS_RAW',
 'INTERNAL','Trimmed; not null preferred', CURRENT_TIMESTAMP()),

('ENTERPRISE_DATA_PLATFORM_DB','STAGING','STG_CUSTOMERS','CUSTOMER_STATE','STRING',
 'Validated 2-char state code used for regional KPIs.',
 'Data Steward - Customer Domain','dbt: stg_customers from RAW.OLIST_CUSTOMERS_RAW',
 'INTERNAL','Not null; length=2; accepted values optional', CURRENT_TIMESTAMP());




 SELECT
  SCHEMA_NAME,
  TABLE_NAME,
  COUNT(*) AS dictionary_rows
FROM ENTERPRISE_DATA_PLATFORM_DB.META.DATA_DICTIONARY
GROUP BY 1,2
ORDER BY 1,2;


SELECT *
FROM ENTERPRISE_DATA_PLATFORM_DB.META.DATA_DICTIONARY
ORDER BY CREATED_AT DESC
LIMIT 10;