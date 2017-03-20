require_relative '../tools_helper'

cql = %Q(CREATE TABLE  currency_histories
        (
            date  timestamp PRIMARY KEY,
            rates frozen <list<map<text,double>>>
           ))
execute_lazy cql, []
