require_relative '../tools_helper'

cql = %Q(ALTER TABLE  products ADD interchanges  list<bigint>)
execute cql