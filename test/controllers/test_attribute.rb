require_relative '../test_helper'

ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require_relative '../../config/initializers/sources'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/attribute_controller'
require 'test/unit'
require 'rack/test'

class AttributeControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def setup

  end
  def app
    AttributeController.new
  end
  def test_it_says_hello_world
    get'/attributes'
    assert last_response.ok?
    response = JSON.parse(last_response.body)
    assert_equal  1, response.size
  end


end
