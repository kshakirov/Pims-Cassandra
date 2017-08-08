require_relative '../test_helper'

ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require_relative '../../config/initializers/sources'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/product_controller'
require 'test/unit'
require 'rack/test'

class ProductControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def setup
    @rack_env = {
        'HTTP_ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
    }
  end
  def app
    ProductController.new
  end
  def test_it_says_hello_world
    params = {
        paging_state: nil,
        page_size: 10
    }
    post '/products/paginate/' , params.to_json, @rack_env
    assert last_response.ok?
    response = JSON.parse(last_response.body)
    assert_equal  10, response['results'].size
  end


end
