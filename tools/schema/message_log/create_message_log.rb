require_relative '../tools_helper'

cql = %Q(CREATE TABLE  message_logs
        (
            customer_email text,
            id timeuuid,
            status text,
            date_start timestamp,
            date_end timestamp,
            message text,
            Primary Key (customer_email, id)) WITH CLUSTERING ORDER BY (id DESC)
        )
execute_lazy cql, []
