require_relative '../tools_helper'

cql = %Q(CREATE TABLE  products
        (
            sku  text,
            created_at timeuuid,
            updated_at timeuuid,
            name text,
            description text,
            critical_boolean map<text,boolean>,
            critical_decimal map<text,double>,
            critical_integer map<text,int>,
            critical_enum map<text,text>,
            PRIMARY KEY (sku))
        )
execute_lazy cql,[]
