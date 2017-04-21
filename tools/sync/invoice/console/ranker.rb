require_relative '../../sync_helper'

ranker = TurboCassandra::API::Ranker.new
skus  = TurboCassandra::Model::ProductInvoice.distinct 'sku'

skus.each_with_index  do |sku, index|
  puts "[#{index}] SKU #{sku['sku']}"
  freq_map = ranker.rank_bougt_products(sku['sku'])
  p freq_map
end