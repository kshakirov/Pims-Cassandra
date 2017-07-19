require_relative '../tools_helper'

cql = %Q(CREATE TABLE  products
        (
            sku  text,
            created_at timeuuid,
            updated_at timeuuid,
            name text,
            description text,
            custom_boolean map<text,boolean>,
            custom_decimal map<text,double>,
            custom_integer map<text,int>,
            custom_enum map<text,text>,
            custom_text map<text,text>,
            PRIMARY KEY (sku))
        )
execute_lazy cql,[]
