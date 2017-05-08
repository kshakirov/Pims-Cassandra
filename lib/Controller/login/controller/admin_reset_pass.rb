module TurboCassandra
  module Controller
    module AdminResetPassword


      def create_response password, user
        {
            'password'=> password,
            'login'=> user.login,
            'email' => user.email,
        }
      end

      def reset user
        user = @user_api.find_user(user['id'])
        new_password = SecureRandom.urlsafe_base64(10)
        user.password = _hash_password(new_password).to_s
        user.save
        create_response new_password, user
      end

      def user_has_internal_auth? user
        user['authentication_node'] == 'Internal'
      end

      def user_exists? user
        not user.nil?
      end

      def _reset_password login
        user = @user_api.find_user_by_login login
        if user_exists? user
          if user_has_internal_auth? user
             reset user
          else
            raise "Unable to reset your password. Please contact your administrator"
          end
        else
          raise "The provided user name does not exists. Please contact your administrator"
        end
      end
    end
  end
end