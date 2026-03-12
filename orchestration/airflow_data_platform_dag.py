from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    "owner": "data_platform",
    "start_date": datetime(2024, 1, 1),
    "retries": 1
}

with DAG(
    dag_id="enterprise_data_platform_pipeline",
    default_args=default_args,
    schedule_interval="@daily",
    catchup=False
) as dag:

    load_raw_data = BashOperator(
        task_id="load_raw_data",
        bash_command="echo Running RAW ingestion layer"
    )

    run_staging_models = BashOperator(
        task_id="run_staging_transformations",
        bash_command="echo Running STAGING transformations"
    )

    run_dbt_models = BashOperator(
        task_id="run_dbt_models",
        bash_command="dbt run"
    )

    run_data_quality = BashOperator(
        task_id="execute_data_quality_rules",
        bash_command="echo Running DQ validation rules"
    )

    update_metadata = BashOperator(
        task_id="update_metadata_catalog",
        bash_command="echo Updating metadata governance tables"
    )

    run_monitoring_checks = BashOperator(
        task_id="run_monitoring_checks",
        bash_command="echo Executing platform monitoring"
    )

    load_raw_data >> run_staging_models >> run_dbt_models >> run_data_quality >> update_metadata >> run_monitoring_checks
