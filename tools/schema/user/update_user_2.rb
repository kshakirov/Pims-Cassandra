require_relative '../tools_helper'
column = 'superuser'
type = 'boolean'
cql = %Q(ALTER TABLE users ADD #{column} #{type} )
execute_lazy(cql, [])