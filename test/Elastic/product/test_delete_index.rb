require_relative 'test_helper'

name = "magento_product"
index_manager = TurboCassandra::ElasticIndex.new
index_manager.delete name