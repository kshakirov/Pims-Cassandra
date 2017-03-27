require_relative "../test_helper"
class TestOeRefUrl < Minitest::Test
  def setup
    @product = TurboCassandra::API::Product.new
    tcas_host = get_tcas_host
    @product_transformer = TurboCassandra::EsProductTransformer.new(tcas_host)
  end

  def test_non_ti_oe_ref
    product = @product.find_by_sku  47123
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product[:not_external_part_number], '258T-011'
    assert_equal elastic_product['oe_ref_urls'], nil

  end

  def test_ti_oe_ref
    product = @product.find_by_sku  48225
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product[:not_external_part_number], '258T-011'
    assert_equal elastic_product['oe_ref_urls'], nil
  end

  def test_ti_oe_ref_not_ext
    product = @product.find_by_sku  30160
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product['oe_ref_urls'].first[:part_number], '078145703H'
  end
end

