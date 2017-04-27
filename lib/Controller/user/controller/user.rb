module TurboCassandra
  module Controller
    class User
      include TurboCassandra::Controller::PasswordHash
      private
      def process_pass user_hash
        unless user_hash['password'].nil?
          user_hash['password'] = _hash_password(user_hash['password']).to_s
        end
      end

      public
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
        process_pass(user_hash)
        @user_api.add_user user_hash
      end

      def get_profile env
        name = ''
        image_id = ''
        if env.key? :group
          name = env[:name]
          image_id = env[:id]
        elsif env.key? 'customer'
          name = env['name']
          image_id = env['id']
        end
        {
            image_id: image_id,
            name: name

        }
      end

    end
  end
end