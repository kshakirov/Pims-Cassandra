require_relative '../tools_helper'

cql = %Q(CREATE TABLE  new_products
        (
            sku  bigint Primary Key,
            ord int,
            part_number text,
            visible boolean,
           ))
execute_lazy cql, []