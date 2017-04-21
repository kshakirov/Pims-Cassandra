require_relative '../tools_helper'

cql = %Q(CREATE TABLE  invoice_products
        (
            invoice_id text,
            sku bigint ,
            name text,
            part_type text,
            description text,
            interchanges frozen <list<map<bigint,text>>>,
            Primary Key(invoice_id, sku))
        )
execute_lazy cql, []