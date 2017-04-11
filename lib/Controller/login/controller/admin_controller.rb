module TurboCassandra
  module Controller
    class AdminLogin
      include JwtSettings
      private
      def authenticate login, password
        ad_user = ActiveDirectory::User.find(:first, :sAMAccountName => login)
        ad_user.authenticate password
      end

      def get_payload admin
        {
            exp: Time.now.to_i + 60 * 60 * 6000,
            iat: Time.now.to_i,
            iss: @jwt_issuer,
            admin: {
                id: admin.first.userprincipalname.first.to_s,
                group: admin.first.primarygroupid.first.to_s,
                name: admin.first.displayname.first.to_s
            }
        }
      end

      def create_token admin
        JWT.encode get_payload(admin), @jwt_secret
      end

      def get_ldap_settings ldap_host
        {
            :host => ldap_host,
            :base => 'dc=TurboInternational,dc=local',
            :port => 636,
            :encryption => {
                :method => :simple_tls,
                :tls_options => {verify_mode: OpenSSL::SSL::VERIFY_NONE}
            },
            :auth => {
                :method => :simple,
                :username => "LDAP",
                :password => "9)Fkp6%gaBk"
            }
        }
      end

      public

      def initialize ldap_host
        @jwt_issuer = get_jwt_user
        @jwt_secret = get_jwt_secret
        settings = get_ldap_settings(ldap_host)
        ActiveDirectory::Base.setup(settings)
        ActiveDirectory::Base.enable_cache
      end

      def authenticate_admin body
        payload = JSON.parse body
        authorized = authenticate(payload['login'], payload['password'])
        if authorized
          {
              result: 'success',
              token: create_token(authorized)
          }
        else
          {
              result: 'failed'
          }
        end
      end
    end
  end
end