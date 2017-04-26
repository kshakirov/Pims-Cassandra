require_relative '../tools_helper'

  auth_node_api = TurboCassandra::API::AuthenticationNode.new
  node = {
      name: "TurboInternational LDAP",
      account: 'LDAP',
      base_dn: 'dc=TurboInternational,dc=local',
      host: '162.249.218.162',
      password:  "9)Fkp6%gaBk",
      port: 636,
      timeout: 0,
      attributes: {
          'login_attribute' => 'sAMAccountName'
      }

  }
 auth_node_api.add_node node