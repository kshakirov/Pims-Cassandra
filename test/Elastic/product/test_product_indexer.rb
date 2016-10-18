require_relative 'test_helper'

product = TurboCassandra::Product.new
index_manager = TurboCassandra::ElasticIndex.new

product.each{|r|
  p r['sku']
  index_manager.add_product r
}