require_relative '../tools_helper.rb'

attribute_batch = TurboCassandra::Model::AttributeBatch.new
attribute = TurboCassandra::Model::Attribute.new
attrs = read_attributes_from_file

attrs.each do |attr|
  puts "Attribute code  [#{attr['code']}]"
  properties = attribute_batch.adopt_hash attr
  attribute.insert properties
end
