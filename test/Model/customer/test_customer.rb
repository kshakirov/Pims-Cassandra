require_relative '../test_helper'


class TestCustomer < Minitest::Test
  def setup

  end

  def test_save
    hash = {'default_billing_address' =>  {'city' =>  "Alabama", 'company' =>  "Zoral",
                                      'country_id' =>  "US",
                                      'postcode' =>  "123456",
                                      'region' =>  nil,
                                      'region_id' =>  "1",
                                      'street' =>  "Lipskaya 19/7",
                                      'telephone' =>  "3434343434"},
            'firstname' =>  "Kirill", 'id' =>  628, 'lastname' =>  "Shakirov"
    }
    customer = TurboCassandra::Model::Customer.new hash
    customer.update(hash)
  end

  def test_new
       id  = @customer.new ({'email' => "kirill.shakirov4@gmail.com", 'password' => "test"})
        assert id
  end


  def test_max
    max_id = TurboCassandra::Model::Customer.max
    refute_nil max_id
  end
end