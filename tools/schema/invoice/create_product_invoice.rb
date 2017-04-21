require_relative '../tools_helper'

cql = %Q(CREATE TABLE  product_invoices
        (
          sku bigint ,
          invoice_id text,  Primary Key(sku, invoice_id)))
execute_lazy cql, []