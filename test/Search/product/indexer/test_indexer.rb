require_relative "../test_helper"
class TestProductIndexe < Minitest::Test
  def setup
    @product = TurboCassandra::API::Product.new
    elastic_host = get_elastic_host
    tcas_host = get_tcas_host
    @product_indexer = TurboCassandra::ElasticIndex.new(elastic_host,tcas_host)
  end

  def test_delete
    response  = @product_indexer.delete 48225
    refute_nil response
  end

  def test_add_ti
    product  = @product.find_by_sku 48225
    response  = @product_indexer.add_product product
    refute_nil response
  end

  def test_add_not_external
    product = @product.find_by_sku  47123
    response  = @product_indexer.add_product product
    refute_nil response
  end

  def test_search
    product  = @product_indexer.get 48225
    refute_nil product
  end
end