require_relative '../tools_helper'

cql = %Q(CREATE TABLE  attributes
        (
          code text PRIMARY KEY,
    attribute_set text,
    comparable boolean,
    entity text,
    filterable boolean,
    is_custom  boolean,
    is_filterable_in_search boolean,
    is_visible_in_list boolean,
    label text,
    length int,
    options list<text>,
    parent_id text,
    scale int,
    searchable boolean,
    seq_num int,
    tolerance int,
    type text,
    unit text))
execute_lazy(cql, [])

cql = %Q(CREATE INDEX set_name ON attributes (attribute_set))
execute_lazy(cql, [])