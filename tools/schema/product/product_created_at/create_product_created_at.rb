require_relative '../../tools_helper'

cql = %Q(CREATE TABLE  products_created_at
        (
            manufacturer text,
            part_type text,
            created_at timeuuid,
            part_number text,
            sku bigint,
            PRIMARY KEY (manufacturer, part_type, created_at))  WITH CLUSTERING ORDER BY (part_type ASC, created_at DESC)
        )
execute_lazy cql,[]