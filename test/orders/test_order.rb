require_relative '../test_helper'

def read_orders_from_file
  fd = File.open(__dir__ + '/../orders.json', 'r')
  data = fd.read
  JSON.parse data
end

order = TurboCassandra::Order.new
order_batch = TurboCassandra::OrderBatch.new

orders = read_orders_from_file

orders.each do |o|
  puts o['order_id']
  order_batch.remove_null_values o
  order.insert o

end