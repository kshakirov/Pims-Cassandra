require_relative '../test_helper'

class TestCurrency < Minitest::Test
  def setup
    @currency_api = TurboCassandra::API::Currency.new
    @currency_controller = TurboCassandra::Controller::Currency.new
  end

  def test_insert
    res = @currency_api.all
    assert_equal 3, res.size
  end

  def test_update
    body = [
        {code: 'USD', base: true, rate: 1},
        {code: 'EUR', base: nil, rate: 0.87},
        {code: 'GBP', base: false, rate: 0.81},
    ]
    @currency_controller.update_all body.to_json
  end


end