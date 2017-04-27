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

      def create_token admin
        JWT.encode get_payload(admin), @jwt_secret
      end

      def get_payload admin
        {
            exp: Time.now.to_i + 60 * 60 * 6000,
            iat: Time.now.to_i,
            iss: @jwt_issuer,
            admin: {
                id: admin.first.samaccountname.first.to_s,
                group: admin.first.primarygroupid.first.to_s,
                name: admin.first.displayname.first.to_s
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

      def outer_authenticate login, password, node_name
        node = init_active_directory node_name
        authorized = authenticate login, password, node
        if authorized
          result_success(create_token(authorized))
        else
          result_fail
        end
      end

    end
  end
end