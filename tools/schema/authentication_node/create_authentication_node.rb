require_relative '../tools_helper'

cql = %Q(CREATE TABLE  authentication_nodes
        (
            name text Primary Key,
            host text,
            port int,
            account  text,
            password text,
            base_dn text,
            ldap_filter text,
            timeout int,
            attributes map<text,text>))
execute_lazy(cql, [])