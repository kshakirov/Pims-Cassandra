module TurboCassandra
  module Controller
    class AdminLogin
      include JwtSettings
      include PasswordHash
      include OuterAuthenticate
      include PasswordHash
      private

      def result_fail
        {
            result: 'failed'
        }
      end

      def result_success token
        {
            result: 'success',
            token: token
        }
      end

      def inner_authenticate user, password
        if  validate_hashes(password, user.password)
          result_success(create_internal_token(user))
        else
          result_fail
        end
      end

      def get_inner_payload user
        {
            exp: Time.now.to_i + 60 * 60 * 6000,
            iat: Time.now.to_i,
            iss: @jwt_issuer,
            admin: {
                id: user.login,
                group: 'superuser',
                name: user.name
            }
        }
      end

      def create_internal_token user
        JWT.encode get_inner_payload(user), @jwt_secret
      end

      def get_user_auth_sys login, password
        user =@user_api.find_user login
        if not user.nil?
          if user.authentication_node == 'Internal'
            inner_authenticate(user, password)
          elsif user.authentication_node
            outer_authenticate login, password, user.authentication_node
          else
            result_fail
          end
        else
          result_fail
        end
      end

      public

      def initialize ldap_host
        @jwt_issuer = get_jwt_user
        @jwt_secret = get_jwt_secret
        @user_api = TurboCassandra::API::User.new
        @node_api = TurboCassandra::API::AuthenticationNode.new
      end


      def authenticate_admin body
        payload = JSON.parse body
        get_user_auth_sys(payload['login'], payload['password'])
      end
    end
  end
end