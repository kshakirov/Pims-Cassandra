require_relative 'test_helper'

cluster_manager = MyCluster.new
product = TurboCassandra::Product.new
since_sku = 0
logger = Logger.new('update.log')
logger.level = Logger::INFO
product_hashes = YAML.load_stream(open("../all_products.yml"))
logger.info("UPDATE STARTED")

product_hashes.each_with_index do |product_hash, index|
  sku = product_hash['sku']
  if sku > since_sku
    names_string, values_string, args = product.batch_prepare product_hash
    logger.info("PRODUCT SKU[#{sku.to_s}] UPDATED")
    puts "PRODUCT SKU[#{sku.to_s}] UPDATED"
    cql = "INSERT INTO products  (#{names_string}) " \
            "VALUES (#{values_string})"
    begin
      cluster_manager.execute(cql, args)
    rescue Exception => e
      puts "Error" + e.message
      sleep 120
    end
  end
end
logger.info("UPDATE FINISHED")

