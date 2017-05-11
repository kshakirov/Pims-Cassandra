require_relative '../tools_helper'

cql = %Q(CREATE TABLE  notifications
        (
            code  text PRIMARY KEY,
            template_name text,
            admin_email_code text,
            data map<text, text>
           ))
execute_lazy cql, []

