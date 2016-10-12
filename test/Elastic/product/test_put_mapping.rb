require_relative 'test_helper'

index_manager = TurboCassandra::ElasticIndex.new

attributes = read_attributes_from_file

p index_manager.put_critical_mapping  'magento_product', 'product', attributes