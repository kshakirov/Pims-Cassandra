require_relative "../test_helper"

class TestProductBatch < Minitest::Test

  def setup
    @product_batch = TurboCassandra::API::ProductBatch.new 'test/Controller&API/product/products.csv'

  end

  def test_main
    assert@product_batch.run
  end
end