require_relative 'test_helper.rb'


model = TurboCassandra::Attribute.new
attrs = read_attributes_from_file
attrs.each do |attr|
  keys, values = model.insert(attr)
  p keys
  p values
  insert @cluster, keys, values
  break
end
