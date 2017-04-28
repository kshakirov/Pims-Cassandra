module TurboCassandra
  module API
    class User
      def all
        TurboCassandra::Model::User.all
      end
      def add_user user_hash
        user = TurboCassandra::Model::User.new user_hash
        user.save
      end
      def delete_user id
        TurboCassandra::Model::User.delete id
      end

      def find_user  id
        TurboCassandra::Model::User.find id
      end
      def find_user_by_login login
        users = TurboCassandra::Model::User.find_by login: login
        if users and users.class.name == 'Array'
          users.first
        end
      end
    end
  end
end