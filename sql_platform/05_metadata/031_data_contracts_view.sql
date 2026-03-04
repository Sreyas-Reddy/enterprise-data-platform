CREATE OR REPLACE VIEW META.DATA_CONTRACTS_VW AS
SELECT
    table_name,
    column_name,
    expected_data_type,
    is_required,
    contract_version,
    created_at
FROM META.DATA_CONTRACTS;
