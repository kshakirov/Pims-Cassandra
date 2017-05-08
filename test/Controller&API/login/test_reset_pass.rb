require_relative "../test_helper"
class TestResetPassword < Minitest::Test

  def setup
    @admin_login_controller = TurboCassandra::Controller::AdminLogin.new ''
  end

  def test_reset_user_pass
    body = {
        login: 'pthiry',
    }
    result = @admin_login_controller.reset_password(body.to_json)
    assert_equal 'pthiry', result[:login]
  end

  def test_user_not_exist
    body = {
        login: 'pthiry222',
    }
    assert_raise 'The provided user name does not exists. Please contact your administrator' do
      result = @admin_login_controller.reset_password(body.to_json)
    end
  end

end