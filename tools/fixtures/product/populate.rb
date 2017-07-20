require_relative '../tools_helper'

path = File.expand_path('../../data/products.csv', File.dirname(__FILE__))
puts "CSV File Will Be Loaded [#{path}] "
product_batch = TurboCassandra::API::ProductBatch.new path
product_batch.run


