require_relative '../tools_helper'
column = 'currency_code'
type = 'text'
cql = %Q(ALTER TABLE orders ADD #{column} #{type} )
execute_lazy(cql, [])
