module TurboCassandra
  module Controller
    module OuterAuthenticate

      def setup_active_dir node
        {
            :host => node.host,
            :base => node.base_dn,
            :port => node.port,
            :encryption => {
                :method => :simple_tls,
                :tls_options => {verify_mode: OpenSSL::SSL::VERIFY_NONE}
            },
            :auth => {
                :method => :simple,
                :username => node.account,
                :password => node.password
            }
        }
      end

      def create_token user, ldap_response
        JWT.encode get_payload(user, ldap_response), @jwt_secret
      end

      def get_group user, ldap_response
        if user['superuser']
          'superuser'
        else
          ldap_response.first.primarygroupid.first.to_s
        end
      end

      def get_payload user, ldap_response
        {
            exp: Time.now.to_i + 60 * 60 * 168,
            iat: Time.now.to_i,
            iss: @jwt_issuer,
            admin: {
                id: ldap_response.first.samaccountname.first.to_s,
                group: get_group(user, ldap_response),
                name: ldap_response.first.displayname.first.to_s
            }
        }
      end

      def init_active_directory node_name
        node = @node_api.get_node node_name
        settings = setup_active_dir(node)
        ActiveDirectory::Base.setup(settings)
        ActiveDirectory::Base.enable_cache
        node
      end

      def authenticate login, password, node
        filter = node.attributes['login_attribute'].to_sym
        ad_user = ActiveDirectory::User.find(:first, filter => login)
        ad_user.authenticate password
      end

      def outer_authenticate login, password, user
        node = init_active_directory user['authentication_node']
        authorized = authenticate login, password, node
        if authorized
          result_success(create_token(user, authorized))
        else
          result_fail
        end
      end

    end
  end
end