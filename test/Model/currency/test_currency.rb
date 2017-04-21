require_relative '../test_helper'


class TestCurrency < Minitest::Test
  def setup
  end

  def test_all
    currencies = TurboCassandra::Model::Currency.all
    assert_equal 3 , currencies.size
  end

  def test_update
    currencies = [
        {
            'code' => 'EUR',
            'base' => false,
            'rate' => 0.875
        },
        {
            'code' => 'USD',
            'base' => true,
            'rate' => 1.0
        }

    ]
    currencies.each do |c|
      currency = TurboCassandra::Model::Currency.new c
      currency.save
    end
    assert true
  end


end