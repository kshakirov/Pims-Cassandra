require_relative "../test_helper"
class TestCart < Minitest::Test

  def setup
    @cart_controller = TurboCassandra::Controller::Cart.new
    @cart_api = TurboCassandra::API::Cart.new
    @product_controller = TurboCassandra::Controller::Product.new
  end

  def test_find
    customer_data = [{'id' => 12}]
    cart = @cart_controller.get_customer_cart customer_data
    refute_nil cart
  end

  def test_add_item
    customer_data = [{'id' => 12}]
    product = @product_controller.get_product 1
    request_payload = {
        'product' => product,
        'price' => 74.8,
        'qty' => 2
    }

    @cart_controller.add_product_to_cart customer_data, request_payload.to_json
    response = @cart_controller.get_products_count(customer_data)
    assert_equal 2, response[:count].to_i
  end

  def test_delete_item
    @cart_controller.delete_product_from_cart 12, 41661
  end

  def test_empty_cart
    result = @cart_api.empty_cart 12
    assert result
  end

end