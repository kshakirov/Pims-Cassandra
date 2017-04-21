require_relative '../../sync_helper'

ranker = TurboCassandra::API::Ranker.new
skus  = TurboCassandra::Model::ProductInvoice.distinct 'sku'
@invoice_api = TurboCassandra::API::Invoice.new


def save_also_bought_prods prods
  prods.each do |prod|
    @invoice_api.add_also_bought_prod prod
  end
end


skus.each_with_index  do |sku, index|
  puts "[#{index}] SKU #{sku['sku']}"
  prods = ranker.rank_bougt_products(sku['sku'])
  p prods
  save_also_bought_prods prods
end