
require_relative "../test_helper"
class TestProduct < Minitest::Test

  def setup
    @product_web_api =TurboCassandra::WebAPI::Product::Product.new
  end

  def test_create
    body = IO.read('test/WebAPI/product/product_json.json')
    body = @product_web_api.create body
    p body
  end
end
