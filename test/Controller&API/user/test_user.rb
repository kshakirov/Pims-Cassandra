require_relative '../test_helper'

class TestUser < Minitest::Test
  def setup
    @user_api = TurboCassandra::API::User.new
  end

  def test_add
    user = {
        login: 'kshakirov',
        name: "Kirill Shakirov",
        email: "kshakirov@zoral.com.ua",
        password: "test",
        must_change: true


    }
    res = @user_api.add_user user
    refute_nil res
  end

  def test_all
    all = @user_api.all
    assert_true 1, all.size
  end

  def test_delete
    @user_api.delete_user 'kshakirov'
  end


end