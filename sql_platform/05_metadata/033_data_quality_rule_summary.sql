CREATE OR REPLACE VIEW META.DATA_QUALITY_RULE_SUMMARY AS
SELECT
    table_name,
    COUNT(*) AS total_rules,
    COUNT_IF(severity = 'HIGH') AS high_severity_rules,
    COUNT_IF(severity = 'MEDIUM') AS medium_severity_rules,
    COUNT_IF(severity = 'LOW') AS low_severity_rules
FROM META.DATA_QUALITY_RULES
GROUP BY table_name;