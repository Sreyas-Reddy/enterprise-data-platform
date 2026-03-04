USE WAREHOUSE EDP_WH;
USE DATABASE ENTERPRISE_DATA_PLATFORM_DB;
USE SCHEMA ENTERPRISE_DATA_PLATFORM_DB.META;

INSERT INTO DATA_DICTIONARY (
    DATABASE_NAME,
    SCHEMA_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    BUSINESS_DEFINITION,
    STEWARD_OWNER,
    SOURCE_SYSTEM,
    SENSITIVITY_CLASS,
    QUALITY_SLA,
    CREATED_AT
)
VALUES
(
    'ENTERPRISE_DATA_PLATFORM_DB',
    'STAGING',
    'MART_CUSTOMER_RETENTION_KPIS',
    'REPEAT_RATE_PCT',
    'NUMBER',
    'Percent of customers with 2 or more distinct orders. Formula: repeat_customers / total_customers * 100.',
    'Analytics Owner',
    'DBT_TRANSFORMATION',
    'Internal',
    'Daily refresh by 9 AM',
    CURRENT_TIMESTAMP()
),
(
    'ENTERPRISE_DATA_PLATFORM_DB',
    'STAGING',
    'MART_CUSTOMER_RETENTION_KPIS',
    'AVG_LIFETIME_DAYS',
    'NUMBER',
    'Average number of days between first_order_date and last_order_date for each customer_unique_id.',
    'Analytics Owner',
    'DBT_TRANSFORMATION',
    'Internal',
    'Daily refresh by 9 AM',
    CURRENT_TIMESTAMP()
);


