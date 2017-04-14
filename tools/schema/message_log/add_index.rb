require_relative '../tools_helper'

cql = %Q(CREATE INDEX status ON message_logs (status))
execute_lazy cql, []