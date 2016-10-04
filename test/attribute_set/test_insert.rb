require_relative 'test_helper'

attr_set = TurboCassandra::AttributeSet.new
sets = read_attribute_sets_from_file
sets.each do |s|
  keys, values = attr_set.insert({ :code => s.gsub(' ','').underscore, :name => s})
  p  keys
  p values
  insert(@cluster, keys, values)
end