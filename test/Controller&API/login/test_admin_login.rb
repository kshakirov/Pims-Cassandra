require_relative "../test_helper"
class TestLogin < Minitest::Test
  include TurboCassandra::Controller::JwtSettings
  def setup
    @admin_login_controller = TurboCassandra::Controller::AdminLogin.new '162.249.218.162'
    @options = {
        algorithm: 'HS256', iss: get_jwt_user
    }
  end

  def decode token
    payload, header = JWT.decode token, get_jwt_secret, true, @options
  end

  def test_admin_user
    body = {
        login: 'jbond',
        password: 'zoraltemp01!'
    }
    result  = @admin_login_controller.authenticate_admin body.to_json
    assert result
    admin_info =  decode result[:token]
    assert_equal 'jbond@turbointernational.com', admin_info.first['admin']['id']
  end

  def test_internal_login
    body = {
        login: 'kshakirov',
        password: 'test'
    }
    result = @admin_login_controller.authenticate_admin(body.to_json)
    refute_nil result
    assert_equal 'success', result[:result]
  end

  def test_external_login
    body = {
        login: 'jbond',
        password: 'assembly01!'
    }
    result = @admin_login_controller.authenticate_admin(body.to_json)
    refute_nil result
    assert_equal 'success', result[:result]
  end

end