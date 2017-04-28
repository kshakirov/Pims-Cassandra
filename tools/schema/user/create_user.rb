require_relative '../tools_helper'

cql = %Q(CREATE TABLE  users
        (
            id uuid Primary Key,
            login text,
            authentication_node text,
            name text,
            email  text,
            password text,
            must_change boolean))
execute_lazy(cql, [])
cql = %Q(CREATE INDEX users_login ON users (login))
execute_lazy cql, []