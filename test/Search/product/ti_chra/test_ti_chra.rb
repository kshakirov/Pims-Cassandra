require_relative "../test_helper"
class TestTiChra < Minitest::Test
  def setup
    @product_api = TurboCassandra::API::Product.new
    tcas_host = get_tcas_host
    @product_transformer = TurboCassandra::EsProductTransformer.new(tcas_host)
  end

  def test_ti_chra
    product = @product_api.find_by_sku 68157
    refute_nil product
    elastic_product = @product_transformer.get_ti_chra product
    refute_nil elastic_product
  end

  def test_foreign_chra
    product = @product_api.find_by_sku 19191
    refute_nil product
    elastic_product = @product_transformer.get_foreign_chra product
    refute_nil elastic_product
  end


end
