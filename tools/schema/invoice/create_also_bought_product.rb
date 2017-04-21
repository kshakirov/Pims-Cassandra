require_relative '../tools_helper'

cql = %Q(CREATE TABLE  also_bought_products
        (
            sku_original bigint ,
            rank bigint,
            sku bigint,
            name text,
            part_type text,
            description text,
            interchanges frozen <list<map<bigint,text>>>,
            Primary Key(sku_original, rank, sku)) WITH CLUSTERING ORDER BY (rank DESC)
        )
execute_lazy cql, []