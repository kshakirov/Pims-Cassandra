require_relative '../test_helper'


class TestCurrency < Minitest::Test
  def setup
    @currency_model = TurboCassandra::Model::Currency.new
  end

  def test_all
    currencies = @currency_model.all
    assert_equal 3 , currencies.size
  end


end