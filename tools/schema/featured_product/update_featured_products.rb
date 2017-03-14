require_relative '../tools_helper'

cql = %Q(ALTER TABLE featured_products ADD  ord int )
execute_lazy(cql, [])

cql = %Q(ALTER TABLE featured_products drop  data )
execute_lazy(cql, [])

cql = %Q(ALTER TABLE featured_products ADD visible boolean)
execute_lazy(cql, [])