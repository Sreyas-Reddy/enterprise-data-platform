CREATE OR REPLACE VIEW META.DATA_QUALITY_RULES_VW AS
SELECT
    rule_id,
    table_name,
    column_name,
    rule_type,
    rule_sql,
    severity,
    created_at
FROM META.DATA_QUALITY_RULES;