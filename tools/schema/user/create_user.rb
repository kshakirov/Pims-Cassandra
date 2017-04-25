require_relative '../tools_helper'

cql = %Q(CREATE TABLE  users
        (
            login text Primary Key,
            authentication_node int,
            name text,
            email  text,
            password text,
            must_change boolean))
execute_lazy(cql, [])