-- MASTER EXECUTION SCRIPT
-- Enterprise Data Platform Setup

--------------------------------------------------
-- PLATFORM SETUP
--------------------------------------------------

-- Warehouse, Database, Schemas
!source 01_platform_setup/001_create_platform.sql
!source 01_platform_setup/002_create_file_formats.sql
!source 01_platform_setup/003_create_stages.sql


--------------------------------------------------
-- RAW DATA INGESTION
--------------------------------------------------

!source 02_raw_layer/004_create_raw_tables.sql
!source 02_raw_layer/005_load_raw_data.sql


--------------------------------------------------
-- STAGING LAYER
--------------------------------------------------

!source 03_staging_layer/006_stg_customers_validation.sql


--------------------------------------------------
-- DATA QUALITY FRAMEWORK
--------------------------------------------------

!source 04_data_quality/007_data_quality_validation.sql
!source 04_data_quality/008_dq_monitoring_tables.sql
!source 04_data_quality/009_dq_run_start.sql
!source 04_data_quality/010_dq_run_completed.sql
!source 04_data_quality/011_dq_run_fail_start.sql
!source 04_data_quality/012_dq_log_test_result.sql
!source 04_data_quality/013_dq_run_fail_complete.sql
!source 04_data_quality/014_dq_exceptions_table.sql
!source 04_data_quality/015_dq_rule_execution_stg_customers.sql
!source 04_data_quality/016_dq_scorecard_view.sql
!source 04_data_quality/017_dq_scorecard_v2.sql
!source 04_data_quality/018_dq_latest_run_view.sql
!source 04_data_quality/036_data_quality_rule_engine.sql


--------------------------------------------------
-- METADATA GOVERNANCE
--------------------------------------------------

!source 05_metadata/019_meta_data_dictionary.sql
!source 05_metadata/020_meta_seed_data_dictionary_customers.sql
!source 05_metadata/021_meta_lineage_map.sql
!source 05_metadata/022_meta_seed_lineage_stg_customers.sql
!source 05_metadata/023_meta_seed_lineage_stg_orders.sql
!source 05_metadata/024_meta_gold_kpi_definitions.sql

!source 05_metadata/028_metadata_governance_framework.sql
!source 05_metadata/029_data_dictionary_view.sql
!source 05_metadata/030_lineage_map_view.sql
!source 05_metadata/031_data_contracts_view.sql
!source 05_metadata/032_data_quality_rules_view.sql
!source 05_metadata/033_data_quality_rule_summary.sql
!source 05_metadata/034_pipeline_sla_status_view.sql
!source 05_metadata/035_data_governance_dashboard_view.sql


--------------------------------------------------
-- DATA MARTS
--------------------------------------------------

!source 06_marts/025_mart_design_grain_and_entities.sql
!source 06_marts/040_customer_lifetime_value_mart.sql
!source 06_marts/041_customer_retention_kpis.sql
!source 06_marts/042_state_kpi_anomalies.sql


--------------------------------------------------
-- MONITORING & OBSERVABILITY
--------------------------------------------------

!source 07_monitoring/026_dq_anomaly_log.sql
!source 07_monitoring/027_dq_reliability_scorecard_view.sql
!source 07_monitoring/028_ops_dashboard_view.sql
!source 07_monitoring/037_platform_health_dashboard.sql
!source 07_monitoring/038_data_quality_alerts.sql
!source 07_monitoring/039_data_reliability_metrics.sql