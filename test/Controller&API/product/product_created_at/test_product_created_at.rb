require_relative '../../test_helper'
class TestProductCreatedAt < Minitest::Test

  def setup
    @product_created_at_controller = TurboCassandra::Controller::ProductCreatedAt.new
  end

  def test_where
    body = {
        manufacturers: ['Turbo International'],
        part_types: ['Backplate', 'Compressor Wheel'],
        page_size: 10
    }
    response = @product_created_at_controller.where body.to_json
    refute_nil response
  end
end