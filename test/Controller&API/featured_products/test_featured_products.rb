require_relative "../test_helper"
class TestFeaturedProduct < Minitest::Test

  def setup
    @featured_product_controller =TurboCassandra::Controller::FeaturedProduct.new
  end
  def test_get_featured_products
    list  = @featured_product_controller.get_admin_list
    refute_nil list
  end

  def test_update_featured_product
    product = {
        sku: 62923,
        ord: 2,
        visible: false
    }
    list  = @featured_product_controller.update_featured_product product.to_json
    refute_nil list
  end

end