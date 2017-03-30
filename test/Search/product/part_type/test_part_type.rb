require_relative "../test_helper"
class TestPartType < Minitest::Test
  def setup
    @product = TurboCassandra::API::Product.new
    tcas_host = get_tcas_host
    @product_transformer = TurboCassandra::EsProductTransformer.new(tcas_host)
  end

  def test_main
    p = @product.find_by_sku  43747
    elastic_product = @product_transformer.run p
    assert_equal 4, elastic_product['part_type']
  end
end