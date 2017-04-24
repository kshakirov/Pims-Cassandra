require_relative '../tools_helper'

cql = %Q(CREATE TABLE  customer_groups
        (
            code  text  PRIMARY KEY,
            description text
           ))
execute_lazy cql, []