require_relative 'test_helper.rb'
attribute = TurboCassandra::Model::Attribute.new
attr =  attribute.find "manufacturer"
p attr

