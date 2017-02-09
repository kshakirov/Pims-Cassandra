require_relative "../test_helper"
class TestCustomer < Minitest::Test

  def setup
    @admin_backend = TurboCassandra::AdminBackEnd.new
  end

  def test_get_customer_by_email
    @admin_backend.change_password_by_email("kshakirov@zoral.com.ua")
    p test
  end

end