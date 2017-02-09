require_relative "../test_helper"

class TestProduct < Minitest::Test

  def setup
    @product_backend = TurboCassandra::ProductBackEnd.new
  end

  def test_get_products
    prs = @product_backend.get_products [62923,65019]
    refute_nil prs
  end

  def test_get_product
    prs = @product_backend.get_product 62923
    refute_nil prs
  end

end

