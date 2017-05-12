require_relative '../tools_helper'
column = 'image'
type = 'blob'
cql = %Q(ALTER TABLE users ADD #{column} #{type} )
execute_lazy(cql, [])