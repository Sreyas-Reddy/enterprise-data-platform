CREATE OR REPLACE VIEW META.LINEAGE_MAP_VW AS
SELECT
    upstream_table,
    downstream_table,
    transformation_layer,
    transformation_tool,
    created_at
FROM META.LINEAGE_MAP;