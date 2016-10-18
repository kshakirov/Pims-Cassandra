require_relative '../tools_helper'

cql = %Q(CREATE INDEX set_name ON attributes (attribute_set))
execute cql