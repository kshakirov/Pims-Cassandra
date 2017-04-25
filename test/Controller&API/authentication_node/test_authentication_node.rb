require_relative '../test_helper'

class TestAuthenticationNode < Minitest::Test
  def setup
    @auth_node_api = TurboCassandra::API::AuthenticationNode.new
  end

  def test_add
    node = {
        name: "TurboInternational LDAP",
        account: 'LDAP',
        base_dn: 'dc=TurboInternational,dc=local',
        host: '162.249.218.162',
        password:  "9)Fkp6%gaBk",
        port: 636,
        timeout: 0


    }
    res = @auth_node_api.add_node node
    refute_nil res
  end

  def test_all
    all = @auth_node_api.all
    assert_true 1, all.size
  end

  def test_delete
    @auth_node_api.delete_node "TurboInternational LDAP"
  end


end