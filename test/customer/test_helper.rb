require 'yaml'
require 'logger'
require 'cassandra'
require 'active_support'
require 'active_support/all'
require_relative '../../lib/tools/Model/turbo_cluster'
require_relative '../../lib/tools/Model/customer/customer'
require_relative '../../lib/tools/Model/customer/customer_batch'

def read_customers_from_file
  fd = File.open(__dir__ + '/../customers_production.json', 'r')
  data = fd.read
  JSON.parse data
end