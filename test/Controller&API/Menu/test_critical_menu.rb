require_relative 'test_helper'

class TestCritical < Minitest::Test
  def setup
    @menu_controller = TurboCassandra::Controller::Menu.new
  end

  def test_critical_parts
    critical_parts   = @menu_controller.get_critical_parts
    refute_nil critical_parts
  end

  def tets_critical_sorters
    pps =  @menu_controller.get_critical_sorters 4
    pp = JSON.parse pps
    p pp
  end

end