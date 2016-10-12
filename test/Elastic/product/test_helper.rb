require 'cassandra'
require 'active_support'
require 'active_support/all'
require 'elasticsearch'
require_relative '../../../lib/tools/Model/product/product'
require_relative '../../../lib/tools/Elastic/product/index'
require_relative '../../../lib/tools/Elastic/product/mapping'
require_relative '../../../lib/tools/Model/turbo_cluster'

def read_attributes_from_file
  fd = File.open(__dir__ + '/../../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end