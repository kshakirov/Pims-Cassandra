require_relative '../test_helper'

class TestMenu < Minitest::Test
  def setup

    @menu_controller = TurboCassandra::Controller::Menu.new
  end

  def test_currency
    res = @menu_controller.get_currencies
    assert_equal 3, res.size
  end




end