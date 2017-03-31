require_relative "test_helper"

class TestTurboTM < Minitest::Test
  def test_turbo_types
    @menu_controller = TurboCassandra::Controller::Menu.new
    filters = @menu_controller.get_manufacturer_filters
    assert_equal 100,  filters['options']
  end
end
