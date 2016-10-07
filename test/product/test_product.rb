require_relative 'test_helper'

product = TurboCassandra::Product.new
product_batch = TurboCassandra::ProductBatch.new
product_hashes = YAML.load_stream(open("../all_products.yml"))

product_hashes.each_with_index do |product_hash, index|
  sku = product_hash['sku']
  product_batch.remove_keys(product_hash)
  product_hash = product_batch.parse_critical_attributes(product_hash)
  product.insert product_hash
  puts "PRODUCT SKU[#{sku.to_s}] UPDATED"
end


