require_relative '../tools_helper'

cql = %Q(CREATE TABLE  invoice_products
        (
            invoice_id text,
            sku bigint ,
            name text,
            part_type text,
            description text,
            interchanges frozen <list<map<bigint,text>>>,
            detail_seq_no text,
            quantity_shipped int,
            unit_price double,
            unit_cost  double,
            extension_amt double,
            armc_234_entry_currency text,
            armc_234_entry_rate double,
            Primary Key(invoice_id, sku))
        )
execute_lazy cql, []