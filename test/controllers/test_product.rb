require_relative '../test_helper'

class TestCustomer < Minitest::Test

  def setup
    @generator = Cassandra::Uuid::Generator.new
  end

  def test_find
    params = { 'sku' => 'Assembly'}
    product  = ProductController.show params
    refute_nil product
    assert_equal "test_name", product.name
  end

end