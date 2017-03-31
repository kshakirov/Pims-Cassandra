require_relative "../test_helper"
class TestNotExternalManufacturer < Minitest::Test
  def setup
    @product = TurboCassandra::API::Product.new
    tcas_host = get_tcas_host
    @product_transformer = TurboCassandra::EsProductTransformer.new(tcas_host)
  end

  def test_without_oe_ref
    product = @product.find_by_sku  47123
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product[:not_external_part_number], '258t011'
    assert_equal elastic_product['oe_ref_urls'], []
    assert_equal elastic_product['manufacturer'], [{:code=>3, :name=>"Turbo International"}]
    assert_equal elastic_product['visible_in_catalog'], false

  end


  def test_oe_ref
    product = @product.find_by_sku  43936
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product['visible_in_catalog'], false

  end


  def test_turbo
    product = @product.find_by_sku  13445
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product['invisible_in_search'], true

  end


  def test_ti_description
    product = @product.find_by_sku  47124
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal "RET RING, RHB5",  elastic_product['description']


  end


  def test_with_oe_ref
    product = @product.find_by_sku  47124
    refute_nil product
    elastic_product = @product_transformer.run product
    refute_nil elastic_product
    assert_equal elastic_product[:not_external_part_number], '258t012'
    assert_equal elastic_product['oe_ref_urls'], [{:part_number=>"115030-0000", :part_number_clean=>"1150300000", :product_url=>"", :sku=>46962}]
    assert_equal elastic_product['manufacturer'], [{:code=>3, :name=>"Turbo International"}]
    assert_equal elastic_product['visible_in_catalog'], false
  end

end
