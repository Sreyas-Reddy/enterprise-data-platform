USE WAREHOUSE EDP_WH;
USE DATABASE ENTERPRISE_DATA_PLATFORM_DB;
USE SCHEMA META;

CREATE OR REPLACE TABLE META.DATA_DICTIONARY (
    table_name STRING,
    column_name STRING,
    data_type STRING,
    description STRING,
    business_definition STRING,
    data_owner STRING,
    data_steward STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE META.LINEAGE_MAP (
    upstream_table STRING,
    downstream_table STRING,
    transformation_layer STRING,
    transformation_tool STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE META.DATA_OWNERSHIP (
    table_name STRING,
    domain STRING,
    data_owner STRING,
    data_steward STRING,
    criticality STRING,
    pii_flag BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE META.DATA_PIPELINE_SLA (
    pipeline_name STRING,
    expected_refresh_minutes INTEGER,
    last_refresh_time TIMESTAMP,
    sla_status STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE VIEW META.GOVERNANCE_OVERVIEW AS
SELECT
    d.table_name,
    d.data_owner,
    d.data_steward,
    o.criticality,
    s.sla_status
FROM META.DATA_DICTIONARY d
LEFT JOIN META.DATA_OWNERSHIP o
    ON d.table_name = o.table_name
LEFT JOIN META.DATA_PIPELINE_SLA s
    ON d.table_name = s.pipeline_name;

CREATE OR REPLACE TABLE META.DATA_CONTRACTS (
    table_name STRING,
    column_name STRING,
    expected_data_type STRING,
    is_required BOOLEAN,
    contract_version STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE META.DATA_QUALITY_RULES (
    rule_id STRING,
    table_name STRING,
    column_name STRING,
    rule_type STRING,
    rule_sql STRING,
    severity STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO META.DATA_QUALITY_RULES VALUES
('RULE_001','stg_customers','customer_id','NOT_NULL','customer_id IS NOT NULL','HIGH',CURRENT_TIMESTAMP),
('RULE_002','stg_orders','order_id','NOT_NULL','order_id IS NOT NULL','HIGH',CURRENT_TIMESTAMP),
('RULE_003','stg_orders','customer_id','NOT_NULL','customer_id IS NOT NULL','HIGH',CURRENT_TIMESTAMP);