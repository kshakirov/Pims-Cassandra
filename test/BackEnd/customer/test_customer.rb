require_relative "../test_helper"
class TestCustomer < Minitest::Test

  def setup
    @customer_model = TurboCassandra::CustomerBackEnd.new
  end

  def test_load_customer_by_id
    customer_data = @customer_model.get_customer_info 12
    assert_equal customer_data['email'] , 'pthiry1@dbicapital.com', "Get Customer By Id Failed"
  end

  def test_get_customers_list
    customers_list = @customer_model.get_list
    assert_equal customers_list.size, 4, "Customers List Failed"
  end

end