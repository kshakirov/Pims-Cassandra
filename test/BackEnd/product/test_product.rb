require_relative "test_helper"
class TestProduct < Minitest::Test

  def setup
    @product_model = TurboCassandra::ProductBackEnd.new
  end

  def test_non_ti_interchange
    pr = @product_model.get_product 6228
    pr = JSON.parse pr
    p pr
  end

  def test_ti_manufactured

    pr = @product_model.get_product 45333
    pr = JSON.parse pr
    p pr
  end
end

