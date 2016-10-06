require 'json'
require 'cassandra'
require 'active_support'
require 'active_support/all'
require_relative '../../lib/tools/Model/turbo_cluster'
require_relative '../../lib/tools/Model/attribute_set'

def read_attribute_sets_from_file
  fd = File.open(__dir__ + '/../attribute_sets_all.json', 'r')
  data = fd.read
  JSON.parse data
end


def read_attributes_from_file
  fd = File.open(__dir__ + '/../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end
