CREATE OR REPLACE VIEW META.DATA_DICTIONARY_VW AS
SELECT
    table_name,
    column_name,
    data_type,
    description,
    business_definition,
    data_owner,
    data_steward,
    created_at
FROM META.DATA_DICTIONARY;