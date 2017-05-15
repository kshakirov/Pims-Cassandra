require_relative '../test_helper'
class TestPrintOrder < Minitest::Test
  def test_render
    order = TurboCassandra::Controller::Order.new
    refute_nil order
    data = order.print(100000365)
    IO.binwrite("order.pdf",data)
  end
end