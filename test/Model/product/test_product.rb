
require_relative '../test_helper'

class TestCustomer < Minitest::Test

  def setup
    @generator = Cassandra::Uuid::Generator.new
  end

  def test_find
    product = TurboCassandra::Model::Product.find 'Assembly'
    refute_nil product
    assert_equal "test_name", product.name
  end

  def test_paging
    paging_params = {
        'page_size' => 5,
        'paging_state' => nil
    }
    res = TurboCassandra::Model::Product.paginate paging_params
    assert_equal false, res[:last]
  end

  def test_create
    product_hash = {
        sku: 'Assembly',
        created_at: @generator.now,
        name: "test_name",
        description: "test description",
        custom_boolean: {'test' =>  Cassandra::Types::Boolean.new(1)}
    }

    product = TurboCassandra::Model::Product.new product_hash
    product.save
  end
end



