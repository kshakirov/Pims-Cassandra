module TurboCassandra
  module Controller
    module JwtSettings
      def get_jwt_user
        'zoral.com'
      end

      def get_jwt_secret
        'keepitsecret'
      end
    end
  end
end