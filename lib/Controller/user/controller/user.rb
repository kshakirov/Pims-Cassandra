module TurboCassandra
  module Controller
    class User
      def initialize
        @user_api = API::User.new
      end
      def get_users_list
        @user_api.all
      end

      def get_user params
        login = params['login']
        user = @user_api.find_user login
        user.to_hash
      end

      def delete_user params
        login = params['login']
        @user_api.delete_user login
      end

      def create_user body
        user_hash = JSON.parse body
        @user_api.add_user user_hash
      end

    end
  end
end