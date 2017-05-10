require_relative '../tools_helper'

cql = %Q(CREATE TABLE  admin_emails
        (
            code  text PRIMARY KEY,
            internal_name text,
            sender_name text,
            sender_email text
           ))
execute_lazy cql, []

