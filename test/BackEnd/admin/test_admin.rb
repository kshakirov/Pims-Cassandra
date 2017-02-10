require_relative "../test_helper"
class TestAdmin < Minitest::Test

  def setup
    @admin_backend = TurboCassandra::AdminBackEnd.new
  end

  def test_change_forgotten_password
    new_password = @admin_backend.reset_password("kshakirov@zoral.com.ua")
    refute_nil new_password
    assert new_password[:result]
    assert new_password[:password].size >= 10
  end

end