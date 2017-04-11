require_relative "test_helper"
class TestLogin < Minitest::Test
  def setup
    @login_manager = TurboCassandra::Controller::Login.new
  end

  def test_success
    result  = @login_manager.validate_password 'servantes1', 'kshakirov@zoral.com.ua'
  end

  def test_error
    result =  @login_manager.validate_customer 'gogol', 'kshakirov@zoral.com.ua'

  end

end







